// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.IO;
using System.Text;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.RSAKey;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using Org.BouncyCastle.Crypto.Xml.Encryption;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class XmlDecryption : EncryptedXml
    {

        public XmlDecryption() : base() { }
        public XmlDecryption(XmlDocument document) : base(document) { }

        //
        // private methods
        //

        private byte[] GetCipherValue(CipherData cipherData)
        {
            Validator.checkNull(cipherData);
            Stream inputStream = null;

            if (cipherData.CipherValue != null)
            {
                return cipherData.CipherValue;
            }
            else if (cipherData.CipherReference != null)
            {
                if (cipherData.CipherReference.CipherValue != null)
                    return cipherData.CipherReference.CipherValue;
                Stream decInputStream = null;
                if (cipherData.CipherReference.Uri == null)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotSupported);
                }
                // See if the CipherReference is a local URI
                if (cipherData.CipherReference.Uri.Length == 0)
                {
                    // self referenced Uri
                    string baseUri = (_document == null ? null : _document.BaseURI);
                    TransformChain tc = cipherData.CipherReference.TransformChain;
                    if (tc == null)
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotSupported);
                    }
                    decInputStream = tc.TransformToOctetStream(_document, _xmlResolver, baseUri);
                }
                else if (cipherData.CipherReference.Uri[0] == '#')
                {
                    string idref = ParserUtils.ExtractIdFromLocalUri(cipherData.CipherReference.Uri);
                    // Serialize 
                    XmlElement idElem = GetIdElement(_document, idref);
                    if (idElem == null || idElem.OuterXml == null)
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotSupported);
                    }
                    inputStream = new MemoryStream(_encoding.GetBytes(idElem.OuterXml));
                    string baseUri = (_document == null ? null : _document.BaseURI);
                    TransformChain tc = cipherData.CipherReference.TransformChain;
                    if (tc == null)
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotSupported);
                    }
                    decInputStream = tc.TransformToOctetStream(inputStream, _xmlResolver, baseUri);
                }
                else
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotResolved, cipherData.CipherReference.Uri);
                }
                // read the output stream into a memory stream
                byte[] cipherValue = null;
                using (MemoryStream ms = new MemoryStream())
                {
                    StreamUtils.Pump(decInputStream, ms);
                    cipherValue = ms.ToArray();
                    // Close the stream and return
                    if (inputStream != null)
                        inputStream.Close();
                    decInputStream.Close();
                }

                // cache the cipher value for Perf reasons in case we call this routine twice
                cipherData.CipherReference.CipherValue = cipherValue;
                return cipherValue;
            }

            // Throw a CryptographicException if we were unable to retrieve the cipher data.
            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingCipherData);
        }

        //
        // public virtual methods
        //

        // This describes how the application wants to associate id references to elements
        public virtual XmlElement GetIdElement(XmlDocument document, string idValue)
        {
            return SignedXml.DefaultGetIdElement(document, idValue);
        }

        // default behaviour is to look for the IV in the CipherValue
        public virtual byte[] GetDecryptionIV(EncryptedData encryptedData, NS symmetricAlgorithmUri)
        {
            Validator.checkNull(encryptedData);
            int initBytesSize = 0;
            // If the Uri is not provided by the application, try to get it from the EncryptionMethod
            if (symmetricAlgorithmUri == NS.None)
            {
                if (encryptedData.EncryptionMethod == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                symmetricAlgorithmUri = encryptedData.EncryptionMethod.KeyAlgorithm;
            }

            switch (symmetricAlgorithmUri)
            {
                case NS.XmlEncDESUrl:
                case NS.XmlEncTripleDESUrl:
                    initBytesSize = 8;
                    break;
                case NS.XmlEncAES128Url:
                case NS.XmlEncAES192Url:
                case NS.XmlEncAES256Url:
                    initBytesSize = 16;
                    break;
                default:
                    // The Uri is not supported.
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotSupported);
            }

            byte[] IV = new byte[initBytesSize];
            byte[] cipherValue = GetCipherValue(encryptedData.CipherData);
            Buffer.BlockCopy(cipherValue, 0, IV, 0, IV.Length);
            return IV;
        }

        // default behaviour is to look for keys defined by an EncryptedKey clause
        // either directly or through a KeyInfoRetrievalMethod, and key names in the key mapping
        public virtual ICipherParameters GetDecryptionKey(EncryptedData encryptedData, NS symmetricAlgorithmUri)
        {
            Validator.checkNull(encryptedData);
            if (encryptedData.KeyInfo == null)
                return null;
            IEnumerator keyInfoEnum = encryptedData.KeyInfo.GetEnumerator();
            KeyInfoRetrievalMethod kiRetrievalMethod;
            KeyInfoName kiName;
            KeyInfoEncryptedKey kiEncKey;
            EncryptedKey ek = null;

            while (keyInfoEnum.MoveNext())
            {
                kiName = keyInfoEnum.Current as KeyInfoName;
                if (kiName != null)
                {
                    // Get the decryption key from the key mapping
                    string keyName = kiName.Value;
                    if (_keyNameMapping[keyName] is ICipherParameters)
                    {
                        return (ICipherParameters)_keyNameMapping[keyName];
                    }
                    // try to get it from a CarriedKeyName
                    XmlNamespaceManager nsm = new XmlNamespaceManager(_document.NameTable);
                    nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                    XmlNodeList encryptedKeyList = _document.SelectNodes("//enc:EncryptedKey", nsm);
                    if (encryptedKeyList != null)
                    {
                        foreach (XmlNode encryptedKeyNode in encryptedKeyList)
                        {
                            XmlElement encryptedKeyElement = encryptedKeyNode as XmlElement;
                            EncryptedKey ek1 = new EncryptedKey();
                            ek1.LoadXml(encryptedKeyElement);
                            if (ek1.CarriedKeyName == keyName && ek1.Recipient == Recipient)
                            {
                                ek = ek1;
                                break;
                            }
                        }
                    }
                    break;
                }
                kiRetrievalMethod = keyInfoEnum.Current as KeyInfoRetrievalMethod;
                if (kiRetrievalMethod != null)
                {
                    string idref = ParserUtils.ExtractIdFromLocalUri(kiRetrievalMethod.GetUri());
                    ek = new EncryptedKey();
                    ek.LoadXml(GetIdElement(_document, idref));
                    break;
                }
                kiEncKey = keyInfoEnum.Current as KeyInfoEncryptedKey;
                if (kiEncKey != null)
                {
                    ek = kiEncKey.GetEncryptedKey();
                    break;
                }
            }

            // if we have an EncryptedKey, decrypt to get the symmetric key
            if (ek != null)
            {
                // now process the EncryptedKey, loop recursively 
                // If the Uri is not provided by the application, try to get it from the EncryptionMethod
                if (symmetricAlgorithmUri == NS.None)
                {
                    if (encryptedData.EncryptionMethod == null)
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                    symmetricAlgorithmUri = encryptedData.EncryptionMethod.KeyAlgorithm;
                }
                byte[] key = DecryptEncryptedKey(ek);
                if (key == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingDecryptionKey);

                IBufferedCipher symAlg = CryptoHelpers.CreateFromName<IBufferedCipher>(XmlNameSpace.Url[symmetricAlgorithmUri]);
                if (symAlg == null)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                }

                KeyParameter keyParam;
                if (symAlg.AlgorithmName.IndexOf("DESede", StringComparison.OrdinalIgnoreCase) >= 0)
                    keyParam = new DesEdeParameters(key);
                else if (symAlg.AlgorithmName.IndexOf("DES", StringComparison.OrdinalIgnoreCase) >= 0)
                    keyParam = new DesParameters(key);
                else
                    keyParam = new KeyParameter(key);

                return keyParam;
            }
            return null;
        }

        // Try to decrypt the EncryptedKey given the key mapping
        public virtual byte[] DecryptEncryptedKey(EncryptedKey encryptedKey, RsaKeyParameters privateKey = null)
        {
            Validator.checkNull(encryptedKey);
            if (encryptedKey.KeyInfo == null)
                return null;

            IEnumerator keyInfoEnum = encryptedKey.KeyInfo.GetEnumerator();
            KeyInfoName kiName;
            KeyInfoX509Data kiX509Data;
            KeyInfoRetrievalMethod kiRetrievalMethod;
            KeyInfoEncryptedKey kiEncKey;
            EncryptedKey ek = null;
            bool fOAEP = false;

            while (keyInfoEnum.MoveNext())
            {
                kiName = keyInfoEnum.Current as KeyInfoName;
                if (kiName != null)
                {
                    // Get the decryption key from the key mapping
                    string keyName = kiName.Value;
                    object kek = _keyNameMapping[keyName];
                    if (kek != null)
                    {
                        if (encryptedKey.CipherData == null || encryptedKey.CipherData.CipherValue == null)
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                        }
                        // kek is either a SymmetricAlgorithm or an RSA key, otherwise, we wouldn't be able to insert it in the hash table
                        if (kek is KeyParameter kp)
                            return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, kp);
                        else if (kek is ParametersWithIV piv)
                            return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, piv.Parameters as KeyParameter);

                        // kek is an RSA key: get fOAEP from the algorithm, default to false
                        fOAEP = (encryptedKey.EncryptionMethod != null && encryptedKey.EncryptionMethod.KeyAlgorithm == NS.XmlEncRSAOAEPUrl);
                        return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, (RsaKeyParameters)kek, fOAEP);
                    }
                    break;
                }
                kiX509Data = keyInfoEnum.Current as KeyInfoX509Data;
                if (kiX509Data != null)
                {
                    var collection = CryptoUtils.BuildBagOfCerts(kiX509Data, CertUsageType.Decryption);
                    foreach (X509Certificate certificate in collection)
                    {
                        if (privateKey != null)
                        {
                            if (encryptedKey.CipherData == null || encryptedKey.CipherData.CipherValue == null)
                            {
                                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                            }
                            fOAEP = (encryptedKey.EncryptionMethod != null && encryptedKey.EncryptionMethod.KeyAlgorithm == NS.XmlEncRSAOAEPUrl);
                            return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, privateKey, fOAEP);
                        }
                    }
                    break;
                }
                kiRetrievalMethod = keyInfoEnum.Current as KeyInfoRetrievalMethod;
                if (kiRetrievalMethod != null)
                {
                    string idref = ParserUtils.ExtractIdFromLocalUri(kiRetrievalMethod.GetUri());
                    ek = new EncryptedKey();
                    ek.LoadXml(GetIdElement(_document, idref));
                    try
                    {
                        //Following checks if XML dsig processing is in loop and within the limit defined by machine
                        // admin or developer. Once the recursion depth crosses the defined limit it will throw exception.
                        _xmlDsigSearchDepthCounter++;
                        if (IsOverXmlDsigRecursionLimit())
                        {
                            //Throw exception once recursion limit is hit. 
                            throw new CryptoSignedXmlRecursionException();
                        }
                        else
                        {
                            return DecryptEncryptedKey(ek, privateKey);
                        }
                    }
                    finally
                    {
                        _xmlDsigSearchDepthCounter--;
                    }
                }
                kiEncKey = keyInfoEnum.Current as KeyInfoEncryptedKey;
                if (kiEncKey != null)
                {
                    ek = kiEncKey.GetEncryptedKey();
                    // recursively process EncryptedKey elements
                    byte[] encryptionKey = DecryptEncryptedKey(ek, privateKey);
                    if (encryptionKey != null)
                    {
                        // this is a symmetric algorithm for sure
                        IBlockCipher blockSymAlg = CryptoHelpers.CreateFromName<IBlockCipher>(XmlNameSpace.Url[encryptedKey.EncryptionMethod.KeyAlgorithm]);
                        if (blockSymAlg == null)
                        {
                            IBufferedCipher bufferedSymAlg = CryptoHelpers.CreateFromName<IBufferedCipher>(XmlNameSpace.Url[encryptedKey.EncryptionMethod.KeyAlgorithm]);
                            if (bufferedSymAlg == null)
                            {
                                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                            }
                        }
                        if (encryptedKey.CipherData == null || encryptedKey.CipherData.CipherValue == null)
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                        }
                        return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, new KeyParameter(encryptionKey));
                    }
                }
            }
            return null;
        }

        //
        // public methods
        //

        // decrypts the document using the defined key mapping in GetDecryptionKey
        // The behaviour of this method can be extended because GetDecryptionKey is virtual
        // the document is decrypted in place
        public void DecryptDocument()
        {
            // Look for all EncryptedData elements and decrypt them
            XmlNamespaceManager nsm = new XmlNamespaceManager(_document.NameTable);
            nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            XmlNodeList encryptedDataList = _document.SelectNodes("//enc:EncryptedData", nsm);
            if (encryptedDataList != null)
            {
                foreach (XmlNode encryptedDataNode in encryptedDataList)
                {
                    XmlElement encryptedDataElement = encryptedDataNode as XmlElement;
                    EncryptedData ed = new EncryptedData();
                    ed.LoadXml(encryptedDataElement);
                    ICipherParameters symAlg = GetDecryptionKey(ed, NS.None);
                    if (symAlg == null)
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingDecryptionKey);
                    byte[] decrypted = DecryptData(ed, symAlg);
                    ReplaceData(encryptedDataElement, decrypted);
                }
            }
        }

        // decrypts the supplied EncryptedData
        public byte[] DecryptData(EncryptedData encryptedData, ICipherParameters symmetricAlgorithm)
        {
            Validator.checkNull(encryptedData);
            Validator.checkNull(symmetricAlgorithm);

            var ivParam = symmetricAlgorithm as ParametersWithIV;
            var keyParam = ivParam == null ? symmetricAlgorithm as KeyParameter : ivParam.Parameters as KeyParameter;

            // get the cipher value and decrypt
            byte[] cipherValue = GetCipherValue(encryptedData.CipherData);

            // read the IV from cipherValue
            byte[] decryptionIV = null;
            if (!_mode.Equals("ECB", StringComparison.OrdinalIgnoreCase))
                decryptionIV = GetDecryptionIV(encryptedData, NS.None);

            byte[] output = null;
            int lengthIV = 0;
            if (decryptionIV != null)
            {
                symmetricAlgorithm = new ParametersWithIV(keyParam, decryptionIV);
                lengthIV = decryptionIV.Length;
            }

            IBufferedCipher dec;
            if (keyParam is DesEdeParameters)
                dec = CipherUtilities.GetCipher($"DESede/{_mode}/{_padding}");
            else if (keyParam is DesParameters)
                dec = CipherUtilities.GetCipher($"DES/{_mode}/{_padding}");
            else
                dec = CipherUtilities.GetCipher($"AES/{_mode}/{_padding}");

            dec.Init(false, symmetricAlgorithm);
            output = dec.DoFinal(cipherValue, lengthIV, cipherValue.Length - lengthIV);

            return output;
        }

        // This method replaces an EncryptedData element with the decrypted sequence of bytes
        public void ReplaceData(XmlElement inputElement, byte[] decryptedData)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(decryptedData);

            XmlNode parent = inputElement.ParentNode;
            if (parent.NodeType == XmlNodeType.Document)
            {
                // We're replacing the root element, but we can't just wholesale replace the owner
                // document's InnerXml, since we need to preserve any other top-level XML elements (such as
                // comments or the XML entity declaration.  Instead, create a new document with the
                // decrypted XML, import it into the existing document, and replace just the root element.
                XmlDocument importDocument = new XmlDocument();
                importDocument.PreserveWhitespace = true;
                string decryptedString = _encoding.GetString(decryptedData);
                using (StringReader sr = new StringReader(decryptedString))
                {
                    using (XmlReader xr = XmlReader.Create(sr, StreamUtils.GetSecureXmlReaderSettings(_xmlResolver)))
                    {
                        importDocument.Load(xr);
                    }
                }

                XmlNode importedNode = inputElement.OwnerDocument.ImportNode(importDocument.DocumentElement, true);

                parent.RemoveChild(inputElement);
                parent.AppendChild(importedNode);
            }
            else
            {
                XmlNode dummy = parent.OwnerDocument.CreateElement(parent.Prefix, parent.LocalName, parent.NamespaceURI);

                try
                {
                    parent.AppendChild(dummy);

                    // Replace the children of the dummy node with the sequence of bytes passed in.
                    // The string will be parsed into DOM objects in the context of the parent of the EncryptedData element.
                    dummy.InnerXml = _encoding.GetString(decryptedData);

                    // Move the children of the dummy node up to the parent.
                    XmlNode child = dummy.FirstChild;
                    XmlNode sibling = inputElement.NextSibling;

                    XmlNode nextChild = null;
                    while (child != null)
                    {
                        nextChild = child.NextSibling;
                        parent.InsertBefore(child, sibling);
                        child = nextChild;
                    }
                }
                finally
                {
                    // Remove the dummy element.
                    parent.RemoveChild(dummy);
                }

                // Remove the EncryptedData element
                parent.RemoveChild(inputElement);
            }
        }

        //
        // public static methods
        //

        // replaces the inputElement with the provided EncryptedData
        public static void ReplaceElement(XmlElement inputElement, EncryptedData encryptedData, bool content)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(encryptedData);

            // First, get the XML representation of the EncryptedData object
            XmlElement elemED = encryptedData.GetXml(inputElement.OwnerDocument);
            switch (content)
            {
                case true:
                    // remove all children of the input element
                    ElementUtils.RemoveAllChildren(inputElement);
                    // then append the encrypted data as a child of the input element
                    inputElement.AppendChild(elemED);
                    break;
                case false:
                    XmlNode parentNode = inputElement.ParentNode;
                    // remove the input element from the containing document
                    parentNode.ReplaceChild(elemED, inputElement);
                    break;
            }
        }

        // decrypts the supplied wrapped key using the provided symmetric algorithm
        public static byte[] DecryptKey(byte[] keyData, KeyParameter symmetricAlgorithm)
        {
            Validator.checkNull(keyData);
            Validator.checkNull(symmetricAlgorithm);

            if (symmetricAlgorithm is DesParameters)
            {
                // CMS Triple DES Key Wrap
                return SymmetricKeyWrap.TripleDESKeyWrapDecrypt(symmetricAlgorithm.GetKey(), keyData);
            }
            else
            {
                // FIPS AES Key Wrap
                return SymmetricKeyWrap.AESKeyWrapDecrypt(symmetricAlgorithm.GetKey(), keyData);
            }
        }

        // decrypts the supplied data using an RSA key and specifies whether we want to use OAEP 
        // padding or PKCS#1 v1.5 padding as described in the PKCS specification
        public static byte[] DecryptKey(byte[] keyData, RsaKeyParameters rsa, bool useOAEP)
        {
            Validator.checkNull(keyData);
            Validator.checkNull(rsa);

            var padding = RSAPadding.PKCS1;

            if (useOAEP)
            {
                padding = RSAPadding.OAEP;
            }
            
            IKeyDeformatter rsaDeformatter = new KeyExchangeDeformatter(rsa, padding);
            return rsaDeformatter.DecryptKeyExchange(keyData);
        }
    }
}

using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.IO;
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

        public virtual XmlElement GetIdElement(XmlDocument document, string idValue)
        {
            return SignedXml.DefaultGetIdElement(document, idValue);
        }

        public virtual byte[] GetDecryptionIV(EncryptedData encryptedData, NS symmetricAlgorithmUri)
        {
            Validator.checkNull(encryptedData);
            int initBytesSize = 0;
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

            if (ek != null)
            {
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

        private byte[] DecryptEncryptedKey1(EncryptedKey encryptedKey, KeyInfoName kiName, bool fOAEP) 
        {
            string keyName = kiName.Value;
            object kek = _keyNameMapping[keyName];
            if (kek != null)
            {
                if (encryptedKey.CipherData == null || encryptedKey.CipherData.CipherValue == null)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingAlgorithm);
                }

                if (kek is KeyParameter kp)
                    return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, kp);
                else if (kek is ParametersWithIV piv)
                    return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, piv.Parameters as KeyParameter);

                fOAEP = (encryptedKey.EncryptionMethod != null && encryptedKey.EncryptionMethod.KeyAlgorithm == NS.XmlEncRSAOAEPUrl);
                return XmlDecryption.DecryptKey(encryptedKey.CipherData.CipherValue, (RsaKeyParameters)kek, fOAEP);
            }
            return null;
        }

        private byte[] DecryptEncryptedKey2(EncryptedKey encryptedKey, RsaKeyParameters privateKey, KeyInfoX509Data kiX509Data, bool fOAEP)
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
            return null;
        }

        private byte[] DecryptEncryptedKey3(EncryptedKey ek, RsaKeyParameters privateKey, KeyInfoRetrievalMethod kiRetrievalMethod) 
        {
            string idref = ParserUtils.ExtractIdFromLocalUri(kiRetrievalMethod.GetUri());
            ek = new EncryptedKey();
            ek.LoadXml(GetIdElement(_document, idref));
            try
            {
                _xmlDsigSearchDepthCounter++;
                if (IsOverXmlDsigRecursionLimit())
                {
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

        private byte[] DecryptEncryptedKey4(EncryptedKey ek, KeyInfoEncryptedKey kiEncKey, EncryptedKey encryptedKey, RsaKeyParameters privateKey)
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
            return null;
        }


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
                    var res = DecryptEncryptedKey1(encryptedKey, kiName, fOAEP);
                    if (res != null) {
                        return res;
                    }
                    break;
                }
                kiX509Data = keyInfoEnum.Current as KeyInfoX509Data;
                if (kiX509Data != null)
                {
                    var res = DecryptEncryptedKey2(encryptedKey, privateKey, kiX509Data, fOAEP);
                    if (res != null)
                    {
                        return res;
                    }
                    break;
                }
                kiRetrievalMethod = keyInfoEnum.Current as KeyInfoRetrievalMethod;
                if (kiRetrievalMethod != null)
                {
                    var res = DecryptEncryptedKey3(ek, privateKey, kiRetrievalMethod);
                    if (res != null)
                    {
                        return res;
                    }
                }
                kiEncKey = keyInfoEnum.Current as KeyInfoEncryptedKey;
                if (kiEncKey != null)
                {
                    var res = DecryptEncryptedKey4(ek, kiEncKey, encryptedKey, privateKey);
                    if (res != null)
                    {
                        return res;
                    }
                }
            }
            return null;
        }

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

        public void ReplaceData(XmlElement inputElement, byte[] decryptedData)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(decryptedData);

            XmlNode parent = inputElement.ParentNode;
            if (parent.NodeType == XmlNodeType.Document)
            {
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

                    dummy.InnerXml = _encoding.GetString(decryptedData);

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
                    parent.RemoveChild(dummy);
                }

                parent.RemoveChild(inputElement);
            }
        }

        public static void ReplaceElement(XmlElement inputElement, EncryptedData encryptedData, bool content)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(encryptedData);

            XmlElement elemED = encryptedData.GetXml(inputElement.OwnerDocument);
            switch (content)
            {
                case true:
                    ElementUtils.RemoveAllChildren(inputElement);
                    inputElement.AppendChild(elemED);
                    break;
                case false:
                    XmlNode parentNode = inputElement.ParentNode;
                    parentNode.ReplaceChild(elemED, inputElement);
                    break;
            }
        }

        public static byte[] DecryptKey(byte[] keyData, KeyParameter symmetricAlgorithm)
        {
            Validator.checkNull(keyData);
            Validator.checkNull(symmetricAlgorithm);

            if (symmetricAlgorithm is DesParameters)
            {
                return SymmetricKeyWrap.TripleDESKeyWrapDecrypt(symmetricAlgorithm.GetKey(), keyData);
            }
            else
            {
                return SymmetricKeyWrap.AESKeyWrapDecrypt(symmetricAlgorithm.GetKey(), keyData);
            }
        }

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

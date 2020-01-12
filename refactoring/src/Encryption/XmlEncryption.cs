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

namespace Org.BouncyCastle.Crypto.Xml.Encryption
{
    public class XmlEncryption : EncryptedXml
    {

        public XmlEncryption() : base() { }
        public XmlEncryption(XmlDocument document) : base(document) { }

        public EncryptedData Encrypt(XmlElement inputElement, X509Certificate certificate)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(certificate);

            AsymmetricKeyParameter rsaPublicKey = certificate.GetPublicKey();
            if (!(rsaPublicKey is RsaKeyParameters))
                throw new NotSupportedException(SR.NotSupported_KeyAlgorithm);

            EncryptedData ed = new EncryptedData();
            ed.Type = XmlNameSpace.Url[NS.XmlEncElementUrl];
            ed.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);

            EncryptedKey ek = new EncryptedKey();
            ek.EncryptionMethod = new EncryptionMethod(NS.XmlEncRSA15Url);
            ek.KeyInfo.AddClause(new KeyInfoX509Data(certificate));

            IBufferedCipher rijn = CipherUtilities.GetCipher("RIJNDAEL/CBC/PKCS7");
            KeyParameter keyParam = new KeyParameter(CryptoUtils.GenerateRandomBlock(rijn.GetBlockSize()));
            ParametersWithIV rijnKey = new ParametersWithIV(keyParam, CryptoUtils.GenerateRandomBlock(rijn.GetBlockSize()));
            ek.CipherData.CipherValue = EncryptKey(keyParam.GetKey(), (RsaKeyParameters)rsaPublicKey, false);

            // Encrypt the input element with the random session key that we've created above.
            KeyInfoEncryptedKey kek = new KeyInfoEncryptedKey(ek);
            ed.KeyInfo.AddClause(kek);
            ed.CipherData.CipherValue = EncryptData(inputElement, rijnKey, false);

            return ed;
        }

        public EncryptedData Encrypt(XmlElement inputElement, string keyName)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(keyName);

            object encryptionKey = null;
            if (_keyNameMapping != null)
                encryptionKey = _keyNameMapping[keyName];

            if (encryptionKey == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingEncryptionKey);

            // kek is either a SymmetricAlgorithm or an RSA key, otherwise, we wouldn't be able to insert it in the hash table
            ParametersWithIV iv = encryptionKey as ParametersWithIV;
            KeyParameter symKey = encryptionKey as KeyParameter;
            RsaKeyParameters rsa = encryptionKey as RsaKeyParameters;

            // Create the EncryptedData object, using an AES-256 session key by default.
            EncryptedData ed = new EncryptedData();
            ed.Type = XmlNameSpace.Url[NS.XmlEncElementUrl];
            ed.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);

            // Include the key name in the EncryptedKey KeyInfo.
            NS encryptionMethod = NS.None;
            if (symKey == null && iv == null)
            {
                encryptionMethod = NS.XmlEncRSA15Url;
            }
            else if (iv != null)
            {
                symKey = iv.Parameters as KeyParameter;
            }

            if (symKey != null)
            {
                if (symKey is DesParameters)
                {
                    // CMS Triple DES Key Wrap
                    encryptionMethod = NS.XmlEncTripleDESKeyWrapUrl;
                }
                else
                {
                    // FIPS AES Key Wrap
                    switch (symKey.GetKey().Length * 8)
                    {
                        case 128:
                            encryptionMethod = NS.XmlEncAES128KeyWrapUrl;
                            break;
                        case 192:
                            encryptionMethod = NS.XmlEncAES192KeyWrapUrl;
                            break;
                        case 256:
                            encryptionMethod = NS.XmlEncAES256KeyWrapUrl;
                            break;
                    }
                }
            }

            EncryptedKey ek = new EncryptedKey();
            ek.EncryptionMethod = new EncryptionMethod(encryptionMethod);
            ek.KeyInfo.AddClause(new KeyInfoName(keyName));

            // Create a random AES session key and encrypt it with the public key associated with the certificate.
            var keydata = CryptoUtils.GenerateRandomBlock(256 / 8);
            var ivdata = CryptoUtils.GenerateRandomBlock(128 / 8);
            var rijn = new ParametersWithIV(new KeyParameter(keydata), ivdata);
            ek.CipherData.CipherValue = (symKey == null ? EncryptKey(keydata, rsa, false) : EncryptKey(keydata, symKey));

            // Encrypt the input element with the random session key that we've created above.
            KeyInfoEncryptedKey kek = new KeyInfoEncryptedKey(ek);
            ed.KeyInfo.AddClause(kek);
            ed.CipherData.CipherValue = EncryptData(inputElement, rijn, false);

            return ed;
        }

        public byte[] EncryptData(byte[] plaintext, ICipherParameters symmetricAlgorithm)
        {
            Validator.checkNull(plaintext);
            Validator.checkNull(symmetricAlgorithm);

            var ivParam = symmetricAlgorithm as ParametersWithIV;
            var keyParam = ivParam == null ? symmetricAlgorithm as KeyParameter : ivParam.Parameters as KeyParameter;

            IBufferedCipher enc;
            if (keyParam is DesEdeParameters)
                enc = CipherUtilities.GetCipher($"DESede/{_mode}/{_padding}");
            else if (keyParam is DesParameters)
                enc = CipherUtilities.GetCipher($"DES/{_mode}/{_padding}");
            else
                enc = CipherUtilities.GetCipher($"AES/{_mode}/{_padding}");

            enc.Init(true, symmetricAlgorithm);
            byte[] cipher = enc.DoFinal(plaintext);

            byte[] output = null;
            if (_mode.Equals("ECB", StringComparison.OrdinalIgnoreCase))
            {
                output = cipher;
            }
            else
            {
                byte[] IV = ((ParametersWithIV)symmetricAlgorithm).GetIV();
                output = new byte[cipher.Length + IV.Length];
                Buffer.BlockCopy(IV, 0, output, 0, IV.Length);
                Buffer.BlockCopy(cipher, 0, output, IV.Length, cipher.Length);
            }
            return output;
        }

        public byte[] EncryptData(XmlElement inputElement, ICipherParameters symmetricAlgorithm, bool content)
        {
            Validator.checkNull(inputElement);
            Validator.checkNull(symmetricAlgorithm);

            byte[] plainText = (content ? _encoding.GetBytes(inputElement.InnerXml) : _encoding.GetBytes(inputElement.OuterXml));
            return EncryptData(plainText, symmetricAlgorithm);
        }

        public static byte[] EncryptKey(byte[] keyData, KeyParameter symmetricAlgorithm)
        {
            Validator.checkNull(keyData);
            Validator.checkNull(symmetricAlgorithm);

            if (symmetricAlgorithm is DesParameters)
            {
                // CMS Triple DES Key Wrap
                return SymmetricKeyWrap.TripleDESKeyWrapEncrypt(symmetricAlgorithm.GetKey(), keyData);
            }
            else
            {
                // FIPS AES Key Wrap
                return SymmetricKeyWrap.AESKeyWrapEncrypt(symmetricAlgorithm.GetKey(), keyData);
            }
        }

        public static byte[] EncryptKey(byte[] keyData, RsaKeyParameters rsa, bool useOAEP)
        {
            Validator.checkNull(keyData);
            Validator.checkNull(rsa);

            var padding = RSAPadding.PKCS1;

            if (useOAEP)
            {
                padding = RSAPadding.OAEP;
            }

            IKeyFormatter rsaFormatter = new KeyExchangeFormatter(rsa, padding);
            return rsaFormatter.CreateKeyExchange(keyData);
        }

    }
}

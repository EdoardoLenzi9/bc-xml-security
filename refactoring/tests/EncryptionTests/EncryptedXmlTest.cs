













using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Encryption;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public class EncryptedXmlTest
    {
        private static readonly Encoding DefaultEncoding = Encoding.UTF8;
        private const string DefaultCipherMode = "CBC";
        private const string DefaultPaddingMode = "ISO10126PADDING";
        private const string DefaultRecipient = "";
        private static readonly XmlResolver DefaultXmlResolver = null;
        private const int DefaultXmlDSigSearchDepth = 20;

        [Fact]
        public void Constructor_Default()
        {
            XmlDecryption encryptedXml = new XmlDecryption();
            Assert.Equal(DefaultEncoding, encryptedXml.GetEncoding());
            Assert.Equal(DefaultCipherMode, encryptedXml.GetMode());
            Assert.Equal(DefaultPaddingMode, encryptedXml.GetPadding());
            Assert.Equal(DefaultRecipient, encryptedXml.Recipient);
            Assert.Equal(DefaultXmlResolver, encryptedXml.GetResolver());
            Assert.Equal(DefaultXmlDSigSearchDepth, encryptedXml.GetXmlDSigSearchDepth());
        }

        [Fact]
        public void Constructor_XmlDocument()
        {
            XmlDecryption encryptedXml = new XmlDecryption(null);
            Assert.Equal(DefaultEncoding, encryptedXml.GetEncoding());
            Assert.Equal(DefaultCipherMode, encryptedXml.GetMode());
            Assert.Equal(DefaultPaddingMode, encryptedXml.GetPadding());
            Assert.Equal(DefaultRecipient, encryptedXml.Recipient);
            Assert.Equal(DefaultXmlResolver, encryptedXml.GetResolver());
            Assert.Equal(DefaultXmlDSigSearchDepth, encryptedXml.GetXmlDSigSearchDepth());
        }

        [Theory]
        [InlineData("Org.BouncyCastle.Crypto.Xml.Tests.EncryptedXmlSample1.xml")]
        [InlineData("Org.BouncyCastle.Crypto.Xml.Tests.EncryptedXmlSample3.xml")]
        public void RsaDecryption(string resourceName)
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string originalXml;
            using (Stream stream = TestHelpers.LoadResourceStream(resourceName))
            using (StreamReader streamReader = new StreamReader(stream))
            {
                originalXml = streamReader.ReadToEnd();
                doc.LoadXml(originalXml);
            }

            XmlDecryption encxml = new XmlDecryption(doc);
            var certificate = TestHelpers.GetSampleX509Certificate();
            var rsaKey = certificate.Item2 as RsaKeyParameters;
            Assert.NotNull(rsaKey);

            XmlNamespaceManager nm = new XmlNamespaceManager(doc.NameTable);
            nm.AddNamespace("s", "http://www.w3.org/2003/05/soap-envelope");
            nm.AddNamespace("o", "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd");
            nm.AddNamespace("e", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            XmlElement el = doc.SelectSingleNode("/s:Envelope/s:Header/o:Security/e:EncryptedKey", nm) as XmlElement;
            EncryptedKey ekey = new EncryptedKey();
            ekey.LoadXml(el);

            var rsa = CipherUtilities.GetCipher("RSA//OAEPPADDING");
            rsa.Init(false, rsaKey);
            byte[] key = rsa.DoFinal(ekey.CipherData.CipherValue);

            var aes = CipherUtilities.GetCipher("AES/CBC/PKCS7PADDING");
            var random = new SecureRandom();
            var ivdata = new byte[aes.GetBlockSize()];
            random.NextBytes(ivdata);
            var param = new ParametersWithIV(new KeyParameter(key), ivdata);

            List<XmlElement> elements = new List<XmlElement>();
            foreach (XmlElement encryptedDataElement in doc.SelectNodes("//e:EncryptedData", nm))
            {
                elements.Add(encryptedDataElement);
            }
            foreach (XmlElement encryptedDataElement in elements)
            {
                EncryptedData edata = new EncryptedData();
                edata.LoadXml(encryptedDataElement);
                encxml.ReplaceData(encryptedDataElement, encxml.DecryptData(edata, param));
            }
        }

        [Fact]
        public void Sample2()
        {
            var aes = CipherUtilities.GetCipher("AES/CBC/ZEROBYTEPADDING");
            var random = new SecureRandom();
            var ivdata = new byte[aes.GetBlockSize()];
            var keydata = Convert.FromBase64String("o/ilseZu+keLBBWGGPlUHweqxIPc4gzZEFWr2nBt640=");
            random.NextBytes(ivdata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.Load(TestHelpers.LoadResourceStream("Org.BouncyCastle.Crypto.Xml.Tests.EncryptedXmlSample2.xml"));
            XmlDecryption encxml = new XmlDecryption(doc);
            EncryptedData edata = new EncryptedData();
            edata.LoadXml(doc.DocumentElement);
            encxml.ReplaceData(doc.DocumentElement, encxml.DecryptData(edata, param));
        }

        [Fact]
        public void RoundtripSample1()
        {
            using (StringWriter sw = new StringWriter())
            {


                {
                    XmlDocument doc = new XmlDocument();
                    doc.PreserveWhitespace = true;
                    doc.LoadXml("<root>  <child>sample</child>   </root>");

                    XmlElement body = doc.DocumentElement;

                    var aes = CipherUtilities.GetCipher("AES/CBC/ZEROBYTEPADDING");
                    var ivdata = Convert.FromBase64String("pBUM5P03rZ6AE4ZK5EyBrw==");
                    var keydata = Convert.FromBase64String("o/ilseZu+keLBBWGGPlUHweqxIPc4gzZEFWr2nBt640=");
                    var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

                    XmlEncryption exml = new XmlEncryption();
                    byte[] encrypted = exml.EncryptData(body, param, false);
                    EncryptedData edata = new EncryptedData();
                    edata.Type = XmlNameSpace.Url[NS.XmlEncElementUrl];
                    edata.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
                    EncryptedKey ekey = new EncryptedKey();

                    byte[] encKeyBytes = keydata;
                    ekey.CipherData = new CipherData(encKeyBytes);
                    ekey.EncryptionMethod = new EncryptionMethod(NS.XmlEncRSA15Url);
                    DataReference dr = new DataReference();
                    dr.Uri = "_0";
                    ekey.AddReference(dr);
                    edata.KeyInfo.AddClause(new KeyInfoEncryptedKey(ekey));
                    ekey.KeyInfo.AddClause(new RsaKeyValue());
                    edata.CipherData.CipherValue = encrypted;
                    XmlDecryption.ReplaceElement(doc.DocumentElement, edata, false);
                    doc.Save(new XmlTextWriter(sw));
                }


                {
                    var aes = CipherUtilities.GetCipher("AES/CBC/ZEROBYTEPADDING");
                    var random = new SecureRandom();
                    var ivdata = new byte[aes.GetBlockSize()];
                    var keydata = Convert.FromBase64String("o/ilseZu+keLBBWGGPlUHweqxIPc4gzZEFWr2nBt640=");
                    random.NextBytes(ivdata);
                    var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

                    XmlDocument doc = new XmlDocument();
                    doc.PreserveWhitespace = true;
                    doc.LoadXml(sw.ToString());
                    XmlDecryption encxml = new XmlDecryption(doc);
                    EncryptedData edata = new EncryptedData();
                    edata.LoadXml(doc.DocumentElement);
                    encxml.ReplaceData(doc.DocumentElement, encxml.DecryptData(edata, param));
                }
            }
        }

        [Fact]
        public void Encrypt_DecryptDocument_AES()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var aes = CipherUtilities.GetCipher("AES/CBC/ZEROBYTEPADDING");
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            XmlEncryption exml = new XmlEncryption();
            exml.AddKeyNameMapping("aes", param);
            EncryptedData ed = exml.Encrypt(doc.DocumentElement, "aes");

            doc.LoadXml(ed.GetXml().OuterXml);
            XmlDecryption exmlDecryptor = new XmlDecryption(doc);
            exmlDecryptor.AddKeyNameMapping("aes", param);
            exmlDecryptor.DecryptDocument();

            Assert.Equal(xml, doc.OuterXml);
        }

        [Fact]
        public void Encrypt_X509()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var certificate = TestHelpers.GetSampleX509Certificate();
            XmlEncryption exml = new XmlEncryption();
            EncryptedData ed = exml.Encrypt(doc.DocumentElement, certificate.Item1);

            Assert.NotNull(ed);

            doc.LoadXml(ed.GetXml().OuterXml);
            XmlNamespaceManager nm = new XmlNamespaceManager(doc.NameTable);
            nm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);

            Assert.NotNull(doc.SelectSingleNode("//enc:EncryptedKey", nm));
            Assert.DoesNotContain("sample", doc.OuterXml);
        }

        [Fact]
        public void Encrypt_X509_XmlNull()
        {
            var certificate = TestHelpers.GetSampleX509Certificate();
            XmlEncryption exml = new XmlEncryption();
            Assert.Throws<ArgumentNullException>(() => exml.Encrypt(null, certificate.Item1));
        }

        [Fact]
        public void Encrypt_X509_CertificateNull()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            XmlEncryption exml = new XmlEncryption();
            X509Certificate certificate = null;
            Assert.Throws<ArgumentNullException>(() => exml.Encrypt(doc.DocumentElement, certificate));
        }

        [Fact]
        public void Encrypt_XmlNull()
        {
            XmlEncryption exml = new XmlEncryption();
            Assert.Throws<ArgumentNullException>(() => exml.Encrypt(null, "aes"));
        }

        [Fact]
        public void Encrypt_KeyNameNull()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            XmlEncryption exml = new XmlEncryption();
            string keyName = null;
            Assert.Throws<ArgumentNullException>(() => exml.Encrypt(doc.DocumentElement, keyName));
        }

        [Fact]
        public void Encrypt_MissingKey()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            XmlEncryption exml = new XmlEncryption();
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => exml.Encrypt(doc.DocumentElement, "aes"));
        }

        [Fact]
        public void Encrypt_RSA()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();
            CheckEncryptionMethod(pair.Public, XmlNameSpace.Url[NS.XmlEncRSA15Url]);
        }

        [Fact]
        public void Encrypt_TripleDES()
        {
            var aes = CipherUtilities.GetCipher("DESEDE/CBC/PKCS7PADDING");
            var random = new SecureRandom();
            var ivdata = new byte[64 / 8];
            var keydata = new byte[192 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new DesEdeParameters(keydata), ivdata);

            CheckEncryptionMethod(param, XmlNameSpace.Url[NS.XmlEncTripleDESKeyWrapUrl]);
        }

        [Fact]
        public void Encrypt_AES128()
        {
            var aes = CipherUtilities.GetCipher("AES/CBC/PKCS7PADDING");
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[128 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            CheckEncryptionMethod(param, XmlNameSpace.Url[NS.XmlEncAES128KeyWrapUrl]);
        }

        [Fact]
        public void Encrypt_AES192()
        {
            var aes = CipherUtilities.GetCipher("AES/CBC/PKCS7PADDING");
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[192 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            CheckEncryptionMethod(param, XmlNameSpace.Url[NS.XmlEncAES192KeyWrapUrl]);
        }

        [Fact]
        public void Encrypt_NotSupportedAlgorithm()
        {
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => CheckEncryptionMethod("", XmlNameSpace.Url[NS.XmlEncAES192KeyWrapUrl]));
        }

        [Fact]
        public void AddKeyNameMapping_KeyNameNull()
        {
            XmlEncryption exml = new XmlEncryption();

            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => exml.AddKeyNameMapping(null, param));
        }

        [Fact]
        public void AddKeyNameMapping_KeyObjectNull()
        {
            XmlEncryption exml = new XmlEncryption();
            Assert.Throws<ArgumentNullException>(() => exml.AddKeyNameMapping("no_object", null));
        }

        [Fact]
        public void AddKeyNameMapping_KeyObjectWrongType()
        {
            XmlEncryption exml = new XmlEncryption();
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => exml.AddKeyNameMapping("string", ""));
        }

        [Fact]
        public void ReplaceData_XmlElementNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.ReplaceData(null, new byte[0]));
        }

        [Fact]
        public void ReplaceData_EncryptedDataNull()
        {
            XmlDecryption ex = new XmlDecryption();
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            Assert.Throws<ArgumentNullException>(() => ex.ReplaceData(doc.DocumentElement, null));
        }

        [Fact]
        public void ReplaceElement_XmlElementNull()
        {
            Assert.Throws<ArgumentNullException>(() => XmlDecryption.ReplaceElement(null, new EncryptedData(), true));
        }

        [Fact]
        public void ReplaceElement_EncryptedDataNull()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            Assert.Throws<ArgumentNullException>(() => XmlDecryption.ReplaceElement(doc.DocumentElement, null, false));
        }

        [Fact]
        public void ReplaceElement_ContentTrue()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            EncryptedData edata = new EncryptedData();
            edata.CipherData.CipherValue = new byte[16];
            XmlDecryption.ReplaceElement(doc.DocumentElement, edata, true);
            Assert.Equal("root", doc.DocumentElement.Name);
            Assert.Equal("EncryptedData", doc.DocumentElement.FirstChild.Name);
        }

        [Fact]
        public void GetIdElement_XmlDocumentNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Null(ex.GetIdElement(null, "value"));
        }

        [Fact]
        public void GetIdElement_StringNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.GetIdElement(new XmlDocument(), null));
        }

        [Fact]
        public void GetDecryptionKey_EncryptedDataNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.GetDecryptionKey(null, NS.XmlEncAES128Url));
        }

        [Fact]
        public void GetDecryptionKey_NoEncryptionMethod()
        {
            EncryptedData edata = new EncryptedData();
            edata.KeyInfo = new KeyInfo();
            edata.KeyInfo.AddClause(new KeyInfoEncryptedKey(new EncryptedKey()));
            XmlDecryption exml = new XmlDecryption();
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => exml.GetDecryptionKey(edata, NS.None));
        }

        [Fact]
        public void GetDecryptionKey_StringNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Null(ex.GetDecryptionKey(new EncryptedData(), NS.None));
        }

        [Fact]
        public void GetDecryptionKey_KeyInfoName()
        {
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            EncryptedData edata = new EncryptedData();
            edata.KeyInfo = new KeyInfo();
            edata.KeyInfo.AddClause(new KeyInfoName("aes"));

            XmlDecryption exml = new XmlDecryption();
            exml.AddKeyNameMapping("aes", param);
            var decryptedAlg = exml.GetDecryptionKey(edata, NS.None);

            Assert.IsType<ParametersWithIV>(decryptedAlg);
            Assert.Equal(((KeyParameter)param.Parameters).GetKey(), ((KeyParameter)((ParametersWithIV)decryptedAlg).Parameters).GetKey());
        }

        [Fact]
        public void GetDecryptionKey_CarriedKeyName()
        {
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            keydata = new byte[128 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var innerParam = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            EncryptedData edata = new EncryptedData();
            edata.KeyInfo = new KeyInfo();
            edata.KeyInfo.AddClause(new KeyInfoName("aes"));

            EncryptedKey ekey = new EncryptedKey();
            byte[] encKeyBytes = XmlEncryption.EncryptKey(((KeyParameter)innerParam.Parameters).GetKey(), (KeyParameter)param.Parameters);
            ekey.CipherData = new CipherData(encKeyBytes);
            ekey.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            ekey.CarriedKeyName = "aes";
            ekey.KeyInfo = new KeyInfo();
            ekey.KeyInfo.AddClause(new KeyInfoName("another_aes"));

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(ekey.GetXml().OuterXml);

            XmlDecryption exml = new XmlDecryption(doc);
            exml.AddKeyNameMapping("another_aes", param);
            var decryptedAlg = exml.GetDecryptionKey(edata, NS.XmlEncAES256Url);

            Assert.IsType<KeyParameter>(decryptedAlg);
            Assert.Equal(((KeyParameter)innerParam.Parameters).GetKey(), ((KeyParameter)decryptedAlg).GetKey());
        }

        [Fact]
        public void GetDecryptionIV_EncryptedDataNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.GetDecryptionIV(null, NS.XmlEncAES128Url));
        }

        [Fact]
        public void GetDecryptionIV_StringNull()
        {
            XmlDecryption ex = new XmlDecryption();
            EncryptedData encryptedData = new EncryptedData();
            encryptedData.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            encryptedData.CipherData = new CipherData(new byte[16]);
            Assert.Equal(new byte[16], ex.GetDecryptionIV(encryptedData, NS.None));
        }

        [Fact]
        public void GetDecryptionIV_StringNullWithoutEncryptionMethod()
        {
            XmlDecryption ex = new XmlDecryption();
            EncryptedData encryptedData = new EncryptedData();
            encryptedData.CipherData = new CipherData(new byte[16]);
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => ex.GetDecryptionIV(encryptedData, NS.None));
        }

        [Fact]
        public void GetDecryptionIV_InvalidAlgorithmUri()
        {
            XmlDecryption ex = new XmlDecryption();
            EncryptedData encryptedData = new EncryptedData();
            encryptedData.CipherData = new CipherData(new byte[16]);
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => ex.GetDecryptionIV(encryptedData, NS.Invalid));
        }

        [Fact]
        public void GetDecryptionIV_TripleDesUri()
        {
            XmlDecryption ex = new XmlDecryption();
            EncryptedData encryptedData = new EncryptedData();
            encryptedData.CipherData = new CipherData(new byte[16]);
            Assert.Equal(8, ex.GetDecryptionIV(encryptedData, NS.XmlEncTripleDESUrl).Length);
        }

        [Fact]
        public void DecryptKey_KeyNull()
        {
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => XmlDecryption.DecryptKey(null, new KeyParameter(keydata)));
        }

        [Fact]
        public void DecryptKey_SymmetricAlgorithmNull()
        {
            Assert.Throws<ArgumentNullException>(() => XmlDecryption.DecryptKey(new byte[16], null));
        }

        [Fact]
        public void EncryptKey_KeyNull()
        {
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => XmlEncryption.EncryptKey(null, new KeyParameter(keydata)));
        }

        [Fact]
        public void EncryptKey_SymmetricAlgorithmNull()
        {
            Assert.Throws<ArgumentNullException>(() => XmlEncryption.EncryptKey(new byte[16], null));
        }

        /*
        [Fact]
        public void EncryptKey_WrongSymmetricAlgorithm()
        {
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => EncryptedXml.EncryptKey(new byte[16], new NotSupportedSymmetricAlgorithm()));
        }
        */

        [Fact]
        public void EncryptKey_RSA_KeyDataNull()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();

            Assert.Throws<ArgumentNullException>(() => XmlEncryption.EncryptKey(null, (RsaKeyParameters)pair.Public, false));
        }

        [Fact]
        public void EncryptKey_RSA_RSANull()
        {
            Assert.Throws<ArgumentNullException>(() => XmlEncryption.EncryptKey(new byte[16], null, false));
        }

        [Fact]
        public void EncryptKey_RSA_UseOAEP()
        {
            byte[] data = Encoding.ASCII.GetBytes("12345678");
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();

            byte[] encryptedData = XmlEncryption.EncryptKey(data, (RsaKeyParameters)pair.Public, true);
            byte[] decryptedData = XmlDecryption.DecryptKey(encryptedData, (RsaKeyParameters)pair.Private, true);
            Assert.Equal(data, decryptedData);
        }

        [Fact]
        public void DecryptData_EncryptedDataNull()
        {
            XmlDecryption ex = new XmlDecryption();
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => ex.DecryptData(null, param));
        }

        [Fact]
        public void DecryptData_SymmetricAlgorithmNull()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.DecryptData(new EncryptedData(), null));
        }

        [Fact]
        public void DecryptData_CipherReference_InvalidUri()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            XmlEncryption exml = new XmlEncryption();
            XmlDecryption dexml = new XmlDecryption();
            exml.AddKeyNameMapping("aes", param);
            EncryptedData ed = exml.Encrypt(doc.DocumentElement, "aes");
            ed.CipherData = new CipherData();
            ed.CipherData.CipherReference = new CipherReference("invaliduri");


            Action decrypt = () => dexml.DecryptData(ed, param);
            Assert.Throws<System.Security.Cryptography.CryptographicException>(decrypt);
        }

        [Fact]
        public void DecryptData_CipherReference_IdUri()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            XmlEncryption exml = new XmlEncryption(doc);
            XmlDecryption dexml = new XmlDecryption(doc);
            string cipherValue = Convert.ToBase64String(exml.EncryptData(Encoding.UTF8.GetBytes(xml), param));

            EncryptedData ed = new EncryptedData();
            ed.Type = XmlNameSpace.Url[NS.XmlEncElementUrl];
            ed.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            ed.CipherData = new CipherData();

            ed.CipherData.CipherReference = new CipherReference("#ID_0");
            string xslt = "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"><xsl:template match = \"/\"><xsl:value-of select=\".\" /></xsl:template></xsl:stylesheet>";
            XmlDsigXsltTransform xsltTransform = new XmlDsigXsltTransform();
            XmlDocument xsltDoc = new XmlDocument();
            xsltDoc.LoadXml(xslt);
            xsltTransform.LoadInnerXml(xsltDoc.ChildNodes);
            ed.CipherData.CipherReference.AddTransform(xsltTransform);
            ed.CipherData.CipherReference.AddTransform(new XmlDsigBase64Transform());


            doc.LoadXml("<root></root>");
            XmlNode encryptedDataNode = doc.ImportNode(ed.GetXml(), true);
            doc.DocumentElement.AppendChild(encryptedDataNode);
            XmlElement cipherDataByReference = doc.CreateElement("CipherData");
            cipherDataByReference.SetAttribute("ID", "ID_0");
            cipherDataByReference.InnerText = cipherValue;
            doc.DocumentElement.AppendChild(cipherDataByReference);

            string decryptedXmlString = Encoding.UTF8.GetString(dexml.DecryptData(ed, param));
            Assert.Equal(xml, decryptedXmlString);
        }

        [Fact]
        public void EncryptData_DataNull()
        {
            XmlEncryption ex = new XmlEncryption();

            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => ex.EncryptData(null, param));
        }

        [Fact]
        public void EncryptData_SymmetricAlgorithmNull()
        {
            XmlEncryption ex = new XmlEncryption();
            Assert.Throws<ArgumentNullException>(() => ex.EncryptData(new byte[16], null));
        }

        [Fact]
        public void EncryptData_Xml_SymmetricAlgorithmNull()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            XmlEncryption ex = new XmlEncryption();
            Assert.Throws<ArgumentNullException>(() => ex.EncryptData(doc.DocumentElement, null, true));
        }

        [Fact]
        public void EncryptData_Xml_XmlElementNull()
        {
            XmlEncryption ex = new XmlEncryption();
            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            Assert.Throws<ArgumentNullException>(() => ex.EncryptData(null, param, true));
        }

        [Fact]
        public void DecryptEncryptedKey_Null()
        {
            XmlDecryption ex = new XmlDecryption();
            Assert.Throws<ArgumentNullException>(() => ex.DecryptEncryptedKey(null));
        }

        [Fact]
        public void DecryptEncryptedKey_Empty()
        {
            XmlDecryption ex = new XmlDecryption();
            EncryptedKey ek = new EncryptedKey();
            Assert.Null(ex.DecryptEncryptedKey(ek));
        }

        [Fact]
        public void DecryptEncryptedKey_KeyInfoRetrievalMethod()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var random = new SecureRandom();
            var ivdata = new byte[128 / 8];
            var keydata = new byte[256 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var param = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            keydata = new byte[128 / 8];
            random.NextBytes(ivdata);
            random.NextBytes(keydata);
            var innerParam = new ParametersWithIV(new KeyParameter(keydata), ivdata);

            XmlDecryption exml = new XmlDecryption(doc);
            exml.AddKeyNameMapping("aes", param);

            EncryptedKey ekey = new EncryptedKey();
            byte[] encKeyBytes = XmlEncryption.EncryptKey(((KeyParameter)innerParam.Parameters).GetKey(), (KeyParameter)param.Parameters);
            ekey.CipherData = new CipherData(encKeyBytes);
            ekey.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            ekey.Id = "Key_ID";
            ekey.KeyInfo = new KeyInfo();
            ekey.KeyInfo.AddClause(new KeyInfoName("aes"));

            doc.LoadXml(ekey.GetXml().OuterXml);

            EncryptedKey ekeyRetrieval = new EncryptedKey();
            KeyInfo keyInfoRetrieval = new KeyInfo();
            keyInfoRetrieval.AddClause(new KeyInfoRetrievalMethod("#Key_ID"));
            ekeyRetrieval.KeyInfo = keyInfoRetrieval;

            byte[] decryptedKey = exml.DecryptEncryptedKey(ekeyRetrieval);
            Assert.Equal(((KeyParameter)innerParam.Parameters).GetKey(), decryptedKey);

            EncryptedData eData = new EncryptedData();
            eData.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            eData.KeyInfo = keyInfoRetrieval;
            var decryptedAlg = exml.GetDecryptionKey(eData, NS.None);
            Assert.Equal(((KeyParameter)innerParam.Parameters).GetKey(), ((KeyParameter)decryptedAlg).GetKey());
        }

        [Fact]
        public void DecryptEncryptedKey_KeyInfoEncryptedKey()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            string xml = "<root>  <child>sample</child>   </root>";
            doc.LoadXml(xml);

            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            keydata = new byte[128 / 8];
            random.NextBytes(keydata);
            var innerParam = new KeyParameter(keydata);

            keydata = new byte[192 / 8];
            random.NextBytes(keydata);
            var outerParam = new KeyParameter(keydata);

            XmlDecryption exml = new XmlDecryption(doc);
            exml.AddKeyNameMapping("aes", param);

            EncryptedKey ekey = new EncryptedKey();
            byte[] encKeyBytes = XmlEncryption.EncryptKey(outerParam.GetKey(), param);
            ekey.CipherData = new CipherData(encKeyBytes);
            ekey.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            ekey.Id = "Key_ID";
            ekey.KeyInfo = new KeyInfo();
            ekey.KeyInfo.AddClause(new KeyInfoName("aes"));

            KeyInfo topLevelKeyInfo = new KeyInfo();
            topLevelKeyInfo.AddClause(new KeyInfoEncryptedKey(ekey));

            EncryptedKey ekeyTopLevel = new EncryptedKey();
            byte[] encTopKeyBytes = XmlEncryption.EncryptKey(innerParam.GetKey(), outerParam);
            ekeyTopLevel.CipherData = new CipherData(encTopKeyBytes);
            ekeyTopLevel.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            ekeyTopLevel.KeyInfo = topLevelKeyInfo;

            doc.LoadXml(ekeyTopLevel.GetXml().OuterXml);

            byte[] decryptedKey = exml.DecryptEncryptedKey(ekeyTopLevel);
            Assert.Equal(innerParam.GetKey(), decryptedKey);

            EncryptedData eData = new EncryptedData();
            eData.EncryptionMethod = new EncryptionMethod(NS.XmlEncAES256Url);
            eData.KeyInfo = topLevelKeyInfo;
            var decryptedAlg = exml.GetDecryptionKey(eData, NS.None);
            Assert.Equal(outerParam.GetKey(), ((KeyParameter)decryptedAlg).GetKey());
        }

        [Fact]
        public void EncryptKey_TripleDES()
        {
            var random = new SecureRandom();
            var keydata = new byte[192 / 8];
            random.NextBytes(keydata);
            var param = new DesEdeParameters(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123456781234567812345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);

            Assert.NotNull(encryptedKey);
            Assert.Equal(key, XmlDecryption.DecryptKey(encryptedKey, param));
        }

        [Fact]
        public void EncryptKey_AES()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123456781234567812345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);

            Assert.NotNull(encryptedKey);
            Assert.Equal(key, XmlDecryption.DecryptKey(encryptedKey, param));
        }

        [Fact]
        public void EncryptKey_AES8Bytes()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("12345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);

            Assert.NotNull(encryptedKey);
            Assert.Equal(key, XmlDecryption.DecryptKey(encryptedKey, param));
        }

        [Fact]
        public void EncryptKey_AESNotDivisibleBy8()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("1234567");

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlEncryption.EncryptKey(key, param));
        }

        [Fact]
        public void DecryptKey_TripleDESWrongKeySize()
        {
            var random = new SecureRandom();
            var keydata = new byte[192 / 8];
            random.NextBytes(keydata);
            var param = new DesEdeParameters(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123");

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlDecryption.DecryptKey(key, param));
        }

        [Fact]
        public void DecryptKey_TripleDESCorruptedKey()
        {
            var random = new SecureRandom();
            var keydata = new byte[192 / 8];
            random.NextBytes(keydata);
            var param = new DesEdeParameters(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123456781234567812345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);
            encryptedKey[0] ^= 0xFF;

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlDecryption.DecryptKey(encryptedKey, param));
        }

        [Fact]
        public void DecryptKey_AESWrongKeySize()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123");

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlDecryption.DecryptKey(key, param));
        }

        [Fact]
        public void DecryptKey_AESCorruptedKey()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("123456781234567812345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);
            encryptedKey[0] ^= 0xFF;

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlDecryption.DecryptKey(encryptedKey, param));
        }

        [Fact]
        public void DecryptKey_AESCorruptedKey8Bytes()
        {
            var random = new SecureRandom();
            var keydata = new byte[256 / 8];
            random.NextBytes(keydata);
            var param = new KeyParameter(keydata);

            byte[] key = Encoding.ASCII.GetBytes("12345678");

            byte[] encryptedKey = XmlEncryption.EncryptKey(key, param);
            encryptedKey[0] ^= 0xFF;

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => XmlDecryption.DecryptKey(encryptedKey, param));
        }

        /*
        [Fact]
        public void DecryptKey_NotSupportedAlgorithm()
        {
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => EncryptedXml.DecryptKey(new byte[16], new NotSupportedSymmetricAlgorithm()));
        }
        */

        [Fact]
        public void DecryptKey_RSA_KeyDataNull()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();

            Assert.Throws<ArgumentNullException>(() => XmlDecryption.DecryptKey(null, (RsaKeyParameters)pair.Private, false));
        }

        [Fact]
        public void DecryptKey_RSA_RSANull()
        {
            Assert.Throws<ArgumentNullException>(() => XmlDecryption.DecryptKey(new byte[16], null, false));
        }

        [Fact]
        public void Properties()
        {
            XmlEncryption exml = new XmlEncryption();
            exml.SetXmlDSigSearchDepth(10);
            exml.SetResolver(null);
            exml.SetPadding("NOPADDING");
            exml.SetMode("CBC");
            exml.SetEncoding(Encoding.ASCII);
            exml.Recipient = "Recipient";

            Assert.Equal(10, exml.GetXmlDSigSearchDepth());
            Assert.Null(exml.GetResolver());
            Assert.Equal("NOPADDING", exml.GetPadding());
            Assert.Equal("CBC", exml.GetMode());
            Assert.Equal(Encoding.ASCII, exml.GetEncoding());
            Assert.Equal("Recipient", exml.Recipient);
        }

        private void CheckEncryptionMethod(object algorithm, string uri)
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<root />");
            XmlEncryption exml = new XmlEncryption();
            exml.AddKeyNameMapping("key", algorithm);

            EncryptedData edata = exml.Encrypt(doc.DocumentElement, "key");
            IEnumerator keyInfoEnum = edata.KeyInfo.GetEnumerator();
            keyInfoEnum.MoveNext();
            KeyInfoEncryptedKey kiEncKey = keyInfoEnum.Current as KeyInfoEncryptedKey;

            Assert.NotNull(edata);
            Assert.Equal(uri, XmlNameSpace.Url[kiEncKey.GetEncryptedKey().EncryptionMethod.KeyAlgorithm]);
            Assert.NotNull(edata.CipherData.CipherValue);
        }
    }
}

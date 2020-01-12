












using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Encryption;
using Org.BouncyCastle.Security;
using System;
using System.IO;
using System.Text;
using System.Xml;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class UnprotectedXmlDecryptionTransform : XmlDecryptionTransform
    {
        public bool UnprotectedIsTargetElement(XmlElement inputElement, string idValue)
        {
            return base.IsTargetElement(inputElement, idValue);
        }

        public XmlNodeList UnprotectedGetInnerXml()
        {
            return base.GetInnerXml();
        }
    }

    public class XmlDecryptionTransformTest
    {
        private UnprotectedXmlDecryptionTransform transform;

        public XmlDecryptionTransformTest()
        {
            transform = new UnprotectedXmlDecryptionTransform();
        }

        [Fact]
        public void IsTargetElement_XmlElementNull()
        {
            Assert.False(transform.UnprotectedIsTargetElement(null, "value"));
        }

        [Fact]
        public void IsTargetElement_StringNull()
        {
            XmlDocument doc = new XmlDocument();
            Assert.False(transform.UnprotectedIsTargetElement(doc.DocumentElement, null));
        }

        [Theory]
        [InlineData("<a id=\"1\" />", "1", true)]
        [InlineData("<a ID=\"1\" />", "1", true)]
        [InlineData("<a Id=\"1\" />", "1", true)]
        [InlineData("<a iD=\"1\" />", "1", false)]
        [InlineData("<a id=\"1\" />", "2", false)]
        public void IsTargetElement_ValidXml(string xml, string id, bool expectedResult)
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xml);

            Assert.Equal(expectedResult, transform.UnprotectedIsTargetElement(doc.DocumentElement, id));
        }

        [Fact]
        public void AddExceptUri_Null()
        {
            Assert.Throws<ArgumentNullException>(() => transform.AddExceptUri(null));
        }

        [Fact]
        public void EncryptedXml_NotNull()
        {
            Assert.NotNull(transform.XmlDecryption);
        }

        [Fact]
        public void InputTypes()
        {
            Type[] inputTypes = transform.InputTypes;

            Assert.Equal(2, inputTypes.Length);
            Assert.Contains(typeof(Stream), inputTypes);
            Assert.Contains(typeof(XmlDocument), inputTypes);
        }

        [Fact]
        public void OutputTypes()
        {
            Type[] outputTypes = transform.OutputTypes;

            Assert.Equal(1, outputTypes.Length);
            Assert.Contains(typeof(XmlDocument), outputTypes);
        }

        [Fact]
        public void LoadInnerXml_XmlNull()
        {
            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => transform.LoadInnerXml(null));
        }

        [Fact]
        public void LoadInnerXml_XmlNoExcept()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<a />");

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => transform.LoadInnerXml(doc.ChildNodes));

            Assert.Null(transform.UnprotectedGetInnerXml());
        }

        [Fact]
        public void LoadInnerXml_XmlNoUriForExcept()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(@"<dcrpt:Except xmlns:dcrpt=""http://www.w3.org/2002/07/decrypt#""/>");

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => transform.LoadInnerXml(doc.ChildNodes));
        }

        [Fact]
        public void LoadInnerXml_XmlValidUriForExcept()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(@"<dcrpt:Except URI=""#item1"" xmlns:dcrpt=""http://www.w3.org/2002/07/decrypt#""/>");

            transform.LoadInnerXml(doc.ChildNodes);

            Assert.NotNull(transform.UnprotectedGetInnerXml());
        }

        [Fact]
        public void LoadStreamInput_CorrectXml()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<root><a /><b /></root>";
            doc.LoadXml(xml);

            using (MemoryStream memoryStream = new MemoryStream())
            using (StreamWriter streamWriter = new StreamWriter(memoryStream, Encoding.Unicode))
            {
                streamWriter.Write(xml);
                streamWriter.Flush();
                memoryStream.Position = 0;

                transform.LoadInput(memoryStream);
                XmlDocument output = (XmlDocument)transform.GetOutput();

                Assert.Equal(xml, output.OuterXml);
            }
        }

        [Fact]
        public void GetOutput_WrongType()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<test />";
            doc.LoadXml(xml);

            transform.LoadInput(doc);
            AssertExtensions.Throws<ArgumentException>("type", () => transform.GetOutput(typeof(string)));
        }

        [Fact]
        public void GetOutput_XmlNoEncryptedData()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<test />";
            doc.LoadXml(xml);

            transform.LoadInput(doc);
            XmlDocument transformedDocument = (XmlDocument)transform.GetOutput(typeof(XmlDocument));

            Assert.Equal(xml, transformedDocument.OuterXml);
        }

        [Fact]

        public void GetOutput_XmlWithEncryptedData()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<root><a /><b /><c>To Be Encrypted</c><d /></root>";
            doc.LoadXml(xml);

            XmlDocument transformedDocument = GetTransformedOutput(doc, "c");

            Assert.NotNull(transformedDocument);
            Assert.Equal(xml, transformedDocument.OuterXml);
        }

        [Fact]
        public void GetOutput_XmlWithEncryptedDataInRoot()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<root>To Be Encrypted</root>";
            doc.LoadXml(xml);

            XmlDocument transformedDocument = GetTransformedOutput(doc, "//root");

            Assert.NotNull(transformedDocument);
            Assert.Equal(xml, transformedDocument.OuterXml);
        }

        [Fact]
        public void GetOutput_XmlWithEncryptedDataAndExcept()
        {
            XmlDocument doc = new XmlDocument();
            string xml = "<root><a /><b /><c>To Be Encrypted</c><d /></root>";
            doc.LoadXml(xml);

            transform.AddExceptUri("#_notfound");
            transform.AddExceptUri("#_0");
            XmlDocument transformedDocument = GetTransformedOutput(doc, "c");

            XmlNamespaceManager xmlNamespaceManager = new XmlNamespaceManager(doc.NameTable);
            xmlNamespaceManager.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            Assert.NotNull(transformedDocument.DocumentElement.SelectSingleNode("//enc:EncryptedData", xmlNamespaceManager));
            Assert.NotEqual(xml, transformedDocument.OuterXml);
        }

        private XmlDocument GetTransformedOutput(XmlDocument doc, string nodeToEncrypt)
        {
            var aes = CipherUtilities.GetCipher("AES/CBC/PKCS7");
            var random = new SecureRandom();
            var keyData = new byte[aes.GetBlockSize()];
            var ivData = new byte[aes.GetBlockSize()];
            random.NextBytes(ivData);
            random.NextBytes(keyData);
            var key = new ParametersWithIV(new KeyParameter(keyData), ivData);

            var encryptedXml = new XmlEncryption();
            encryptedXml.AddKeyNameMapping("aes", key);

            XmlElement elementToEncrypt = (XmlElement)doc.DocumentElement.SelectSingleNode(nodeToEncrypt);
            EncryptedData encryptedData = encryptedXml.Encrypt(elementToEncrypt, "aes");
            XmlDecryption.ReplaceElement(elementToEncrypt, encryptedData, false);

            XmlNamespaceManager xmlNamespaceManager = new XmlNamespaceManager(doc.NameTable);
            xmlNamespaceManager.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            XmlElement encryptedNode = (XmlElement)doc.DocumentElement.SelectSingleNode("//enc:EncryptedData", xmlNamespaceManager);
            encryptedNode.SetAttribute("ID", "#_0");

            transform.LoadInput(doc);
            
            var dencryptedXml = new XmlDecryption();
            dencryptedXml.AddKeyNameMapping("aes", key);

            transform.XmlDecryption = dencryptedXml;
            XmlDocument transformedDocument = (XmlDocument)transform.GetOutput();

            transform.XmlDecryption = null;

            return transformedDocument;
        }
    }
}


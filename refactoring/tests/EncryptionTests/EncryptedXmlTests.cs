



using System.Globalization;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Encryption;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public static class EncryptedXmlTests
    {
        [Fact]
        public static void DecryptWithCertificate_NotInStore()
        {
            const string SecretMessage = "Grilled cheese is tasty";

            XmlDocument document = new XmlDocument();
            document.LoadXml($"<data><secret>{SecretMessage}</secret></data>");
            XmlElement toEncrypt = (XmlElement)document.DocumentElement.FirstChild;

            var cert = TestHelpers.GetSampleX509Certificate();
            XmlEncryption encryptor = new XmlEncryption(document);
            EncryptedData encryptedElement = encryptor.Encrypt(toEncrypt, cert.Item1);
            XmlDecryption.ReplaceElement(toEncrypt, encryptedElement, false);
                
            XmlDocument document2 = new XmlDocument();
            document2.LoadXml(document.OuterXml);

            XmlDecryption decryptor = new XmlDecryption(document2);

            Assert.Throws<System.Security.Cryptography.CryptographicException>(() => decryptor.DecryptDocument());
            Assert.DoesNotContain(SecretMessage, document2.OuterXml);
        }
    }
}

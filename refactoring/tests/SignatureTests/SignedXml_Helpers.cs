

using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public static class Helpers
    {
        public static bool VerifyCryptoExceptionOnLoad(string xml, bool loadXmlThrows)
        {
            var xmlDoc = new XmlDocument();
            xmlDoc.PreserveWhitespace = true;
            xmlDoc.LoadXml(xml);

            var signatureNode = (XmlElement)xmlDoc.GetElementsByTagName("Signature", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl])[0];

            SignatureChecker signedXml = new SignatureChecker(xmlDoc);
            if (loadXmlThrows)
                Assert.Throws<System.Security.Cryptography.CryptographicException>(() => signedXml.LoadXml(signatureNode));
            else
                signedXml.LoadXml(signatureNode);

            if (!loadXmlThrows)
            {
                bool checkSigResult = signedXml.CheckSignature();
                return checkSigResult;
            }
            return false;
        }
    }
}

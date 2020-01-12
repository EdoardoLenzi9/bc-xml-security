using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using System;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class RsaKeyValue : KeyInfoClause
    {
        private RsaKeyParameters _key;

        public RsaKeyValue()
        {
            var pair = CryptoUtils.RSAGenerateKeyPair();
            _key = (RsaKeyParameters)pair.Public;
        }

        public RsaKeyValue(RsaKeyParameters key)
        {
            _key = key;
        }

        public RsaKeyParameters GetKey()
        { return _key; }

        public void SetKey(RsaKeyParameters value)
        { _key = value; }

        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        private const string KeyValueElementName = "KeyValue";
        private const string RSAKeyValueElementName = "RSAKeyValue";
        private const string ModulusElementName = "Modulus";
        private const string ExponentElementName = "Exponent";

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement keyValueElement = xmlDocument.CreateElement(KeyValueElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            XmlElement rsaKeyValueElement = xmlDocument.CreateElement(RSAKeyValueElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlElement modulusElement = xmlDocument.CreateElement(ModulusElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            modulusElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Modulus.ToByteArrayUnsigned())));
            rsaKeyValueElement.AppendChild(modulusElement);

            XmlElement exponentElement = xmlDocument.CreateElement(ExponentElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            exponentElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Exponent.ToByteArrayUnsigned())));
            rsaKeyValueElement.AppendChild(exponentElement);

            keyValueElement.AppendChild(rsaKeyValueElement);

            return keyValueElement;
        }

        public override void LoadXml(XmlElement element)
        {
            if (element == null)
            {
                throw new ArgumentNullException(nameof(element));
            }
            if (element.LocalName != KeyValueElementName
                || element.NamespaceURI != XmlNameSpace.Url[NS.XmlDsigNamespaceUrl])
            {
                throw new System.Security.Cryptography.CryptographicException($"Root element must be {KeyValueElementName} element in namespace {NS.XmlDsigNamespaceUrl}");
            }

            const string xmlDsigNamespacePrefix = "dsig";
            XmlNamespaceManager xmlNamespaceManager = new XmlNamespaceManager(element.OwnerDocument.NameTable);
            xmlNamespaceManager.AddNamespace(xmlDsigNamespacePrefix, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlNode rsaKeyValueElement = element.SelectSingleNode($"{xmlDsigNamespacePrefix}:{RSAKeyValueElementName}", xmlNamespaceManager);
            if (rsaKeyValueElement == null)
            {
                throw new System.Security.Cryptography.CryptographicException($"{KeyValueElementName} must contain child element {RSAKeyValueElementName}");
            }

            try
            {
                _key = new RsaKeyParameters(false,
                    new Math.BigInteger(1, Convert.FromBase64String(rsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{ModulusElementName}", xmlNamespaceManager).InnerText)),
                    new Math.BigInteger(1, Convert.FromBase64String(rsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{ExponentElementName}", xmlNamespaceManager).InnerText)));
            }
            catch (Exception ex)
            {
                throw new System.Security.Cryptography.CryptographicException($"An error occurred parsing the {ModulusElementName} and {ExponentElementName} elements", ex);
            }
        }
    }
}

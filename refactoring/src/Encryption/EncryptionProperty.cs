using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class EncryptionProperty
    {
        private string _target;
        private string _id;
        private XmlElement _elemProp;
        private XmlElement _cachedXml = null;

        // We are being lax here as per the spec
        public EncryptionProperty() { }

        public EncryptionProperty(XmlElement elementProperty)
        {
            if (elementProperty == null)
                throw new ArgumentNullException(nameof(elementProperty));
            if (elementProperty.LocalName != "EncryptionProperty" || elementProperty.NamespaceURI != XmlNameSpace.Url[NS.XmlEncNamespaceUrl])
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidEncryptionProperty);

            _elemProp = elementProperty;
            _cachedXml = null;
        }

        public string Id
        {
            get { return _id; }
        }

        public string Target
        {
            get { return _target; }
        }

        public XmlElement PropertyElement
        {
            get { return _elemProp; }
            set
            {
                if (value == null)
                    throw new ArgumentNullException(nameof(value));
                if (value.LocalName != "EncryptionProperty" || value.NamespaceURI != XmlNameSpace.Url[NS.XmlEncNamespaceUrl])
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidEncryptionProperty);

                _elemProp = value;
                _cachedXml = null;
            }
        }

        private bool CacheValid
        {
            get
            {
                return (_cachedXml != null);
            }
        }

        public XmlElement GetXml()
        {
            if (CacheValid) return _cachedXml;

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            return document.ImportNode(_elemProp, true) as XmlElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));
            if (value.LocalName != "EncryptionProperty" || value.NamespaceURI != XmlNameSpace.Url[NS.XmlEncNamespaceUrl])
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidEncryptionProperty);

            // cache the Xml
            _cachedXml = value;
            _id = ElementUtils.GetAttribute(value, "Id", NS.XmlEncNamespaceUrl);
            _target = ElementUtils.GetAttribute(value, "Target", NS.XmlEncNamespaceUrl);
            _elemProp = value;
        }
    }
}

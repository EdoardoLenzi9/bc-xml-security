using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class CipherReference : EncryptedReference
    {
        private byte[] _cipherValue;

        public CipherReference() : base()
        {
            ReferenceType = "CipherReference";
        }

        public CipherReference(string uri) : base(uri)
        {
            ReferenceType = "CipherReference";
        }

        public CipherReference(string uri, TransformChain transformChain) : base(uri, transformChain)
        {
            ReferenceType = "CipherReference";
        }

        internal byte[] CipherValue
        {
            get
            {
                if (!CacheValid)
                    return null;
                return _cipherValue;
            }
            set
            {
                _cipherValue = value;
            }
        }

        public override XmlElement GetXml()
        {
            if (CacheValid) return _cachedXml;

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        new internal XmlElement GetXml(XmlDocument document)
        {
            if (ReferenceType == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_ReferenceTypeRequired);

            XmlElement referenceElement = document.CreateElement(ReferenceType, XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            if (!string.IsNullOrEmpty(Uri))
                referenceElement.SetAttribute("URI", Uri);

            if (TransformChain.Count > 0)
                referenceElement.AppendChild(TransformChain.GetXml(document, NS.XmlEncNamespaceUrl));

            return referenceElement;
        }

        public override void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            ReferenceType = value.LocalName;
            string uri = ElementUtils.GetAttribute(value, "URI", NS.XmlEncNamespaceUrl);
            Uri = uri ?? throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriRequired);

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            XmlNode transformsNode = value.SelectSingleNode("enc:Transforms", nsm);
            if (transformsNode != null)
                TransformChain.LoadXml(transformsNode as XmlElement);

            _cachedXml = value;
        }
    }
}

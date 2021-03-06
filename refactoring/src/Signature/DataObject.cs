using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class DataObject
    {
        private string _id;
        private string _mimeType;
        private string _encoding;
        private CanonicalXmlNodeList _elData;
        private XmlElement _cachedXml;

        public DataObject()
        {
            _cachedXml = null;
            _elData = new CanonicalXmlNodeList();
        }

        public DataObject(string id, string mimeType, string encoding, XmlElement data)
        {
            if (data == null)
                throw new ArgumentNullException(nameof(data));

            _id = id;
            _mimeType = mimeType;
            _encoding = encoding;
            _elData = new CanonicalXmlNodeList();
            _elData.Add(data);
            _cachedXml = null;
        }

        public string Id
        {
            get { return _id; }
            set
            {
                _id = value;
                _cachedXml = null;
            }
        }

        public string MimeType
        {
            get { return _mimeType; }
            set
            {
                _mimeType = value;
                _cachedXml = null;
            }
        }

        public string Encoding
        {
            get { return _encoding; }
            set
            {
                _encoding = value;
                _cachedXml = null;
            }
        }

        public XmlNodeList Data
        {
            get { return _elData; }
            set
            {
                if (value == null)
                    throw new ArgumentNullException(nameof(value));

                _elData = new CanonicalXmlNodeList();
                foreach (XmlNode node in value)
                {
                    _elData.Add(node);
                }
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
            if (CacheValid) return (_cachedXml);

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            XmlElement objectElement = document.CreateElement("Object", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            if (!string.IsNullOrEmpty(_id))
                objectElement.SetAttribute("Id", _id);
            if (!string.IsNullOrEmpty(_mimeType))
                objectElement.SetAttribute("MimeType", _mimeType);
            if (!string.IsNullOrEmpty(_encoding))
                objectElement.SetAttribute("Encoding", _encoding);

            if (_elData != null)
            {
                foreach (XmlNode node in _elData)
                {
                    objectElement.AppendChild(document.ImportNode(node, true));
                }
            }

            return objectElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            _id = ElementUtils.GetAttribute(value, "Id", NS.XmlDsigNamespaceUrl);
            _mimeType = ElementUtils.GetAttribute(value, "MimeType", NS.XmlDsigNamespaceUrl);
            _encoding = ElementUtils.GetAttribute(value, "Encoding", NS.XmlDsigNamespaceUrl);

            foreach (XmlNode node in value.ChildNodes)
            {
                _elData.Add(node);
            }

            _cachedXml = value;
        }
    }
}

using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfoName : KeyInfoClause
    {
        private string _keyName;

        public KeyInfoName() : this(null) { }

        public KeyInfoName(string keyName)
        {
            Value = keyName;
        }
        
        public string Value
        {
            get { return _keyName; }
            set { _keyName = value; }
        }

        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement nameElement = xmlDocument.CreateElement("KeyName", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            nameElement.AppendChild(xmlDocument.CreateTextNode(_keyName));
            return nameElement;
        }

        public override void LoadXml(XmlElement element)
        {
            if (element == null)
                throw new ArgumentNullException(nameof(element));
            XmlElement nameElement = element;
            _keyName = nameElement.InnerText.Trim();
        }
    }
}

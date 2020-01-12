using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfoNode : KeyInfoClause
    {
        private XmlElement _node;

        public KeyInfoNode() { }

        public KeyInfoNode(XmlElement node)
        {
            _node = node;
        }
        
        public XmlElement GetValue()
        { return _node; }
        
        public void SetValue(XmlElement value)
        { _node = value; }
        
        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            return xmlDocument.ImportNode(_node, true) as XmlElement;
        }

        public override void LoadXml(XmlElement element)
        {
            _node = element;
        }
    }
}

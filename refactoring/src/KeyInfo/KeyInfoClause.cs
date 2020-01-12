using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public abstract class KeyInfoClause
    {

        protected KeyInfoClause() { }

        public abstract XmlElement GetXml();
        internal virtual XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement keyInfo = GetXml();
            return (XmlElement)xmlDocument.ImportNode(keyInfo, true);
        }

        public abstract void LoadXml(XmlElement element);
    }
}

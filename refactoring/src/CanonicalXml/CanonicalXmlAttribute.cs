using System.Xml;
using System.Text;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXmlAttribute : XmlAttribute, ICanonicalizableNode
    {
        public CanonicalXmlAttribute(string prefix, string localName, string namespaceURI, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(prefix, localName, namespaceURI, doc)
        {
            SetIsInNodeSet(defaultNodeSetInclusionState);
        }

        private bool isInNodeSet;

        public bool GetIsInNodeSet()
        {
            return isInNodeSet;
        }

        public void SetIsInNodeSet(bool value)
        {
            isInNodeSet = value;
        }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            strBuilder.Append(" " + Name + "=\"");
            strBuilder.Append(ParserUtils.EscapeAttributeValue(Value));
            strBuilder.Append("\"");
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            UTF8Encoding utf8 = new UTF8Encoding(false);
            byte[] rgbData = utf8.GetBytes(" " + Name + "=\"");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes(ParserUtils.EscapeAttributeValue(Value));
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes("\"");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
        }
    }
}

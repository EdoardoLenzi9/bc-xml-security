using System.Xml;
using System.Text;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlWhitespace
    internal class CanonicalXmlWhitespace : XmlWhitespace, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlWhitespace(string strData, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(strData, doc)
        {
            _isInNodeSet = defaultNodeSetInclusionState;
        }

        public bool GetIsInNodeSet()
        { return _isInNodeSet; }

        public void SetIsInNodeSet(bool value)
        { _isInNodeSet = value; }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet() && docPos == DocPosition.InRootElement)
                strBuilder.Append(ParserUtils.EscapeWhitespaceData(Value));
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet() && docPos == DocPosition.InRootElement)
            {
                UTF8Encoding utf8 = new UTF8Encoding(false);
                byte[] rgbData = utf8.GetBytes(ParserUtils.EscapeWhitespaceData(Value));
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

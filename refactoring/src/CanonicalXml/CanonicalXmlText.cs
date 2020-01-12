using System.Xml;
using System.Text;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXmlText : XmlText, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlText(string strData, XmlDocument doc, bool defaultNodeSetInclusionState)
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
            if (GetIsInNodeSet())
                strBuilder.Append(ParserUtils.EscapeTextData(Value));
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet())
            {
                UTF8Encoding utf8 = new UTF8Encoding(false);
                byte[] rgbData = utf8.GetBytes(ParserUtils.EscapeTextData(Value));
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

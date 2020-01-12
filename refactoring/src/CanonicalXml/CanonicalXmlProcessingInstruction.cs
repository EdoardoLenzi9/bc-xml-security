using System.Xml;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXmlProcessingInstruction : XmlProcessingInstruction, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlProcessingInstruction(string target, string data, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(target, data, doc)
        {
            _isInNodeSet = defaultNodeSetInclusionState;
        }

        public bool GetIsInNodeSet()
        { return _isInNodeSet; }

        public void SetIsInNodeSet(bool value)
        { _isInNodeSet = value; }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!GetIsInNodeSet())
                return;

            if (docPos == DocPosition.AfterRootElement)
                strBuilder.Append((char)10);
            strBuilder.Append("<?");
            strBuilder.Append(Name);
            if ((Value != null) && (Value.Length > 0))
                strBuilder.Append(" " + Value);
            strBuilder.Append("?>");
            if (docPos == DocPosition.BeforeRootElement)
                strBuilder.Append((char)10);
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!GetIsInNodeSet())
                return;

            UTF8Encoding utf8 = new UTF8Encoding(false);
            byte[] rgbData;
            if (docPos == DocPosition.AfterRootElement)
            {
                rgbData = utf8.GetBytes("(char) 10");
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
            rgbData = utf8.GetBytes("<?");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes((Name));
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            if ((Value != null) && (Value.Length > 0))
            {
                rgbData = utf8.GetBytes(" " + Value);
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
            rgbData = utf8.GetBytes("?>");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            if (docPos == DocPosition.BeforeRootElement)
            {
                rgbData = utf8.GetBytes("(char) 10");
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

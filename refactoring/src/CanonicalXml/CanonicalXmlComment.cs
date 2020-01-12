using System.Xml;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlComment
    internal class CanonicalXmlComment : XmlComment, ICanonicalizableNode
    {
        public CanonicalXmlComment(string comment, XmlDocument doc, bool defaultNodeSetInclusionState, bool includeComments)
            : base(comment, doc)
        {
            SetIsInNodeSet(defaultNodeSetInclusionState);
            IncludeComments = includeComments;
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

        public bool IncludeComments { get; }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!GetIsInNodeSet() || !IncludeComments)
                return;

            if (docPos == DocPosition.AfterRootElement)
                strBuilder.Append((char)10);
            strBuilder.Append("<!--");
            strBuilder.Append(Value);
            strBuilder.Append("-->");
            if (docPos == DocPosition.BeforeRootElement)
                strBuilder.Append((char)10);
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!GetIsInNodeSet() || !IncludeComments)
                return;

            UTF8Encoding utf8 = new UTF8Encoding(false);
            byte[] rgbData = utf8.GetBytes("(char) 10");
            if (docPos == DocPosition.AfterRootElement)
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes("<!--");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes(Value);
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            rgbData = utf8.GetBytes("-->");
            hash.BlockUpdate(rgbData, 0, rgbData.Length);
            if (docPos == DocPosition.BeforeRootElement)
            {
                rgbData = utf8.GetBytes("(char) 10");
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

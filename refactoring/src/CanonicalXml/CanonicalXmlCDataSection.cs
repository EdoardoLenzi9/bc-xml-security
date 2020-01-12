using System.Xml;
using System.Text;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXmlCDataSection : XmlCDataSection, ICanonicalizableNode
    {
        public CanonicalXmlCDataSection(string data, XmlDocument doc, bool defaultNodeSetInclusionState) : base(data, doc)
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
            if (GetIsInNodeSet())
                strBuilder.Append(ParserUtils.EscapeCData(Data));
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet())
            {
                UTF8Encoding utf8 = new UTF8Encoding(false);
                byte[] rgbData = utf8.GetBytes(ParserUtils.EscapeCData(Data));
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

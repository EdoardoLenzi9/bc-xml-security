using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXml
    {
        bool IsInNodeSet { get; set; }

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc);
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc);
    }
}
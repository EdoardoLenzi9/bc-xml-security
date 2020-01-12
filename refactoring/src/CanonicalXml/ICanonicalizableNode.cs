using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalizableNode
    {
        bool GetIsInNodeSet();
        void SetIsInNodeSet(bool value);
        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc);
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc);
    }
}

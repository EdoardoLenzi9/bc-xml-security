using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the interface to be implemented by all subclasses of XmlNode
    // that have to provide node subsetting and canonicalization features.
    internal interface ICanonicalizableNode
    {
        bool GetIsInNodeSet();
        void SetIsInNodeSet(bool value);
        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc);
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc);
    }
}

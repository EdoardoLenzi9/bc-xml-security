using System.Xml;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlEntityReference
    internal class CanonicalXmlEntityReference : XmlEntityReference, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlEntityReference(string name, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(name, doc)
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
                CanonicalizationDispatcher.WriteGenericNode(this, strBuilder, docPos, anc);
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet())
                CanonicalizationDispatcher.WriteHashGenericNode(this, hash, docPos, anc);
        }
    }
}

using System.Collections;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class ExcAncestralNamespaceContextManager : AncestralNamespaceContextManager
    {
        private Hashtable _inclusivePrefixSet = null;

        internal ExcAncestralNamespaceContextManager(string inclusiveNamespacesPrefixList)
        {
            _inclusivePrefixSet = EncodingUtils.TokenizePrefixListString(inclusiveNamespacesPrefixList);
        }

        private bool HasNonRedundantInclusivePrefix(XmlAttribute attr)
        {
            int tmp;
            string nsPrefix = AttributeUtils.GetNamespacePrefix(attr);
            return _inclusivePrefixSet.ContainsKey(nsPrefix) &&
                AttributeUtils.IsNonRedundantNamespaceDecl(attr, GetNearestNamespaceWithMatchingPrefix(nsPrefix, out tmp));
        }

        private void GatherNamespaceToRender(string nsPrefix, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            foreach (object a in nsListToRender.GetKeyList())
            {
                if (AttributeUtils.HasNamespacePrefix((XmlAttribute)a, nsPrefix))
                    return;
            }

            int rDepth;
            XmlAttribute local = (XmlAttribute)nsLocallyDeclared[nsPrefix];
            XmlAttribute rAncestral = GetNearestNamespaceWithMatchingPrefix(nsPrefix, out rDepth);

            if (local != null)
            {
                if (AttributeUtils.IsNonRedundantNamespaceDecl(local, rAncestral))
                {
                    nsLocallyDeclared.Remove(nsPrefix);
                    nsListToRender.Add(local, null);
                }
            }
            else
            {
                int uDepth;
                XmlAttribute uAncestral = GetNearestNamespaceWithMatchingPrefix(nsPrefix, out uDepth, false);
                if (uAncestral != null && uDepth > rDepth && AttributeUtils.IsNonRedundantNamespaceDecl(uAncestral, rAncestral))
                {
                    nsListToRender.Add(uAncestral, null);
                }
            }
        }

        internal override void GetNamespacesToRender(XmlElement element, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            GatherNamespaceToRender(element.Prefix, nsListToRender, nsLocallyDeclared);
            foreach (object attr in attrListToRender.GetKeyList())
            {
                string prefix = ((XmlAttribute)attr).Prefix;
                if (prefix.Length > 0)
                    GatherNamespaceToRender(prefix, nsListToRender, nsLocallyDeclared);
            }
        }

        internal override void TrackNamespaceNode(XmlAttribute attr, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            if (!AttributeUtils.IsXmlPrefixDefinitionNode(attr))
            {
                if (HasNonRedundantInclusivePrefix(attr))
                    nsListToRender.Add(attr, null);
                else
                    nsLocallyDeclared.Add(AttributeUtils.GetNamespacePrefix(attr), attr);
            }
        }

        internal override void TrackXmlNamespaceNode(XmlAttribute attr, SortedList nsListToRender, SortedList attrListToRender, Hashtable nsLocallyDeclared)
        {
            // exclusive canonicalization treats Xml namespaces as simple attributes. They are not propagated.
            attrListToRender.Add(attr, null);
        }
    }
}

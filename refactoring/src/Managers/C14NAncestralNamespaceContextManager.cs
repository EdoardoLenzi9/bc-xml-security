using System.Collections;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class C14NAncestralNamespaceContextManager : AncestralNamespaceContextManager
    {
        internal C14NAncestralNamespaceContextManager() { }

        private void GetNamespaceToRender(string nsPrefix, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            foreach (object a in nsListToRender.GetKeyList())
            {
                if (AttributeUtils.HasNamespacePrefix((XmlAttribute)a, nsPrefix))
                    return;
            }
            foreach (object a in attrListToRender.GetKeyList())
            {
                if (((XmlAttribute)a).LocalName.Equals(nsPrefix))
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
                    if (NodeUtils.IsXmlNamespaceNode(local))
                        attrListToRender.Add(local, null);
                    else
                        nsListToRender.Add(local, null);
                }
            }
            else
            {
                int uDepth;
                XmlAttribute uAncestral = GetNearestNamespaceWithMatchingPrefix(nsPrefix, out uDepth, false);
                if (uAncestral != null && uDepth > rDepth && AttributeUtils.IsNonRedundantNamespaceDecl(uAncestral, rAncestral))
                {
                    if (NodeUtils.IsXmlNamespaceNode(uAncestral))
                        attrListToRender.Add(uAncestral, null);
                    else
                        nsListToRender.Add(uAncestral, null);
                }
            }
        }

        internal override void GetNamespacesToRender(XmlElement element, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            XmlAttribute attrib = null;
            object[] attrs = new object[nsLocallyDeclared.Count];
            nsLocallyDeclared.Values.CopyTo(attrs, 0);
            foreach (object a in attrs)
            {
                attrib = (XmlAttribute)a;
                int rDepth;
                XmlAttribute rAncestral = GetNearestNamespaceWithMatchingPrefix(AttributeUtils.GetNamespacePrefix(attrib), out rDepth);
                if (AttributeUtils.IsNonRedundantNamespaceDecl(attrib, rAncestral))
                {
                    nsLocallyDeclared.Remove(AttributeUtils.GetNamespacePrefix(attrib));
                    if (NodeUtils.IsXmlNamespaceNode(attrib))
                        attrListToRender.Add(attrib, null);
                    else
                        nsListToRender.Add(attrib, null);
                }
            }

            for (int i = _ancestorStack.Count - 1; i >= 0; i--)
            {
                foreach (object a in GetScopeAt(i).GetUnrendered().Values)
                {
                    attrib = (XmlAttribute)a;
                    if (attrib != null)
                        GetNamespaceToRender(AttributeUtils.GetNamespacePrefix(attrib), attrListToRender, nsListToRender, nsLocallyDeclared);
                }
            }
        }

        internal override void TrackNamespaceNode(XmlAttribute attr, SortedList nsListToRender, Hashtable nsLocallyDeclared)
        {
            nsLocallyDeclared.Add(AttributeUtils.GetNamespacePrefix(attr), attr);
        }

        internal override void TrackXmlNamespaceNode(XmlAttribute attr, SortedList nsListToRender, SortedList attrListToRender, Hashtable nsLocallyDeclared)
        {
            nsLocallyDeclared.Add(AttributeUtils.GetNamespacePrefix(attr), attr);
        }
    }
}

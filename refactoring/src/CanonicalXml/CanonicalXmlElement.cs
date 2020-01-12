using System.Xml;
using System.Text;
using System.Collections;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlElement
    internal class CanonicalXmlElement : XmlElement, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlElement(string prefix, string localName, string namespaceURI, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(prefix, localName, namespaceURI, doc)
        {
            _isInNodeSet = defaultNodeSetInclusionState;
        }

        public bool GetIsInNodeSet()
        { return _isInNodeSet; }

        public void SetIsInNodeSet(bool value)
        { _isInNodeSet = value; }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            Hashtable nsLocallyDeclared = new Hashtable();
            SortedList nsListToRender = new SortedList(new NamespaceSortOrder());
            SortedList attrListToRender = new SortedList(new AttributeSortOrder());

            XmlAttributeCollection attrList = Attributes;
            if (attrList != null)
            {
                foreach (XmlAttribute attr in attrList)
                {
                    if (((CanonicalXmlAttribute)attr).GetIsInNodeSet() || NodeUtils.IsNamespaceNode(attr) || NodeUtils.IsXmlNamespaceNode(attr))
                    {
                        if (NodeUtils.IsNamespaceNode(attr))
                        {
                            anc.TrackNamespaceNode(attr, nsListToRender, nsLocallyDeclared);
                        }
                        else if (NodeUtils.IsXmlNamespaceNode(attr))
                        {
                            anc.TrackXmlNamespaceNode(attr, nsListToRender, attrListToRender, nsLocallyDeclared);
                        }
                        else if (GetIsInNodeSet())
                        {
                            attrListToRender.Add(attr, null);
                        }
                    }
                }
            }

            if (!ElementUtils.IsCommittedNamespace(this, Prefix, NamespaceURI))
            {
                string name = ((Prefix.Length > 0) ? "xmlns" + ":" + Prefix : "xmlns");
                XmlAttribute nsattrib = OwnerDocument.CreateAttribute(name);
                nsattrib.Value = NamespaceURI;
                anc.TrackNamespaceNode(nsattrib, nsListToRender, nsLocallyDeclared);
            }

            if (GetIsInNodeSet())
            {
                anc.GetNamespacesToRender(this, attrListToRender, nsListToRender, nsLocallyDeclared);

                strBuilder.Append("<" + Name);
                foreach (object attr in nsListToRender.GetKeyList())
                {
                    (attr as CanonicalXmlAttribute).Write(strBuilder, docPos, anc);
                }
                foreach (object attr in attrListToRender.GetKeyList())
                {
                    (attr as CanonicalXmlAttribute).Write(strBuilder, docPos, anc);
                }
                strBuilder.Append(">");
            }

            anc.EnterElementContext();
            anc.LoadUnrenderedNamespaces(nsLocallyDeclared);
            anc.LoadRenderedNamespaces(nsListToRender);

            XmlNodeList childNodes = ChildNodes;
            foreach (XmlNode childNode in childNodes)
            {
                CanonicalizationDispatcher.Write(childNode, strBuilder, docPos, anc);
            }

            anc.ExitElementContext();

            if (GetIsInNodeSet())
            {
                strBuilder.Append("</" + Name + ">");
            }
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            Hashtable nsLocallyDeclared = new Hashtable();
            SortedList nsListToRender = new SortedList(new NamespaceSortOrder());
            SortedList attrListToRender = new SortedList(new AttributeSortOrder());
            UTF8Encoding utf8 = new UTF8Encoding(false);
            byte[] rgbData;

            XmlAttributeCollection attrList = Attributes;
            if (attrList != null)
            {
                foreach (XmlAttribute attr in attrList)
                {
                    if (((CanonicalXmlAttribute)attr).GetIsInNodeSet() || NodeUtils.IsNamespaceNode(attr) || NodeUtils.IsXmlNamespaceNode(attr))
                    {
                        if (NodeUtils.IsNamespaceNode(attr))
                        {
                            anc.TrackNamespaceNode(attr, nsListToRender, nsLocallyDeclared);
                        }
                        else if (NodeUtils.IsXmlNamespaceNode(attr))
                        {
                            anc.TrackXmlNamespaceNode(attr, nsListToRender, attrListToRender, nsLocallyDeclared);
                        }
                        else if (GetIsInNodeSet())
                        {
                            attrListToRender.Add(attr, null);
                        }
                    }
                }
            }

            if (!ElementUtils.IsCommittedNamespace(this, Prefix, NamespaceURI))
            {
                string name = ((Prefix.Length > 0) ? "xmlns" + ":" + Prefix : "xmlns");
                XmlAttribute nsattrib = (XmlAttribute)OwnerDocument.CreateAttribute(name);
                nsattrib.Value = NamespaceURI;
                anc.TrackNamespaceNode(nsattrib, nsListToRender, nsLocallyDeclared);
            }

            if (GetIsInNodeSet())
            {
                anc.GetNamespacesToRender(this, attrListToRender, nsListToRender, nsLocallyDeclared);
                rgbData = utf8.GetBytes("<" + Name);
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
                foreach (object attr in nsListToRender.GetKeyList())
                {
                    (attr as CanonicalXmlAttribute).WriteHash(hash, docPos, anc);
                }
                foreach (object attr in attrListToRender.GetKeyList())
                {
                    (attr as CanonicalXmlAttribute).WriteHash(hash, docPos, anc);
                }
                rgbData = utf8.GetBytes(">");
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }

            anc.EnterElementContext();
            anc.LoadUnrenderedNamespaces(nsLocallyDeclared);
            anc.LoadRenderedNamespaces(nsListToRender);

            XmlNodeList childNodes = ChildNodes;
            foreach (XmlNode childNode in childNodes)
            {
                CanonicalizationDispatcher.WriteHash(childNode, hash, docPos, anc);
            }

            anc.ExitElementContext();

            if (GetIsInNodeSet())
            {
                rgbData = utf8.GetBytes("</" + Name + ">");
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

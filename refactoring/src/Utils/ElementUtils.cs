using System;
using System.Collections;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class ElementUtils
    {
        private static bool HasNamespace(XmlElement element, string prefix, string value)
        {
            if (IsCommittedNamespace(element, prefix, value)) return true;
            if (element.Prefix == prefix && element.NamespaceURI == value) return true;
            return false;
        }

        // A helper function that determines if a namespace node is a committed attribute
        internal static bool IsCommittedNamespace(XmlElement element, string prefix, string value)
        {
            if (element == null)
                throw new ArgumentNullException(nameof(element));

            string name = ((prefix.Length > 0) ? "xmlns:" + prefix : "xmlns");
            if (element.HasAttribute(name) && element.GetAttribute(name) == value) return true;
            return false;
        }

        internal static bool IsRedundantNamespace(XmlElement element, string prefix, string value)
        {
            if (element == null)
                throw new ArgumentNullException(nameof(element));

            XmlNode ancestorNode = ((XmlNode)element).ParentNode;
            while (ancestorNode != null)
            {
                XmlElement ancestorElement = ancestorNode as XmlElement;
                if (ancestorElement != null && HasNamespace(ancestorElement, prefix, value))
                {
                    return true;
                }

                ancestorNode = ancestorNode.ParentNode;
            }

            return false;
        }

        internal static string GetAttribute(XmlElement element, string localName, NS nameSpace)
        {
            string s = (element.HasAttribute(localName) ? element.GetAttribute(localName) : null);
            if (s == null && element.HasAttribute(localName, XmlNameSpace.Url[nameSpace]))
                s = element.GetAttribute(localName, XmlNameSpace.Url[nameSpace]);
            return s;
        }

        internal static bool HasAttribute(XmlElement element, string localName, string namespaceURI)
        {
            return element.HasAttribute(localName) || element.HasAttribute(localName, namespaceURI);
        }

        internal static bool VerifyAttributes(XmlElement element, string expectedAttrName)
        {
            return VerifyAttributes(element, expectedAttrName == null ? null : new string[] { expectedAttrName });
        }

        internal static bool VerifyAttributes(XmlElement element, string[] expectedAttrNames)
        {
            foreach (XmlAttribute attr in element.Attributes)
            {
                // There are a few Xml Special Attributes that are always allowed on any node. Make sure we allow those here.
                bool attrIsAllowed = attr.Name == "xmlns" || attr.Name.StartsWith("xmlns:") || attr.Name == "xml:space" || attr.Name == "xml:lang" || attr.Name == "xml:base";
                int expectedInd = 0;
                while (!attrIsAllowed && expectedAttrNames != null && expectedInd < expectedAttrNames.Length)
                {
                    attrIsAllowed = attr.Name == expectedAttrNames[expectedInd];
                    expectedInd++;
                }
                if (!attrIsAllowed)
                    return false;
            }
            return true;
        }

        // This method gets the attributes that should be propagated
        internal static CanonicalXmlNodeList GetPropagatedAttributes(XmlElement elem)
        {
            if (elem == null)
                return null;

            CanonicalXmlNodeList namespaces = new CanonicalXmlNodeList();
            XmlNode ancestorNode = elem;
            bool bDefNamespaceToAdd = true;

            while (ancestorNode != null)
            {
                XmlElement ancestorElement = ancestorNode as XmlElement;
                if (ancestorElement == null)
                {
                    ancestorNode = ancestorNode.ParentNode;
                    continue;
                }
                if (!IsCommittedNamespace(ancestorElement, ancestorElement.Prefix, ancestorElement.NamespaceURI))
                {
                    // Add the namespace attribute to the collection if needed
                    if (!IsRedundantNamespace(ancestorElement, ancestorElement.Prefix, ancestorElement.NamespaceURI))
                    {
                        string name = ((ancestorElement.Prefix.Length > 0) ? "xmlns:" + ancestorElement.Prefix : "xmlns");
                        XmlAttribute nsattrib = elem.OwnerDocument.CreateAttribute(name);
                        nsattrib.Value = ancestorElement.NamespaceURI;
                        namespaces.Add(nsattrib);
                    }
                }
                if (ancestorElement.HasAttributes)
                {
                    XmlAttributeCollection attribs = ancestorElement.Attributes;
                    foreach (XmlAttribute attrib in attribs)
                    {
                        // Add a default namespace if necessary
                        if (bDefNamespaceToAdd && attrib.LocalName == "xmlns")
                        {
                            XmlAttribute nsattrib = elem.OwnerDocument.CreateAttribute("xmlns");
                            nsattrib.Value = attrib.Value;
                            namespaces.Add(nsattrib);
                            bDefNamespaceToAdd = false;
                            continue;
                        }
                        // retain the declarations of type 'xml:*' as well
                        if (attrib.Prefix == "xmlns" || attrib.Prefix == "xml")
                        {
                            namespaces.Add(attrib);
                            continue;
                        }
                        if (attrib.NamespaceURI.Length > 0)
                        {
                            if (!IsCommittedNamespace(ancestorElement, attrib.Prefix, attrib.NamespaceURI) && !IsRedundantNamespace(ancestorElement, attrib.Prefix, attrib.NamespaceURI))
                            {
                                string name = ((attrib.Prefix.Length > 0) ? "xmlns:" + attrib.Prefix : "xmlns");
                                XmlAttribute nsattrib = elem.OwnerDocument.CreateAttribute(name);
                                nsattrib.Value = attrib.NamespaceURI;
                                namespaces.Add(nsattrib);
                            }
                        }
                    }
                }
                ancestorNode = ancestorNode.ParentNode;
            }

            return namespaces;
        }

        internal static void AddNamespaces(XmlElement elem, CanonicalXmlNodeList namespaces)
        {
            if (namespaces != null)
            {
                foreach (XmlNode attrib in namespaces)
                {
                    string name = ((attrib.Prefix.Length > 0) ? attrib.Prefix + ":" + attrib.LocalName : attrib.LocalName);
                    // Skip the attribute if one with the same qualified name already exists
                    if (elem.HasAttribute(name) || (name.Equals("xmlns") && elem.Prefix.Length == 0)) continue;
                    XmlAttribute nsattrib = elem.OwnerDocument.CreateAttribute(name);
                    nsattrib.Value = attrib.Value;
                    elem.SetAttributeNode(nsattrib);
                }
            }
        }

        internal static void AddNamespaces(XmlElement elem, Hashtable namespaces)
        {
            if (namespaces != null)
            {
                foreach (string key in namespaces.Keys)
                {
                    if (elem.HasAttribute(key)) continue;
                    XmlAttribute nsattrib = elem.OwnerDocument.CreateAttribute(key);
                    nsattrib.Value = namespaces[key] as string;
                    elem.SetAttributeNode(nsattrib);
                }
            }
        }

        // This removes all children of an element.
        internal static void RemoveAllChildren(XmlElement inputElement)
        {
            XmlNode child = inputElement.FirstChild;
            XmlNode sibling = null;

            while (child != null)
            {
                sibling = child.NextSibling;
                inputElement.RemoveChild(child);
                child = sibling;
            }
        }
    }
}

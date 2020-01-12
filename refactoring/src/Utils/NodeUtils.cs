using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class NodeUtils
    {
        internal static bool IsNamespaceNode(XmlNode n)
        {
            return n.NodeType == XmlNodeType.Attribute && (n.Prefix.Equals("xmlns") || (n.Prefix.Length == 0 && n.LocalName.Equals("xmlns")));
        }

        internal static bool IsXmlNamespaceNode(XmlNode n)
        {
            return n.NodeType == XmlNodeType.Attribute && n.Prefix.Equals("xml");
        }


        internal static bool IsDefaultNamespaceNode(XmlNode n)
        {
            bool b1 = n.NodeType == XmlNodeType.Attribute && n.Prefix.Length == 0 && n.LocalName.Equals("xmlns");
            bool b2 = IsXmlNamespaceNode(n);
            return b1 || b2;
        }

        internal static bool IsEmptyDefaultNamespaceNode(XmlNode n)
        {
            return IsDefaultNamespaceNode(n) && n.Value.Length == 0;
        }

        internal static XmlDocument GetOwnerDocument(XmlNodeList nodeList)
        {
            foreach (XmlNode node in nodeList)
            {
                if (node.OwnerDocument != null)
                    return node.OwnerDocument;
            }
            return null;
        }

        internal static XmlNodeList AllDescendantNodes(XmlNode node, bool includeComments)
        {
            CanonicalXmlNodeList nodeList = new CanonicalXmlNodeList();
            CanonicalXmlNodeList elementList = new CanonicalXmlNodeList();
            CanonicalXmlNodeList attribList = new CanonicalXmlNodeList();
            CanonicalXmlNodeList namespaceList = new CanonicalXmlNodeList();

            int index = 0;
            elementList.Add(node);

            do
            {
                XmlNode rootNode = elementList[index];

                XmlNodeList childNodes = rootNode.ChildNodes;
                if (childNodes != null)
                {
                    foreach (XmlNode node1 in childNodes)
                    {
                        if (includeComments || (!(node1 is XmlComment)))
                        {
                            elementList.Add(node1);
                        }
                    }
                }

                XmlAttributeCollection attribNodes = rootNode.Attributes;
                if (attribNodes != null)
                {
                    foreach (XmlNode attribNode in rootNode.Attributes)
                    {
                        if (attribNode.LocalName == "xmlns" || attribNode.Prefix == "xmlns")
                            namespaceList.Add(attribNode);
                        else
                            attribList.Add(attribNode);
                    }
                }
                index++;
            } while (index < elementList.Count);
            foreach (XmlNode elementNode in elementList)
            {
                nodeList.Add(elementNode);
            }
            foreach (XmlNode attribNode in attribList)
            {
                nodeList.Add(attribNode);
            }
            foreach (XmlNode namespaceNode in namespaceList)
            {
                nodeList.Add(namespaceNode);
            }

            return nodeList;
        }

        internal static bool NodeInList(XmlNode node, XmlNodeList nodeList)
        {
            foreach (XmlNode nodeElem in nodeList)
            {
                if (nodeElem == node) return true;
            }
            return false;
        }

    }
}

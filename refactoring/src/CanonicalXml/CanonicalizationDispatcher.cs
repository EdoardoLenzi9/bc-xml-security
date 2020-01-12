using System;
using System.Xml;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{

    internal static class CanonicalizationDispatcher 
    {
        
        public static void Write(XmlNode node, StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!(node is ICanonicalizableNode))
            {
                WriteGenericNode(node, strBuilder, docPos, anc);
            }
            else
            {
                ((ICanonicalizableNode)node).Write(strBuilder, docPos, anc);
            }
        }

        public static void WriteGenericNode(XmlNode node, StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (node == null)
                throw new ArgumentNullException(nameof(node));

            XmlNodeList childNodes = node.ChildNodes;
            foreach (XmlNode childNode in childNodes)
            {
                Write(childNode, strBuilder, docPos, anc);
            }
        }

        public static void WriteHash(XmlNode node, IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (!(node is ICanonicalizableNode))
            {
                WriteHashGenericNode(node, hash, docPos, anc);
            }
            else
            {
                ((ICanonicalizableNode)node).WriteHash(hash, docPos, anc);
            }
        }

        public static void WriteHashGenericNode(XmlNode node, IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (node == null)
                throw new ArgumentNullException(nameof(node));

            XmlNodeList childNodes = node.ChildNodes;
            foreach (XmlNode childNode in childNodes)
            {
                WriteHash(childNode, hash, docPos, anc);
            }
        }
    }
}

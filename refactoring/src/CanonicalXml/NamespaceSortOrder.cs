using System;
using System.Xml;
using System.Collections;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class NamespaceSortOrder : IComparer
    {
        internal NamespaceSortOrder() { }

        public int Compare(object x, object y)
        {
            XmlNode nodeA = x as XmlNode;
            XmlNode nodeB = y as XmlNode;
            if ((nodeA == null) || (nodeB == null))
            {
                ArgumentException argumentException = new ArgumentException();
                throw argumentException;
            }

            bool nodeAdefault = NodeUtils.IsDefaultNamespaceNode(nodeA);
            bool nodeBdefault = NodeUtils.IsDefaultNamespaceNode(nodeB);
            if (nodeAdefault && nodeBdefault) return 0;
            if (nodeAdefault) return -1;
            if (nodeBdefault) return 1;
            return string.CompareOrdinal(nodeA.LocalName, nodeB.LocalName);
        }
    }
}

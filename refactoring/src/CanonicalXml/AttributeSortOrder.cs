using System;
using System.Xml;
using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class AttributeSortOrder : IComparer
    {
        internal AttributeSortOrder() { }

        public int Compare(object a, object b)
        {
            XmlNode nodeA = a as XmlNode;
            XmlNode nodeB = b as XmlNode;
            if ((nodeA == null) || (nodeB == null))
                throw new ArgumentException();
            int namespaceCompare = string.CompareOrdinal(nodeA.NamespaceURI, nodeB.NamespaceURI);
            if (namespaceCompare != 0) return namespaceCompare;
            return string.CompareOrdinal(nodeA.LocalName, nodeB.LocalName);
        }
    }
}

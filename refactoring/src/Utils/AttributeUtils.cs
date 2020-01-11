using System.Diagnostics;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class AttributeUtils
    {
        internal static string GetNamespacePrefix(XmlAttribute a)
        {
            Debug.Assert(NodeUtils.IsNamespaceNode(a) || NodeUtils.IsXmlNamespaceNode(a));
            return a.Prefix.Length == 0 ? string.Empty : a.LocalName;
        }

        internal static bool HasNamespacePrefix(XmlAttribute a, string nsPrefix)
        {
            return GetNamespacePrefix(a).Equals(nsPrefix);
        }

        internal static bool IsNonRedundantNamespaceDecl(XmlAttribute a, XmlAttribute nearestAncestorWithSamePrefix)
        {
            if (nearestAncestorWithSamePrefix == null)
                return !NodeUtils.IsEmptyDefaultNamespaceNode(a);
            else
                return !nearestAncestorWithSamePrefix.Value.Equals(a.Value);
        }

        internal static bool IsXmlPrefixDefinitionNode(XmlAttribute a)
        {
            return false;
        }
    }
}

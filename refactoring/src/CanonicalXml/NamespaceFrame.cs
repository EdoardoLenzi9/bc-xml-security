using System.Xml;
using System.Collections;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{

    internal class NamespaceFrame
    {
        private Hashtable _rendered = new Hashtable();
        private Hashtable _unrendered = new Hashtable();

        internal NamespaceFrame() { }

        internal void AddRendered(XmlAttribute attr)
        {
            _rendered.Add(AttributeUtils.GetNamespacePrefix(attr), attr);
        }

        internal XmlAttribute GetRendered(string nsPrefix)
        {
            return (XmlAttribute)_rendered[nsPrefix];
        }

        internal void AddUnrendered(XmlAttribute attr)
        {
            _unrendered.Add(AttributeUtils.GetNamespacePrefix(attr), attr);
        }

        internal XmlAttribute GetUnrendered(string nsPrefix)
        {
            return (XmlAttribute)_unrendered[nsPrefix];
        }

        internal Hashtable GetUnrendered()
        {
            return _unrendered;
        }
    }
}

using System;
using System.Collections;
using System.IO;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public abstract class Transform
    {
        private NS _algorithm;
        private string _baseUri = null;
        internal XmlResolver _xmlResolver = null;
        private bool _bResolverSet = false;
        private SignedXml _signedXml = null;
        private Reference _reference = null;
        private Hashtable _propagatedNamespaces = null;
        private XmlElement _context = null;

        internal string BaseURI
        {
            get { return _baseUri; }
            set { _baseUri = value; }
        }

        internal SignedXml SignedXml
        {
            get { return _signedXml; }
            set { _signedXml = value; }
        }

        internal Reference Reference
        {
            get { return _reference; }
            set { _reference = value; }
        }

        protected Transform() { }

        public NS Algorithm
        {
            get { return _algorithm; }
            set { _algorithm = value; }
        }

        public XmlResolver Resolver
        {
            set
            {
                _xmlResolver = value;
                _bResolverSet = true;
            }

            internal get
            {
                return _xmlResolver;
            }
        }

        internal bool ResolverSet
        {
            get { return _bResolverSet; }
        }

        public abstract Type[] InputTypes
        {
            get;
        }

        public abstract Type[] OutputTypes
        {
            get;
        }

        internal bool AcceptsType(Type inputType)
        {
            if (InputTypes != null)
            {
                for (int i = 0; i < InputTypes.Length; i++)
                {
                    if (inputType == InputTypes[i] || inputType.IsSubclassOf(InputTypes[i]))
                        return true;
                }
            }
            return false;
        }
        public XmlElement GetXml()
        {
            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            return GetXml(document, "Transform");
        }

        internal XmlElement GetXml(XmlDocument document, string name)
        {
            XmlElement transformElement = document.CreateElement(name, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            if (Algorithm != NS.None)
                transformElement.SetAttribute("Algorithm", XmlNameSpace.Url[Algorithm]);
            XmlNodeList children = GetInnerXml();
            if (children != null)
            {
                foreach (XmlNode node in children)
                {
                    transformElement.AppendChild(document.ImportNode(node, true));
                }
            }
            return transformElement;
        }

        public abstract void LoadInnerXml(XmlNodeList nodeList);

        protected abstract XmlNodeList GetInnerXml();

        public abstract void LoadInput(object obj);

        public abstract object GetOutput();

        public abstract object GetOutput(Type type);

        public virtual void GetDigestedOutput(IHash hash)
        {
            // Default the buffer size to 4K.
            byte[] buffer = new byte[4096];
            int bytesRead;
            var inputStream = (Stream)GetOutput(typeof(Stream));
            hash.Reset();
            while ((bytesRead = inputStream.Read(buffer, 0, buffer.Length)) > 0) {
                hash.BlockUpdate(buffer, 0, bytesRead);
            }
        }

        public XmlElement Context
        {
            get
            {
                if (_context != null)
                    return _context;

                Reference reference = Reference;
                SignedXml signedXml = (reference == null ? SignedXml : reference.GetSignedXml());
                if (signedXml == null)
                    return null;

                return signedXml._context;
            }
            set
            {
                _context = value;
            }
        }

        public Hashtable PropagatedNamespaces
        {
            get
            {
                if (_propagatedNamespaces != null)
                    return _propagatedNamespaces;

                Reference reference = Reference;
                SignedXml signedXml = (reference == null ? SignedXml : reference.GetSignedXml());

                // If the reference is not a Uri reference with a DataObject target, return an empty hashtable.
                if (reference != null &&
                    ((reference.ReferenceTargetType != ReferenceTargetType.UriReference) ||
                     (string.IsNullOrEmpty(reference.Uri) || reference.Uri[0] != '#')))
                {
                    _propagatedNamespaces = new Hashtable(0);
                    return _propagatedNamespaces;
                }

                CanonicalXmlNodeList namespaces = null;
                if (reference != null)
                    namespaces = reference._namespaces;
                else if (signedXml?._context != null)
                    namespaces = ElementUtils.GetPropagatedAttributes(signedXml._context);

                // if no namespaces have been propagated, return an empty hashtable.
                if (namespaces == null)
                {
                    _propagatedNamespaces = new Hashtable(0);
                    return _propagatedNamespaces;
                }

                _propagatedNamespaces = new Hashtable(namespaces.Count);
                foreach (XmlNode attrib in namespaces)
                {
                    string key = ((attrib.Prefix.Length > 0) ? attrib.Prefix + ":" + attrib.LocalName : attrib.LocalName);
                    if (!_propagatedNamespaces.Contains(key))
                        _propagatedNamespaces.Add(key, attrib.Value);
                }
                return _propagatedNamespaces;
            }
        }
    }
}

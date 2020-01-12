

using System;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{

    public class XmlDsigXPathTransform : Transform
    {
        private Type[] _inputTypes = { typeof(Stream), typeof(XmlNodeList), typeof(XmlDocument) };
        private Type[] _outputTypes = { typeof(XmlNodeList) };
        private string _xpathexpr;
        private XmlDocument _document;
        private XmlNamespaceManager _nsm;

        public XmlDsigXPathTransform()
        {
            Algorithm = NS.XmlDsigXPathTransformUrl;
        }

        public override Type[] InputTypes
        {
            get { return _inputTypes; }
        }

        public override Type[] OutputTypes
        {
            get { return _outputTypes; }
        }

        public override void LoadInnerXml(XmlNodeList nodeList)
        {
            if (nodeList == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);

            foreach (XmlNode node in nodeList)
            {
                string prefix = null;
                string namespaceURI = null;
                XmlElement elem = node as XmlElement;
                if (elem != null)
                {
                    if (elem.LocalName == "XPath")
                    {
                        _xpathexpr = elem.InnerXml.Trim(null);
                        XmlNodeReader nr = new XmlNodeReader(elem);
                        XmlNameTable nt = nr.NameTable;
                        _nsm = new XmlNamespaceManager(nt);
                        if (!ElementUtils.VerifyAttributes(elem, (string)null))
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                        }
                        foreach (XmlAttribute attrib in elem.Attributes)
                        {
                            if (attrib.Prefix == "xmlns")
                            {
                                prefix = attrib.LocalName;
                                namespaceURI = attrib.Value;
                                if (prefix == null)
                                {
                                    prefix = elem.Prefix;
                                    namespaceURI = elem.NamespaceURI;
                                }
                                _nsm.AddNamespace(prefix, namespaceURI);
                            }
                        }
                        break;
                    }
                    else
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                    }
                }
            }

            if (_xpathexpr == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
        }

        protected override XmlNodeList GetInnerXml()
        {
            XmlDocument document = new XmlDocument();
            XmlElement element = document.CreateElement(null, "XPath", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            if (_nsm != null)
            {
                foreach (string prefix in _nsm)
                {
                    switch (prefix)
                    {
                        case "xml":
                        case "xmlns":
                            break;

                        default:
                            if (prefix != null && prefix.Length > 0)
                                element.SetAttribute("xmlns:" + prefix, _nsm.LookupNamespace(prefix));
                            break;
                    }
                }
            }
            element.InnerXml = _xpathexpr;
            document.AppendChild(element);
            return document.ChildNodes;
        }

        public override void LoadInput(object obj)
        {
            if (obj is Stream)
            {
                LoadStreamInput((Stream)obj);
            }
            else if (obj is XmlNodeList)
            {
                LoadXmlNodeListInput((XmlNodeList)obj);
            }
            else if (obj is XmlDocument)
            {
                LoadXmlDocumentInput((XmlDocument)obj);
            }
        }

        private void LoadStreamInput(Stream stream)
        {
            XmlResolver resolver = (ResolverSet ? _xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), BaseURI));
            XmlReader valReader = StreamUtils.PreProcessStreamInput(stream, resolver, BaseURI);
            _document = new XmlDocument();
            _document.PreserveWhitespace = true;
            _document.Load(valReader);
        }

        private void LoadXmlNodeListInput(XmlNodeList nodeList)
        {
            XmlResolver resolver = (ResolverSet ? _xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), BaseURI));
            CanonicalXml c14n = new CanonicalXml((XmlNodeList)nodeList, resolver, true);
            using (MemoryStream ms = new MemoryStream(c14n.GetBytes()))
            {
                LoadStreamInput(ms);
            }
        }

        private void LoadXmlDocumentInput(XmlDocument doc)
        {
            _document = doc;
        }

        public override object GetOutput()
        {
            CanonicalXmlNodeList resultNodeList = new CanonicalXmlNodeList();
            if (!string.IsNullOrEmpty(_xpathexpr))
            {
                XPathNavigator navigator = _document.CreateNavigator();
                XPathNodeIterator it = navigator.Select("//. | //@*");

                XPathExpression xpathExpr = navigator.Compile("boolean(" + _xpathexpr + ")");
                xpathExpr.SetContext(_nsm);

                while (it.MoveNext())
                {
                    XmlNode node = ((IHasXmlNode)it.Current).GetNode();

                    bool include = (bool)it.Current.Evaluate(xpathExpr);
                    if (include == true)
                        resultNodeList.Add(node);
                }

                it = navigator.Select("//namespace::*");
                while (it.MoveNext())
                {
                    XmlNode node = ((IHasXmlNode)it.Current).GetNode();
                    resultNodeList.Add(node);
                }
            }

            return resultNodeList;
        }

        public override object GetOutput(Type type)
        {
            if (type != typeof(XmlNodeList) && !type.IsSubclassOf(typeof(XmlNodeList)))
                throw new ArgumentException(SR.Cryptography_Xml_TransformIncorrectInputType, nameof(type));
            return (XmlNodeList)GetOutput();
        }
    }
}

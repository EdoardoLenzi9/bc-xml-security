using System.Xml;
using System.IO;
using System.Text;
using System;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXml 
    {
        private readonly CanonicalXmlDocument _c14nDoc;
        private readonly C14NAncestralNamespaceContextManager _ancMgr;

        internal CanonicalXml(Stream inputStream, bool includeComments, XmlResolver resolver, string strBaseUri)
        {
            if (inputStream == null)
                throw new ArgumentNullException(nameof(inputStream));

            _c14nDoc = new CanonicalXmlDocument(true, includeComments);
            _c14nDoc.XmlResolver = resolver;
            _c14nDoc.Load(StreamUtils.PreProcessStreamInput(inputStream, resolver, strBaseUri));
            _ancMgr = new C14NAncestralNamespaceContextManager();
        }

        internal CanonicalXml(XmlDocument document, XmlResolver resolver) : this(document, resolver, false) { }
        internal CanonicalXml(XmlDocument document, XmlResolver resolver, bool includeComments)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));

            _c14nDoc = new CanonicalXmlDocument(true, includeComments);
            _c14nDoc.XmlResolver = resolver;
            _c14nDoc.Load(new XmlNodeReader(document));
            _ancMgr = new C14NAncestralNamespaceContextManager();
        }

        internal CanonicalXml(XmlNodeList nodeList, XmlResolver resolver, bool includeComments)
        {
            if (nodeList == null)
                throw new ArgumentNullException(nameof(nodeList));

            XmlDocument doc = NodeUtils.GetOwnerDocument(nodeList);
            if (doc == null)
                throw new ArgumentException(nameof(nodeList));

            _c14nDoc = new CanonicalXmlDocument(false, includeComments);
            _c14nDoc.XmlResolver = resolver;
            _c14nDoc.Load(new XmlNodeReader(doc));
            _ancMgr = new C14NAncestralNamespaceContextManager();

            MarkInclusionStateForNodes(nodeList, doc, _c14nDoc);
        }

        private static void MarkNodeAsIncluded(XmlNode node)
        {
            if (node is ICanonicalizableNode)
            {
                ((ICanonicalizableNode)node).SetIsInNodeSet(true);
            }
        }
        
        internal byte[] GetBytes()
        {
            StringBuilder sb = new StringBuilder();
            _c14nDoc.Write(sb, DocPosition.BeforeRootElement, _ancMgr);
            UTF8Encoding utf8 = new UTF8Encoding(false);
            return utf8.GetBytes(sb.ToString());
        }

        internal void GetDigestedBytes(IHash hash)
        {
            _c14nDoc.WriteHash(hash, DocPosition.BeforeRootElement, _ancMgr);
        }

        private static void MarkInclusionStateForNodes(XmlNodeList nodeList, XmlDocument inputRoot, XmlDocument root)
        {
            CanonicalXmlNodeList elementList = new CanonicalXmlNodeList();
            CanonicalXmlNodeList elementListCanonical = new CanonicalXmlNodeList();
            elementList.Add(inputRoot);
            elementListCanonical.Add(root);
            int index = 0;

            do
            {
                XmlNode currentNode = elementList[index];
                XmlNode currentNodeCanonical = elementListCanonical[index];
                XmlNodeList childNodes = currentNode.ChildNodes;
                XmlNodeList childNodesCanonical = currentNodeCanonical.ChildNodes;
                for (int i = 0; i < childNodes.Count; i++)
                {
                    elementList.Add(childNodes[i]);
                    elementListCanonical.Add(childNodesCanonical[i]);

                    if (NodeUtils.NodeInList(childNodes[i], nodeList))
                    {
                        MarkNodeAsIncluded(childNodesCanonical[i]);
                    }

                    XmlAttributeCollection attribNodes = childNodes[i].Attributes;
                    if (attribNodes != null)
                    {
                        for (int j = 0; j < attribNodes.Count; j++)
                        {
                            if (NodeUtils.NodeInList(attribNodes[j], nodeList))
                            {
                                MarkNodeAsIncluded(childNodesCanonical[i].Attributes.Item(j));
                            }
                        }
                    }
                }
                index++;
            } while (index < elementList.Count);
        }

    }
}

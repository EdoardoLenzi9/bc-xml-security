using System;
using System.Collections;
using System.IO;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class TransformChain
    {
        private ArrayList _transforms;

        public TransformChain()
        {
            _transforms = new ArrayList();
        }

        public void Add(Transform transform)
        {
            if (transform != null)
                _transforms.Add(transform);
        }

        public IEnumerator GetEnumerator()
        {
            return _transforms.GetEnumerator();
        }

        public int Count
        {
            get { return _transforms.Count; }
        }

        public Transform this[int index]
        {
            get
            {
                if (index >= _transforms.Count)
                    throw new ArgumentException(SR.ArgumentOutOfRange_Index, nameof(index));
                return (Transform)_transforms[index];
            }
        }

        internal Stream TransformToOctetStream(object inputObject, Type inputType, XmlResolver resolver, string baseUri)
        {
            object currentInput = inputObject;
            foreach (Transform transform in _transforms)
            {
                if (currentInput == null || transform.AcceptsType(currentInput.GetType()))
                {
                    transform.Resolver = resolver;
                    transform.BaseURI = baseUri;
                    transform.LoadInput(currentInput);
                    currentInput = transform.GetOutput();
                }
                else
                {
                    if (currentInput is Stream)
                    {
                        if (transform.AcceptsType(typeof(XmlDocument)))
                        {
                            Stream currentInputStream = currentInput as Stream;
                            XmlDocument doc = new XmlDocument();
                            doc.PreserveWhitespace = true;
                            XmlReader valReader = StreamUtils.PreProcessStreamInput(currentInputStream, resolver, baseUri);
                            doc.Load(valReader);
                            transform.LoadInput(doc);
                            currentInputStream.Close();
                            currentInput = transform.GetOutput();
                            continue;
                        }
                        else
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_TransformIncorrectInputType);
                        }
                    }
                    if (currentInput is XmlNodeList)
                    {
                        if (transform.AcceptsType(typeof(Stream)))
                        {
                            CanonicalXml c14n = new CanonicalXml((XmlNodeList)currentInput, resolver, false);
                            MemoryStream ms = new MemoryStream(c14n.GetBytes());
                            transform.LoadInput(ms);
                            currentInput = transform.GetOutput();
                            ms.Close();
                            continue;
                        }
                        else
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_TransformIncorrectInputType);
                        }
                    }
                    if (currentInput is XmlDocument)
                    {
                        if (transform.AcceptsType(typeof(Stream)))
                        {
                            CanonicalXml c14n = new CanonicalXml((XmlDocument)currentInput, resolver);
                            MemoryStream ms = new MemoryStream(c14n.GetBytes());
                            transform.LoadInput(ms);
                            currentInput = transform.GetOutput();
                            ms.Close();
                            continue;
                        }
                        else
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_TransformIncorrectInputType);
                        }
                    }
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_TransformIncorrectInputType);
                }
            }

            if (currentInput is Stream)
            {
                return currentInput as Stream;
            }
            if (currentInput is XmlNodeList)
            {
                CanonicalXml c14n = new CanonicalXml((XmlNodeList)currentInput, resolver, false);
                MemoryStream ms = new MemoryStream(c14n.GetBytes());
                return ms;
            }
            if (currentInput is XmlDocument)
            {
                CanonicalXml c14n = new CanonicalXml((XmlDocument)currentInput, resolver);
                MemoryStream ms = new MemoryStream(c14n.GetBytes());
                return ms;
            }
            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_TransformIncorrectInputType);
        }

        internal Stream TransformToOctetStream(Stream input, XmlResolver resolver, string baseUri)
        {
            return TransformToOctetStream(input, typeof(Stream), resolver, baseUri);
        }

        internal Stream TransformToOctetStream(XmlDocument document, XmlResolver resolver, string baseUri)
        {
            return TransformToOctetStream(document, typeof(XmlDocument), resolver, baseUri);
        }

        internal XmlElement GetXml(XmlDocument document, NS ns)
        {
            XmlElement transformsElement = document.CreateElement("Transforms", XmlNameSpace.Url[ns]);
            foreach (Transform transform in _transforms)
            {
                if (transform != null)
                {
                    // Construct the individual transform element
                    XmlElement transformElement = transform.GetXml(document);
                    if (transformElement != null)
                        transformsElement.AppendChild(transformElement);
                }
            }
            return transformsElement;
        }

        internal void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlNodeList transformNodes = value.SelectNodes("ds:Transform", nsm);
            if (transformNodes.Count == 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Transforms");

            _transforms.Clear();
            for (int i = 0; i < transformNodes.Count; ++i)
            {
                XmlElement transformElement = (XmlElement)transformNodes.Item(i);
                string algorithm = ElementUtils.GetAttribute(transformElement, "Algorithm", NS.XmlDsigNamespaceUrl);
                Transform transform = CryptoHelpers.CreateFromName<Transform>(algorithm);
                if (transform == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                // let the transform read the children of the transformElement for data
                transform.LoadInnerXml(transformElement.ChildNodes);
                _transforms.Add(transform);
            }
        }
    }
}

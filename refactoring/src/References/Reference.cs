// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using System;
using System.Globalization;
using System.IO;
using System.Net;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class Reference
    {
        private string _id;
        private string _uri;
        private string _type;
        private TransformChain _transformChain;
        private string _digestMethod;
        private byte[] _digestValue;
        private IHash _hashAlgorithm;
        private readonly object _refTarget;
        private readonly ReferenceTargetType _refTargetType;
        private XmlElement _cachedXml;
        private SignedXml _signedXml = null;
        internal CanonicalXmlNodeList _namespaces = null;
        private byte[] _hashval = null;

        //
        // public constructors
        //

        public Reference()
        {
            _transformChain = new TransformChain();
            _refTarget = null;
            _refTargetType = ReferenceTargetType.UriReference;
            _cachedXml = null;
            _digestMethod = XmlNameSpace.Url[NS.XmlDsigSHA256Url];
        }

        public Reference(Stream stream)
        {
            _transformChain = new TransformChain();
            _refTarget = stream;
            _refTargetType = ReferenceTargetType.Stream;
            _cachedXml = null;
            _digestMethod = XmlNameSpace.Url[NS.XmlDsigSHA256Url];
        }

        public Reference(string uri)
        {
            _transformChain = new TransformChain();
            _refTarget = uri;
            _uri = uri;
            _refTargetType = ReferenceTargetType.UriReference;
            _cachedXml = null;
            _digestMethod = XmlNameSpace.Url[NS.XmlDsigSHA256Url];
        }

        internal Reference(XmlElement element)
        {
            _transformChain = new TransformChain();
            _refTarget = element;
            _refTargetType = ReferenceTargetType.XmlElement;
            _cachedXml = null;
            _digestMethod = XmlNameSpace.Url[NS.XmlDsigSHA256Url];
        }

        //
        // public properties
        //

        public string GetId()
        { return _id; }

        //
        // public properties
        //

        public void SetId(string value)
        { _id = value; }

        public string Uri
        {
            get { return _uri; }
            set
            {
                _uri = value;
                _cachedXml = null;
            }
        }

        public string Type
        {
            get { return _type; }
            set
            {
                _type = value;
                _cachedXml = null;
            }
        }

        public string DigestMethod
        {
            get { return _digestMethod; }
            set
            {
                _digestMethod = value;
                _cachedXml = null;
            }
        }

        public byte[] DigestValue
        {
            get { return _digestValue; }
            set
            {
                _digestValue = value;
                _cachedXml = null;
            }
        }

        public TransformChain TransformChain
        {
            get
            {
                if (_transformChain == null)
                    _transformChain = new TransformChain();
                return _transformChain;
            }
            set
            {
                _transformChain = value;
                _cachedXml = null;
            }
        }

        internal bool CacheValid
        {
            get
            {
                return (_cachedXml != null);
            }
        }

        internal SignedXml GetSignedXml()
        { return _signedXml; }

        internal void SetSignedXml(SignedXml value)
        { _signedXml = value; }

        internal ReferenceTargetType ReferenceTargetType
        {
            get
            {
                return _refTargetType;
            }
        }

        //
        // public methods
        //

        public XmlElement GetXml()
        {
            if (CacheValid) return (_cachedXml);

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            // Create the Reference
            XmlElement referenceElement = document.CreateElement("Reference", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            if (!string.IsNullOrEmpty(_id))
                referenceElement.SetAttribute("Id", _id);

            if (_uri != null)
                referenceElement.SetAttribute("URI", _uri);

            if (!string.IsNullOrEmpty(_type))
                referenceElement.SetAttribute("Type", _type);

            // Add the transforms to the Reference
            if (TransformChain.Count != 0)
                referenceElement.AppendChild(TransformChain.GetXml(document, NS.XmlDsigNamespaceUrl));

            // Add the DigestMethod
            if (string.IsNullOrEmpty(_digestMethod))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_DigestMethodRequired);

            XmlElement digestMethodElement = document.CreateElement("DigestMethod", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            digestMethodElement.SetAttribute("Algorithm", _digestMethod);
            referenceElement.AppendChild(digestMethodElement);

            if (DigestValue == null)
            {
                if (_hashval == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_DigestValueRequired);
                DigestValue = _hashval;
            }

            XmlElement digestValueElement = document.CreateElement("DigestValue", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            digestValueElement.AppendChild(document.CreateTextNode(Convert.ToBase64String(_digestValue)));
            referenceElement.AppendChild(digestValueElement);

            return referenceElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            _id = ElementUtils.GetAttribute(value, "Id", NS.XmlDsigNamespaceUrl);
            _uri = ElementUtils.GetAttribute(value, "URI", NS.XmlDsigNamespaceUrl);
            _type = ElementUtils.GetAttribute(value, "Type", NS.XmlDsigNamespaceUrl);
            if (!ElementUtils.VerifyAttributes(value, new string[] { "Id", "URI", "Type" }))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference");

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            // Transforms
            bool hasTransforms = false;
            TransformChain = new TransformChain();
            XmlNodeList transformsNodes = value.SelectNodes("ds:Transforms", nsm);
            if (transformsNodes != null && transformsNodes.Count != 0)
            {
                if (transformsNodes.Count > 1)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/Transforms");
                }
                hasTransforms = true;
                XmlElement transformsElement = transformsNodes[0] as XmlElement;
                if (!ElementUtils.VerifyAttributes(transformsElement, (string[])null))
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/Transforms");
                }

                XmlNodeList transformNodes = transformsElement.SelectNodes("ds:Transform", nsm);
                if (transformNodes != null)
                {
                    if (transformNodes.Count != transformsElement.SelectNodes("*").Count)
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/Transforms");
                    }
                    if (transformNodes.Count > CryptoUtils.MaxTransformsPerReference)
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/Transforms");
                    }
                    foreach (XmlNode transformNode in transformNodes)
                    {
                        XmlElement transformElement = transformNode as XmlElement;
                        string algorithm = ElementUtils.GetAttribute(transformElement, "Algorithm", NS.XmlDsigNamespaceUrl);
                        if (algorithm == null || !ElementUtils.VerifyAttributes(transformElement, "Algorithm"))
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                        }
                        Transform transform = CryptoHelpers.CreateFromName<Transform>(algorithm);
                        if (transform == null)
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                        }
                        AddTransform(transform);
                        // let the transform read the children of the transformElement for data
                        transform.LoadInnerXml(transformElement.ChildNodes);
                        // Hack! this is done to get around the lack of here() function support in XPath
                        if (transform is XmlDsigEnvelopedSignatureTransform)
                        {
                            // Walk back to the Signature tag. Find the nearest signature ancestor
                            // Signature-->SignedInfo-->Reference-->Transforms-->Transform
                            XmlNode signatureTag = transformElement.SelectSingleNode("ancestor::ds:Signature[1]", nsm);
                            XmlNodeList signatureList = transformElement.SelectNodes("//ds:Signature", nsm);
                            if (signatureList != null)
                            {
                                int position = 0;
                                foreach (XmlNode node in signatureList)
                                {
                                    position++;
                                    if (node == signatureTag)
                                    {
                                        ((XmlDsigEnvelopedSignatureTransform)transform).SignaturePosition = position;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // DigestMethod
            XmlNodeList digestMethodNodes = value.SelectNodes("ds:DigestMethod", nsm);
            if (digestMethodNodes == null || digestMethodNodes.Count == 0 || digestMethodNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/DigestMethod");
            XmlElement digestMethodElement = digestMethodNodes[0] as XmlElement;
            _digestMethod = ElementUtils.GetAttribute(digestMethodElement, "Algorithm", NS.XmlDsigNamespaceUrl);
            if (_digestMethod == null || !ElementUtils.VerifyAttributes(digestMethodElement, "Algorithm"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/DigestMethod");


            // DigestValue
            XmlNodeList digestValueNodes = value.SelectNodes("ds:DigestValue", nsm);
            if (digestValueNodes == null || digestValueNodes.Count == 0 || digestValueNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/DigestValue");
            XmlElement digestValueElement = digestValueNodes[0] as XmlElement;
            _digestValue = Convert.FromBase64String(ParserUtils.DiscardWhiteSpaces(digestValueElement.InnerText));
            if (!ElementUtils.VerifyAttributes(digestValueElement, (string[])null))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference/DigestValue");
            // Verify that there aren't any extra nodes that aren't allowed
            int expectedChildNodeCount = hasTransforms ? 3 : 2;
            if (value.SelectNodes("*").Count != expectedChildNodeCount)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Reference");

            // cache the Xml
            _cachedXml = value;
        }

        public void AddTransform(Transform transform)
        {
            if (transform == null)
                throw new ArgumentNullException("transform");

            transform.Reference = this;
            TransformChain.Add(transform);
        }

        internal void UpdateHashValue(XmlDocument document, CanonicalXmlNodeList refList)
        {
            DigestValue = CalculateHashValue(document, refList);
        }

        // What we want to do is pump the input throug the TransformChain and then 
        // hash the output of the chain document is the document context for resolving relative references
        internal byte[] CalculateHashValue(XmlDocument document, CanonicalXmlNodeList refList)
        {
            // refList is a list of elements that might be targets of references
            // Now's the time to create our hashing algorithm
            IDigest digest = CryptoHelpers.CreateFromName<IDigest>(_digestMethod);
            if (digest == null)
            {
                IMac mac = CryptoHelpers.CreateFromName<IMac>(_digestMethod);
                if (mac == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_CreateHashAlgorithmFailed);

                // For compatibility to corefx' HMAC implementation
                byte[] randomKey = CryptoUtils.GenerateRandomBlock(mac.GetMacSize());
                mac.Init(new KeyParameter(randomKey));

                _hashAlgorithm = new MacHashWrapper(mac);
            }
            else
            {
                _hashAlgorithm = new DigestHashWrapper(digest);
            }

            // Let's go get the target.
            string baseUri = document == null ? Environment.CurrentDirectory + "\\" : document.BaseURI;
            Stream hashInputStream = null;
            WebResponse response = null;
            Stream inputStream = null;
            XmlResolver resolver = null;
            _hashval = null;

            try
            {
                switch (_refTargetType)
                {
                    case ReferenceTargetType.Stream:
                        // This is the easiest case. We already have a stream, so just pump it through the TransformChain
                        resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                        hashInputStream = TransformChain.TransformToOctetStream((Stream)_refTarget, resolver, baseUri);
                        break;
                    case ReferenceTargetType.UriReference:
                        // Second-easiest case -- dereference the URI & pump through the TransformChain
                        // handle the special cases where the URI is null (meaning whole doc)
                        // or the URI is just a fragment (meaning a reference to an embedded Object)
                        if (_uri == null)
                        {
                            // We need to create a DocumentNavigator out of the XmlElement
                            resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                            // In the case of a Uri-less reference, we will simply pass null to the transform chain.
                            // The first transform in the chain is expected to know how to retrieve the data to hash.
                            hashInputStream = TransformChain.TransformToOctetStream((Stream)null, resolver, baseUri);
                        }
                        else if (_uri.Length == 0)
                        {
                            // This is the self-referential case. First, check that we have a document context.
                            // The Enveloped Signature does not discard comments as per spec; those will be omitted during the transform chain process
                            if (document == null)
                                throw new System.Security.Cryptography.CryptographicException(string.Format(CultureInfo.CurrentCulture, SR.Cryptography_Xml_SelfReferenceRequiresContext, _uri));

                            // Normalize the containing document
                            resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                            XmlDocument docWithNoComments = StreamUtils.DiscardComments(StreamUtils.PreProcessDocumentInput(document, resolver, baseUri));
                            hashInputStream = TransformChain.TransformToOctetStream(docWithNoComments, resolver, baseUri);
                        }
                        else if (_uri[0] == '#')
                        {
                            // If we get here, then we are constructing a Reference to an embedded DataObject
                            // referenced by an Id = attribute. Go find the relevant object
                            bool discardComments = true;
                            string idref = ParserUtils.GetIdFromLocalUri(_uri, out discardComments);
                            if (idref == "xpointer(/)")
                            {
                                // This is a self referencial case
                                if (document == null)
                                    throw new System.Security.Cryptography.CryptographicException(string.Format(CultureInfo.CurrentCulture, SR.Cryptography_Xml_SelfReferenceRequiresContext, _uri));

                                // We should not discard comments here!!!
                                resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                                hashInputStream = TransformChain.TransformToOctetStream(StreamUtils.PreProcessDocumentInput(document, resolver, baseUri), resolver, baseUri);
                                break;
                            }

                            XmlElement elem = GetSignedXml().GetIdElement(document, idref);
                            if (elem != null)
                                _namespaces = ElementUtils.GetPropagatedAttributes(elem.ParentNode as XmlElement);

                            if (elem == null && refList != null)
                            {
                                foreach (XmlNode node in refList)
                                {
                                    XmlElement tempElem = node as XmlElement;
                                    if ((tempElem != null) && (ElementUtils.HasAttribute(tempElem, "Id", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]))
                                        && (ElementUtils.GetAttribute(tempElem, "Id", NS.XmlDsigNamespaceUrl).Equals(idref)))
                                    {
                                        elem = tempElem;
                                        if (_signedXml._context != null)
                                            _namespaces = ElementUtils.GetPropagatedAttributes(_signedXml._context);
                                        break;
                                    }
                                }
                            }

                            if (elem == null)
                                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);

                            XmlDocument normDocument = StreamUtils.PreProcessElementInput(elem, resolver, baseUri);
                            // Add the propagated attributes
                            ElementUtils.AddNamespaces(normDocument.DocumentElement, _namespaces);

                            resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                            if (discardComments)
                            {
                                // We should discard comments before going into the transform chain
                                XmlDocument docWithNoComments = StreamUtils.DiscardComments(normDocument);
                                hashInputStream = TransformChain.TransformToOctetStream(docWithNoComments, resolver, baseUri);
                            }
                            else
                            {
                                // This is an XPointer reference, do not discard comments!!!
                                hashInputStream = TransformChain.TransformToOctetStream(normDocument, resolver, baseUri);
                            }
                        }
                        else
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotResolved, _uri);
                        }
                        break;
                    case ReferenceTargetType.XmlElement:
                        // We need to create a DocumentNavigator out of the XmlElement
                        resolver = (GetSignedXml().ResolverSet ? GetSignedXml()._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                        hashInputStream = TransformChain.TransformToOctetStream(StreamUtils.PreProcessElementInput((XmlElement)_refTarget, resolver, baseUri), resolver, baseUri);
                        break;
                    default:
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriNotResolved, _uri);
                }

                // Compute the new hash value
                hashInputStream = SignedXmlDebugLog.LogReferenceData(this, hashInputStream);
                // Default the buffer size to 4K.
                byte[] buffer = new byte[4096];
                int bytesRead;
                _hashAlgorithm.Reset();
                while ((bytesRead = hashInputStream.Read(buffer, 0, buffer.Length)) > 0) {
                    _hashAlgorithm.BlockUpdate(buffer, 0, bytesRead);
                }
                _hashval = new byte[_hashAlgorithm.GetHashSize()];
                _hashAlgorithm.DoFinal(_hashval, 0);
            }
            finally
            {
                if (hashInputStream != null)
                    hashInputStream.Close();
                if (response != null)
                    response.Close();
                if (inputStream != null)
                    inputStream.Close();
            }

            return _hashval;
        }
    }
}

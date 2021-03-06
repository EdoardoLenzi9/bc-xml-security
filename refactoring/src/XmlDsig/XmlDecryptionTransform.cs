﻿using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using System;
using System.Collections;
using System.IO;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{

    public class XmlDecryptionTransform : Transform
    {
        private Type[] _inputTypes = { typeof(Stream), typeof(XmlDocument) };
        private Type[] _outputTypes = { typeof(XmlDocument) };
        private XmlNodeList _encryptedDataList = null;
        private ArrayList _arrayListUri = null; // this ArrayList object represents the Uri's to be excluded
        private XmlDecryption _exml = null; // defines the XML encryption processing rules
        private XmlDocument _containingDocument = null;
        private XmlNamespaceManager _nsm = null;

        public XmlDecryptionTransform()
        {
            Algorithm = NS.XmlDecryptionTransformUrl;
        }

        private ArrayList ExceptUris
        {
            get
            {
                if (_arrayListUri == null)
                    _arrayListUri = new ArrayList();
                return _arrayListUri;
            }
        }

        protected virtual bool IsTargetElement(XmlElement inputElement, string idValue)
        {
            if (inputElement == null)
                return false;
            if (inputElement.GetAttribute("Id") == idValue || inputElement.GetAttribute("id") == idValue ||
                inputElement.GetAttribute("ID") == idValue)
                return true;

            return false;
        }

        public XmlDecryption XmlDecryption
        {
            get
            {
                if (_exml != null)
                    return _exml;

                Reference reference = Reference;
                SignedXml signedXml = (reference == null ? SignedXml : reference.GetSignedXml());
                if (signedXml == null || signedXml.EncryptedXml == null)
                    _exml = new XmlDecryption(_containingDocument); // default processing rules
                else
                    _exml = signedXml.EncryptedXml;

                return _exml;
            }
            set { _exml = value; }
        }

        public override Type[] InputTypes
        {
            get { return _inputTypes; }
        }

        public override Type[] OutputTypes
        {
            get { return _outputTypes; }
        }

        public void AddExceptUri(string uri)
        {
            if (uri == null)
                throw new ArgumentNullException(nameof(uri));
            ExceptUris.Add(uri);
        }

        public override void LoadInnerXml(XmlNodeList nodeList)
        {
            if (nodeList == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
            ExceptUris.Clear();
            foreach (XmlNode node in nodeList)
            {
                XmlElement elem = node as XmlElement;
                if (elem != null)
                {
                    if (elem.LocalName == "Except" && elem.NamespaceURI == XmlNameSpace.Url[NS.XmlDecryptionTransformNamespaceUrl])
                    {
                        string uri = ElementUtils.GetAttribute(elem, "URI", NS.XmlDecryptionTransformNamespaceUrl);
                        if (uri == null || uri.Length == 0 || uri[0] != '#')
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UriRequired);
                        if (!ElementUtils.VerifyAttributes(elem, "URI"))
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                        }
                        string idref = ParserUtils.ExtractIdFromLocalUri(uri);
                        ExceptUris.Add(idref);
                    }
                    else
                    {
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                    }
                }
            }
        }

        protected override XmlNodeList GetInnerXml()
        {
            if (ExceptUris.Count == 0)
                return null;
            XmlDocument document = new XmlDocument();
            XmlElement element = document.CreateElement("Transform", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            if (Algorithm != NS.None)
                element.SetAttribute("Algorithm", XmlNameSpace.Url[Algorithm]);
            foreach (string uri in ExceptUris)
            {
                XmlElement exceptUriElement = document.CreateElement("Except", XmlNameSpace.Url[NS.XmlDecryptionTransformNamespaceUrl]);
                exceptUriElement.SetAttribute("URI", uri);
                element.AppendChild(exceptUriElement);
            }
            return element.ChildNodes;
        }

        public override void LoadInput(object obj)
        {
            if (obj is Stream)
            {
                LoadStreamInput((Stream)obj);
            }
            else if (obj is XmlDocument)
            {
                LoadXmlDocumentInput((XmlDocument)obj);
            }
        }

        private void LoadStreamInput(Stream stream)
        {
            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            XmlResolver resolver = (ResolverSet ? _xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), BaseURI));
            XmlReader xmlReader = StreamUtils.PreProcessStreamInput(stream, resolver, BaseURI);
            document.Load(xmlReader);
            _containingDocument = document;
            _nsm = new XmlNamespaceManager(_containingDocument.NameTable);
            _nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            _encryptedDataList = document.SelectNodes("//enc:EncryptedData", _nsm);
        }

        private void LoadXmlDocumentInput(XmlDocument document)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));
            _containingDocument = document;
            _nsm = new XmlNamespaceManager(document.NameTable);
            _nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            _encryptedDataList = document.SelectNodes("//enc:EncryptedData", _nsm);
        }

        private void ReplaceEncryptedData(XmlElement encryptedDataElement, byte[] decrypted)
        {
            XmlNode parent = encryptedDataElement.ParentNode;
            if (parent.NodeType == XmlNodeType.Document)
            {
                parent.InnerXml = XmlDecryption.GetEncoding().GetString(decrypted);
            }
            else
            {
                XmlDecryption.ReplaceData(encryptedDataElement, decrypted);
            }
        }

        private bool ProcessEncryptedDataItem(XmlElement encryptedDataElement)
        {
            if (ExceptUris.Count > 0)
            {
                for (int index = 0; index < ExceptUris.Count; index++)
                {
                    if (IsTargetElement(encryptedDataElement, (string)ExceptUris[index]))
                        return false;
                }
            }
            EncryptedData ed = new EncryptedData();
            ed.LoadXml(encryptedDataElement);
            ICipherParameters symAlg = XmlDecryption.GetDecryptionKey(ed, NS.None);
            if (symAlg == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingDecryptionKey);
            byte[] decrypted = XmlDecryption.DecryptData(ed, symAlg);

            ReplaceEncryptedData(encryptedDataElement, decrypted);
            return true;
        }

        private void ProcessElementRecursively(XmlNodeList encryptedDatas)
        {
            if (encryptedDatas == null || encryptedDatas.Count == 0)
                return;
            Queue encryptedDatasQueue = new Queue();
            foreach (XmlNode value in encryptedDatas)
            {
                encryptedDatasQueue.Enqueue(value);
            }
            XmlNode node = encryptedDatasQueue.Dequeue() as XmlNode;
            while (node != null)
            {
                XmlElement encryptedDataElement = node as XmlElement;
                if (encryptedDataElement != null && encryptedDataElement.LocalName == "EncryptedData" &&
                    encryptedDataElement.NamespaceURI == XmlNameSpace.Url[NS.XmlEncNamespaceUrl])
                {
                    XmlNode sibling = encryptedDataElement.NextSibling;
                    XmlNode parent = encryptedDataElement.ParentNode;
                    if (ProcessEncryptedDataItem(encryptedDataElement))
                    {
                        XmlNode child = parent.FirstChild;
                        while (child != null && child.NextSibling != sibling)
                            child = child.NextSibling;
                        if (child != null)
                        {
                            XmlNodeList nodes = child.SelectNodes("//enc:EncryptedData", _nsm);
                            if (nodes.Count > 0)
                            {
                                foreach (XmlNode value in nodes)
                                {
                                    encryptedDatasQueue.Enqueue(value);
                                }
                            }
                        }
                    }
                }
                if (encryptedDatasQueue.Count == 0)
                    break;
                node = encryptedDatasQueue.Dequeue() as XmlNode;
            }
        }

        public override object GetOutput()
        {
            if (_encryptedDataList != null)
                ProcessElementRecursively(_encryptedDataList);
            ElementUtils.AddNamespaces(_containingDocument.DocumentElement, PropagatedNamespaces);
            return _containingDocument;
        }

        public override object GetOutput(Type type)
        {
            if (type == typeof(XmlDocument))
                return (XmlDocument)GetOutput();
            else
                throw new ArgumentException(SR.Cryptography_Xml_TransformIncorrectInputType, nameof(type));
        }
    }
}

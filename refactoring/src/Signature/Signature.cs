using System;
using System.Collections;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class Signature
    {
        private string _id;
        private SignedInfo _signedInfo;
        private byte[] _signatureValue;
        private string _signatureValueId;
        private KeyInfo _keyInfo;
        private IList _embeddedObjects;
        private readonly CanonicalXmlNodeList _referencedItems;
        private SignedXml _signedXml = null;

        internal SignedXml GetSignedXml()
        { return _signedXml; }

        internal void SetSignedXml(SignedXml value)
        { _signedXml = value; }

        public Signature()
        {
            _embeddedObjects = new ArrayList();
            _referencedItems = new CanonicalXmlNodeList();
        }

        public string GetId()
        { return _id; }


        public void SetId(string value)
        { _id = value; }

        public SignedInfo SignedInfo
        {
            get { return _signedInfo; }
            set
            {
                _signedInfo = value;
                if (GetSignedXml() != null && _signedInfo != null)
                    _signedInfo.SetSignedXml(GetSignedXml());
            }
        }

        public byte[] GetSignatureValue()
        { return _signatureValue; }

        public void SetSignatureValue(byte[] value)
        { _signatureValue = value; }

        public KeyInfo KeyInfo
        {
            get
            {
                if (_keyInfo == null)
                    _keyInfo = new KeyInfo();
                return _keyInfo;
            }
            set { _keyInfo = value; }
        }

        public IList GetObjectList()
        { return _embeddedObjects; }

        public void SetObjectList(IList value)
        { _embeddedObjects = value; }

        internal CanonicalXmlNodeList ReferencedItems
        {
            get { return _referencedItems; }
        }

        public XmlElement GetXml()
        {
            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            XmlElement signatureElement = (XmlElement)document.CreateElement("Signature", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            if (!string.IsNullOrEmpty(_id))
                signatureElement.SetAttribute("Id", _id);

            if (_signedInfo == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignedInfoRequired);

            signatureElement.AppendChild(_signedInfo.GetXml(document));

            if (_signatureValue == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureValueRequired);

            XmlElement signatureValueElement = document.CreateElement("SignatureValue", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            signatureValueElement.AppendChild(document.CreateTextNode(Convert.ToBase64String(_signatureValue)));
            if (!string.IsNullOrEmpty(_signatureValueId))
                signatureValueElement.SetAttribute("Id", _signatureValueId);
            signatureElement.AppendChild(signatureValueElement);

            if (KeyInfo.Count > 0)
                signatureElement.AppendChild(KeyInfo.GetXml(document));

            foreach (object obj in _embeddedObjects)
            {
                DataObject dataObj = obj as DataObject;
                if (dataObj != null)
                {
                    signatureElement.AppendChild(dataObj.GetXml(document));
                }
            }

            return signatureElement;
        }

        private XmlElement LoadXml1(XmlElement value) {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlElement signatureElement = value;
            if (!signatureElement.LocalName.Equals("Signature"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Signature");

            _id = ElementUtils.GetAttribute(signatureElement, "Id", NS.XmlDsigNamespaceUrl);
            if (!ElementUtils.VerifyAttributes(signatureElement, "Id"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Signature");

            return signatureElement;
        }

        private int LoadXml2(XmlElement signatureElement, XmlNamespaceManager nsm, int expectedChildNodes)
        {
            XmlNodeList signedInfoNodes = signatureElement.SelectNodes("ds:SignedInfo", nsm);
            if (signedInfoNodes == null || signedInfoNodes.Count == 0 || signedInfoNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo");
            XmlElement signedInfoElement = signedInfoNodes[0] as XmlElement;
            expectedChildNodes += signedInfoNodes.Count;

            XmlNodeList signatureValueNodes = signatureElement.SelectNodes("ds:SignatureValue", nsm);
            if (signatureValueNodes == null || signatureValueNodes.Count == 0 || signatureValueNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignatureValue");
            XmlElement signatureValueElement = signatureValueNodes[0] as XmlElement;
            expectedChildNodes += signatureValueNodes.Count;
            _signatureValue = Convert.FromBase64String(ParserUtils.DiscardWhiteSpaces(signatureValueElement.InnerText));
            _signatureValueId = ElementUtils.GetAttribute(signatureValueElement, "Id", NS.XmlDsigNamespaceUrl);
            if (!ElementUtils.VerifyAttributes(signatureValueElement, "Id"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignatureValue");

            SignedInfo = new SignedInfo();
            SignedInfo.LoadXml(signedInfoElement);

            return expectedChildNodes;
        }
     
        public void LoadXml(XmlElement value)
        {
            var signatureElement = LoadXml1(value);
            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            int expectedChildNodes = LoadXml2(signatureElement, nsm, 0);
            
            XmlNodeList keyInfoNodes = signatureElement.SelectNodes("ds:KeyInfo", nsm);
            _keyInfo = new KeyInfo();
            if (keyInfoNodes != null)
            {
                if (keyInfoNodes.Count > 1)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "KeyInfo");
                }
                foreach (XmlNode node in keyInfoNodes)
                {
                    XmlElement keyInfoElement = node as XmlElement;
                    if (keyInfoElement != null)
                        _keyInfo.LoadXml(keyInfoElement);
                }
                expectedChildNodes += keyInfoNodes.Count;
            }

            XmlNodeList objectNodes = signatureElement.SelectNodes("ds:Object", nsm);
            _embeddedObjects.Clear();
            if (objectNodes != null)
            {
                foreach (XmlNode node in objectNodes)
                {
                    XmlElement objectElement = node as XmlElement;
                    if (objectElement != null)
                    {
                        DataObject dataObj = new DataObject();
                        dataObj.LoadXml(objectElement);
                        _embeddedObjects.Add(dataObj);
                    }
                }
                expectedChildNodes += objectNodes.Count;
            }

            XmlNodeList nodeList = signatureElement.SelectNodes("//*[@Id]", nsm);
            if (nodeList != null)
            {
                foreach (XmlNode node in nodeList)
                {
                    _referencedItems.Add(node);
                }
            }
            if (signatureElement.SelectNodes("*").Count != expectedChildNodes)
            {
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "Signature");
            }
        }

        public void AddObject(DataObject dataObject)
        {
            _embeddedObjects.Add(dataObject);
        }
    }
}


using System;
using System.Collections;
using System.Globalization;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class SignedInfo : ICollection
    {
        private string _id;
        private string _canonicalizationMethod;
        private string _signatureMethod;
        private string _signatureLength;
        private readonly ArrayList _references;
        private XmlElement _cachedXml = null;
        private SignedXml _signedXml = null;
        private Transform _canonicalizationMethodTransform = null;

        internal SignedXml GetSignedXml()
        { return _signedXml; }

        internal void SetSignedXml(SignedXml value)
        { _signedXml = value; }

        public SignedInfo()
        {
            _references = new ArrayList();
        }

        public IEnumerator GetEnumerator()
        {
            throw new NotSupportedException();
        }

        public void CopyTo(Array array, int index)
        {
            throw new NotSupportedException();
        }

        public int Count
        {
            get { throw new NotSupportedException(); }
        }

        public bool IsReadOnly
        {
            get { throw new NotSupportedException(); }
        }

        public bool IsSynchronized
        {
            get { throw new NotSupportedException(); }
        }

        public object SyncRoot
        {
            get { throw new NotSupportedException(); }
        }

        public string Id
        {
            get { return _id; }
            set
            {
                _id = value;
                _cachedXml = null;
            }
        }

        public string CanonicalizationMethod
        {
            get
            {
                if (_canonicalizationMethod == null)
                    return XmlNameSpace.Url[NS.XmlDsigC14NTransformUrl];
                return _canonicalizationMethod;
            }
            set
            {
                _canonicalizationMethod = value;
                _cachedXml = null;
            }
        }

        public Transform CanonicalizationMethodObject
        {
            get
            {
                if (_canonicalizationMethodTransform == null)
                {
                    _canonicalizationMethodTransform = CryptoHelpers.CreateFromName<Transform>(CanonicalizationMethod);
                    if (_canonicalizationMethodTransform == null)
                        throw new System.Security.Cryptography.CryptographicException(string.Format(CultureInfo.CurrentCulture, SR.Cryptography_Xml_CreateTransformFailed, CanonicalizationMethod));
                    _canonicalizationMethodTransform.SignedXml = GetSignedXml();
                    _canonicalizationMethodTransform.Reference = null;
                }
                return _canonicalizationMethodTransform;
            }
        }

        public string SignatureMethod
        {
            get { return _signatureMethod; }
            set
            {
                _signatureMethod = value;
                _cachedXml = null;
            }
        }

        public string SignatureLength
        {
            get { return _signatureLength; }
            set
            {
                _signatureLength = value;
                _cachedXml = null;
            }
        }

        public ArrayList References
        {
            get { return _references; }
        }

        internal bool CacheValid
        {
            get
            {
                if (_cachedXml == null) return false;
                foreach (Reference reference in References)
                {
                    if (!reference.CacheValid) return false;
                }
                return true;
            }
        }

        public XmlElement GetXml()
        {
            if (CacheValid) return _cachedXml;

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            XmlElement signedInfoElement = document.CreateElement("SignedInfo", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            if (!string.IsNullOrEmpty(_id))
                signedInfoElement.SetAttribute("Id", _id);

            XmlElement canonicalizationMethodElement = CanonicalizationMethodObject.GetXml(document, "CanonicalizationMethod");
            signedInfoElement.AppendChild(canonicalizationMethodElement);

            if (string.IsNullOrEmpty(_signatureMethod))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureMethodRequired);

            XmlElement signatureMethodElement = document.CreateElement("SignatureMethod", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            signatureMethodElement.SetAttribute("Algorithm", _signatureMethod);
            if (_signatureLength != null)
            {
                XmlElement hmacLengthElement = document.CreateElement(null, "HMACOutputLength", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                XmlText outputLength = document.CreateTextNode(_signatureLength);
                hmacLengthElement.AppendChild(outputLength);
                signatureMethodElement.AppendChild(hmacLengthElement);
            }

            signedInfoElement.AppendChild(signatureMethodElement);

            if (_references.Count == 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_ReferenceElementRequired);

            for (int i = 0; i < _references.Count; ++i)
            {
                Reference reference = (Reference)_references[i];
                signedInfoElement.AppendChild(reference.GetXml(document));
            }

            return signedInfoElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlElement signedInfoElement = value;
            if (!signedInfoElement.LocalName.Equals("SignedInfo"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo");

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            int expectedChildNodes = 0;

            _id = ElementUtils.GetAttribute(signedInfoElement, "Id", NS.XmlDsigNamespaceUrl);
            if (!ElementUtils.VerifyAttributes(signedInfoElement, "Id"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo");

            XmlNodeList canonicalizationMethodNodes = signedInfoElement.SelectNodes("ds:CanonicalizationMethod", nsm);
            if (canonicalizationMethodNodes == null || canonicalizationMethodNodes.Count == 0 || canonicalizationMethodNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo/CanonicalizationMethod");
            XmlElement canonicalizationMethodElement = canonicalizationMethodNodes.Item(0) as XmlElement;
            expectedChildNodes += canonicalizationMethodNodes.Count;
            _canonicalizationMethod = ElementUtils.GetAttribute(canonicalizationMethodElement, "Algorithm", NS.XmlDsigNamespaceUrl);
            if (_canonicalizationMethod == null || !ElementUtils.VerifyAttributes(canonicalizationMethodElement, "Algorithm"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo/CanonicalizationMethod");
            _canonicalizationMethodTransform = null;
            if (canonicalizationMethodElement.ChildNodes.Count > 0)
                CanonicalizationMethodObject.LoadInnerXml(canonicalizationMethodElement.ChildNodes);

            XmlNodeList signatureMethodNodes = signedInfoElement.SelectNodes("ds:SignatureMethod", nsm);
            if (signatureMethodNodes == null || signatureMethodNodes.Count == 0 || signatureMethodNodes.Count > 1)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo/SignatureMethod");
            XmlElement signatureMethodElement = signatureMethodNodes.Item(0) as XmlElement;
            expectedChildNodes += signatureMethodNodes.Count;
            _signatureMethod = ElementUtils.GetAttribute(signatureMethodElement, "Algorithm", NS.XmlDsigNamespaceUrl);
            if (_signatureMethod == null || !ElementUtils.VerifyAttributes(signatureMethodElement, "Algorithm"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo/SignatureMethod");

            XmlElement signatureLengthElement = signatureMethodElement.SelectSingleNode("ds:HMACOutputLength", nsm) as XmlElement;
            if (signatureLengthElement != null)
                _signatureLength = signatureLengthElement.InnerXml;

            _references.Clear();

            XmlNodeList referenceNodes = signedInfoElement.SelectNodes("ds:Reference", nsm);
            if (referenceNodes != null)
            {
                if (referenceNodes.Count > CryptoUtils.MaxReferencesPerSignedInfo)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo/Reference");
                }
                foreach (XmlNode node in referenceNodes)
                {
                    XmlElement referenceElement = node as XmlElement;
                    Reference reference = new Reference();
                    AddReference(reference);
                    reference.LoadXml(referenceElement);
                }
                expectedChildNodes += referenceNodes.Count;
                if (signedInfoElement.SelectNodes("*").Count != expectedChildNodes)
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "SignedInfo");
                }
            }

            _cachedXml = signedInfoElement;
        }

        public void AddReference(Reference reference)
        {
            if (reference == null)
                throw new ArgumentNullException(nameof(reference));

            reference.SetSignedXml(GetSignedXml());
            _references.Add(reference);
        }
    }
}

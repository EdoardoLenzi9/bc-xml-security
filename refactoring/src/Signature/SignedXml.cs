// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Crypto.Macs;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.CompilerServices;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class SignedXml
    {
        protected Signature m_signature;
        protected string m_strSigningKeyName;

        private AsymmetricKeyParameter _signingKey;
        public XmlDocument _containingDocument = null;
        private IEnumerator _keyInfoEnum = null;
        private IList<X509Certificate> _x509Collection = null;
        private IEnumerator _x509Enum = null;

        private bool[] _refProcessed = null;
        private int[] _refLevelCache = null;

        public XmlResolver _xmlResolver = null;
        internal XmlElement _context = null;
        public bool _bResolverSet = false;

        private Func<SignedXml, bool> _signatureFormatValidator = DefaultSignatureFormatValidator;
        private Collection<string> _safeCanonicalizationMethods;

        // Built in canonicalization algorithm URIs
        private static IList<string> s_knownCanonicalizationMethods = null;
        // Built in transform algorithm URIs (excluding canonicalization URIs)
        public static IList<string> s_defaultSafeTransformMethods = null;

        public bool IsCacheValid { get; set; } = false;

        // defines the XML encryption processing rules
        private EncryptedXml _exml = null;

       
        //
        // public constructors
        //

        public SignedXml()
        {
            Initialize(null);
        }

        public SignedXml(XmlDocument document)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));
            Initialize(document.DocumentElement);
        }

        public SignedXml(XmlElement elem)
        {
            if (elem == null)
                throw new ArgumentNullException(nameof(elem));
            Initialize(elem);
        }

        private void Initialize(XmlElement element)
        {
            _containingDocument = (element == null ? null : element.OwnerDocument);
            _context = element;
            m_signature = new Signature();
            m_signature.SignedXml = this;
            m_signature.SignedInfo = new SignedInfo();
            _signingKey = null;

            _safeCanonicalizationMethods = new Collection<string>(KnownCanonicalizationMethods);
        }

        //
        // public properties
        //

        /// <internalonly/>
        public string SigningKeyName
        {
            get { return m_strSigningKeyName; }
            set { m_strSigningKeyName = value; }
        }

        internal bool ResolverSet
        {
            get { return _bResolverSet; }
        }

        public Func<SignedXml, bool> SignatureFormatValidator
        {
            get { return _signatureFormatValidator; }
            set { _signatureFormatValidator = value; }
        }

        public Collection<string> SafeCanonicalizationMethods
        {
            get { return _safeCanonicalizationMethods; }
        }

        public AsymmetricKeyParameter SigningKey
        {
            get { return _signingKey; }
            set { _signingKey = value; }
        }

        public EncryptedXml EncryptedXml
        {
            get
            {
                if (_exml == null)
                    _exml = new EncryptedXml(_containingDocument); // default processing rules
                return _exml;
            }
            set { _exml = value; }
        }

        public Signature Signature
        {
            get { return m_signature; }
        }

        public SignedInfo SignedInfo
        {
            get { return m_signature.SignedInfo; }
        }

        public string SignatureMethod
        {
            get { return m_signature.SignedInfo.SignatureMethod; }
        }

        public string SignatureLength
        {
            get { return m_signature.SignedInfo.SignatureLength; }
        }

        public byte[] SignatureValue
        {
            get { return m_signature.SignatureValue; }
        }

        public KeyInfo KeyInfo
        {
            get { return m_signature.KeyInfo; }
            set { m_signature.KeyInfo = value; }
        }

        public XmlElement GetXml()
        {
            // If we have a document context, then return a signature element in this context
            if (_containingDocument != null)
                return m_signature.GetXml(_containingDocument);
            else
                return m_signature.GetXml();
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            m_signature.LoadXml(value);

            if (_context == null)
            {
                _context = value;
            }

            IsCacheValid = false;
        }

        //
        // public methods
        //

        public void AddReference(Reference reference)
        {
            m_signature.SignedInfo.AddReference(reference);
        }

        public void AddObject(DataObject dataObject)
        {
            m_signature.AddObject(dataObject);
        }

        public bool CheckSignature()
        {
            return CheckSignatureReturningKey(out _);
        }

        public bool CheckSignatureReturningKey(out AsymmetricKeyParameter signingKey)
        {
            SignedXmlDebugLog.LogBeginSignatureVerification(this, _context);

            int count = 0;
            signingKey = null;
            bool bRet = false;
            AsymmetricKeyParameter key = null;

            if (!CheckSignatureManager.CheckSignatureFormat(this, _signatureFormatValidator))
            {
                return false;
            }

            do
            {
                key = GetPublicKey();
                if (key != null)
                {
                    if (count++ > 0)
                        IsCacheValid = false;
                    bRet = CheckSignature(key);
                    SignedXmlDebugLog.LogVerificationResult(this, key, bRet);
                }
            } while (key != null && bRet == false);

            signingKey = key;
            return bRet;
        }

        public bool CheckSignature(AsymmetricKeyParameter key)
        {
            if (!CheckSignatureManager.CheckSignatureFormat(this, _signatureFormatValidator))
            {
                return false;
            }

            if (!CheckSignatureManager.CheckSignedInfo(key, this, m_signature))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_SignedInfo);
                return false;
            }

            // Now is the time to go through all the references and see if their DigestValues are good
            if (!ReferenceManager.CheckDigestedReferences(m_signature, this))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_References);
                return false;
            }

            SignedXmlDebugLog.LogVerificationResult(this, key, true);
            return true;
        }

        public bool CheckSignature(IMac macAlg)
        {
            if (!CheckSignatureManager.CheckSignatureFormat(this, _signatureFormatValidator))
            {
                return false;
            }

            if (!CheckSignatureManager.CheckSignedInfo(macAlg, m_signature, this))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_SignedInfo);
                return false;
            }

            if (!ReferenceManager.CheckDigestedReferences(m_signature, this))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_References);
                return false;
            }

            SignedXmlDebugLog.LogVerificationResult(this, macAlg, true);
            return true;
        }

        public bool CheckSignature(X509Certificate certificate, bool verifySignatureOnly)
        {
            if (!verifySignatureOnly)
            {
                // Check key usages to make sure it is good for signing.
                var exts = certificate.CertificateStructure.TbsCertificate.Extensions;
                foreach (DerObjectIdentifier extension in exts.ExtensionOids)
                {
                    if (extension.Equals(X509Extensions.KeyUsage))
                    {
                        var keyUsage = certificate.GetKeyUsage();
                        bool validKeyUsage = (keyUsage[0 /* DigitalSignature */] || keyUsage[1 /* NonRepudiation */]);

                        if (!validKeyUsage)
                        {
                            SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_X509KeyUsage);
                            return false;
                        }
                        break;
                    }
                }
            }

            AsymmetricKeyParameter publicKey = certificate.GetPublicKey();
            if (!CheckSignature(publicKey))
            {
                return false;
            }

            SignedXmlDebugLog.LogVerificationResult(this, certificate, true);
            return true;
        }

        public void ComputeSignature()
        {
            SignedXmlDebugLog.LogBeginSignatureComputation(this, _context);

            BuildDigestedReferences();

            // Load the key
            AsymmetricKeyParameter key = SigningKey;

            if (key == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_LoadKeyFailed);

            // Check the signature algorithm associated with the key so that we can accordingly set the signature method
            if (SignedInfo.SignatureMethod == null)
            {
                if (key is DsaKeyParameters)
                {

                    SignedInfo.SignatureMethod = SignedConstants.XmlDsigDSAUrl;
                }
                else if (key is RsaKeyParameters)
                {
                    SignedInfo.SignatureMethod = SignedConstants.XmlDsigRSASHA256Url;
                }
                else
                {
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_CreatedKeyFailed);
                }
            }

            // See if there is a signature description class defined in the Config file
            ISigner signatureDescription = CryptoHelpers.CreateFromName<ISigner>(SignedInfo.SignatureMethod);
            if (signatureDescription == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureDescriptionNotCreated);

            signatureDescription.Init(true, key);
            CheckSignatureManager.GetC14NDigest(new SignerHashWrapper(signatureDescription), this);

            SignedXmlDebugLog.LogSigning(this, key, signatureDescription);
            m_signature.SignatureValue = signatureDescription.GenerateSignature();
        }

        public void ComputeSignature(IMac macAlg)
        {
            if (macAlg == null)
                throw new ArgumentNullException(nameof(macAlg));

            if (!(macAlg is HMac))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureMethodKeyMismatch);

            int signatureLength;
            if (m_signature.SignedInfo.SignatureLength == null)
                signatureLength = macAlg.GetMacSize() * 8;
            else
                signatureLength = Convert.ToInt32(m_signature.SignedInfo.SignatureLength, null);
            // signatureLength should be less than hash size
            if (signatureLength < 0 || signatureLength > macAlg.GetMacSize() * 8)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength);
            if (signatureLength % 8 != 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength2);

            BuildDigestedReferences();
            var algorithmName = macAlg.AlgorithmName.Substring(0, macAlg.AlgorithmName.IndexOf('/')).ToUpperInvariant();
            var signedXmlDictionary = new Dictionary<string, string>()
            {
                { "SHA-1", SignedConstants.XmlDsigHMACSHA1Url },
                { "SHA-256", SignedConstants.XmlDsigMoreHMACSHA256Url },
                { "SHA-384", SignedConstants.XmlDsigMoreHMACSHA384Url},
                { "SHA-512", SignedConstants.XmlDsigMoreHMACSHA512Url },
                { "MD5", SignedConstants.XmlDsigMoreHMACMD5Url },
                { "RIPEMD160", SignedConstants.XmlDsigMoreHMACRIPEMD160Url }
            };

            try
            {
                SignedInfo.SignatureMethod = signedXmlDictionary[algorithmName];
            }
            catch (Exception)
            {
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureMethodKeyMismatch);
            }

            CheckSignatureManager.GetC14NDigest(new MacHashWrapper(macAlg), this);
            byte[] hashValue = new byte[macAlg.GetMacSize()];
            macAlg.DoFinal(hashValue, 0);

            SignedXmlDebugLog.LogSigning(this, macAlg);
            m_signature.SignatureValue = new byte[signatureLength / 8];
            Buffer.BlockCopy(hashValue, 0, m_signature.SignatureValue, 0, signatureLength / 8);
        }

        //
        // virtual methods
        //

        protected virtual AsymmetricKeyParameter GetPublicKey()
        {
            if (KeyInfo == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_KeyInfoRequired);

            if (_x509Enum != null)
            {
                AsymmetricKeyParameter key = GetNextCertificatePublicKey();
                if (key != null)
                    return key;
            }

            if (_keyInfoEnum == null)
                _keyInfoEnum = KeyInfo.GetEnumerator();

            // In our implementation, we move to the next KeyInfo clause which is an RSAKeyValue, DSAKeyValue or KeyInfoX509Data
            while (_keyInfoEnum.MoveNext())
            {
                RSAKeyValue rsaKeyValue = _keyInfoEnum.Current as RSAKeyValue;
                if (rsaKeyValue != null)
                    return rsaKeyValue.Key;

                DSAKeyValue dsaKeyValue = _keyInfoEnum.Current as DSAKeyValue;
                if (dsaKeyValue != null)
                    return dsaKeyValue.Key;

                KeyInfoX509Data x509Data = _keyInfoEnum.Current as KeyInfoX509Data;
                if (x509Data != null)
                {
                    _x509Collection = Utils.BuildBagOfCerts(x509Data, CertUsageType.Verification);
                    if (_x509Collection.Count > 0)
                    {
                        _x509Enum = _x509Collection.GetEnumerator();
                        AsymmetricKeyParameter key = GetNextCertificatePublicKey();
                        if (key != null)
                            return key;
                    }
                }
            }

            return null;
        }

        private AsymmetricKeyParameter GetNextCertificatePublicKey()
        {
            while (_x509Enum.MoveNext())
            {
                X509Certificate certificate = (X509Certificate)_x509Enum.Current;
                if (certificate != null)
                    return certificate.GetPublicKey();
            }

            return null;
        }

        public virtual XmlElement GetIdElement(XmlDocument document, string idValue)
        {
            return DefaultGetIdElement(document, idValue);
        }

        internal static XmlElement DefaultGetIdElement(XmlDocument document, string idValue)
        {
            if (document == null)
                return null;

            try
            {
                XmlConvert.VerifyNCName(idValue);
            }
            catch (XmlException)
            {
                // Identifiers are required to be an NCName
                //   (xml:id version 1.0, part 4, paragraph 2, bullet 1)
                //
                // If it isn't an NCName, it isn't allowed to match.
                return null;
            }

            // Get the element with idValue
            XmlElement elem = document.GetElementById(idValue);

            if (elem != null)
            {
                // Have to check for duplicate ID values from the DTD.

                XmlDocument docClone = (XmlDocument)document.CloneNode(true);
                XmlElement cloneElem = docClone.GetElementById(idValue);

                // If it's null here we want to know about it, because it means that
                // GetElementById failed to work across the cloning, and our uniqueness
                // test is invalid.
                System.Diagnostics.Debug.Assert(cloneElem != null);

                // Guard against null anyways
                if (cloneElem != null)
                {
                    cloneElem.Attributes.RemoveAll();

                    XmlElement cloneElem2 = docClone.GetElementById(idValue);

                    if (cloneElem2 != null)
                    {
                        throw new System.Security.Cryptography.CryptographicException(
                            SR.Cryptography_Xml_InvalidReference);
                    }
                }

                return elem;
            }

            elem = CheckSignatureManager.GetSingleReferenceTarget(document, "Id", idValue);
            if (elem != null)
                return elem;
            elem = CheckSignatureManager.GetSingleReferenceTarget(document, "id", idValue);
            if (elem != null)
                return elem;
            elem = CheckSignatureManager.GetSingleReferenceTarget(document, "ID", idValue);

            return elem;
        }

        //
        // private methods
        //



        private static bool DefaultSignatureFormatValidator(SignedXml signedXml)
        {
            // Reject the signature if it uses a truncated HMAC
            if (signedXml.DoesSignatureUseTruncatedHmac())
            {
                return false;
            }

            // Reject the signature if it uses a canonicalization algorithm other than
            // one of the ones explicitly allowed
            if (!signedXml.DoesSignatureUseSafeCanonicalizationMethod())
            {
                return false;
            }

            // Otherwise accept it
            return true;
        }

        // Validation function to see if the current signature is signed with a truncated HMAC - one which
        // has a signature length of fewer bits than the whole HMAC output.
        private bool DoesSignatureUseTruncatedHmac()
        {
            // If we're not using the SignatureLength property, then we're not truncating the signature length
            if (SignedInfo.SignatureLength == null)
            {
                return false;
            }

            // See if we're signed witn an HMAC algorithm
            IMac hmac = CryptoHelpers.CreateFromName<IMac>(SignatureMethod);
            if (hmac == null)
            {
                // We aren't signed with an HMAC algorithm, so we cannot have a truncated HMAC
                return false;
            }

            // Figure out how many bits the signature is using
            int actualSignatureSize = 0;
            if (!int.TryParse(SignedInfo.SignatureLength, out actualSignatureSize))
            {
                // If the value wasn't a valid integer, then we'll conservatively reject it all together
                return true;
            }

            // Make sure the full HMAC signature size is the same size that was specified in the XML
            // signature.  If the actual signature size is not exactly the same as the full HMAC size, then
            // reject the signature.
            return actualSignatureSize != hmac.GetMacSize();
        }

        // Validation function to see if the signature uses a canonicalization algorithm from our list
        // of approved algorithm URIs.
        private bool DoesSignatureUseSafeCanonicalizationMethod()
        {
            foreach (string safeAlgorithm in SafeCanonicalizationMethods)
            {
                if (string.Equals(safeAlgorithm, SignedInfo.CanonicalizationMethod, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            SignedXmlDebugLog.LogUnsafeCanonicalizationMethod(this, SignedInfo.CanonicalizationMethod, SafeCanonicalizationMethods);
            return false;
        }

        // Get a list of the built in canonicalization algorithms, as well as any that the machine admin has
        // added to the valid set.
        private static IList<string> KnownCanonicalizationMethods
        {
            get
            {
                if (s_knownCanonicalizationMethods == null)
                {
                    // Start with the list that the machine admin added, if any
                    List<string> safeAlgorithms = new List<string>();

                    // Built in algorithms
                    safeAlgorithms.Add(SignedConstants.XmlDsigC14NTransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlDsigC14NWithCommentsTransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlDsigExcC14NTransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlDsigExcC14NWithCommentsTransformUrl);

                    s_knownCanonicalizationMethods = safeAlgorithms;
                }

                return s_knownCanonicalizationMethods;
            }
        }
 
        public int GetReferenceLevel(int index, ArrayList references)
        {
            if (_refProcessed[index]) return _refLevelCache[index];
            _refProcessed[index] = true;
            Reference reference = (Reference)references[index];
            if (reference.Uri == null || reference.Uri.Length == 0 || (reference.Uri.Length > 0 && reference.Uri[0] != '#'))
            {
                _refLevelCache[index] = 0;
                return 0;
            }
            if (reference.Uri.Length > 0 && reference.Uri[0] == '#')
            {
                string idref = Utils.ExtractIdFromLocalUri(reference.Uri);
                if (idref == "xpointer(/)")
                {
                    _refLevelCache[index] = 0;
                    return 0;
                }
                // If this is pointing to another reference
                for (int j = 0; j < references.Count; ++j)
                {
                    if (((Reference)references[j]).Id == idref)
                    {
                        _refLevelCache[index] = GetReferenceLevel(j, references) + 1;
                        return (_refLevelCache[index]);
                    }
                }
                // Then the reference points to an object tag
                _refLevelCache[index] = 0;
                return 0;
            }
            // Malformed reference
            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);
        }

        private void BuildDigestedReferences()
        {
            // Default the DigestMethod and Canonicalization
            ArrayList references = SignedInfo.References;
            // Reset the cache
            _refProcessed = new bool[references.Count];
            _refLevelCache = new int[references.Count];

            ReferenceLevelSortOrder sortOrder = new ReferenceLevelSortOrder();
            sortOrder.References = references;
            // Don't alter the order of the references array list
            ArrayList sortedReferences = new ArrayList();
            foreach (Reference reference in references)
            {
                sortedReferences.Add(reference);
            }
            sortedReferences.Sort(sortOrder);

            CanonicalXmlNodeList nodeList = new CanonicalXmlNodeList();
            foreach (DataObject obj in m_signature.ObjectList)
            {
                nodeList.Add(obj.GetXml());
            }
            foreach (Reference reference in sortedReferences)
            {
                // If no DigestMethod has yet been set, default it to sha1
                if (reference.DigestMethod == null)
                    reference.DigestMethod = Reference.DefaultDigestMethod;

                SignedXmlDebugLog.LogSigningReference(this, reference);

                reference.UpdateHashValue(_containingDocument, nodeList);
                // If this reference has an Id attribute, add it
                if (reference.Id != null)
                    nodeList.Add(reference.GetXml());
            }
        }
    }
}

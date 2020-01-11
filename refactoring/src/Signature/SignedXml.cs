// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Crypto.Macs;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
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
        private Signature msignature;
        protected string m_strSigningKeyName;

        private AsymmetricKeyParameter _signingKey;
        private XmlDocument containingDocument = null;
        private IEnumerator _keyInfoEnum = null;
        private IList<X509Certificate> _x509Collection = null;
        private IEnumerator _x509Enum = null;

        private bool[] _refProcessed = null;
        private int[] _refLevelCache = null;

        public XmlResolver _xmlResolver = null;
        internal XmlElement _context = null;
        public bool _bResolverSet = false;

        private Func<SignedXml, bool> _signatureFormatValidator = CheckSignatureManager.DefaultSignatureFormatValidator;
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
            ContainingDocument = (element == null ? null : element.OwnerDocument);
            _context = element;
            MSignature = new Signature();
            MSignature.SetSignedXml(this);
            MSignature.SignedInfo = new SignedInfo();
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
                    _exml = new EncryptedXml(ContainingDocument); // default processing rules
                return _exml;
            }
            set { _exml = value; }
        }

        public Signature Signature
        {
            get { return MSignature; }
        }

        public SignedInfo SignedInfo
        {
            get { return MSignature.SignedInfo; }
        }

        public string SignatureMethod
        {
            get { return MSignature.SignedInfo.SignatureMethod; }
        }

        public string SignatureLength
        {
            get { return MSignature.SignedInfo.SignatureLength; }
        }

        public byte[] SignatureValue
        {
            get { return MSignature.GetSignatureValue(); }
        }

        public KeyInfo KeyInfo
        {
            get { return MSignature.KeyInfo; }
            set { MSignature.KeyInfo = value; }
        }

        public XmlElement GetXml()
        {
            // If we have a document context, then return a signature element in this context
            if (ContainingDocument != null)
                return MSignature.GetXml(ContainingDocument);
            else
                return MSignature.GetXml();
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            MSignature.LoadXml(value);

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
            MSignature.SignedInfo.AddReference(reference);
        }

        public void AddObject(DataObject dataObject)
        {
            MSignature.AddObject(dataObject);
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

            if (!CheckSignatureManager.CheckSignedInfo(key, this, MSignature))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_SignedInfo);
                return false;
            }

            // Now is the time to go through all the references and see if their DigestValues are good
            if (!ReferenceManager.CheckDigestedReferences(MSignature, this))
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

            if (!CheckSignatureManager.CheckSignedInfo(macAlg, MSignature, this))
            {
                SignedXmlDebugLog.LogVerificationFailure(this, SR.Log_VerificationFailed_SignedInfo);
                return false;
            }

            if (!ReferenceManager.CheckDigestedReferences(MSignature, this))
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

            ReferenceManager.BuildDigestedReferences(this);

            // Load the key
            AsymmetricKeyParameter key = SigningKey;

            if (key == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_LoadKeyFailed);

            // Check the signature algorithm associated with the key so that we can accordingly set the signature method
            if (SignedInfo.SignatureMethod == null)
            {
                if (key is DsaKeyParameters)
                {

                    SignedInfo.SignatureMethod = XmlNameSpace.Url[NS.XmlDsigDSAUrl];
                }
                else if (key is RsaKeyParameters)
                {
                    SignedInfo.SignatureMethod = XmlNameSpace.Url[NS.XmlDsigRSASHA256Url];
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
            MSignature.SetSignatureValue(signatureDescription.GenerateSignature());
        }

        public void ComputeSignature(IMac macAlg)
        {
            if (macAlg == null)
                throw new ArgumentNullException(nameof(macAlg));

            if (!(macAlg is HMac))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureMethodKeyMismatch);

            int signatureLength;
            if (MSignature.SignedInfo.SignatureLength == null)
                signatureLength = macAlg.GetMacSize() * 8;
            else
                signatureLength = Convert.ToInt32(MSignature.SignedInfo.SignatureLength, null);
            // signatureLength should be less than hash size
            if (signatureLength < 0 || signatureLength > macAlg.GetMacSize() * 8)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength);
            if (signatureLength % 8 != 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength2);

            ReferenceManager.BuildDigestedReferences(this);

            var algorithmName = macAlg.AlgorithmName.Substring(0, macAlg.AlgorithmName.IndexOf('/')).ToUpperInvariant();
            var signedXmlDictionary = new Dictionary<string, NS>()
            {
                { "SHA-1", NS.XmlDsigHMACSHA1Url },
                { "SHA-256", NS.XmlDsigMoreHMACSHA256Url },
                { "SHA-384", NS.XmlDsigMoreHMACSHA384Url},
                { "SHA-512", NS.XmlDsigMoreHMACSHA512Url },
                { "MD5", NS.XmlDsigMoreHMACMD5Url },
                { "RIPEMD160", NS.XmlDsigMoreHMACRIPEMD160Url }
            };

            try
            {
                SignedInfo.SignatureMethod = XmlNameSpace.Url[signedXmlDictionary[algorithmName]];
            }
            catch (Exception)
            {
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureMethodKeyMismatch);
            }

            CheckSignatureManager.GetC14NDigest(new MacHashWrapper(macAlg), this);
            byte[] hashValue = new byte[macAlg.GetMacSize()];
            macAlg.DoFinal(hashValue, 0);

            SignedXmlDebugLog.LogSigning(this, macAlg);
            MSignature.SetSignatureValue(new byte[signatureLength / 8]);
            Buffer.BlockCopy(hashValue, 0, MSignature.GetSignatureValue(), 0, signatureLength / 8);
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
                RsaKeyValue rsaKeyValue = _keyInfoEnum.Current as RsaKeyValue;
                if (rsaKeyValue != null)
                    return rsaKeyValue.GetKey();

                DsaKeyValue dsaKeyValue = _keyInfoEnum.Current as DsaKeyValue;
                if (dsaKeyValue != null)
                    return dsaKeyValue.GetKey();

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
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigC14NTransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigC14NWithCommentsTransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigExcC14NTransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigExcC14NWithCommentsTransformUrl]);

                    s_knownCanonicalizationMethods = safeAlgorithms;
                }

                return s_knownCanonicalizationMethods;
            }
        }

        public XmlDocument ContainingDocument { get => containingDocument; set => containingDocument = value; }
        public bool[] RefProcessed { get => _refProcessed; set => _refProcessed = value; }
        public int[] RefLevelCache { get => _refLevelCache; set => _refLevelCache = value; }
        protected Signature MSignature { get => msignature; set => msignature = value; }

        public int GetReferenceLevel(int index, ArrayList references)
        {
            if (RefProcessed[index]) return RefLevelCache[index];
            RefProcessed[index] = true;
            Reference reference = (Reference)references[index];
            if (reference.Uri == null || reference.Uri.Length == 0 || (reference.Uri.Length > 0 && reference.Uri[0] != '#'))
            {
                RefLevelCache[index] = 0;
                return 0;
            }
            if (reference.Uri.Length > 0 && reference.Uri[0] == '#')
            {
                string idref = Utils.ExtractIdFromLocalUri(reference.Uri);
                if (idref == "xpointer(/)")
                {
                    RefLevelCache[index] = 0;
                    return 0;
                }
                // If this is pointing to another reference
                for (int j = 0; j < references.Count; ++j)
                {
                    if (((Reference)references[j]).GetId() == idref)
                    {
                        RefLevelCache[index] = GetReferenceLevel(j, references) + 1;
                        return (RefLevelCache[index]);
                    }
                }
                // Then the reference points to an object tag
                RefLevelCache[index] = 0;
                return 0;
            }
            // Malformed reference
            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);
        }
    }
}

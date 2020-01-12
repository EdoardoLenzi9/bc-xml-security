using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class CheckSignatureManager
    {
        public static bool CheckSignedInfo(IMac macAlg, Signature m_signature, SignedXml signedXml)
        {
            if (macAlg == null)
                throw new ArgumentNullException(nameof(macAlg));

            SignedXmlDebugLog.LogBeginCheckSignedInfo(signedXml, m_signature.SignedInfo);

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
            if (m_signature.GetSignatureValue() == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureValueRequired);
            if (m_signature.GetSignatureValue().Length != signatureLength / 8)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength);

            // Calculate the hash
            GetC14NDigest(new MacHashWrapper(macAlg), signedXml);
            byte[] hashValue = new byte[macAlg.GetMacSize()];
            macAlg.DoFinal(hashValue, 0);
            SignedXmlDebugLog.LogVerifySignedInfo(signedXml, macAlg, hashValue, m_signature.GetSignatureValue());
            for (int i = 0; i < m_signature.GetSignatureValue().Length; i++)
            {
                if (m_signature.GetSignatureValue()[i] != hashValue[i]) return false;
            }
            return true;
        }

        public static void GetC14NDigest(IHash hash, SignedXml signedXml)
        {
            bool isKeyedHashAlgorithm = hash is MacHashWrapper;
            if (isKeyedHashAlgorithm || ! signedXml.IsCacheValid || !signedXml.SignedInfo.CacheValid)
            {
                string baseUri = (signedXml.ContainingDocument == null ? null : signedXml.ContainingDocument.BaseURI);
                XmlResolver resolver = (signedXml._bResolverSet ? signedXml._xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), baseUri));
                XmlDocument doc = StreamUtils.PreProcessElementInput(signedXml.SignedInfo.GetXml(), resolver, baseUri);

                // Add non default namespaces in scope
                CanonicalXmlNodeList namespaces = (signedXml._context == null ? null : ElementUtils.GetPropagatedAttributes(signedXml._context));
                SignedXmlDebugLog.LogNamespacePropagation(signedXml, namespaces);
                ElementUtils.AddNamespaces(doc.DocumentElement, namespaces);

                Transform c14nMethodTransform = signedXml.SignedInfo.CanonicalizationMethodObject;
                c14nMethodTransform.Resolver = resolver;
                c14nMethodTransform.BaseURI = baseUri;

                SignedXmlDebugLog.LogBeginCanonicalization(signedXml, c14nMethodTransform);
                c14nMethodTransform.LoadInput(doc);
                SignedXmlDebugLog.LogCanonicalizedOutput(signedXml, c14nMethodTransform);
                c14nMethodTransform.GetDigestedOutput(hash);

                signedXml.IsCacheValid = !isKeyedHashAlgorithm;
            }
        }

        public static bool CheckSignedInfo(AsymmetricKeyParameter key, SignedXml signedXml, Signature m_signature)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));

            SignedXmlDebugLog.LogBeginCheckSignedInfo(signedXml, m_signature.SignedInfo);

            ISigner signatureDescription = CryptoHelpers.CreateFromName<ISigner>(signedXml.SignatureMethod);
            if (signatureDescription == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureDescriptionNotCreated);

            try
            {
                signatureDescription.Init(false, key);
            }
            catch (Exception)
            {
                return false;
            }

            CheckSignatureManager.GetC14NDigest(new SignerHashWrapper(signatureDescription), signedXml);

            return signatureDescription.VerifySignature(m_signature.GetSignatureValue());
        }

        public static XmlElement GetSingleReferenceTarget(XmlDocument document, string idAttributeName, string idValue)
        {
            string xPath = "//*[@" + idAttributeName + "=\"" + idValue + "\"]";

            XmlNodeList nodeList = document.SelectNodes(xPath);

            if (nodeList == null || nodeList.Count == 0)
            {
                return null;
            }

            if (nodeList.Count == 1)
            {
                return nodeList[0] as XmlElement;
            }

            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);
        }

        public static bool CheckSignatureFormat(SignedXml signedXml, Func<SignedXml, bool> _signatureFormatValidator)
        {
            if (_signatureFormatValidator == null)
            {
                return true;
            }

            SignedXmlDebugLog.LogBeginCheckSignatureFormat(signedXml, _signatureFormatValidator);

            bool formatValid = _signatureFormatValidator(signedXml);
            SignedXmlDebugLog.LogFormatValidationResult(signedXml, formatValid);
            return formatValid;
        }

        public static bool DefaultSignatureFormatValidator(SignedXml signedXml)
        {
            if (DoesSignatureUseTruncatedHmac(signedXml))
            {
                return false;
            }

            if (!DoesSignatureUseSafeCanonicalizationMethod(signedXml))
            {
                return false;
            }

            return true;
        }

        private static bool DoesSignatureUseTruncatedHmac(SignedXml signedXml)
        {
            if (signedXml.SignedInfo.SignatureLength == null)
            {
                return false;
            }

            IMac hmac = CryptoHelpers.CreateFromName<IMac>(signedXml.SignatureMethod);
            if (hmac == null)
            {
                return false;
            }

            int actualSignatureSize = 0;
            if (!int.TryParse(signedXml.SignedInfo.SignatureLength, out actualSignatureSize))
            {
                return true;
            }

            return actualSignatureSize != hmac.GetMacSize();
        }

        private static bool DoesSignatureUseSafeCanonicalizationMethod(SignedXml signedXml)
        {
            foreach (string safeAlgorithm in signedXml.SafeCanonicalizationMethods)
            {
                if (string.Equals(safeAlgorithm, signedXml.SignedInfo.CanonicalizationMethod, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            SignedXmlDebugLog.LogUnsafeCanonicalizationMethod(signedXml, signedXml.SignedInfo.CanonicalizationMethod, signedXml.SafeCanonicalizationMethods);
            return false;
        }
    }
}

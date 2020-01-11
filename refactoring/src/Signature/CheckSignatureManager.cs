using System;
using System.Xml;

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
                XmlDocument doc = Utils.PreProcessElementInput(signedXml.SignedInfo.GetXml(), resolver, baseUri);

                // Add non default namespaces in scope
                CanonicalXmlNodeList namespaces = (signedXml._context == null ? null : Utils.GetPropagatedAttributes(signedXml._context));
                SignedXmlDebugLog.LogNamespacePropagation(signedXml, namespaces);
                Utils.AddNamespaces(doc.DocumentElement, namespaces);

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
            // idValue has already been tested as an NCName (unless overridden for compatibility), so there's no
            // escaping that needs to be done here.
            string xPath = "//*[@" + idAttributeName + "=\"" + idValue + "\"]";

            // http://www.w3.org/TR/xmldsig-core/#sec-ReferenceProcessingModel says that for the form URI="#chapter1":
            //
            //   Identifies a node-set containing the element with ID attribute value 'chapter1' ...
            //
            // Note that it uses the singular. Therefore, if the match is ambiguous, we should consider the document invalid.
            //
            // In this case, we'll treat it the same as having found nothing across all fallbacks (but shortcut so that we don't
            // fall into a trap of finding a secondary element which wasn't the originally signed one).

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

        // If we have a signature format validation callback, check to see if this signature's format (not
        // the signautre itself) is valid according to the validator.  A return value of true indicates that
        // the signature format is acceptable, false means that the format is not valid.
        public static bool CheckSignatureFormat(SignedXml signedXml, Func<SignedXml, bool> _signatureFormatValidator)
        {
            if (_signatureFormatValidator == null)
            {
                // No format validator means that we default to accepting the signature.  (This is
                // effectively compatibility mode with v3.5).
                return true;
            }

            SignedXmlDebugLog.LogBeginCheckSignatureFormat(signedXml, _signatureFormatValidator);

            bool formatValid = _signatureFormatValidator(signedXml);
            SignedXmlDebugLog.LogFormatValidationResult(signedXml, formatValid);
            return formatValid;
        }

        public static bool DefaultSignatureFormatValidator(SignedXml signedXml)
        {
            // Reject the signature if it uses a truncated HMAC
            if (DoesSignatureUseTruncatedHmac(signedXml))
            {
                return false;
            }

            // Reject the signature if it uses a canonicalization algorithm other than
            // one of the ones explicitly allowed
            if (!DoesSignatureUseSafeCanonicalizationMethod(signedXml))
            {
                return false;
            }

            // Otherwise accept it
            return true;
        }

        private static bool DoesSignatureUseTruncatedHmac(SignedXml signedXml)
        {
            // If we're not using the SignatureLength property, then we're not truncating the signature length
            if (signedXml.SignedInfo.SignatureLength == null)
            {
                return false;
            }

            // See if we're signed witn an HMAC algorithm
            IMac hmac = CryptoHelpers.CreateFromName<IMac>(signedXml.SignatureMethod);
            if (hmac == null)
            {
                // We aren't signed with an HMAC algorithm, so we cannot have a truncated HMAC
                return false;
            }

            // Figure out how many bits the signature is using
            int actualSignatureSize = 0;
            if (!int.TryParse(signedXml.SignedInfo.SignatureLength, out actualSignatureSize))
            {
                // If the value wasn't a valid integer, then we'll conservatively reject it all together
                return true;
            }

            // Make sure the full HMAC signature size is the same size that was specified in the XML
            // signature.  If the actual signature size is not exactly the same as the full HMAC size, then
            // reject the signature.
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

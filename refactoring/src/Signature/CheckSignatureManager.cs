using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Text;
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
            if (m_signature.SignatureValue == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_SignatureValueRequired);
            if (m_signature.SignatureValue.Length != signatureLength / 8)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidSignatureLength);

            // Calculate the hash
            GetC14NDigest(new MacHashWrapper(macAlg), signedXml);
            byte[] hashValue = new byte[macAlg.GetMacSize()];
            macAlg.DoFinal(hashValue, 0);
            SignedXmlDebugLog.LogVerifySignedInfo(signedXml, macAlg, hashValue, m_signature.SignatureValue);
            for (int i = 0; i < m_signature.SignatureValue.Length; i++)
            {
                if (m_signature.SignatureValue[i] != hashValue[i]) return false;
            }
            return true;
        }

        public static void GetC14NDigest(IHash hash, SignedXml signedXml)
        {
            bool isKeyedHashAlgorithm = hash is MacHashWrapper;
            if (isKeyedHashAlgorithm || ! signedXml.IsCacheValid || !signedXml.SignedInfo.CacheValid)
            {
                string baseUri = (signedXml._containingDocument == null ? null : signedXml._containingDocument.BaseURI);
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
    }
}

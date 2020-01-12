using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml
{
    class ReferenceManager
    {
        public static bool CheckDigestedReferences(Signature m_signature, SignedXml signedXml )
        {
            ArrayList references = m_signature.SignedInfo.References;
            for (int i = 0; i < references.Count; ++i)
            {
                Reference digestedReference = (Reference)references[i];

                if (!ReferenceUsesSafeTransformMethods(digestedReference, signedXml))
                {
                    return false;
                }

                SignedXmlDebugLog.LogVerifyReference(signedXml, digestedReference);
                byte[] calculatedHash = null;
                try
                {
                    calculatedHash = digestedReference.CalculateHashValue(signedXml.ContainingDocument, m_signature.ReferencedItems);
                }
                catch (CryptoSignedXmlRecursionException)
                {
                    SignedXmlDebugLog.LogSignedXmlRecursionLimit(signedXml, digestedReference);
                    return false;
                }
                SignedXmlDebugLog.LogVerifyReferenceHash(signedXml, digestedReference, calculatedHash, digestedReference.DigestValue);

                if (!CryptographicEquals(calculatedHash, digestedReference.DigestValue))
                {
                    return false;
                }
            }

            return true;
        }

        private static bool ReferenceUsesSafeTransformMethods(Reference reference, SignedXml signedXml)
        {
            TransformChain transformChain = reference.TransformChain;
            int transformCount = transformChain.Count;

            for (int i = 0; i < transformCount; i++)
            {
                Transform transform = transformChain[i];

                if (!IsSafeTransform(transform.Algorithm, signedXml))
                {
                    return false;
                }
            }

            return true;
        }

        private static bool IsSafeTransform(NS transformAlgorithm, SignedXml signedXml)
        {
            foreach (string safeAlgorithm in signedXml.SafeCanonicalizationMethods)
            {
                if (string.Equals(safeAlgorithm, XmlNameSpace.Url[transformAlgorithm], StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            foreach (string safeAlgorithm in DefaultSafeTransformMethods(SignedXml.s_defaultSafeTransformMethods))
            {
                if (string.Equals(safeAlgorithm, XmlNameSpace.Url[transformAlgorithm], StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            SignedXmlDebugLog.LogUnsafeTransformMethod(
                signedXml,
                XmlNameSpace.Url[transformAlgorithm],
                signedXml.SafeCanonicalizationMethods,
                DefaultSafeTransformMethods(SignedXml.s_defaultSafeTransformMethods));

            return false;
        }

        private static IList<string> DefaultSafeTransformMethods (IList<string> s_defaultSafeTransformMethods)
        {
                if (s_defaultSafeTransformMethods == null)
                {
                    List<string> safeAlgorithms = new List<string>();

                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigEnvelopedSignatureTransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDsigBase64TransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlLicenseTransformUrl]);
                    safeAlgorithms.Add(XmlNameSpace.Url[NS.XmlDecryptionTransformUrl]);

                    s_defaultSafeTransformMethods = safeAlgorithms;
                }

                return s_defaultSafeTransformMethods;
        }

        [MethodImpl(MethodImplOptions.NoInlining | MethodImplOptions.NoOptimization)]
        private static bool CryptographicEquals(byte[] a, byte[] b)
        {
            System.Diagnostics.Debug.Assert(a != null);
            System.Diagnostics.Debug.Assert(b != null);

            int result = 0;

            if (a.Length != b.Length)
                return false;

            unchecked
            {
                int aLength = a.Length;

                for (int i = 0; i < aLength; i++)
                    result = result | (a[i] - b[i]);
            }

            return (0 == result);
        }

        public static void BuildDigestedReferences(SignedXml signedXml)
        {
            ArrayList references = signedXml.SignedInfo.References;
            signedXml.RefProcessed = new bool[references.Count];
            signedXml.RefLevelCache = new int[references.Count];

            ReferenceLevelSortOrder sortOrder = new ReferenceLevelSortOrder();
            sortOrder.SetReferences(references);
            ArrayList sortedReferences = new ArrayList();
            foreach (Reference reference in references)
            {
                sortedReferences.Add(reference);
            }
            sortedReferences.Sort(sortOrder);

            CanonicalXmlNodeList nodeList = new CanonicalXmlNodeList();
            foreach (DataObject obj in signedXml.Signature.GetObjectList())
            {
                nodeList.Add(obj.GetXml());
            }
            foreach (Reference reference in sortedReferences)
            {
                if (reference.DigestMethod == null)
                    reference.DigestMethod = XmlNameSpace.Url[NS.XmlDsigSHA256Url];

                SignedXmlDebugLog.LogSigningReference(signedXml, reference);

                reference.UpdateHashValue(signedXml.ContainingDocument, nodeList);
                if (reference.GetId() != null)
                    nodeList.Add(reference.GetXml());
            }
        }
    }
}

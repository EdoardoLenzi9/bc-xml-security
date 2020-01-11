using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

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
                // Compare both hashes
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

        private static bool IsSafeTransform(string transformAlgorithm, SignedXml signedXml)
        {
            // All canonicalization algorithms are valid transform algorithms.
            foreach (string safeAlgorithm in signedXml.SafeCanonicalizationMethods)
            {
                if (string.Equals(safeAlgorithm, transformAlgorithm, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            foreach (string safeAlgorithm in DefaultSafeTransformMethods(SignedXml.s_defaultSafeTransformMethods))
            {
                if (string.Equals(safeAlgorithm, transformAlgorithm, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            SignedXmlDebugLog.LogUnsafeTransformMethod(
                signedXml,
                transformAlgorithm,
                signedXml.SafeCanonicalizationMethods,
                DefaultSafeTransformMethods(SignedXml.s_defaultSafeTransformMethods));

            return false;
        }

        private static IList<string> DefaultSafeTransformMethods (IList<string> s_defaultSafeTransformMethods)
        {
                if (s_defaultSafeTransformMethods == null)
                {
                    List<string> safeAlgorithms = new List<string>();

                    // Built in algorithms

                    // KnownCanonicalizationMethods don't need to be added here, because
                    // the validator will automatically accept those.
                    //
                    // xmldsig 6.6.1:
                    //     Any canonicalization algorithm that can be used for
                    //     CanonicalizationMethod can be used as a Transform.
                    safeAlgorithms.Add(SignedConstants.XmlDsigEnvelopedSignatureTransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlDsigBase64TransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlLicenseTransformUrl);
                    safeAlgorithms.Add(SignedConstants.XmlDecryptionTransformUrl);

                    s_defaultSafeTransformMethods = safeAlgorithms;
                }

                return s_defaultSafeTransformMethods;
        }

        // Methods _must_ be marked both No Inlining and No Optimization to be fully opted out of optimization.
        // This is because if a candidate method is inlined, its method level attributes, including the NoOptimization
        // attribute, are lost. 
        // This method makes no attempt to disguise the length of either of its inputs. It is assumed the attacker has 
        // knowledge of the algorithms used, and thus the output length. Length is difficult to properly blind in modern CPUs.
        [MethodImpl(MethodImplOptions.NoInlining | MethodImplOptions.NoOptimization)]
        private static bool CryptographicEquals(byte[] a, byte[] b)
        {
            System.Diagnostics.Debug.Assert(a != null);
            System.Diagnostics.Debug.Assert(b != null);

            int result = 0;

            // Short cut if the lengths are not identical
            if (a.Length != b.Length)
                return false;

            unchecked
            {
                // Normally this caching doesn't matter, but with the optimizer off, this nets a non-trivial speedup.
                int aLength = a.Length;

                for (int i = 0; i < aLength; i++)
                    // We use subtraction here instead of XOR because the XOR algorithm gets ever so
                    // slightly faster as more and more differences pile up.
                    // This cannot overflow more than once (and back to 0) because bytes are 1 byte
                    // in length, and result is 4 bytes. The OR propagates all set bytes, so the differences
                    // can't add up and overflow a second time.
                    result = result | (a[i] - b[i]);
            }

            return (0 == result);
        }

        public static void BuildDigestedReferences(SignedXml signedXml)
        {
            // Default the DigestMethod and Canonicalization
            ArrayList references = signedXml.SignedInfo.References;
            // Reset the cache
            signedXml.RefProcessed = new bool[references.Count];
            signedXml.RefLevelCache = new int[references.Count];

            ReferenceLevelSortOrder sortOrder = new ReferenceLevelSortOrder();
            sortOrder.SetReferences(references);
            // Don't alter the order of the references array list
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
                // If no DigestMethod has yet been set, default it to sha1
                if (reference.DigestMethod == null)
                    reference.DigestMethod = Reference.DefaultDigestMethod;

                SignedXmlDebugLog.LogSigningReference(signedXml, reference);

                reference.UpdateHashValue(signedXml.ContainingDocument, nodeList);
                // If this reference has an Id attribute, add it
                if (reference.GetId() != null)
                    nodeList.Add(reference.GetXml());
            }
        }
    }
}

using Org.BouncyCastle.Crypto.Generators;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Pkix;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using Org.BouncyCastle.X509.Store;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class CryptoUtils
    {

        // Mimic the behavior of the X509IssuerSerial constructor with null and empty checks
        internal static X509IssuerSerial CreateX509IssuerSerial(string issuerName, string serialNumber)
        {
            if (issuerName == null || issuerName.Length == 0)
                throw new ArgumentException(SR.Arg_EmptyOrNullString, nameof(issuerName));
            if (serialNumber == null || serialNumber.Length == 0)
                throw new ArgumentException(SR.Arg_EmptyOrNullString, nameof(serialNumber));

            return new X509IssuerSerial()
            {
                IssuerName = issuerName,
                SerialNumber = serialNumber
            };
        }

        internal static IList<X509Certificate> BuildBagOfCerts(KeyInfoX509Data keyInfoX509Data, CertUsageType certUsageType)
        {
            var collection = new List<X509Certificate>();
            ArrayList decryptionIssuerSerials = (certUsageType == CertUsageType.Decryption ? new ArrayList() : null);
            if (keyInfoX509Data.Certificates != null)
            {
                foreach (X509Certificate certificate in keyInfoX509Data.Certificates)
                {
                    switch (certUsageType)
                    {
                        case CertUsageType.Verification:
                            collection.Add(certificate);
                            break;
                        case CertUsageType.Decryption:
                            decryptionIssuerSerials.Add(CreateX509IssuerSerial(certificate.IssuerDN.ToString(), certificate.SerialNumber.ToString()));
                            break;
                    }
                }
            }

            if (keyInfoX509Data.SubjectNames == null && keyInfoX509Data.IssuerSerials == null &&
                keyInfoX509Data.SubjectKeyIds == null && decryptionIssuerSerials == null)
                return collection;
            return collection;
        }


        internal static bool IsSelfSigned(IList<X509Certificate> chain)
        {
            if (chain.Count != 1)
                return false;
            X509Certificate certificate = chain[0];
            if (String.Compare(certificate.SubjectDN.ToString(), certificate.IssuerDN.ToString(), StringComparison.OrdinalIgnoreCase) == 0)
                return true;
            return false;
        }

        internal static IList<X509Certificate> BuildCertificateChain(X509Certificate primaryCertificate, IEnumerable<X509Certificate> additionalCertificates)
        {
            _ = new X509CertificateParser();
            var builder = new PkixCertPathBuilder();

            // Separate root from itermediate
            var intermediateCerts = new List<X509Certificate>();
            var rootCerts = new BouncyCastle.Utilities.Collections.HashSet();

            foreach (var cert in additionalCertificates)
            {
                // Separate root and subordinate certificates
                if (cert.IssuerDN.Equivalent(cert.SubjectDN))
                    rootCerts.Add(new TrustAnchor(cert, null));
                else
                    intermediateCerts.Add(cert);
            }

            // Create chain for this certificate
            var holder = new X509CertStoreSelector();
            holder.Certificate = primaryCertificate;

            // WITHOUT THIS LINE BUILDER CANNOT BEGIN BUILDING THE CHAIN
            intermediateCerts.Add(holder.Certificate);

            PkixBuilderParameters builderParams = new PkixBuilderParameters(rootCerts, holder);
            builderParams.IsRevocationEnabled = false;

            X509CollectionStoreParameters intermediateStoreParameters =
                new X509CollectionStoreParameters(intermediateCerts);

            builderParams.AddStore(X509StoreFactory.Create(
                "Certificate/Collection", intermediateStoreParameters));

            PkixCertPathBuilderResult result = builder.Build(builderParams);

            return result.CertPath.Certificates.Cast<X509Certificate>().ToList();
        }

        internal static AsymmetricKeyParameter GetAnyPublicKey(X509Certificate certificate)
        {
            return certificate.GetPublicKey();
        }

        internal const int MaxTransformsPerReference = 10;
        internal const int MaxReferencesPerSignedInfo = 100;

        internal static IDigest GetSignerDigest(ISigner signer)
        {
            var fields = signer.GetType().GetFields(BindingFlags.Instance | BindingFlags.NonPublic);
            var digestType = typeof(IDigest);
            foreach (var field in fields)
            {
                if (digestType.IsAssignableFrom(field.FieldType))
                {
                    return (IDigest)field.GetValue(signer);
                }
            }
            throw new InvalidOperationException();
        }

        internal static X509Certificate CloneCertificate(X509Certificate cert)
        {
            cert = cert ?? throw new ArgumentNullException(nameof(cert));
            var parser = new X509CertificateParser();
            return parser.ReadCertificate(cert.GetEncoded());
        }

        internal static AsymmetricCipherKeyPair DSAGenerateKeyPair()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("DSA");
            var rand = new SecureRandom();
            var pGen = new DsaParametersGenerator();
            pGen.Init(512, 80, rand);
            keyGen.Init(new DsaKeyGenerationParameters(rand, pGen.GenerateParameters()));
            return keyGen.GenerateKeyPair();
        }

        internal static AsymmetricCipherKeyPair RSAGenerateKeyPair()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            return keyGen.GenerateKeyPair();
        }

        internal static byte[] GenerateRandomBlock(int sizeInBytes)
        {
            SecureRandom random = new SecureRandom();
            byte[] keyBytes = new byte[sizeInBytes];
            random.NextBytes(keyBytes);
            return keyBytes;
        }
    }
}

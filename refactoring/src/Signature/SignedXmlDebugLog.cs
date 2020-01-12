using Org.BouncyCastle.X509;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Text;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal static class SignedXmlDebugLog
    {
        private const string NullString = "(null)";

        private static TraceSource s_traceSource = new TraceSource("Org.BouncyCastle.Crypto.Xml.SignedXml");
        private static volatile bool s_haveVerboseLogging;
        private static volatile bool s_verboseLogging;
        private static volatile bool s_haveInformationLogging;
        private static volatile bool s_informationLogging;

        internal enum SignedXmlDebugEvent
        {
            BeginCanonicalization,
            BeginCheckSignatureFormat,
            BeginCheckSignedInfo,
            BeginSignatureComputation,
            BeginSignatureVerification,
            CanonicalizedData,
            FormatValidationResult,
            NamespacePropagation,
            ReferenceData,
            SignatureVerificationResult,
            Signing,
            SigningReference,
            VerificationFailure,
            VerifyReference,
            VerifySignedInfo,
            X509Verification,
            UnsafeCanonicalizationMethod,
            UnsafeTransformMethod,
        }

        private static bool InformationLoggingEnabled
        {
            get
            {
                if (!s_haveInformationLogging)
                {
                    s_informationLogging = s_traceSource.Switch.ShouldTrace(TraceEventType.Information);
                    s_haveInformationLogging = true;
                }

                return s_informationLogging;
            }
        }

        private static bool VerboseLoggingEnabled
        {
            get
            {
                if (!s_haveVerboseLogging)
                {
                    s_verboseLogging = s_traceSource.Switch.ShouldTrace(TraceEventType.Verbose);
                    s_haveVerboseLogging = true;
                }

                return s_verboseLogging;
            }
        }

        private static string FormatBytes(byte[] bytes)
        {
            if (bytes == null)
                return NullString;

            StringBuilder builder = new StringBuilder(bytes.Length * 2);
            foreach (byte b in bytes)
            {
                builder.Append(b.ToString("x2", CultureInfo.InvariantCulture));
            }

            return builder.ToString();
        }

        private static string GetKeyName(object key)
        {
            Debug.Assert(key != null, "key != null");

            AsymmetricKeyParameter cspKey = key as AsymmetricKeyParameter;
            X509Certificate certificate = key as X509Certificate;

            string keyName = null;
            if (cspKey != null)
            {
                keyName = string.Format(CultureInfo.InvariantCulture,
                                        "\"{0}\"",
                                        cspKey.GetType().Name);
            }
            else if (certificate != null)
            {
                keyName = string.Format(CultureInfo.InvariantCulture,
                                        "\"{0}\"",
                                        certificate.SubjectDN);
            }
            else
            {
                keyName = key.GetHashCode().ToString("x8", CultureInfo.InvariantCulture);
            }

            return string.Format(CultureInfo.InvariantCulture, "{0}#{1}", key.GetType().Name, keyName);
        }

        private static string GetObjectId(object o)
        {
            Debug.Assert(o != null, "o != null");

            return string.Format(CultureInfo.InvariantCulture,
                                 "{0}#{1}", o.GetType().Name,
                                 o.GetHashCode().ToString("x8", CultureInfo.InvariantCulture));
        }

        internal static void LogBeginCanonicalization(SignedXml signedXml, Transform canonicalizationTransform)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(canonicalizationTransform != null, "canonicalizationTransform != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_BeginCanonicalization,
                                                  canonicalizationTransform.Algorithm,
                                                  canonicalizationTransform.GetType().Name);
                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.BeginCanonicalization,
                          logMessage);
            }

            if (VerboseLoggingEnabled)
            {
                string canonicalizationSettings = string.Format(CultureInfo.InvariantCulture,
                                                                SR.Log_CanonicalizationSettings,
                                                                canonicalizationTransform.Resolver.GetType(),
                                                                canonicalizationTransform.BaseURI);
                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.BeginCanonicalization,
                          canonicalizationSettings);
            }
        }

        internal static void LogBeginCheckSignatureFormat(SignedXml signedXml, Func<SignedXml, bool> formatValidator)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(formatValidator != null, "formatValidator != null");

            if (InformationLoggingEnabled)
            {
                MethodInfo validationMethod = formatValidator.Method;

                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_CheckSignatureFormat,
                                                  validationMethod.Module.Assembly.FullName,
                                                  validationMethod.DeclaringType.FullName,
                                                  validationMethod.Name);
                WriteLine(signedXml, TraceEventType.Information, SignedXmlDebugEvent.BeginCheckSignatureFormat, logMessage);
            }
        }

        internal static void LogBeginCheckSignedInfo(SignedXml signedXml, SignedInfo signedInfo)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(signedInfo != null, " signedInfo != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_CheckSignedInfo,
                                                  signedInfo.Id != null ? signedInfo.Id : NullString);
                WriteLine(signedXml, TraceEventType.Information, SignedXmlDebugEvent.BeginCheckSignedInfo, logMessage);
            }
        }

        internal static void LogBeginSignatureComputation(SignedXml signedXml, XmlElement context)
        {
            Debug.Assert(signedXml != null, "signedXml != null");

            if (InformationLoggingEnabled)
            {
                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.BeginSignatureComputation,
                          SR.Log_BeginSignatureComputation);
            }

            if (VerboseLoggingEnabled)
            {
                string contextData = string.Format(CultureInfo.InvariantCulture,
                                                   SR.Log_XmlContext,
                                                   context != null ? context.OuterXml : NullString);

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.BeginSignatureComputation,
                          contextData);
            }
        }

        internal static void LogBeginSignatureVerification(SignedXml signedXml, XmlElement context)
        {
            Debug.Assert(signedXml != null, "signedXml != null");

            if (InformationLoggingEnabled)
            {
                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.BeginSignatureVerification,
                          SR.Log_BeginSignatureVerification);
            }

            if (VerboseLoggingEnabled)
            {
                string contextData = string.Format(CultureInfo.InvariantCulture,
                                                   SR.Log_XmlContext,
                                                   context != null ? context.OuterXml : NullString);

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.BeginSignatureVerification,
                          contextData);
            }
        }

        internal static void LogCanonicalizedOutput(SignedXml signedXml, Transform canonicalizationTransform)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(canonicalizationTransform != null, "canonicalizationTransform != null");

            if (VerboseLoggingEnabled)
            {
                using (StreamReader reader = new StreamReader(canonicalizationTransform.GetOutput(typeof(Stream)) as Stream))
                {
                    string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                      SR.Log_CanonicalizedOutput,
                                                      reader.ReadToEnd());
                    WriteLine(signedXml,
                              TraceEventType.Verbose,
                              SignedXmlDebugEvent.CanonicalizedData,
                              logMessage);
                }
            }
        }

        internal static void LogFormatValidationResult(SignedXml signedXml, bool result)
        {
            Debug.Assert(signedXml != null, "signedXml != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = result ? SR.Log_FormatValidationSuccessful :
                                             SR.Log_FormatValidationNotSuccessful;
                WriteLine(signedXml, TraceEventType.Information, SignedXmlDebugEvent.FormatValidationResult, logMessage);
            }
        }

        internal static void LogUnsafeCanonicalizationMethod(SignedXml signedXml, string algorithm, IEnumerable<string> validAlgorithms)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(validAlgorithms != null, "validAlgorithms != null");

            if (InformationLoggingEnabled)
            {
                StringBuilder validAlgorithmBuilder = new StringBuilder();
                foreach (string validAlgorithm in validAlgorithms)
                {
                    if (validAlgorithmBuilder.Length != 0)
                    {
                        validAlgorithmBuilder.Append(", ");
                    }

                    validAlgorithmBuilder.AppendFormat("\"{0}\"", validAlgorithm);
                }

                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_UnsafeCanonicalizationMethod,
                                                  algorithm,
                                                  validAlgorithmBuilder.ToString());

                WriteLine(signedXml, TraceEventType.Information, SignedXmlDebugEvent.UnsafeCanonicalizationMethod, logMessage);
            }
        }

        internal static void LogUnsafeTransformMethod(
            SignedXml signedXml,
            string algorithm,
            IEnumerable<string> validC14nAlgorithms,
            IEnumerable<string> validTransformAlgorithms)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(validC14nAlgorithms != null, "validC14nAlgorithms != null");
            Debug.Assert(validTransformAlgorithms != null, "validTransformAlgorithms != null");

            if (InformationLoggingEnabled)
            {
                StringBuilder validAlgorithmBuilder = new StringBuilder();
                foreach (string validAlgorithm in validC14nAlgorithms)
                {
                    if (validAlgorithmBuilder.Length != 0)
                    {
                        validAlgorithmBuilder.Append(", ");
                    }

                    validAlgorithmBuilder.AppendFormat("\"{0}\"", validAlgorithm);
                }

                foreach (string validAlgorithm in validTransformAlgorithms)
                {
                    if (validAlgorithmBuilder.Length != 0)
                    {
                        validAlgorithmBuilder.Append(", ");
                    }

                    validAlgorithmBuilder.AppendFormat("\"{0}\"", validAlgorithm);
                }

                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_UnsafeTransformMethod,
                                                  algorithm,
                                                  validAlgorithmBuilder.ToString());

                WriteLine(signedXml, TraceEventType.Information, SignedXmlDebugEvent.UnsafeTransformMethod, logMessage);
            }
        }

        internal static void LogNamespacePropagation(SignedXml signedXml, XmlNodeList namespaces)
        {
            Debug.Assert(signedXml != null, "signedXml != null");

            if (InformationLoggingEnabled)
            {
                if (namespaces != null)
                {
                    foreach (XmlAttribute propagatedNamespace in namespaces)
                    {
                        string propagationMessage = string.Format(CultureInfo.InvariantCulture,
                                                                  SR.Log_PropagatingNamespace,
                                                                  propagatedNamespace.Name,
                                                                  propagatedNamespace.Value);

                        WriteLine(signedXml,
                                  TraceEventType.Information,
                                  SignedXmlDebugEvent.NamespacePropagation,
                                  propagationMessage);
                    }
                }
                else
                {
                    WriteLine(signedXml,
                              TraceEventType.Information,
                              SignedXmlDebugEvent.NamespacePropagation,
                              SR.Log_NoNamespacesPropagated);
                }
            }
        }

        internal static Stream LogReferenceData(Reference reference, Stream data)
        {
            if (VerboseLoggingEnabled)
            {
                MemoryStream ms = new MemoryStream();

                byte[] buffer = new byte[4096];
                int readBytes = 0;
                do
                {
                    readBytes = data.Read(buffer, 0, buffer.Length);
                    ms.Write(buffer, 0, readBytes);
                } while (readBytes == buffer.Length);

                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_TransformedReferenceContents,
                                                  Encoding.UTF8.GetString(ms.ToArray()));
                WriteLine(reference,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.ReferenceData,
                          logMessage);

                ms.Seek(0, SeekOrigin.Begin);
                return ms;
            }
            else
            {
                return data;
            }
        }




        internal static void LogSigning(SignedXml signedXml,
                                        object key,
                                        ISigner signatureDescription)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(signatureDescription != null, "signatureDescription != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_SigningAsymmetric,
                                                  GetKeyName(key),
                                                  signatureDescription.GetType().Name,
                                                  signatureDescription.AlgorithmName,
                                                  "");

                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.Signing,
                          logMessage);
            }
        }

        internal static void LogSigning(SignedXml signedXml, IMac key)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(key != null, "key != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_SigningHmac,
                                                  key.GetType().Name);

                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.Signing,
                          logMessage);
            }
        }
        internal static void LogSigningReference(SignedXml signedXml, Reference reference)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(reference != null, "reference != null");

            if (VerboseLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_SigningReference,
                                                  GetObjectId(reference),
                                                  reference.Uri,
                                                  reference.GetId(),
                                                  reference.Type,
                                                  reference.DigestMethod,
                                                  CryptoHelpers.CreateFromKnownName(reference.DigestMethod).GetType().Name);

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.SigningReference,
                          logMessage);
            }
        }

        internal static void LogVerificationFailure(SignedXml signedXml, string failureLocation)
        {
            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_VerificationFailed,
                                                  failureLocation);

                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.VerificationFailure,
                          logMessage);
            }
        }

        internal static void LogVerificationResult(SignedXml signedXml, object key, bool verified)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(key != null, "key != null");

            if (InformationLoggingEnabled)
            {
                string resource = verified ? SR.Log_VerificationWithKeySuccessful :
                                             SR.Log_VerificationWithKeyNotSuccessful;
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  resource,
                                                  GetKeyName(key));

                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.SignatureVerificationResult,
                          logMessage);
            }
        }

        internal static void LogVerifyKeyUsage(SignedXml signedXml, X509Certificate certificate/*, X509KeyUsageExtension keyUsages*/)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(certificate != null, "certificate != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_KeyUsages,
                                                  /*keyUsages.KeyUsages*/ "",
                                                  /*GetOidName(keyUsages.Oid)*/ "",
                                                  GetKeyName(certificate));

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.X509Verification,
                          logMessage);
            }
        }

        internal static void LogVerifyReference(SignedXml signedXml, Reference reference)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(reference != null, "reference != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_VerifyReference,
                                                  GetObjectId(reference),
                                                  reference.Uri,
                                                  reference.GetId(),
                                                  reference.Type);

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.VerifyReference,
                          logMessage);
            }
        }

        internal static void LogVerifyReferenceHash(SignedXml signedXml,
                                                    Reference reference,
                                                    byte[] actualHash,
                                                    byte[] expectedHash)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(reference != null, "reference != null");
            Debug.Assert(actualHash != null, "actualHash != null");
            Debug.Assert(expectedHash != null, "expectedHash != null");

            if (VerboseLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_ReferenceHash,
                                                  GetObjectId(reference),
                                                  reference.DigestMethod,
                                                  CryptoHelpers.CreateFromKnownName(reference.DigestMethod).GetType().Name,
                                                  FormatBytes(actualHash),
                                                  FormatBytes(expectedHash));

                WriteLine(signedXml,
                          TraceEventType.Verbose,
                          SignedXmlDebugEvent.VerifyReference,
                          logMessage);
            }
        }

        internal static void LogVerifySignedInfo(SignedXml signedXml,
                                                 AsymmetricKeyParameter key,
                                                 ISigner signatureDescription,
                                                 byte[] actualHashValue,
                                                 byte[] signatureValue)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(signatureDescription != null, "signatureDescription != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_VerifySignedInfoAsymmetric,
                                                  GetKeyName(key),
                                                  signatureDescription.GetType().Name,
                                                  signatureDescription.AlgorithmName,
                                                  "");
                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.VerifySignedInfo,
                          logMessage);
            }

            if (VerboseLoggingEnabled)
            {
                string hashLog = string.Format(CultureInfo.InvariantCulture,
                                               SR.Log_ActualHashValue,
                                               FormatBytes(actualHashValue));
                WriteLine(signedXml, TraceEventType.Verbose, SignedXmlDebugEvent.VerifySignedInfo, hashLog);

                string signatureLog = string.Format(CultureInfo.InvariantCulture,
                                                    SR.Log_RawSignatureValue,
                                                    FormatBytes(signatureValue));
                WriteLine(signedXml, TraceEventType.Verbose, SignedXmlDebugEvent.VerifySignedInfo, signatureLog);
            }
        }

        internal static void LogVerifySignedInfo(SignedXml signedXml,
                                                 IMac mac,
                                                 byte[] actualHashValue,
                                                 byte[] signatureValue)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(mac != null, "mac != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                  SR.Log_VerifySignedInfoHmac,
                                                  mac.GetType().Name);
                WriteLine(signedXml,
                          TraceEventType.Information,
                          SignedXmlDebugEvent.VerifySignedInfo,
                          logMessage);
            }

            if (VerboseLoggingEnabled)
            {
                string hashLog = string.Format(CultureInfo.InvariantCulture,
                                               SR.Log_ActualHashValue,
                                               FormatBytes(actualHashValue));
                WriteLine(signedXml, TraceEventType.Verbose, SignedXmlDebugEvent.VerifySignedInfo, hashLog);

                string signatureLog = string.Format(CultureInfo.InvariantCulture,
                                                    SR.Log_RawSignatureValue,
                                                    FormatBytes(signatureValue));
                WriteLine(signedXml, TraceEventType.Verbose, SignedXmlDebugEvent.VerifySignedInfo, signatureLog);
            }
        }

        internal static void LogSignedXmlRecursionLimit(SignedXml signedXml,
                                                        Reference reference)
        {
            Debug.Assert(signedXml != null, "signedXml != null");
            Debug.Assert(reference != null, "reference != null");

            if (InformationLoggingEnabled)
            {
                string logMessage = string.Format(CultureInfo.InvariantCulture,
                                                    SR.Log_SignedXmlRecursionLimit,
                                                    GetObjectId(reference),
                                                    reference.DigestMethod,
                                                    CryptoHelpers.CreateFromKnownName(reference.DigestMethod).GetType().Name);

                WriteLine(signedXml,
                            TraceEventType.Information,
                            SignedXmlDebugEvent.VerifySignedInfo,
                            logMessage);
            }
        }
        private static void WriteLine(object source, TraceEventType eventType, SignedXmlDebugEvent eventId, string data)
        {
            Debug.Assert(source != null, "source != null");
            Debug.Assert(!string.IsNullOrEmpty(data), "!string.IsNullOrEmpty(data)");
            Debug.Assert(InformationLoggingEnabled, "InformationLoggingEnabled");

            s_traceSource.TraceEvent(eventType,
                                    (int)eventId,
                                    "[{0}, {1}] {2}",
                                    GetObjectId(source),
                                    eventId,
                                    data);
        }
    }
}

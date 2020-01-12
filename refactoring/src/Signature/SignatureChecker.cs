using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Crypto.Macs;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Xml;
namespace Org.BouncyCastle.Crypto.Xml
{
    public class SignatureChecker : SignedXml
    {

        public SignatureChecker() : base() { }

        public SignatureChecker(XmlDocument document) : base(document) { }

        public SignatureChecker(XmlElement elem) : base(elem) { }

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
    }
}
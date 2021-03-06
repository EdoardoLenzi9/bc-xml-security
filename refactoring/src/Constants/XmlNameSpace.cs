﻿using System.Collections.Generic;

namespace Org.BouncyCastle.Crypto.Xml.Constants
{
    public enum NS
    {
        None,
        Invalid,
        Algorithm,
        OriginalAlgorithm,
        XmlEncNamespaceUrl,
        XmlEncElementUrl,
        XmlEncElementContentUrl,
        XmlEncEncryptedKeyUrl,
        XmlEncDESUrl,
        XmlEncTripleDESUrl,
        XmlEncAES128Url,
        XmlEncAES256Url,
        XmlEncAES192Url,
        XmlEncRSA15Url,
        XmlEncRSAOAEPUrl,
        XmlEncTripleDESKeyWrapUrl,
        XmlEncAES128KeyWrapUrl,
        XmlEncAES256KeyWrapUrl,
        XmlEncAES192KeyWrapUrl,
        XmlEncSHA256Url,
        XmlEncSHA512Url,
        XmlDsigMoreHMACMD5Url,
        XmlDsigMoreHMACSHA256Url,
        XmlDsigMoreHMACSHA384Url,
        XmlDsigMoreHMACSHA512Url,
        XmlDsigMoreHMACRIPEMD160Url,
        XmlDsigNamespaceUrl,
        XmlDsigMinimalCanonicalizationUrl,
        XmlDsigSHA1Url,
        XmlDsigDSAUrl,
        XmlDsigRSASHA1Url,
        XmlDsigHMACSHA1Url,
        XmlDsigSHA256Url,
        XmlDsigRSASHA256Url,
        XmlDsigSHA384Url,
        XmlDsigRSASHA384Url,
        XmlDsigSHA512Url,
        XmlDsigRSASHA512Url,
        XmlDsigC14NTransformUrl,
        XmlDsigC14NWithCommentsTransformUrl,
        XmlDsigExcC14NTransformUrl,
        XmlDsigExcC14NWithCommentsTransformUrl,
        XmlDsigBase64TransformUrl,
        XmlDsigXPathTransformUrl,
        XmlDsigXsltTransformUrl,
        XmlDsigEnvelopedSignatureTransformUrl,
        XmlDecryptionTransformUrl,
        XmlLicenseTransformUrl,
        XmlDsigGost3410Url,
        XmlDsigGost3410ObsoleteUrl,
        XmlDsigGost3411Url,
        XmlDsigGost3411ObsoleteUrl,
        XmlDsigGost3411HmacUrl,
        XmlDsigGost3410_2012_256_Url,
        XmlDsigGost3411_2012_256_Url,
        XmlDsigGost3411_2012_256_HmacUrl,
        XmlDsigGost3410_2012_512_Url,
        XmlDsigGost3411_2012_512_Url,
        XmlDsigGost3411_2012_512_HmacUrl,
        XmlDecryptionTransformNamespaceUrl
    };

    public class XmlNameSpace
    {
        public static Dictionary<NS, string> Url = new Dictionary<NS, string>()
        {
            { NS.None, string.Empty },
            { NS.Invalid, "invalid" },
            { NS.Algorithm, "algorithm" },
            { NS.OriginalAlgorithm, "originalAlgorithm" },
            { NS.XmlEncNamespaceUrl, "http://www.w3.org/2001/04/xmlenc#" },
            { NS.XmlEncElementUrl, "http://www.w3.org/2001/04/xmlenc#Element" },
            { NS.XmlEncElementContentUrl, "http://www.w3.org/2001/04/xmlenc#Content"},
            { NS.XmlEncEncryptedKeyUrl, "http://www.w3.org/2001/04/xmlenc#EncryptedKey"},
            { NS.XmlEncDESUrl, "http://www.w3.org/2001/04/xmlenc#des-cbc"},
            { NS.XmlEncTripleDESUrl, "http://www.w3.org/2001/04/xmlenc#tripledes-cbc"},
            { NS.XmlEncAES128Url, "http://www.w3.org/2001/04/xmlenc#aes128-cbc"},
            { NS.XmlEncAES256Url, "http://www.w3.org/2001/04/xmlenc#aes256-cbc"},
            { NS.XmlEncAES192Url, "http://www.w3.org/2001/04/xmlenc#aes192-cbc"},
            { NS.XmlEncRSA15Url, "http://www.w3.org/2001/04/xmlenc#rsa-1_5"},
            { NS.XmlEncRSAOAEPUrl, "http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p"},
            { NS.XmlEncTripleDESKeyWrapUrl, "http://www.w3.org/2001/04/xmlenc#kw-tripledes"},
            { NS.XmlEncAES128KeyWrapUrl, "http://www.w3.org/2001/04/xmlenc#kw-aes128"},
            { NS.XmlEncAES256KeyWrapUrl, "http://www.w3.org/2001/04/xmlenc#kw-aes256"},
            { NS.XmlEncAES192KeyWrapUrl, "http://www.w3.org/2001/04/xmlenc#kw-aes192"},
            { NS.XmlEncSHA256Url, "http://www.w3.org/2001/04/xmlenc#sha256"},
            { NS.XmlEncSHA512Url, "http://www.w3.org/2001/04/xmlenc#sha512"},
            { NS.XmlDsigMoreHMACMD5Url, "http://www.w3.org/2001/04/xmldsig-more#hmac-md5"},
            { NS.XmlDsigMoreHMACSHA256Url, "http://www.w3.org/2001/04/xmldsig-more#hmac-sha256"},
            { NS.XmlDsigMoreHMACSHA384Url, "http://www.w3.org/2001/04/xmldsig-more#hmac-sha384"},
            { NS.XmlDsigMoreHMACSHA512Url, "http://www.w3.org/2001/04/xmldsig-more#hmac-sha512"},
            { NS.XmlDsigMoreHMACRIPEMD160Url, "http://www.w3.org/2001/04/xmldsig-more#hmac-ripemd160"},
            { NS.XmlDsigNamespaceUrl, "http://www.w3.org/2000/09/xmldsig#"},
            { NS.XmlDsigMinimalCanonicalizationUrl, "http://www.w3.org/2000/09/xmldsig#minimal"},
            { NS.XmlDsigSHA1Url, "http://www.w3.org/2000/09/xmldsig#sha1"},
            { NS.XmlDsigDSAUrl, "http://www.w3.org/2000/09/xmldsig#dsa-sha1"},
            { NS.XmlDsigRSASHA1Url, "http://www.w3.org/2000/09/xmldsig#rsa-sha1"},
            { NS.XmlDsigHMACSHA1Url, "http://www.w3.org/2000/09/xmldsig#hmac-sha1"},
            { NS.XmlDsigSHA256Url, "http://www.w3.org/2001/04/xmlenc#sha256"},
            { NS.XmlDsigRSASHA256Url, "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"},
            { NS.XmlDsigSHA384Url, "http://www.w3.org/2001/04/xmldsig-more#sha384"},
            { NS.XmlDsigRSASHA384Url, "http://www.w3.org/2001/04/xmldsig-more#rsa-sha384"},
            { NS.XmlDsigSHA512Url, "http://www.w3.org/2001/04/xmlenc#sha512"},
            { NS.XmlDsigRSASHA512Url, "http://www.w3.org/2001/04/xmldsig-more#rsa-sha512"},
            { NS.XmlDsigC14NTransformUrl, "http://www.w3.org/TR/2001/REC-xml-c14n-20010315"},
            { NS.XmlDsigC14NWithCommentsTransformUrl, "http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments"},
            { NS.XmlDsigExcC14NTransformUrl, "http://www.w3.org/2001/10/xml-exc-c14n#"},
            { NS.XmlDsigExcC14NWithCommentsTransformUrl, "http://www.w3.org/2001/10/xml-exc-c14n#WithComments"},
            { NS.XmlDsigBase64TransformUrl, "http://www.w3.org/2000/09/xmldsig#base64"},
            { NS.XmlDsigXPathTransformUrl, "http://www.w3.org/TR/1999/REC-xpath-19991116"},
            { NS.XmlDsigXsltTransformUrl, "http://www.w3.org/TR/1999/REC-xslt-19991116"},
            { NS.XmlDsigEnvelopedSignatureTransformUrl, "http://www.w3.org/2000/09/xmldsig#enveloped-signature"},
            { NS.XmlDecryptionTransformUrl, "http://www.w3.org/2002/07/decrypt#XML"},
            { NS.XmlLicenseTransformUrl, "urn:mpeg:mpeg21:2003:01-REL-R-NS:licenseTransform"},
            { NS.XmlDsigGost3410Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102001-gostr3411"},
            { NS.XmlDsigGost3410ObsoleteUrl, "http://www.w3.org/2001/04/xmldsig-more#gostr34102001-gostr3411"},
            { NS.XmlDsigGost3411Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr3411"},
            { NS.XmlDsigGost3411ObsoleteUrl, "http://www.w3.org/2001/04/xmldsig-more#gostr3411"},
            { NS.XmlDsigGost3411HmacUrl, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr3411"},
            { NS.XmlDsigGost3410_2012_256_Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012256"},
            { NS.XmlDsigGost3411_2012_256_Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-256"},
            { NS.XmlDsigGost3411_2012_256_HmacUrl, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr34112012-256"},
            { NS.XmlDsigGost3410_2012_512_Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012512"},
            { NS.XmlDsigGost3411_2012_512_Url, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-512"},
            { NS.XmlDsigGost3411_2012_512_HmacUrl, "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr34112012-512"},
            { NS.XmlDecryptionTransformNamespaceUrl, "http://www.w3.org/2002/07/decrypt#" }
        };
    }
}

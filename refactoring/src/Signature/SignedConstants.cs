namespace Org.BouncyCastle.Crypto.Xml
{
    public static class SignedConstants
    {
        // additional HMAC Url identifiers
        public const string XmlDsigMoreHMACMD5Url = "http://www.w3.org/2001/04/xmldsig-more#hmac-md5";
        public const string XmlDsigMoreHMACSHA256Url = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha256";
        public const string XmlDsigMoreHMACSHA384Url = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha384";
        public const string XmlDsigMoreHMACSHA512Url = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha512";
        public const string XmlDsigMoreHMACRIPEMD160Url = "http://www.w3.org/2001/04/xmldsig-more#hmac-ripemd160";

        //
        // public constant Url identifiers most frequently used within the XML Signature classes
        //

        public const string XmlDsigNamespaceUrl = "http://www.w3.org/2000/09/xmldsig#";
        public const string XmlDsigMinimalCanonicalizationUrl = "http://www.w3.org/2000/09/xmldsig#minimal";
        public const string XmlDsigCanonicalizationUrl = XmlDsigC14NTransformUrl;
        public const string XmlDsigCanonicalizationWithCommentsUrl = XmlDsigC14NWithCommentsTransformUrl;

        public const string XmlDsigSHA1Url = "http://www.w3.org/2000/09/xmldsig#sha1";
        public const string XmlDsigDSAUrl = "http://www.w3.org/2000/09/xmldsig#dsa-sha1";
        public const string XmlDsigRSASHA1Url = "http://www.w3.org/2000/09/xmldsig#rsa-sha1";
        public const string XmlDsigHMACSHA1Url = "http://www.w3.org/2000/09/xmldsig#hmac-sha1";

        public const string XmlDsigSHA256Url = "http://www.w3.org/2001/04/xmlenc#sha256";
        public const string XmlDsigRSASHA256Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";

        // Yes, SHA384 is in the xmldsig-more namespace even though all the other SHA variants are in xmlenc. That's the standard.
        public const string XmlDsigSHA384Url = "http://www.w3.org/2001/04/xmldsig-more#sha384";
        public const string XmlDsigRSASHA384Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha384";

        public const string XmlDsigSHA512Url = "http://www.w3.org/2001/04/xmlenc#sha512";
        public const string XmlDsigRSASHA512Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha512";

        public const string XmlDsigC14NTransformUrl = "http://www.w3.org/TR/2001/REC-xml-c14n-20010315";
        public const string XmlDsigC14NWithCommentsTransformUrl = "http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments";
        public const string XmlDsigExcC14NTransformUrl = "http://www.w3.org/2001/10/xml-exc-c14n#";
        public const string XmlDsigExcC14NWithCommentsTransformUrl = "http://www.w3.org/2001/10/xml-exc-c14n#WithComments";
        public const string XmlDsigBase64TransformUrl = "http://www.w3.org/2000/09/xmldsig#base64";
        public const string XmlDsigXPathTransformUrl = "http://www.w3.org/TR/1999/REC-xpath-19991116";
        public const string XmlDsigXsltTransformUrl = "http://www.w3.org/TR/1999/REC-xslt-19991116";
        public const string XmlDsigEnvelopedSignatureTransformUrl = "http://www.w3.org/2000/09/xmldsig#enveloped-signature";
        public const string XmlDecryptionTransformUrl = "http://www.w3.org/2002/07/decrypt#XML";
        public const string XmlLicenseTransformUrl = "urn:mpeg:mpeg21:2003:01-REL-R-NS:licenseTransform";

        // GOST 2001 algorithms
        public const string XmlDsigGost3410Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102001-gostr3411";
        public const string XmlDsigGost3410ObsoleteUrl = "http://www.w3.org/2001/04/xmldsig-more#gostr34102001-gostr3411";
        public const string XmlDsigGost3411Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr3411";
        public const string XmlDsigGost3411ObsoleteUrl = "http://www.w3.org/2001/04/xmldsig-more#gostr3411";
        public const string XmlDsigGost3411HmacUrl = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr3411";

        // GOST 2012 algorithms
        public const string XmlDsigGost3410_2012_256_Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012256";
        public const string XmlDsigGost3411_2012_256_Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-256";
        public const string XmlDsigGost3411_2012_256_HmacUrl = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr34112012-256";

        public const string XmlDsigGost3410_2012_512_Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012512";
        public const string XmlDsigGost3411_2012_512_Url = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-512";
        public const string XmlDsigGost3411_2012_512_HmacUrl = "urn:ietf:params:xml:ns:cpxmlsec:algorithms:hmac-gostr34112012-512";

    }
}

using System.Collections.Generic;
using Org.BouncyCastle.Crypto.Digests;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Paddings;
using Org.BouncyCastle.Crypto.Signers;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Xml.Constants
{
    class XmlUri
    {
        public static readonly Dictionary<string, object> Uri = new Dictionary<string, object>()
        {
            {"MD5", DigestUtilities.GetDigest("MD5")},
            {"SHA384", DigestUtilities.GetDigest("SHA-384")},
            {"System.Security.Cryptography.DSASignatureDescription", new DsaDigestSigner2(new DsaSigner(), new Sha1Digest())},
            {"System.Security.Cryptography.RSASignatureDescription", SignerUtilities.GetSigner("SHA1WITHRSA")},
            {"http://www.w3.org/2000/09/xmldsig# KeyName", new KeyInfoName()},
            {"http://www.w3.org/2000/09/xmldsig# KeyValue/DSAKeyValue", new DsaKeyValue()},
            {"http://www.w3.org/2000/09/xmldsig# KeyValue/RSAKeyValue", new RsaKeyValue()},
            {"http://www.w3.org/2000/09/xmldsig# RetrievalMethod", new KeyInfoRetrievalMethod()},
            {"http://www.w3.org/2000/09/xmldsig# X509Data", new KeyInfoX509Data()},
            {"http://www.w3.org/2000/09/xmldsig#base64", new XmlDsigBase64Transform()},
            {"http://www.w3.org/2000/09/xmldsig#dsa-sha1", new DsaDigestSigner2(new DsaSigner(), new Sha1Digest())},
            {"http://www.w3.org/2000/09/xmldsig#enveloped-signature", new XmlDsigEnvelopedSignatureTransform()},
            {"http://www.w3.org/2000/09/xmldsig#rsa-sha1", SignerUtilities.GetSigner("SHA1WITHRSA")},
            {"http://www.w3.org/2000/09/xmldsig#sha1", DigestUtilities.GetDigest("SHA-1")},
            {"http://www.w3.org/2001/04/xmldsig-more#gostr34102001-gostr3411", SignerUtilities.GetSigner("GOST3411WITHECGOST3410")},
            {"http://www.w3.org/2001/04/xmldsig-more#gostr3411", DigestUtilities.GetDigest("GOST3411")},
            {"http://www.w3.org/2001/04/xmldsig-more#hmac-md5", MacUtilities.GetMac("HMAC-MD5")},
            {"http://www.w3.org/2001/04/xmldsig-more#hmac-ripemd160", MacUtilities.GetMac("HMAC-RIPEMD160")},
            {"http://www.w3.org/2001/04/xmldsig-more#hmac-sha256", MacUtilities.GetMac("HMAC-SHA256")},
            {"http://www.w3.org/2001/04/xmldsig-more#hmac-sha384", MacUtilities.GetMac("HMAC-SHA384")},
            {"http://www.w3.org/2001/04/xmldsig-more#hmac-sha512", MacUtilities.GetMac("HMAC-SHA512")},
            {"http://www.w3.org/2001/04/xmldsig-more#rsa-sha256", SignerUtilities.GetSigner("SHA256WITHRSA")},
            {"http://www.w3.org/2001/04/xmldsig-more#rsa-sha384", SignerUtilities.GetSigner("SHA384WITHRSA")},
            {"http://www.w3.org/2001/04/xmldsig-more#rsa-sha512", SignerUtilities.GetSigner("SHA512WITHRSA")},
            {"http://www.w3.org/2001/04/xmldsig-more#sha384", DigestUtilities.GetDigest("SHA-384")},
            {"http://www.w3.org/2001/04/xmlenc# EncryptedKey", new KeyInfoEncryptedKey()},
            {"http://www.w3.org/2001/04/xmlenc#aes128-cbc", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(128)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#aes192-cbc", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(192)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#aes256-cbc", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(256)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#des-cbc", CipherUtilities.GetCipher("DES/CBC/PKCS7Padding")},
            {"http://www.w3.org/2001/04/xmlenc#kw-aes128", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(128)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#kw-aes192", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(192)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#kw-aes256", new PaddedBufferedBlockCipher(new CbcBlockCipher(new RijndaelEngine(256)), new Pkcs7Padding())},
            {"http://www.w3.org/2001/04/xmlenc#ripemd160", DigestUtilities.GetDigest("RIPEMD-160")},
            {"http://www.w3.org/2001/04/xmlenc#sha256", DigestUtilities.GetDigest("SHA-256")},
            {"http://www.w3.org/2001/04/xmlenc#sha512", DigestUtilities.GetDigest("SHA-512")},
            {"http://www.w3.org/2001/04/xmlenc#tripledes-cbc", CipherUtilities.GetCipher("DESede/CBC/PKCS7Padding")},
            {"http://www.w3.org/2001/10/xml-exc-c14n#", new XmlDsigExcC14NTransform()},
            {"http://www.w3.org/2001/10/xml-exc-c14n#WithComments", new XmlDsigExcC14NWithCommentsTransform()},
            {"http://www.w3.org/2002/07/decrypt#XML", new XmlDecryptionTransform()},
            {"http://www.w3.org/TR/1999/REC-xpath-19991116", new XmlDsigXPathTransform()},
            {"http://www.w3.org/TR/1999/REC-xslt-19991116", new XmlDsigXsltTransform()},
            {"http://www.w3.org/TR/2001/REC-xml-c14n-20010315", new XmlDsigC14NTransform()},
            {"http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments", new XmlDsigC14NWithCommentsTransform()},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102001-gostr3411", SignerUtilities.GetSigner("GOST3411WITHECGOST3410")},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012256", new Gost3410DigestSigner(new ECGost3410Signer(), new Gost3411_2012_256Digest())},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34102012-gostr34112012512", new Gost3410DigestSigner(new ECGost3410Signer(), new Gost3411_2012_512Digest())},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr3411", DigestUtilities.GetDigest("GOST3411")},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-256", DigestUtilities.GetDigest("GOST3411-2012-256")},
            {"urn:ietf:params:xml:ns:cpxmlsec:algorithms:gostr34112012-512", DigestUtilities.GetDigest("GOST3411-2012-512")},
            {"urn:mpeg:mpeg21:2003:01-REL-R-NS:licenseTransform", new XmlLicenseTransform()},
        };
    }
}

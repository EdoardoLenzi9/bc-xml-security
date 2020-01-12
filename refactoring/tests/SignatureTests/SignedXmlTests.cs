



using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public class SignedXmlTests
    {
        [Fact]
        public void Constructor_Document_Null()
        {
            Assert.Throws<ArgumentNullException>(
                () => new SignedXml((XmlDocument) null)
            );
        }

        [Fact]
        public void Constructor_XmlElement_Null()
        {
            Assert.Throws<ArgumentNullException>(
                () => new SignedXml((XmlElement) null)
            );
        }

        [Fact]
        public void Constructor_NoArgs()
        {
            SignedXml signedXml = new SignedXml();


            Assert.NotNull(signedXml.EncryptedXml);

            Assert.Equal(0, signedXml.KeyInfo.Count);
            Assert.Equal(null, signedXml.KeyInfo.GetId());


            Assert.NotNull(signedXml.Signature);
            Assert.NotNull(signedXml.Signature.SignedInfo);

            Assert.Equal(signedXml.SafeCanonicalizationMethods,
                new []
                {
                    XmlNameSpace.Url[NS.XmlDsigC14NTransformUrl],
                    XmlNameSpace.Url[NS.XmlDsigC14NWithCommentsTransformUrl],
                    XmlNameSpace.Url[NS.XmlDsigExcC14NTransformUrl],
                    XmlNameSpace.Url[NS.XmlDsigExcC14NWithCommentsTransformUrl]
                });
            Assert.NotNull(signedXml.SignatureFormatValidator);

            Assert.Null(signedXml.SignatureLength);
            Assert.Null(signedXml.SignatureMethod);
            Assert.Null(signedXml.SignatureValue);
        }
    }
}

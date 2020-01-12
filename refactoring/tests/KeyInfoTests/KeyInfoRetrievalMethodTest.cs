













using System;
using System.Xml;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class KeyInfoRetrievalMethodTest
    {

        [Fact]
        public void TestNewEmptyKeyNode()
        {
            KeyInfoRetrievalMethod uri1 = new KeyInfoRetrievalMethod();
            Assert.Equal("<RetrievalMethod xmlns=\"http://www.w3.org/2000/09/xmldsig#\" />", (uri1.GetXml().OuterXml));
        }

        [Fact]
        public void TestNewKeyNode()
        {
            string uri = "http://www.go-mono.com/";
            KeyInfoRetrievalMethod uri1 = new KeyInfoRetrievalMethod();
            uri1.SetUri(uri);
            XmlElement xel = uri1.GetXml();

            KeyInfoRetrievalMethod uri2 = new KeyInfoRetrievalMethod(uri1.GetUri());
            uri2.LoadXml(xel);

            Assert.Equal((uri1.GetXml().OuterXml), (uri2.GetXml().OuterXml));
            Assert.Equal(uri, uri1.GetUri());
        }

        [Fact]
        public void TestImportKeyNode()
        {
            string value = "<RetrievalMethod URI=\"http://www.go-mono.com/\" xmlns=\"http://www.w3.org/2000/09/xmldsig#\" />";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(value);

            KeyInfoRetrievalMethod uri1 = new KeyInfoRetrievalMethod();
            uri1.LoadXml(doc.DocumentElement);


            string s = (uri1.GetXml().OuterXml);
            Assert.Equal(value, s);


            Assert.Equal("http://www.go-mono.com/", uri1.GetUri());
        }

        [Fact]
        public void InvalidKeyNode1()
        {
            KeyInfoRetrievalMethod uri1 = new KeyInfoRetrievalMethod();
            Assert.Throws<ArgumentNullException>(() => uri1.LoadXml(null));
        }

        [Fact]
        public void InvalidKeyNode2()
        {
            string bad = "<Test></Test>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(bad);

            KeyInfoRetrievalMethod uri1 = new KeyInfoRetrievalMethod();

            uri1.LoadXml(doc.DocumentElement);
            AssertCrypto.AssertXmlEquals("invalid", "<RetrievalMethod xmlns=\"http://www.w3.org/2000/09/xmldsig#\" />", (uri1.GetXml().OuterXml));
        }
    }
}

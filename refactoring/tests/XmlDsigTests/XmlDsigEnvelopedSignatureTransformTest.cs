












using System;
using System.IO;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{



    public class UnprotectedXmlDsigEnvelopedSignatureTransform : XmlDsigEnvelopedSignatureTransform
    {
        public UnprotectedXmlDsigEnvelopedSignatureTransform()
        {
        }

        public UnprotectedXmlDsigEnvelopedSignatureTransform(bool includeComments)
            : base(includeComments)
        {
        }

        public XmlNodeList UnprotectedGetInnerXml()
        {
            return base.GetInnerXml();
        }
    }

    public class XmlDsigEnvelopedSignatureTransformTest
    {
        private UnprotectedXmlDsigEnvelopedSignatureTransform transform;

        public XmlDsigEnvelopedSignatureTransformTest()
        {
            transform = new UnprotectedXmlDsigEnvelopedSignatureTransform();
        }

        [Fact] // ctor ()
        public void Constructor1()
        {
            CheckProperties(transform);
        }

        [Fact] // ctor (Boolean)
        public void Constructor2()
        {
            transform = new UnprotectedXmlDsigEnvelopedSignatureTransform(true);
            CheckProperties(transform);
            transform = new UnprotectedXmlDsigEnvelopedSignatureTransform(false);
            CheckProperties(transform);
        }

        void CheckProperties(XmlDsigEnvelopedSignatureTransform transform)
        {
            Assert.Equal("http://www.w3.org/2000/09/xmldsig#enveloped-signature",
                XmlNameSpace.Url[transform.Algorithm]);

            Type[] input = transform.InputTypes;
            Assert.Equal(3, input.Length);

            bool istream = false;
            bool ixmldoc = false;
            bool ixmlnl = false;
            foreach (Type t in input)
            {
                if (t == typeof(XmlDocument))
                    ixmldoc = true;
                if (t == typeof(XmlNodeList))
                    ixmlnl = true;
                if (t == typeof(Stream))
                    istream = true;
            }
            Assert.True(istream, "Input Stream");
            Assert.True(ixmldoc, "Input XmlDocument");
            Assert.True(ixmlnl, "Input XmlNodeList");

            Type[] output = transform.OutputTypes;
            Assert.Equal(2, output.Length);

            bool oxmlnl = false;
            bool oxmldoc = false;
            foreach (Type t in output)
            {
                if (t == typeof(XmlNodeList))
                    oxmlnl = true;
                if (t == typeof(XmlDocument))
                    oxmldoc = true;
            }
            Assert.True(oxmlnl, "Output XmlNodeList");
            Assert.True(oxmldoc, "Output XmlDocument");
        }

        void AssertEquals(XmlNodeList expected, XmlNodeList actual, string msg)
        {
            for (int i = 0; i < expected.Count; i++)
            {
                Assert.Equal(expected[i].OuterXml, actual[i].OuterXml);
            }
        }

        [Fact]
        public void GetInnerXml()
        {

            Assert.Null(transform.UnprotectedGetInnerXml());
        }

        private XmlDocument GetDoc()
        {
            string dsig = "<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\" /><SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#dsa-sha1\" /><Reference URI=\"\"><Transforms><Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\" /></Transforms><DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\" /><DigestValue>fdy6S2NLpnT4fMdokUHSHsmpcvo=</DigestValue></Reference></Signature>";
            string test = "<Envelope> " + dsig + " </Envelope>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(test);
            return doc;
        }

        [Fact]
        public void LoadInputAsXmlDocument()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc);
            object o = transform.GetOutput();
            Assert.Equal(doc, o);
        }

        [Fact]
        public void LoadInputAsXmlNodeList()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc.ChildNodes);
            XmlNodeList xnl = (XmlNodeList)transform.GetOutput();
            AssertEquals(doc.ChildNodes, xnl, "EnvelopedSignature result");
        }
    }
}

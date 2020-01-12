













using System;
using System.IO;
using System.Text;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{



    public class UnprotectedXmlDsigBase64Transform : XmlDsigBase64Transform
    {

        public XmlNodeList UnprotectedGetInnerXml()
        {
            return base.GetInnerXml();
        }
    }

    public class XmlDsigBase64TransformTest
    {

        protected UnprotectedXmlDsigBase64Transform transform;

        public XmlDsigBase64TransformTest()
        {
            transform = new UnprotectedXmlDsigBase64Transform();
            Type t = typeof(XmlDsigBase64Transform);
        }

        [Fact]
        public void Properties()
        {
            Assert.Equal("http://www.w3.org/2000/09/xmldsig#base64", XmlNameSpace.Url[transform.Algorithm]);

            Type[] input = transform.InputTypes;
            Assert.True((input.Length == 3), "Input #");

            bool istream = false;
            bool ixmldoc = false;
            bool ixmlnl = false;
            foreach (Type t in input)
            {
                if (t.ToString() == "System.IO.Stream")
                    istream = true;
                if (t.ToString() == "System.Xml.XmlDocument")
                    ixmldoc = true;
                if (t.ToString() == "System.Xml.XmlNodeList")
                    ixmlnl = true;
            }
            Assert.True(istream, "Input Stream");
            Assert.True(ixmldoc, "Input XmlDocument");
            Assert.True(ixmlnl, "Input XmlNodeList");

            Type[] output = transform.OutputTypes;
            Assert.True((output.Length == 1), "Output #");

            bool ostream = false;
            foreach (Type t in input)
            {
                if (t.ToString() == "System.IO.Stream")
                    ostream = true;
            }
            Assert.True(ostream, "Output Stream");
        }

        [Fact]
        public void Types()
        {
            Type[] input = transform.InputTypes;
            input[0] = null;
            input[1] = null;
            input[2] = null;

            foreach (Type t in transform.InputTypes)
            {
                Assert.Null(t);
            }

            XmlDsigBase64Transform t2 = new XmlDsigBase64Transform();
            foreach (Type t in t2.InputTypes)
            {
                Assert.NotNull(t);
            }
        }

        [Fact]
        public void GetInnerXml()
        {
            XmlNodeList xnl = transform.UnprotectedGetInnerXml();
            Assert.Null(xnl);
        }

        private string Stream2String(Stream s)
        {
            StreamReader sr = new StreamReader(s);
            return sr.ReadToEnd();
        }

        static private string base64 = "XmlDsigBase64Transform";
        static private byte[] base64array = { 0x58, 0x6D, 0x6C, 0x44, 0x73, 0x69, 0x67, 0x42, 0x61, 0x73, 0x65, 0x36, 0x34, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x6F, 0x72, 0x6D };

        private XmlDocument GetDoc()
        {
            string xml = "<Test>" + Convert.ToBase64String(base64array) + "</Test>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xml);
            return doc;
        }

        [Fact]
        public void LoadInputAsXmlDocument()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal(base64, output);
        }

        [Fact]
        public void LoadInputAsXmlNodeListFromXPath()
        {
            XmlDocument doc = GetDoc();
            XmlNodeList xpath = doc.SelectNodes("//.");
            Assert.Equal(3, xpath.Count);
            transform.LoadInput(xpath);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal(base64, output);
        }

        [Fact]
        public void LoadInputAsXmlNodeList()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc.ChildNodes);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);

            Assert.Equal(string.Empty, output);
        }

        [Fact]
        public void LoadInputAsStream()
        {
            MemoryStream ms = new MemoryStream();
            byte[] x = Encoding.UTF8.GetBytes(Convert.ToBase64String(base64array));
            ms.Write(x, 0, x.Length);
            ms.Position = 0;
            transform.LoadInput(ms);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal(base64, output);
        }

        [Fact]
        public void LoadInputWithUnsupportedType()
        {
            byte[] bad = { 0xBA, 0xD };

            transform.LoadInput(bad);
        }

        [Fact]
        public void UnsupportedOutput()
        {
            XmlDocument doc = new XmlDocument();
            AssertExtensions.Throws<ArgumentException>("type", () => transform.GetOutput(doc.GetType()));
        }
    }
}














using System.Xml;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class KeyInfoNodeTest
    {

        [Fact]
        public void NewKeyNode()
        {
            string test = "<Test></Test>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(test);

            KeyInfoNode node1 = new KeyInfoNode();
            node1.SetValue(doc.DocumentElement);
            XmlElement xel = node1.GetXml();

            KeyInfoNode node2 = new KeyInfoNode(node1.GetValue());
            node2.LoadXml(xel);

            Assert.Equal((node1.GetXml().OuterXml), (node2.GetXml().OuterXml));
        }

        [Fact]
        public void ImportKeyNode()
        {

            string value = "<KeyName xmlns=\"http://www.w3.org/2000/09/xmldsig#\">Mono::</KeyName>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(value);

            KeyInfoNode node1 = new KeyInfoNode();
            node1.LoadXml(doc.DocumentElement);

            string s = (node1.GetXml().OuterXml);
            Assert.Equal(value, s);
        }


        [Fact]
        public void InvalidKeyNode()
        {
            string bad = "<Test></Test>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(bad);

            KeyInfoNode node1 = new KeyInfoNode();

            node1.LoadXml(null);
            Assert.Null(node1.GetValue());
        }
    }
}

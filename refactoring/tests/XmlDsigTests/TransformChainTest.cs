












using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class TransformChainTest
    {

        [Fact]
        public void EmptyChain()
        {
            TransformChain chain = new TransformChain();
            Assert.Equal(0, chain.Count);
            Assert.NotNull(chain.GetEnumerator());
            Assert.Equal("Org.BouncyCastle.Crypto.Xml.TransformChain", chain.ToString());
        }

        [Fact]
        public void FullChain()
        {
            TransformChain chain = new TransformChain();

            XmlDsigBase64Transform base64 = new XmlDsigBase64Transform();
            chain.Add(base64);
            Assert.Equal(base64, chain[0]);
            Assert.Equal(1, chain.Count);

            XmlDsigC14NTransform c14n = new XmlDsigC14NTransform();
            chain.Add(c14n);
            Assert.Equal(c14n, chain[1]);
            Assert.Equal(2, chain.Count);

            XmlDsigC14NWithCommentsTransform c14nc = new XmlDsigC14NWithCommentsTransform();
            chain.Add(c14nc);
            Assert.Equal(c14nc, chain[2]);
            Assert.Equal(3, chain.Count);

            XmlDsigEnvelopedSignatureTransform esign = new XmlDsigEnvelopedSignatureTransform();
            chain.Add(esign);
            Assert.Equal(esign, chain[3]);
            Assert.Equal(4, chain.Count);

            XmlDsigXPathTransform xpath = new XmlDsigXPathTransform();
            chain.Add(xpath);
            Assert.Equal(xpath, chain[4]);
            Assert.Equal(5, chain.Count);

            XmlDsigXsltTransform xslt = new XmlDsigXsltTransform();
            chain.Add(xslt);
            Assert.Equal(xslt, chain[5]);
            Assert.Equal(6, chain.Count);
        }
    }
}

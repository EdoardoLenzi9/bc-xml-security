



using System.Collections;
using System.Xml;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public class KeyInfoTests
    {
        [Fact]
        public void Constructor()
        {
            KeyInfo keyInfo = new KeyInfo();

            Assert.Equal(0, keyInfo.Count);
            Assert.Null(keyInfo.GetId());

            XmlElement xmlElement = keyInfo.GetXml();
            Assert.NotNull(xmlElement);
            Assert.Equal("<KeyInfo xmlns=\"http://www.w3.org/2000/09/xmldsig#\" />", xmlElement.OuterXml);

            IEnumerator enumerator = keyInfo.GetEnumerator();
            Assert.NotNull(enumerator);
            Assert.False(enumerator.MoveNext());
        }

        [Fact]
        public void AddClause()
        {
            KeyInfo keyInfo = new KeyInfo();
        }
    }
}

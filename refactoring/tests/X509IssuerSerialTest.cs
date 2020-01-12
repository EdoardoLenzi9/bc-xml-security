using Org.BouncyCastle.X509;
using Xunit;

namespace Org.BouncyCastle.X509
{
    public class X509IssuerSerialTest
    {
        [Fact]
        public void StructTest()
        {
            X509IssuerSerial x;
            x.IssuerName = "IssuerName";
            x.SerialNumber = "SerialNumber";
            Assert.Equal("IssuerName", x.IssuerName);
            Assert.Equal("SerialNumber", x.SerialNumber);
        }
    }
}

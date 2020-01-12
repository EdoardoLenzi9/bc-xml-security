using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Xml.RSAKey
{
    interface IKeyFormatter
    {

        byte[] CreateKeyExchange(byte[] rgbData);

    }
}

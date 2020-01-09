using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Xml.RSAKey
{
    interface IKeyDeformatter
    {
        byte[] DecryptKeyExchange(byte[] rgbData);
        void SetKey(RsaKeyParameters key);
    }
}

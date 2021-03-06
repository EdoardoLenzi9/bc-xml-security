using System;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.RSAKey;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyExchangeFormatter : IKeyFormatter
    {
        private RsaKeyParameters _rsaKey;
        RSAPadding _padding;

        public KeyExchangeFormatter(RsaKeyParameters key, RSAPadding padding)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));
            _padding = padding;
            _rsaKey = key;
        }

        public byte[] CreateKeyExchange(byte[] rgbData)
        {
            if (_rsaKey == null)
                throw new System.Security.Cryptography.CryptographicUnexpectedOperationException(SR.Cryptography_MissingKey);

            var rsa = CipherUtilities.GetCipher(Padding.Rsa[_padding]);
            rsa.Init(true, _rsaKey);

            return rsa.DoFinal(rgbData);
        }
    }
}

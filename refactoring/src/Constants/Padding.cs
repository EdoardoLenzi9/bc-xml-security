using System.Collections.Generic;

namespace Org.BouncyCastle.Crypto.Xml
{
    public enum RSAPadding
    {
        PKCS1,
        OAEP

    }

    public class Padding
    {
        public static Dictionary<RSAPadding, string> Rsa = new Dictionary<RSAPadding, string>()
        {
            {RSAPadding.OAEP, "RSA//OAEPPADDING"},
            {RSAPadding.PKCS1, "RSA//PKCS1PADDING"}
        };
    }
}
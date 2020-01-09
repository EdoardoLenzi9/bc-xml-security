using System.Collections.Generic;

namespace Org.BouncyCastle.Crypto.Xml
{
    public enum RSAPadding
    {
        PKCS1,
        OAEP

    }

    public class Constants
    {
        public static Dictionary<RSAPadding, string> RsaPaddingDictionary = new Dictionary<RSAPadding, string>()
        {
            {RSAPadding.OAEP, "RSA//OAEPPADDING"},
            {RSAPadding.PKCS1, "RSA//PKCS1PADDING"}
        };
    }
}
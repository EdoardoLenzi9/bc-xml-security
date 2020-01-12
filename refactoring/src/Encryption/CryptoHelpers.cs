using Org.BouncyCastle.Crypto.Xml.Constants;
using System;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal static class CryptoHelpers
    {
        private static readonly char[] _invalidChars = new char[] { ',', '`', '[', '*', '&' };

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Security", "CA5350", Justification = "SHA1 needed for compat.")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Security", "CA5351", Justification = "HMACMD5 needed for compat.")]
        public static object CreateFromKnownName(string name)
        {
            if (XmlUri.Uri.ContainsKey(name)) {
                return XmlUri.Uri[name];
            }
            return null;
        }

        public static T CreateFromName<T>(string name) where T : class
        {
            if (name == null || name.IndexOfAny(_invalidChars) >= 0)
            {
                return null;
            }
            try
            {
                return CreateFromKnownName(name) as T;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}

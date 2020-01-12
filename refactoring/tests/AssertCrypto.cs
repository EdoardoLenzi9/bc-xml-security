













using System;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class AssertCrypto
    {


        public static void AssertEquals(string msg, byte[] array1, byte[] array2)
        {
            if ((array1 == null) && (array2 == null))
                return;
            Assert.NotNull(array1);
            Assert.NotNull(array2);

            bool a = (array1.Length == array2.Length);
            if (a)
            {
                for (int i = 0; i < array1.Length; i++)
                {
                    if (array1[i] != array2[i])
                    {
                        a = false;
                        break;
                    }
                }
            }
            msg += " -> Expected " + BitConverter.ToString(array1, 0);
            msg += " is different than " + BitConverter.ToString(array2, 0);
            Assert.True(a, msg);
        }

        private const string xmldsig = " xmlns=\"http://www.w3.org/2000/09/xmldsig#\"";


        public static void AssertXmlEquals(string msg, string expected, string actual)
        {
            expected = expected.Replace(xmldsig, string.Empty);
            actual = actual.Replace(xmldsig, string.Empty);
            Assert.Equal(expected, actual);
        }
    }
}

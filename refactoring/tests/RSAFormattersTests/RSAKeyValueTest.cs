












using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System;
using System.Linq;
using System.Xml;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class RSAKeyValueTest
    {
        [Fact]
        public void Ctor_Empty()
        {
            RsaKeyValue rsaKeyValue = new RsaKeyValue();
            Assert.NotNull(rsaKeyValue.GetKey());
        }

        [Fact]
        public void Ctor_Rsa()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();
            RsaKeyValue rsaKeyValue = new RsaKeyValue((RsaKeyParameters)pair.Public);
            Assert.Equal(pair.Public, rsaKeyValue.GetKey());
        }

        [Fact]
        public void Ctor_Rsa_Null()
        {
            RsaKeyValue rsaKeyValue = new RsaKeyValue(null);
            Assert.Null(rsaKeyValue.GetKey());
        }


        [Fact]
        public void GetXml()
        {
            RsaKeyValue rsa = new RsaKeyValue();
            XmlElement xmlkey = rsa.GetXml();


            const string schema = "http://www.w3.org/2000/09/xmldsig#";
            new[] { "Exponent", "Modulus" }
                .Select(elementName => Convert.FromBase64String(xmlkey.SelectSingleNode($"*[local-name()='RSAKeyValue' and namespace-uri()='{schema}']/*[local-name()='{elementName}' and namespace-uri()='{schema}']").InnerText))
                .ToArray();
        }

        [Fact]
        public void GetXml_SameRsa()
        {
            var keyGen = GeneratorUtilities.GetKeyPairGenerator("RSA");
            keyGen.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
            var pair = keyGen.GenerateKeyPair();
            RsaKeyValue rsaKeyValue1 = new RsaKeyValue((RsaKeyParameters)pair.Public);
            RsaKeyValue rsaKeyValue2 = new RsaKeyValue((RsaKeyParameters)pair.Public);
            Assert.Equal(rsaKeyValue1.GetXml(), rsaKeyValue2.GetXml());
        }

        [Fact]
        public void LoadXml_LoadXml_GetXml()
        {
            string rsaKey = "<KeyValue xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><RSAKeyValue><Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue></KeyValue>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(rsaKey);

            RsaKeyValue rsa1 = new RsaKeyValue();
            rsa1.LoadXml(doc.DocumentElement);

            string s = rsa1.GetXml().OuterXml;
            Assert.Equal(rsaKey, s);
        }

        [Fact]
        public void LoadXml_GetXml_With_NS_Prefix()
        {
            string rsaKeyWithPrefix = "<ds:KeyValue xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\"><ds:RSAKeyValue><ds:Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</ds:Modulus><ds:Exponent>AQAB</ds:Exponent></ds:RSAKeyValue></ds:KeyValue>";
            string rsaKeyWithoutPrefix = "<KeyValue xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><RSAKeyValue><Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue></KeyValue>";
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(rsaKeyWithPrefix);

            RsaKeyValue rsa1 = new RsaKeyValue();
            rsa1.LoadXml(doc.DocumentElement);

            string s = rsa1.GetXml().OuterXml;

            Assert.Equal(rsaKeyWithoutPrefix, s);
        }

        [Fact]
        public void LoadXml_Null()
        {
            RsaKeyValue rsa = new RsaKeyValue();
            Assert.Throws<ArgumentNullException>(() => rsa.LoadXml(null));
        }

        [Theory]
        [MemberData(nameof(LoadXml_InvalidXml_Source))]
        public void LoadXml_InvalidXml(string xml)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xml);

            RsaKeyValue rsa = new RsaKeyValue();




            try
            {
                rsa.LoadXml(xmlDocument.DocumentElement);
            }
            catch (System.Security.Cryptography.CryptographicException) { }
            catch (FormatException) { }
        }

        public static object[][] LoadXml_InvalidXml_Source()
        {
            return new object[][]
            {

                new [] { "<KeyValue/>" },
                new [] { "<KeyValue><RSAKeyValue/></KeyValue>" },
                new [] { "<RSAKeyValue/>" },
                new [] { "<KeyValue><RSAKeyValue></RSAKeyValue></KeyValue>" },
                new [] { "<KeyValue><RSAKeyValue><Exponent>AQAB</Exponent></RSAKeyValue></KeyValue>" },
                new [] { "<KeyValue><RSAKeyValue><Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus></RSAKeyValue></KeyValue>" },


                new [] { "<KeyValue><RSAKeyValue><Modulus>gZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus></RSAKeyValue></KeyValue>" },
                new [] { "<KeyValue><RSAKeyValue><Exponent>1AQAB</Exponent></RSAKeyValue></KeyValue>" },


                new [] { "<KeyValue><RSAKeyValue><Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue></KeyValue>" },
                new [] { "<KeyValue xlmns=\"http://randomnamespace.org\"><RSAKeyValue><Modulus>ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue></KeyValue>" },
            };
        }

        [Theory]
        [MemberData(nameof(LoadXml_ValidXml_Source))]
        public void LoadXml_ValidXml(string xml, byte[] expectedModulus, byte[] expectedExponent)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xml);

            RsaKeyValue rsa = new RsaKeyValue();
            rsa.LoadXml(xmlDocument.DocumentElement);

            Assert.Equal(expectedModulus, rsa.GetKey().Modulus.ToByteArrayUnsigned());
            Assert.Equal(expectedExponent, rsa.GetKey().Exponent.ToByteArrayUnsigned());
        }

        public static object[][] LoadXml_ValidXml_Source()
        {
            const string modulus1 =
                "ogZ1/O7iks9ncETqNxLDKoPvgrT4nFx1a3lOmpywEmgbc5+8vI5dSzReH4v0YrflY75rIJx13CYWMsaHfQ78GtXvaeshHlQ3lLTuSdYEJceKll/URlBoKQtOj5qYIVSFOIVGHv4Y/0lnLftOzIydem29KKH6lJQlJawBBssR12s=";
            const string modulus2 =
                "xA7SEU+e0yQH5rm9kbCDN9o3aPIo7HbP7tX6WOocLZAtNfyxSZDU16ksL6WjubafOqNEpcwR3RdFsT7bCqnXPBe5ELh5u4VEy19MzxkXRgrMvavzyBpVRgBUwUlV5foK5hhmbktQhyNdy/6LpQRhDUDsTvK+g9Ucj47es9AQJ3U=";
            const string exponent = "AQAB";

            return new []
            {
                new object[]
                {
                    $"<KeyValue xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><RSAKeyValue><Modulus>{modulus1}</Modulus><Exponent>{exponent}</Exponent></RSAKeyValue></KeyValue>",
                    Convert.FromBase64String(modulus1),
                    Convert.FromBase64String(exponent)
                },
                new object[]
                {
                    $"<KeyValue xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><ds:RSAKeyValue><ds:Modulus>{modulus2}</ds:Modulus><ds:Exponent>{exponent}</ds:Exponent></ds:RSAKeyValue></KeyValue>",
                    Convert.FromBase64String(modulus2),
                    Convert.FromBase64String(exponent)
                },
            };
        }
    }
}

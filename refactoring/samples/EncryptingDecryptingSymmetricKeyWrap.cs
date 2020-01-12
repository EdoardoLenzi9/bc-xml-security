using System;
using System.Xml;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Encryption;

namespace _SignedXml.Samples
{
    public class EncryptingDecryptingSymmetricKeyWrap
    {
        private static XmlDocument LoadXmlFromString(string xml)
        {
            var doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.LoadXml(xml);
            return doc;
        }

        private static void Encrypt(XmlDocument doc, string elementName, string encryptionElementID, ICipherParameters key, string keyName, Func<ICipherParameters> innerKeyFactory)
        {
            var elementToEncrypt = (XmlElement)doc.GetElementsByTagName(elementName)[0];

            ICipherParameters innerKey = innerKeyFactory();
            var encryptedKey = new EncryptedKey()
            {
                CipherData = new CipherData(XmlEncryption.EncryptKey(((KeyParameter)((ParametersWithIV)innerKey).Parameters).GetKey(), (KeyParameter)((ParametersWithIV)key).Parameters)),
                EncryptionMethod = new EncryptionMethod(EncryptingAndDecryptingSymmetric.GetEncryptionMethodName(key, keyWrap: true))
            };

            encryptedKey.AddReference(new DataReference()
            {
                Uri = "#" + encryptionElementID
            });

            var encryptedData = new EncryptedData()
            {
                Type = XmlNameSpace.Url[NS.XmlEncElementUrl],
                Id = encryptionElementID,

                EncryptionMethod = new EncryptionMethod(EncryptingAndDecryptingSymmetric.GetEncryptionMethodName(innerKey, keyWrap: false))
            };

            encryptedData.KeyInfo.AddClause(new KeyInfoEncryptedKey(encryptedKey));
            encryptedKey.KeyInfo.AddClause(new KeyInfoName()
            {
                Value = keyName
            });

            var encryptedXml = new XmlEncryption();
            encryptedData.CipherData.CipherValue = encryptedXml.EncryptData(elementToEncrypt, innerKey, false);

            XmlDecryption.ReplaceElement(elementToEncrypt, encryptedData, false);
        }

        public static void Decrypt(XmlDocument doc, ICipherParameters key, string keyName)
        {
            var encrypted = new XmlDecryption(doc);
            encrypted.AddKeyNameMapping(keyName, key);
            encrypted.DecryptDocument();
        }

        public void SymmetricKeyWrapEncryptionRoundtrip(Func<ICipherParameters> keyFactory, Func<ICipherParameters> innerKeyFactory)
        {
            const string exampleXmlRootElement = "example";
            const string exampleXml = @"<?xml version=""1.0""?>
<example>
<test>some text node</test>
</example>";
            const string keyName = "mytestkey";

            ICipherParameters key = keyFactory();
            XmlDocument xmlDocToEncrypt = LoadXmlFromString(exampleXml);
            Encrypt(xmlDocToEncrypt, exampleXmlRootElement, "EncryptedElement1", key, keyName, innerKeyFactory);

            Console.WriteLine("----------------------------------------------------------------");
            Console.WriteLine("Algorithm: {0}", EncryptingAndDecryptingSymmetric.GetEncryptionMethodName(key, keyWrap: true));
            Console.WriteLine("Encrypted document:");
            Console.WriteLine();
            Console.WriteLine(xmlDocToEncrypt.OuterXml);
            Console.WriteLine();

            XmlDocument xmlDocToDecrypt = LoadXmlFromString(xmlDocToEncrypt.OuterXml);
            Decrypt(xmlDocToDecrypt, key, keyName);

            Console.WriteLine("Decrypted document:");
            Console.WriteLine();
            Console.WriteLine(xmlDocToDecrypt.OuterXml);
            Console.WriteLine();
        }

        public void SymmetricKeyWrapEncryptionRoundtrip()
        {
            foreach (var factory in EncryptingAndDecryptingSymmetric.GetSymmetricAlgorithms(skipDes: true))
                foreach (var innerFactory in EncryptingAndDecryptingSymmetric.GetSymmetricAlgorithms(skipDes: true))
                    SymmetricKeyWrapEncryptionRoundtrip(factory, innerFactory);
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Xml;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Encryption;
using Org.BouncyCastle.Security;

namespace _SignedXml.Samples
{
    public class EncryptingAndDecryptingSymmetric
    {
        private static XmlDocument LoadXmlFromString(string xml)
        {
            var doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.LoadXml(xml);
            return doc;
        }

        private static void EncryptElement(XmlDocument doc, string elementName, ICipherParameters key)
        {
            var elementToEncrypt = (XmlElement)doc.GetElementsByTagName(elementName)[0];

            var encryptedXml = new XmlEncryption();
            var encryptedData = new EncryptedData()
            {
                Type = XmlNameSpace.Url[NS.XmlEncElementUrl],
                EncryptionMethod = new EncryptionMethod(GetEncryptionMethodName(key))
            };

            encryptedData.CipherData.CipherValue = encryptedXml.EncryptData(elementToEncrypt, key, false);

            XmlDecryption.ReplaceElement(elementToEncrypt, encryptedData, false);
        }

        private static void Decrypt(XmlDocument doc, ICipherParameters key)
        {
            var encryptedElement = (XmlElement)doc.GetElementsByTagName("EncryptedData")[0];

            var encryptedData = new EncryptedData();
            encryptedData.LoadXml(encryptedElement);

            var encryptedXml = new XmlDecryption();

            byte[] rgbOutput = encryptedXml.DecryptData(encryptedData, key);

            encryptedXml.ReplaceData(encryptedElement, rgbOutput);
        }

        private void SymmetricEncryptionRoundtrip(Func<ICipherParameters> algorithmFactory)
        {
            const string ExampleXmlRootElement = "example";
            const string ExampleXml = @"<?xml version=""1.0""?>
<example>
<test>some text node</test>
</example>";

            var alg = algorithmFactory();

            XmlDocument xmlDocToEncrypt = LoadXmlFromString(ExampleXml);
            EncryptElement(xmlDocToEncrypt, ExampleXmlRootElement, alg);

            Console.WriteLine("----------------------------------------------------------------");
            Console.WriteLine("Algorithm: {0}", GetEncryptionMethodName(alg));
            Console.WriteLine("Encrypted document:");
            Console.WriteLine();
            Console.WriteLine(xmlDocToEncrypt.OuterXml);
            Console.WriteLine();

            XmlDocument xmlDocToDecrypt = LoadXmlFromString(xmlDocToEncrypt.OuterXml);
            Decrypt(xmlDocToDecrypt, alg);

            Console.WriteLine("Decrypted document:");
            Console.WriteLine();
            Console.WriteLine(xmlDocToDecrypt.OuterXml);
            Console.WriteLine();
        }

        public void SymmetricEncryptionRoundtrip()
        {
            foreach (var factory in GetSymmetricAlgorithms())
                SymmetricEncryptionRoundtrip(factory);
        }

        private static readonly SecureRandom _random = new SecureRandom();

        internal static byte[] GenerateBlock(int sizeInBits)
        {
            var result = new byte[sizeInBits / 8];
            _random.NextBytes(result);
            return result;
        }

        internal static IEnumerable<Func<ICipherParameters>> GetSymmetricAlgorithms(bool skipDes = false)
        {
            ICipherParameters CreateDes()
            {
                var key = GenerateBlock(64);
                var iv = GenerateBlock(64);
                return new ParametersWithIV(new DesParameters(key), iv);
            }

            ICipherParameters CreateTripleDes()
            {
                var key = GenerateBlock(192);
                var iv = GenerateBlock(64);
                return new ParametersWithIV(new DesEdeParameters(key), iv);
            }

            ICipherParameters CreateAes(int size)
            {
                var key = GenerateBlock(size);
                var iv = GenerateBlock(128);
                return new ParametersWithIV(new KeyParameter(key), iv);
            }

            if (!skipDes)
                yield return () => CreateDes();
            yield return () => CreateTripleDes();
            yield return () => CreateAes(128);
            yield return () => CreateAes(192);
            yield return () => CreateAes(256);
        }

        internal static NS GetEncryptionMethodName(ICipherParameters param, bool keyWrap = false)
        {
            var iv = param as ParametersWithIV;
            var key = iv != null ? iv.Parameters as KeyParameter : param as KeyParameter;

            if (key is DesEdeParameters) {
                return keyWrap ? NS.XmlEncTripleDESKeyWrapUrl : NS.XmlEncTripleDESUrl;
            } else if (key is DesParameters) {
                return keyWrap ? NS.XmlEncTripleDESKeyWrapUrl : NS.XmlEncDESUrl;
            } else {
                switch (key.GetKey().Length * 8) {
                    case 128:
                        return keyWrap ? NS.XmlEncAES128KeyWrapUrl : NS.XmlEncAES128Url;
                    case 192:
                        return keyWrap ? NS.XmlEncAES192KeyWrapUrl : NS.XmlEncAES192Url;
                    case 256:
                        return keyWrap ? NS.XmlEncAES256KeyWrapUrl : NS.XmlEncAES256Url;
                }
            }

            throw new ArgumentException($"The specified algorithm `{key.GetType().FullName}` is not supported for XML Encryption.");
        }
    }
}

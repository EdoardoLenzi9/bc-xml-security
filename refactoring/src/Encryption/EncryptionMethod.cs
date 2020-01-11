// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Linq;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class EncryptionMethod
    {
        private XmlElement _cachedXml = null;
        private int _keySize = 0;
        private NS _algorithm;

        public EncryptionMethod()
        {
            _cachedXml = null;
        }

        public EncryptionMethod(NS algorithm)
        {
            _algorithm = algorithm;
            _cachedXml = null;
        }

        private bool CacheValid
        {
            get
            {
                return (_cachedXml != null);
            }
        }

        public int KeySize
        {
            get { return _keySize; }
            set
            {
                if (value <= 0)
                    throw new ArgumentOutOfRangeException(nameof(value), SR.Cryptography_Xml_InvalidKeySize);
                _keySize = value;
                _cachedXml = null;
            }
        }

        public NS KeyAlgorithm
        {
            get { return _algorithm; }
            set
            {
                _algorithm = value;
                _cachedXml = null;
            }
        }

        public XmlElement GetXml()
        {
            if (CacheValid) return (_cachedXml);

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            // Create the EncryptionMethod element
            XmlElement encryptionMethodElement = document.CreateElement("EncryptionMethod", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            if (!(_algorithm == NS.None))
                encryptionMethodElement.SetAttribute("Algorithm", XmlNameSpace.Url[_algorithm]);
            if (_keySize > 0)
            {
                // Construct a KeySize element
                XmlElement keySizeElement = document.CreateElement("KeySize", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                keySizeElement.AppendChild(document.CreateTextNode(_keySize.ToString(null, null)));
                encryptionMethodElement.AppendChild(keySizeElement);
            }
            return encryptionMethodElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);

            XmlElement encryptionMethodElement = value;

            var algorithmUrl = ElementUtils.GetAttribute(encryptionMethodElement, "Algorithm", NS.XmlEncNamespaceUrl);
            _algorithm = XmlNameSpace.Url.FirstOrDefault(x => x.Value == algorithmUrl).Key;

            XmlNode keySizeNode = value.SelectSingleNode("enc:KeySize", nsm);
            if (keySizeNode != null)
            {
                KeySize = Convert.ToInt32(ParserUtils.DiscardWhiteSpaces(keySizeNode.InnerText), null);
            }

            // Save away the cached value
            _cachedXml = value;
        }
    }
}

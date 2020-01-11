﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Xml.Constants;
using System;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class DsaKeyValue : KeyInfoClause
    {
        private DsaPublicKeyParameters _key;

        //
        // public constructors
        //

        public DsaKeyValue()
        {
            var pair = Utils.DSAGenerateKeyPair();
            _key = (DsaPublicKeyParameters)pair.Public;
        }

        public DsaKeyValue(DsaPublicKeyParameters key)
        {
            _key = key;
        }

        //
        // public properties
        //

        public DsaPublicKeyParameters GetKey()
        { return _key; }

        //
        // public properties
        //

        public void SetKey(DsaPublicKeyParameters value)
        { _key = value; }

        //
        // public methods
        //

        /// <summary>
        /// Create an XML representation.
        /// </summary>
        /// <remarks>
        /// Based upon https://www.w3.org/TR/xmldsig-core/#sec-DSAKeyValue. 
        /// </remarks>
        /// <returns>
        /// An <see cref="XmlElement"/> containing the XML representation.
        /// </returns>
        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        private const string KeyValueElementName = "KeyValue";
        private const string DSAKeyValueElementName = "DSAKeyValue";

        //Optional {P,Q}-Sequence
        private const string PElementName = "P";
        private const string QElementName = "Q";

        //Optional Members
        private const string GElementName = "G";
        private const string JElementName = "J";

        //Mandatory Members
        private const string YElementName = "Y";

        //Optional {Seed,PgenCounter}-Sequence
        private const string SeedElementName = "Seed";
        private const string PgenCounterElementName = "PgenCounter";

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement keyValueElement = xmlDocument.CreateElement(KeyValueElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            XmlElement dsaKeyValueElement = xmlDocument.CreateElement(DSAKeyValueElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlElement pElement = xmlDocument.CreateElement(PElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            pElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Parameters.P.ToByteArrayUnsigned())));
            dsaKeyValueElement.AppendChild(pElement);

            XmlElement qElement = xmlDocument.CreateElement(QElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            qElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Parameters.Q.ToByteArrayUnsigned())));
            dsaKeyValueElement.AppendChild(qElement);

            XmlElement gElement = xmlDocument.CreateElement(GElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            gElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Parameters.G.ToByteArrayUnsigned())));
            dsaKeyValueElement.AppendChild(gElement);

            XmlElement yElement = xmlDocument.CreateElement(YElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            yElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Y.ToByteArrayUnsigned())));
            dsaKeyValueElement.AppendChild(yElement);


            if (_key.Parameters.ValidationParameters != null)
            {  // note we assume counter is correct if Seed is present
                XmlElement seedElement = xmlDocument.CreateElement(SeedElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                seedElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_key.Parameters.ValidationParameters.GetSeed())));
                dsaKeyValueElement.AppendChild(seedElement);

                XmlElement counterElement = xmlDocument.CreateElement(PgenCounterElementName, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                counterElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(Utils.ConvertIntToByteArray(_key.Parameters.ValidationParameters.Counter))));
                dsaKeyValueElement.AppendChild(counterElement);
            }

            keyValueElement.AppendChild(dsaKeyValueElement);

            return keyValueElement;
        }

        /// <summary>
        /// Deserialize from the XML representation.
        /// </summary>
        /// <remarks>
        /// Based upon https://www.w3.org/TR/xmldsig-core/#sec-DSAKeyValue. 
        /// </remarks>
        /// <param name="value">
        /// An <see cref="XmlElement"/> containing the XML representation. This cannot be null.
        /// </param>
        /// <exception cref="ArgumentNullException">
        /// <paramref name="value"/> cannot be null.
        /// </exception>
        /// <exception cref="CryptographicException">
        /// The XML has the incorrect schema or the DSA parameters are invalid.
        /// </exception>
        public override void LoadXml(XmlElement value)
        {
            if (value == null)
            {
                throw new ArgumentNullException(nameof(value));
            }
            if (value.Name != KeyValueElementName
                || value.NamespaceURI != XmlNameSpace.Url[NS.XmlDsigNamespaceUrl])
            {
                throw new System.Security.Cryptography.CryptographicException($"Root element must be {KeyValueElementName} element in namepsace {NS.XmlDsigNamespaceUrl}");
            }

            const string xmlDsigNamespacePrefix = "dsig";
            XmlNamespaceManager xmlNamespaceManager = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            xmlNamespaceManager.AddNamespace(xmlDsigNamespacePrefix, XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlNode dsaKeyValueElement = value.SelectSingleNode($"{xmlDsigNamespacePrefix}:{DSAKeyValueElementName}", xmlNamespaceManager);
            if (dsaKeyValueElement == null)
            {
                throw new System.Security.Cryptography.CryptographicException($"{KeyValueElementName} must contain child element {DSAKeyValueElementName}");
            }

            XmlNode yNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{YElementName}", xmlNamespaceManager);
            if (yNode == null)
                throw new System.Security.Cryptography.CryptographicException($"{YElementName} is missing");

            XmlNode pNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{PElementName}", xmlNamespaceManager);
            XmlNode qNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{QElementName}", xmlNamespaceManager);

            if ((pNode == null && qNode != null) || (pNode != null && qNode == null))
                throw new System.Security.Cryptography.CryptographicException($"{PElementName} and {QElementName} can only occour in combination");


            XmlNode gNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{GElementName}", xmlNamespaceManager);
            _ = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{JElementName}", xmlNamespaceManager);

            XmlNode seedNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{SeedElementName}", xmlNamespaceManager);
            XmlNode pgenCounterNode = dsaKeyValueElement.SelectSingleNode($"{xmlDsigNamespacePrefix}:{PgenCounterElementName}", xmlNamespaceManager);
            if ((seedNode == null && pgenCounterNode != null) || (seedNode != null && pgenCounterNode == null))
                throw new System.Security.Cryptography.CryptographicException($"{SeedElementName} and {PgenCounterElementName} can only occur in combination");

            try
            {
                _key = new DsaPublicKeyParameters(new Math.BigInteger(1, Convert.FromBase64String(yNode.InnerText)),
                    new DsaParameters(
                        new Math.BigInteger(1, (pNode != null) ? Convert.FromBase64String(pNode.InnerText) : null),
                        new Math.BigInteger(1, (qNode != null) ? Convert.FromBase64String(qNode.InnerText) : null),
                        new Math.BigInteger(1, (gNode != null) ? Convert.FromBase64String(gNode.InnerText) : null),
                        new DsaValidationParameters(
                            (seedNode != null) ? Convert.FromBase64String(seedNode.InnerText) : null,
                            (pgenCounterNode != null) ? Utils.ConvertByteArrayToInt(Convert.FromBase64String(pgenCounterNode.InnerText)) : 0)));
            }
            catch (Exception ex)
            {
                throw new System.Security.Cryptography.CryptographicException($"An error occurred parsing the key components", ex);
            }
        }
    }
}
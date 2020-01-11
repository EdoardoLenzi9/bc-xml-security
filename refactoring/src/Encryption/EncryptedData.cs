// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class EncryptedData : EncryptedType
    {
        public override void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlNamespaceManager nsm = new XmlNamespaceManager(value.OwnerDocument.NameTable);
            nsm.AddNamespace("enc", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            Id = ElementUtils.GetAttribute(value, "Id", NS.XmlEncNamespaceUrl);
            Type = ElementUtils.GetAttribute(value, "Type", NS.XmlEncNamespaceUrl);
            MimeType = ElementUtils.GetAttribute(value, "MimeType", NS.XmlEncNamespaceUrl);
            Encoding = ElementUtils.GetAttribute(value, "Encoding", NS.XmlEncNamespaceUrl);

            XmlNode encryptionMethodNode = value.SelectSingleNode("enc:EncryptionMethod", nsm);

            // EncryptionMethod
            EncryptionMethod = new EncryptionMethod();
            if (encryptionMethodNode != null)
                EncryptionMethod.LoadXml(encryptionMethodNode as XmlElement);

            // Key Info
            KeyInfo = new KeyInfo();
            XmlNode keyInfoNode = value.SelectSingleNode("ds:KeyInfo", nsm);
            if (keyInfoNode != null)
                KeyInfo.LoadXml(keyInfoNode as XmlElement);

            // CipherData
            XmlNode cipherDataNode = value.SelectSingleNode("enc:CipherData", nsm);
            if (cipherDataNode == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingCipherData);

            CipherData = new CipherData();
            CipherData.LoadXml(cipherDataNode as XmlElement);

            // EncryptionProperties
            XmlNode encryptionPropertiesNode = value.SelectSingleNode("enc:EncryptionProperties", nsm);
            if (encryptionPropertiesNode != null)
            {
                // Select the EncryptionProperty elements inside the EncryptionProperties element
                XmlNodeList encryptionPropertyNodes = encryptionPropertiesNode.SelectNodes("enc:EncryptionProperty", nsm);
                if (encryptionPropertyNodes != null)
                {
                    foreach (XmlNode node in encryptionPropertyNodes)
                    {
                        EncryptionProperty ep = new EncryptionProperty();
                        ep.LoadXml(node as XmlElement);
                        EncryptionProperties.Add(ep);
                    }
                }
            }

            // Save away the cached value
            _cachedXml = value;
        }

        public override XmlElement GetXml()
        {
            if (CacheValid) return (_cachedXml);

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            // Create the EncryptedData element
            XmlElement encryptedDataElement = document.CreateElement("EncryptedData", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);

            // Deal with attributes
            if (!string.IsNullOrEmpty(Id))
                encryptedDataElement.SetAttribute("Id", Id);
            if (!string.IsNullOrEmpty(Type))
                encryptedDataElement.SetAttribute("Type", Type);
            if (!string.IsNullOrEmpty(MimeType))
                encryptedDataElement.SetAttribute("MimeType", MimeType);
            if (!string.IsNullOrEmpty(Encoding))
                encryptedDataElement.SetAttribute("Encoding", Encoding);

            // EncryptionMethod
            if (EncryptionMethod != null)
                encryptedDataElement.AppendChild(EncryptionMethod.GetXml(document));

            // KeyInfo
            if (KeyInfo.Count > 0)
                encryptedDataElement.AppendChild(KeyInfo.GetXml(document));

            // CipherData is required.
            if (CipherData == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingCipherData);
            encryptedDataElement.AppendChild(CipherData.GetXml(document));

            // EncryptionProperties
            if (EncryptionProperties.Count > 0)
            {
                XmlElement encryptionPropertiesElement = document.CreateElement("EncryptionProperties", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                for (int index = 0; index < EncryptionProperties.Count; index++)
                {
                    EncryptionProperty ep = EncryptionProperties.Item(index);
                    encryptionPropertiesElement.AppendChild(ep.GetXml(document));
                }
                encryptedDataElement.AppendChild(encryptionPropertiesElement);
            }
            return encryptedDataElement;
        }
    }
}

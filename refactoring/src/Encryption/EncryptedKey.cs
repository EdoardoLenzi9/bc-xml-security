using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class EncryptedKey : EncryptedType
    {
        private string _recipient;
        private string _carriedKeyName;
        private ReferenceList _referenceList;

        public EncryptedKey() { }

        public string Recipient
        {
            get
            {
                // an unspecified value for an XmlAttribute is string.Empty
                if (_recipient == null)
                    _recipient = string.Empty;
                return _recipient;
            }
            set
            {
                _recipient = value;
                _cachedXml = null;
            }
        }

        public string CarriedKeyName
        {
            get { return _carriedKeyName; }
            set
            {
                _carriedKeyName = value;
                _cachedXml = null;
            }
        }

        public ReferenceList ReferenceList
        {
            get
            {
                if (_referenceList == null)
                    _referenceList = new ReferenceList();
                return _referenceList;
            }
        }

        public void AddReference(DataReference dataReference)
        {
            ReferenceList.Add(dataReference);
        }

        public void AddReference(KeyReference keyReference)
        {
            ReferenceList.Add(keyReference);
        }

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
            Recipient = ElementUtils.GetAttribute(value, "Recipient", NS.XmlEncNamespaceUrl);

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

            // CarriedKeyName
            XmlNode carriedKeyNameNode = value.SelectSingleNode("enc:CarriedKeyName", nsm);
            if (carriedKeyNameNode != null)
            {
                CarriedKeyName = carriedKeyNameNode.InnerText;
            }

            // ReferenceList
            XmlNode referenceListNode = value.SelectSingleNode("enc:ReferenceList", nsm);
            if (referenceListNode != null)
            {
                // Select the DataReference elements inside the ReferenceList element
                XmlNodeList dataReferenceNodes = referenceListNode.SelectNodes("enc:DataReference", nsm);
                if (dataReferenceNodes != null)
                {
                    foreach (XmlNode node in dataReferenceNodes)
                    {
                        DataReference dr = new DataReference();
                        dr.LoadXml(node as XmlElement);
                        ReferenceList.Add(dr);
                    }
                }
                // Select the KeyReference elements inside the ReferenceList element
                XmlNodeList keyReferenceNodes = referenceListNode.SelectNodes("enc:KeyReference", nsm);
                if (keyReferenceNodes != null)
                {
                    foreach (XmlNode node in keyReferenceNodes)
                    {
                        KeyReference kr = new KeyReference();
                        kr.LoadXml(node as XmlElement);
                        ReferenceList.Add(kr);
                    }
                }
            }

            // Save away the cached value
            _cachedXml = value;
        }

        public override XmlElement GetXml()
        {
            if (CacheValid) return _cachedXml;

            XmlDocument document = new XmlDocument();
            document.PreserveWhitespace = true;
            return GetXml(document);
        }

        internal XmlElement GetXml(XmlDocument document)
        {
            // Create the EncryptedKey element
            XmlElement encryptedKeyElement = document.CreateElement("EncryptedKey", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);

            // Deal with attributes
            if (!string.IsNullOrEmpty(Id))
                encryptedKeyElement.SetAttribute("Id", Id);
            if (!string.IsNullOrEmpty(Type))
                encryptedKeyElement.SetAttribute("Type", Type);
            if (!string.IsNullOrEmpty(MimeType))
                encryptedKeyElement.SetAttribute("MimeType", MimeType);
            if (!string.IsNullOrEmpty(Encoding))
                encryptedKeyElement.SetAttribute("Encoding", Encoding);
            if (!string.IsNullOrEmpty(Recipient))
                encryptedKeyElement.SetAttribute("Recipient", Recipient);

            // EncryptionMethod
            if (EncryptionMethod != null)
                encryptedKeyElement.AppendChild(EncryptionMethod.GetXml(document));

            // KeyInfo
            if (KeyInfo.Count > 0)
                encryptedKeyElement.AppendChild(KeyInfo.GetXml(document));

            // CipherData
            if (CipherData == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_MissingCipherData);
            encryptedKeyElement.AppendChild(CipherData.GetXml(document));

            // EncryptionProperties
            if (EncryptionProperties.Count > 0)
            {
                XmlElement encryptionPropertiesElement = document.CreateElement("EncryptionProperties", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                for (int index = 0; index < EncryptionProperties.Count; index++)
                {
                    EncryptionProperty ep = EncryptionProperties.Item(index);
                    encryptionPropertiesElement.AppendChild(ep.GetXml(document));
                }
                encryptedKeyElement.AppendChild(encryptionPropertiesElement);
            }

            // ReferenceList
            if (ReferenceList.Count > 0)
            {
                XmlElement referenceListElement = document.CreateElement("ReferenceList", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                for (int index = 0; index < ReferenceList.Count; index++)
                {
                    referenceListElement.AppendChild(ReferenceList[index].GetXml(document));
                }
                encryptedKeyElement.AppendChild(referenceListElement);
            }

            // CarriedKeyName
            if (CarriedKeyName != null)
            {
                XmlElement carriedKeyNameElement = document.CreateElement("CarriedKeyName", XmlNameSpace.Url[NS.XmlEncNamespaceUrl]);
                XmlText carriedKeyNameText = document.CreateTextNode(CarriedKeyName);
                carriedKeyNameElement.AppendChild(carriedKeyNameText);
                encryptedKeyElement.AppendChild(carriedKeyNameElement);
            }

            return encryptedKeyElement;
        }
    }
}

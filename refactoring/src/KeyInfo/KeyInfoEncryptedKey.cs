﻿using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfoEncryptedKey : KeyInfoClause
    {
        private EncryptedKey _encryptedKey;

        public KeyInfoEncryptedKey() { }

        public KeyInfoEncryptedKey(EncryptedKey encryptedKey)
        {
            _encryptedKey = encryptedKey;
        }

        public EncryptedKey GetEncryptedKey()
        { return _encryptedKey; }

        public void SetEncryptedKey(EncryptedKey value)
        { _encryptedKey = value; }

        public override XmlElement GetXml()
        {
            if (_encryptedKey == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "KeyInfoEncryptedKey");
            return _encryptedKey.GetXml();
        }

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            if (_encryptedKey == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "KeyInfoEncryptedKey");
            return _encryptedKey.GetXml(xmlDocument);
        }

        public override void LoadXml(XmlElement element)
        {
            _encryptedKey = new EncryptedKey();
            _encryptedKey.LoadXml(element);
        }
    }
}

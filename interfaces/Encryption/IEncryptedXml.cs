// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text;
using System.Xml;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.X509;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedXml
    {
        Encoding Encoding { get; set; }
        string Mode { get; set; }
        string Padding { get; set; }
        string Recipient { get; set; }
        XmlResolver Resolver { get; set; }
        int XmlDSigSearchDepth { get; set; }

        void AddKeyNameMapping(string keyName, object keyObject);
        void ClearKeyNameMappings();
        byte[] DecryptData(EncryptedData encryptedData, ICipherParameters symmetricAlgorithm);
        void DecryptDocument();
        byte[] DecryptEncryptedKey(EncryptedKey encryptedKey, RsaKeyParameters privateKey = null);
        EncryptedData Encrypt(XmlElement inputElement, string keyName);
        EncryptedData Encrypt(XmlElement inputElement, X509Certificate certificate);
        byte[] EncryptData(byte[] plaintext, ICipherParameters symmetricAlgorithm);
        byte[] EncryptData(XmlElement inputElement, ICipherParameters symmetricAlgorithm, bool content);
        byte[] GetDecryptionIV(EncryptedData encryptedData, string symmetricAlgorithmUri);
        ICipherParameters GetDecryptionKey(EncryptedData encryptedData, string symmetricAlgorithmUri);
        XmlElement GetIdElement(XmlDocument document, string idValue);
        void ReplaceData(XmlElement inputElement, byte[] decryptedData);
    }
}
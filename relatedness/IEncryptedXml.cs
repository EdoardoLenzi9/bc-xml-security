// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; IEncryptedXml
using System.Xml; IEncryptedXml
using Org.BouncyCastle.Crypto.Parameters; IEncryptedXml
using Org.BouncyCastle.X509; IEncryptedXml

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedXml
    {
        Encoding Encoding { get; set; }; IEncryptedXml
        string Mode { get; set; }; IEncryptedXml
        string Padding { get; set; }; IEncryptedXml
        string Recipient { get; set; }; IEncryptedXml
        XmlResolver Resolver { get; set; }; IEncryptedXml
        int XmlDSigSearchDepth { get; set; }; IEncryptedXml

        void AddKeyNameMapping(string keyName, object keyObject); IEncryptedXml
        void ClearKeyNameMappings(); IEncryptedXml

        EncryptedData Encrypt(XmlElement inputElement, string keyName); IEncryptedXml
        EncryptedData Encrypt(XmlElement inputElement, X509Certificate certificate); IEncryptedXml
        byte[] EncryptData(byte[] plaintext, ICipherParameters symmetricAlgorithm); IEncryptedXml
        byte[] EncryptData(XmlElement inputElement, ICipherParameters symmetricAlgorithm, bool content); IEncryptedXml
        
        byte[] DecryptEncryptedKey(EncryptedKey encryptedKey, RsaKeyParameters privateKey = null); IEncryptedXml
        byte[] DecryptData(EncryptedData encryptedData, ICipherParameters symmetricAlgorithm); IEncryptedXml
        byte[] GetDecryptionIV(EncryptedData encryptedData, string symmetricAlgorithmUri); IEncryptedXml
        void DecryptDocument(); IEncryptedXml
        ICipherParameters GetDecryptionKey(EncryptedData encryptedData, string symmetricAlgorithmUri); IEncryptedXml
        XmlElement GetIdElement(XmlDocument document, string idValue); IEncryptedXml
        void ReplaceData(XmlElement inputElement, byte[] decryptedData); IEncryptedXml
        
    }
}
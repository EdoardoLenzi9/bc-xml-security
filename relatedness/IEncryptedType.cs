// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IEncryptedType

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedType
    {
        CipherData CipherData { get; set; }; IEncryptedType
        string Encoding { get; set; }; IEncryptedType
        EncryptionMethod EncryptionMethod { get; set; }; IEncryptedType
        EncryptionPropertyCollection EncryptionProperties { get; }; IEncryptedType
        string Id { get; set; }; IEncryptedType
        KeyInfo KeyInfo { get; set; }; IEncryptedType
        string MimeType { get; set; }; IEncryptedType
        string Type { get; set; }; IEncryptedType

        void AddProperty(EncryptionProperty ep); IEncryptedType
        XmlElement GetXml(); IEncryptedType
        void LoadXml(XmlElement value); IEncryptedType
    }
}
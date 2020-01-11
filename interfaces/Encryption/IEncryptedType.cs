// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedType
    {
        CipherData CipherData { get; set; }
        string Encoding { get; set; }
        EncryptionMethod EncryptionMethod { get; set; }
        EncryptionPropertyCollection EncryptionProperties { get; }
        string Id { get; set; }
        KeyInfo KeyInfo { get; set; }
        string MimeType { get; set; }
        string Type { get; set; }

        void AddProperty(EncryptionProperty ep);
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
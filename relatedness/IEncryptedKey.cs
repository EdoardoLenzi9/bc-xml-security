// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IEncryptedKey

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedKey
    {
        string CarriedKeyName { get; set; }; IEncryptedKey
        string Recipient { get; set; }; IEncryptedKey
        ReferenceList ReferenceList { get; }; IEncryptedKey

        void AddReference(DataReference dataReference); IEncryptedKey
        void AddReference(KeyReference keyReference); IEncryptedKey
        XmlElement GetXml(); IEncryptedKey
        void LoadXml(XmlElement value); IEncryptedKey
    }
}
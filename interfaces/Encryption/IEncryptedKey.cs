// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedKey
    {
        string CarriedKeyName { get; set; }
        string Recipient { get; set; }
        ReferenceList ReferenceList { get; }

        void AddReference(DataReference dataReference);
        void AddReference(KeyReference keyReference);
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
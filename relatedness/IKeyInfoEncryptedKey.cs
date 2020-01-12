// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IKeyInfoEncryptedKey

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfoEncryptedKey
    {
        EncryptedKey EncryptedKey { get; set; }; IKeyInfoEncryptedKey

        XmlElement GetXml(); IKeyInfoEncryptedKey
        void LoadXml(XmlElement value); IKeyInfoEncryptedKey
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IEncryptionProperty

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptionProperty
    {
        string Id { get; }; IEncryptionProperty
        XmlElement PropertyElement { get; set; }; IEncryptionProperty
        string Target { get; }; IEncryptionProperty

        XmlElement GetXml(); IEncryptionProperty
        void LoadXml(XmlElement value); IEncryptionProperty
    }
}
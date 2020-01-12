// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IEncryptionMethod

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptionMethod
    {
        string KeyAlgorithm { get; set; }; IEncryptionMethod
        int KeySize { get; set; }; IEncryptionMethod

        XmlElement GetXml(); IEncryptionMethod
        void LoadXml(XmlElement value); IEncryptionMethod
    }
}
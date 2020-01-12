// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IEncryptedReference

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptedReference
    {
        TransformChain TransformChain { get; set; }; IEncryptedReference
        string Uri { get; set; }; IEncryptedReference

        void AddTransform(Transform transform); IEncryptedReference
        XmlElement GetXml(); IEncryptedReference
        void LoadXml(XmlElement value); IEncryptedReference
    }
}
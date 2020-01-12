// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IReference

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReference
    {
        string DigestMethod { get; set; }; IReference
        byte[] DigestValue { get; set; }; IReference
        string Id { get; set; }; IReference
        TransformChain TransformChain { get; set; }; IReference
        string Type { get; set; }; IReference
        string Uri { get; set; }; IReference

        void AddTransform(Transform transform); IReference
        XmlElement GetXml(); IReference
        void LoadXml(XmlElement value); IReference
    }
}
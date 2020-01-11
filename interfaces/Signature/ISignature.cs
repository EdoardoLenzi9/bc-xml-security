// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignature
    {
        string Id { get; set; }
        KeyInfo KeyInfo { get; set; }
        IList ObjectList { get; set; }
        byte[] SignatureValue { get; set; }
        SignedInfo SignedInfo { get; set; }

        void AddObject(DataObject dataObject);
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
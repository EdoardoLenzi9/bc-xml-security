// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IKeyInfoRetrievalMethod

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfoRetrievalMethod
    {
        string Type { get; set; }; IKeyInfoRetrievalMethod
        string Uri { get; set; }; IKeyInfoRetrievalMethod

        XmlElement GetXml(); IKeyInfoRetrievalMethod
        void LoadXml(XmlElement value); IKeyInfoRetrievalMethod
    }
}
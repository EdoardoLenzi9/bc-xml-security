// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IDataObject
    {
        XmlNodeList Data { get; set; }
        string Encoding { get; set; }
        string Id { get; set; }
        string MimeType { get; set; }

        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IDataObject 

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IDataObject
    {
        XmlNodeList Data { get; set; }; IDataObject 
        string Encoding { get; set; }; IDataObject 
        string Id { get; set; }; IDataObject 
        string MimeType { get; set; }; IDataObject 

        XmlElement GetXml(); IDataObject 
        void LoadXml(XmlElement value); IDataObject 
    }
}
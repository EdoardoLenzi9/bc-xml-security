﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IKeyInfoName

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfoName
    {
        string Value { get; set; }; IKeyInfoName

        XmlElement GetXml(); IKeyInfoName
        void LoadXml(XmlElement value); IKeyInfoName
    }
}
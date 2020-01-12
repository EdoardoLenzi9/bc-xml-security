// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; IKeyInfo
using System.Collections; IKeyInfo
using System.Xml; IKeyInfo

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfo
    {
        int Count { get; }; IKeyInfo
        string Id { get; set; }; IKeyInfo

        void AddClause(KeyInfoClause clause); IKeyInfo
        IEnumerator GetEnumerator(); IKeyInfo
        IEnumerator GetEnumerator(Type requestedObjectType); IKeyInfo
        XmlElement GetXml(); IKeyInfo
        void LoadXml(XmlElement value); IKeyInfo
    }
}
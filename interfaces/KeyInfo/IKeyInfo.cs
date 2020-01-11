// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Collections;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfo
    {
        int Count { get; }
        string Id { get; set; }

        void AddClause(KeyInfoClause clause);
        IEnumerator GetEnumerator();
        IEnumerator GetEnumerator(Type requestedObjectType);
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
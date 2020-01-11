// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Collections;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignedInfo
    {
        string CanonicalizationMethod { get; set; }
        Transform CanonicalizationMethodObject { get; }
        int Count { get; }
        string Id { get; set; }
        bool IsReadOnly { get; }
        bool IsSynchronized { get; }
        ArrayList References { get; }
        string SignatureLength { get; set; }
        string SignatureMethod { get; set; }
        object SyncRoot { get; }

        void AddReference(Reference reference);
        void CopyTo(Array array, int index);
        IEnumerator GetEnumerator();
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
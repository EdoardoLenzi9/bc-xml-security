// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; ISignedInfo
using System.Collections; ISignedInfo
using System.Xml; ISignedInfo

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignedInfo
    {
        string CanonicalizationMethod { get; set; }; ISignedInfo
        Transform CanonicalizationMethodObject { get; }; ISignedInfo
        int Count { get; }; ISignedInfo
        string Id { get; set; }; ISignedInfo
        bool IsReadOnly { get; }; ISignedInfo
        bool IsSynchronized { get; }; ISignedInfo
        ArrayList References { get; }; ISignedInfo
        string SignatureLength { get; set; }; ISignedInfo
        string SignatureMethod { get; set; }; ISignedInfo
        object SyncRoot { get; }; ISignedInfo

        void AddReference(Reference reference); ISignedInfo
        void CopyTo(Array array, int index); ISignedInfo
        IEnumerator GetEnumerator(); ISignedInfo
        XmlElement GetXml(); ISignedInfo
        void LoadXml(XmlElement value); ISignedInfo
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Collections;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlNodeList
    {
        int Count { get; }
        bool IsFixedSize { get; }
        bool IsReadOnly { get; }
        bool IsSynchronized { get; }
        object SyncRoot { get; }

        int Add(object value);
        void Clear();
        bool Contains(object value);
        void CopyTo(Array array, int index);
        IEnumerator GetEnumerator();
        int IndexOf(object value);
        void Insert(int index, object value);
        XmlNode Item(int index);
        void Remove(object value);
        void RemoveAt(int index);
    }
}
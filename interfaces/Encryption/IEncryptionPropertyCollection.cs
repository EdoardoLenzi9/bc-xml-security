// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptionPropertyCollection
    {
        EncryptionProperty this[int index] { get; set; }

        int Count { get; }
        bool IsFixedSize { get; }
        bool IsReadOnly { get; }
        bool IsSynchronized { get; }
        object SyncRoot { get; }

        int Add(EncryptionProperty value);
        void Clear();
        bool Contains(EncryptionProperty value);
        void CopyTo(Array array, int index);
        void CopyTo(EncryptionProperty[] array, int index);
        IEnumerator GetEnumerator();
        int IndexOf(EncryptionProperty value);
        void Insert(int index, EncryptionProperty value);
        EncryptionProperty Item(int index);
        void Remove(EncryptionProperty value);
        void RemoveAt(int index);
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; IEncryptionPropertyCollection
using System.Collections; IEncryptionPropertyCollection

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IEncryptionPropertyCollection
    {
        EncryptionProperty this[int index] { get; set; }; IEncryptionPropertyCollection

        int Count { get; }; IEncryptionPropertyCollection
        bool IsFixedSize { get; }; IEncryptionPropertyCollection
        bool IsReadOnly { get; }; IEncryptionPropertyCollection
        bool IsSynchronized { get; }; IEncryptionPropertyCollection
        object SyncRoot { get; }; IEncryptionPropertyCollection

        int Add(EncryptionProperty value); IEncryptionPropertyCollection
        void Clear(); IEncryptionPropertyCollection
        bool Contains(EncryptionProperty value); IEncryptionPropertyCollection
        void CopyTo(Array array, int index); IEncryptionPropertyCollection
        void CopyTo(EncryptionProperty[] array, int index); IEncryptionPropertyCollection
        IEnumerator GetEnumerator(); IEncryptionPropertyCollection
        int IndexOf(EncryptionProperty value); IEncryptionPropertyCollection
        void Insert(int index, EncryptionProperty value); IEncryptionPropertyCollection
        EncryptionProperty Item(int index); IEncryptionPropertyCollection
        void Remove(EncryptionProperty value); IEncryptionPropertyCollection
        void RemoveAt(int index); IEncryptionPropertyCollection
    }
}
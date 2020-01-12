// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; IReferenceList
using System.Collections; IReferenceList

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReferenceList
    {
        EncryptedReference this[int index] { get; set; }; IReferenceList

        int Count { get; }; IReferenceList
        bool IsSynchronized { get; }; IReferenceList
        object SyncRoot { get; }; IReferenceList

        int Add(object value); IReferenceList
        void Clear(); IReferenceList
        bool Contains(object value); IReferenceList
        void CopyTo(Array array, int index); IReferenceList
        IEnumerator GetEnumerator(); IReferenceList
        int IndexOf(object value); IReferenceList
        void Insert(int index, object value); IReferenceList
        EncryptedReference Item(int index); IReferenceList
        void Remove(object value); IReferenceList
        void RemoveAt(int index); IReferenceList
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; ICanonicalXmlNodeList 
using System.Collections; ICanonicalXmlNodeList 
using System.Xml; ICanonicalXmlNodeList 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlNodeList
    {
        int Count { get; }; ICanonicalXmlNodeList 
        bool IsFixedSize { get; }; ICanonicalXmlNodeList 
        bool IsReadOnly { get; }; ICanonicalXmlNodeList 
        bool IsSynchronized { get; }; ICanonicalXmlNodeList 
        object SyncRoot { get; }; ICanonicalXmlNodeList 

        int Add(object value); ICanonicalXmlNodeList 
        void Clear(); ICanonicalXmlNodeList 
        bool Contains(object value); ICanonicalXmlNodeList 
        void CopyTo(Array array, int index); ICanonicalXmlNodeList 
        IEnumerator GetEnumerator(); ICanonicalXmlNodeList 
        int IndexOf(object value); ICanonicalXmlNodeList 
        void Insert(int index, object value); ICanonicalXmlNodeList 
        XmlNode Item(int index); ICanonicalXmlNodeList 
        void Remove(object value); ICanonicalXmlNodeList 
        void RemoveAt(int index); ICanonicalXmlNodeList 
    }
}
// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlElement 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlElement
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlElement 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlElement 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlElement 
    }
}
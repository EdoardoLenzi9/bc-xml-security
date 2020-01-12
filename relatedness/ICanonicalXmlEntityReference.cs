// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlEntityReference 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlEntityReference
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlEntityReference 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlEntityReference 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlEntityReference 
    }
}
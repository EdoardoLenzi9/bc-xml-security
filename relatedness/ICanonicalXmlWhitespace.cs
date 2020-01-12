// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlWhitespace 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlWhitespace
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlWhitespace 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlWhitespace 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlWhitespace 
    }
}
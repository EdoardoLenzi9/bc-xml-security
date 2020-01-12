// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlSignificantWhitespace 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlSignificantWhitespace
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlSignificantWhitespace 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlSignificantWhitespace 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlSignificantWhitespace 
    }
}
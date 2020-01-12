// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlComment 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlComment
    {
        bool IncludeComments { get; }; ICanonicalXmlComment 
        bool IsInNodeSet { get; set; }; ICanonicalXmlComment 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlComment 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlComment 
    }
}
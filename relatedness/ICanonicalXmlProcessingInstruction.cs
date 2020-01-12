// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlProcessingInstruction 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlProcessingInstruction
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlProcessingInstruction 

        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlProcessingInstruction 
        void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlProcessingInstruction 
    }
}
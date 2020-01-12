// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text; ICanonicalXmlDocument 
using System.Xml; ICanonicalXmlDocument 

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlDocument
    {
        bool IsInNodeSet { get; set; }; ICanonicalXmlDocument 

        XmlAttribute CreateAttribute(string prefix, string localName, string namespaceURI); ICanonicalXmlDocument 
        XmlCDataSection CreateCDataSection(string data); ICanonicalXmlDocument 
        XmlComment CreateComment(string data); ICanonicalXmlDocument 
        XmlElement CreateElement(string prefix, string localName, string namespaceURI); ICanonicalXmlDocument 
        XmlEntityReference CreateEntityReference(string name); ICanonicalXmlDocument 
        XmlProcessingInstruction CreateProcessingInstruction(string target, string data); ICanonicalXmlDocument 
        XmlSignificantWhitespace CreateSignificantWhitespace(string text); ICanonicalXmlDocument 
        XmlText CreateTextNode(string text); ICanonicalXmlDocument 
        XmlWhitespace CreateWhitespace(string prefix); ICanonicalXmlDocument 
        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlDocument 
        void WriteHash(IHash signer, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlDocument 
    }
}
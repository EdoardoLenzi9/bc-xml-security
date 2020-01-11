// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface ICanonicalXmlDocument
    {
        bool IsInNodeSet { get; set; }

        XmlAttribute CreateAttribute(string prefix, string localName, string namespaceURI);
        XmlCDataSection CreateCDataSection(string data);
        XmlComment CreateComment(string data);
        XmlElement CreateElement(string prefix, string localName, string namespaceURI);
        XmlEntityReference CreateEntityReference(string name);
        XmlProcessingInstruction CreateProcessingInstruction(string target, string data);
        XmlSignificantWhitespace CreateSignificantWhitespace(string text);
        XmlText CreateTextNode(string text);
        XmlWhitespace CreateWhitespace(string prefix);
        void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc);
        void WriteHash(IHash signer, DocPosition docPos, AncestralNamespaceContextManager anc);
    }
}
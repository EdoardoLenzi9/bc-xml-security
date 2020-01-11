// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml;
using System.Text;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlCDataSection
    internal class CanonicalXmlCDataSection : XmlCDataSection, ICanonicalizableNode
    {
        public CanonicalXmlCDataSection(string data, XmlDocument doc, bool defaultNodeSetInclusionState) : base(data, doc)
        {
            SetIsInNodeSet(defaultNodeSetInclusionState);
        }

        private bool isInNodeSet;

        public bool GetIsInNodeSet()
        {
            return isInNodeSet;
        }

        public void SetIsInNodeSet(bool value)
        {
            isInNodeSet = value;
        }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet())
                strBuilder.Append(ParserUtils.EscapeCData(Data));
        }

        public void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (GetIsInNodeSet())
            {
                UTF8Encoding utf8 = new UTF8Encoding(false);
                byte[] rgbData = utf8.GetBytes(ParserUtils.EscapeCData(Data));
                hash.BlockUpdate(rgbData, 0, rgbData.Length);
            }
        }
    }
}

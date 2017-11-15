﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Xml;
using System.IO;
using System.Text;
using System.Collections;
using System.Security.Cryptography;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the class that provides node subset state and canonicalization function to XmlText
    internal class CanonicalXmlText : XmlText, ICanonicalizableNode
    {
        private bool _isInNodeSet;

        public CanonicalXmlText(string strData, XmlDocument doc, bool defaultNodeSetInclusionState)
            : base(strData, doc)
        {
            _isInNodeSet = defaultNodeSetInclusionState;
        }

        public bool IsInNodeSet
        {
            get { return _isInNodeSet; }
            set { _isInNodeSet = value; }
        }

        public void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (IsInNodeSet)
                strBuilder.Append(Utils.EscapeTextData(Value));
        }

        public void WriteHash(HashAlgorithm hash, DocPosition docPos, AncestralNamespaceContextManager anc)
        {
            if (IsInNodeSet)
            {
                UTF8Encoding utf8 = new UTF8Encoding(false);
                byte[] rgbData = utf8.GetBytes(Utils.EscapeTextData(Value));
                hash.TransformBlock(rgbData, 0, rgbData.Length, rgbData, 0);
            }
        }
    }
}

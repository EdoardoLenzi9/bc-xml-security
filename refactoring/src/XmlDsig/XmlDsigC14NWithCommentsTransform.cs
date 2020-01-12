﻿



using System;
using System.Collections;
using System.IO;
using System.Runtime.InteropServices;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class XmlDsigC14NWithCommentsTransform : XmlDsigC14NTransform
    {
        public XmlDsigC14NWithCommentsTransform()
            : base(true)
        {
            Algorithm = NS.XmlDsigC14NWithCommentsTransformUrl;
        }
    }
}

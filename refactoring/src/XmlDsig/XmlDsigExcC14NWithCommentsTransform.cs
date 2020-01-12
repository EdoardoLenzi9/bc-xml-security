



using System;
using System.Collections;
using System.IO;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml
{




    public class XmlDsigExcC14NWithCommentsTransform : XmlDsigExcC14NTransform
    {
        public XmlDsigExcC14NWithCommentsTransform() : base(true)
        {
            Algorithm = NS.XmlDsigExcC14NWithCommentsTransformUrl;
        }

        public XmlDsigExcC14NWithCommentsTransform(string inclusiveNamespacesPrefixList) : base(true, inclusiveNamespacesPrefixList)
        {
            Algorithm = NS.XmlDsigExcC14NWithCommentsTransformUrl;
        }
    }
}

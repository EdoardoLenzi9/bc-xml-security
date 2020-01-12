



using Microsoft.Win32;
using System.Collections;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Security.Permissions;
using System.Text;
using System.Threading;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class MyXmlDocument : XmlDocument
    {
        protected override XmlAttribute CreateDefaultAttribute(string prefix, string localName, string namespaceURI)
        {
            return CreateAttribute(prefix, localName, namespaceURI);
        }
    }
}

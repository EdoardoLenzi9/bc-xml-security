using Microsoft.Win32;
using System;
using System.Collections;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal enum CertUsageType
    {
        Verification = 0,
        Decryption = 1
    }
}

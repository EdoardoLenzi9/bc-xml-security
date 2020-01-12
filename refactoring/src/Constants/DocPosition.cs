using System;

namespace Org.BouncyCastle.Crypto.Xml
{
    // the current rendering position in document
    internal enum DocPosition
    {
        BeforeRootElement,
        InRootElement,
        AfterRootElement
    }
}

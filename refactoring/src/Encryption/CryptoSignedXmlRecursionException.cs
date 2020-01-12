﻿using System;
using System.Runtime.Serialization;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{

    [Serializable]
    public class CryptoSignedXmlRecursionException : XmlException
    {
        public CryptoSignedXmlRecursionException() : base() { }
        public CryptoSignedXmlRecursionException(string message) : base(message) { }
        public CryptoSignedXmlRecursionException(string message, Exception inner) : base(message, inner) { }
        protected CryptoSignedXmlRecursionException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}

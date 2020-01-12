using System;
using Org.BouncyCastle.Crypto.Xml.Utils;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.IO;
using System.Text;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.RSAKey;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml.Encryption
{
    public class EncryptedXml
    {
        protected readonly XmlDocument _document;
        protected XmlResolver _xmlResolver;
        // hash table defining the key name mapping
        protected const int _capacity = 4; // 4 is a reasonable capacity for
                                         // the key name mapping hash table
        protected readonly Hashtable _keyNameMapping;
        protected string _padding;
        protected string _mode;
        protected Encoding _encoding;
        protected string _recipient;
        protected int _xmlDsigSearchDepthCounter = 0;
        protected int _xmlDsigSearchDepth;

        //
        // public constructors
        //
        public EncryptedXml() : this(new XmlDocument()) { }

        public EncryptedXml(XmlDocument document)
        {
            _document = document;
            _xmlResolver = null;
            // set the default padding to ISO-10126
            _padding = "ISO10126PADDING";
            // set the default cipher mode to CBC
            _mode = "CBC";
            // By default the encoding is going to be UTF8
            _encoding = Encoding.UTF8;
            _keyNameMapping = new Hashtable(_capacity);
            _xmlDsigSearchDepth = StreamUtils.XmlDsigSearchDepth;
        }

        /// <summary>
        /// This method validates the _xmlDsigSearchDepthCounter counter
        /// if the counter is over the limit defined by admin or developer.
        /// </summary>
        /// <returns>returns true if the limit has reached otherwise false</returns>
        protected bool IsOverXmlDsigRecursionLimit()
        {
            if (_xmlDsigSearchDepthCounter > GetXmlDSigSearchDepth())
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// Gets / Sets the max limit for recursive search of encryption key in signed XML
        /// </summary>
        public int GetXmlDSigSearchDepth()
        {
            return _xmlDsigSearchDepth;
        }

        /// <summary>
        /// Gets / Sets the max limit for recursive search of encryption key in signed XML
        /// </summary>
        public void SetXmlDSigSearchDepth(int value)
        {
            _xmlDsigSearchDepth = value;
        }

        // The resolver to use for external entities
        public XmlResolver GetResolver()
        { return _xmlResolver; }

        // The resolver to use for external entities
        public void SetResolver(XmlResolver value)
        { _xmlResolver = value; }

        // The resolver to use for external entities
        public XmlDocument GetDocument()
        { return _document; }

        // The padding to be used. XML Encryption uses ISO 10126
        // but it's nice to provide a way to extend this to include other forms of paddings
        public string GetPadding()
        { return _padding; }

        // The padding to be used. XML Encryption uses ISO 10126
        // but it's nice to provide a way to extend this to include other forms of paddings
        public void SetPadding(string value)
        { _padding = value; }

        // The cipher mode to be used. XML Encryption uses CBC padding
        // but it's nice to provide a way to extend this to include other cipher modes
        public string GetMode()
        { return _mode; }

        // The cipher mode to be used. XML Encryption uses CBC padding
        // but it's nice to provide a way to extend this to include other cipher modes
        public void SetMode(string value)
        { _mode = value; }

        // The encoding of the XML document
        public Encoding GetEncoding()
        { return _encoding; }

        // The encoding of the XML document
        public void SetEncoding(Encoding value)
        { _encoding = value; }

        // This is used to specify the EncryptedKey elements that should be considered
        // when an EncyptedData references an EncryptedKey using a CarriedKeyName and Recipient
        public string Recipient
        {
            get
            {
                // an unspecified value for an XmlAttribute is string.Empty
                if (_recipient == null)
                    _recipient = string.Empty;
                return _recipient;
            }
            set { _recipient = value; }
        }

        // defines a key name mapping. Default behaviour is to require the key object
        // to be an RSA key or a SymmetricAlgorithm
        public void AddKeyNameMapping(string keyName, object keyObject)
        {
            Validator.checkNull(keyName);
            Validator.checkNull(keyObject);
            if (!(keyObject is RsaKeyParameters) && !(keyObject is ICipherParameters))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_NotSupportedCryptographicTransform);

            _keyNameMapping.Add(keyName, keyObject);
        }
    }
}

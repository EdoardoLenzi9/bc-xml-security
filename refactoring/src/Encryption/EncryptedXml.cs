using Org.BouncyCastle.Crypto.Xml.Utils;
using Org.BouncyCastle.Crypto.Parameters;
using System.Collections;
using System.Text;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml.Encryption
{
    public class EncryptedXml
    {
        protected readonly XmlDocument _document;
        protected XmlResolver _xmlResolver;
        protected const int _capacity = 4; 
        protected readonly Hashtable _keyNameMapping;
        protected string _padding;
        protected string _mode;
        protected Encoding _encoding;
        protected string _recipient;
        protected int _xmlDsigSearchDepthCounter = 0;
        protected int _xmlDsigSearchDepth;

        public EncryptedXml() : this(new XmlDocument()) { }

        public EncryptedXml(XmlDocument document)
        {
            _document = document;
            _xmlResolver = null;
            _padding = "ISO10126PADDING";
            _mode = "CBC";
            _encoding = Encoding.UTF8;
            _keyNameMapping = new Hashtable(_capacity);
            _xmlDsigSearchDepth = StreamUtils.XmlDsigSearchDepth;
        }

        protected bool IsOverXmlDsigRecursionLimit()
        {
            if (_xmlDsigSearchDepthCounter > GetXmlDSigSearchDepth())
            {
                return true;
            }
            return false;
        }

        public int GetXmlDSigSearchDepth()
        {
            return _xmlDsigSearchDepth;
        }

        public void SetXmlDSigSearchDepth(int value)
        {
            _xmlDsigSearchDepth = value;
        }

        public XmlResolver GetResolver()
        { return _xmlResolver; }

        public void SetResolver(XmlResolver value)
        { _xmlResolver = value; }

        public XmlDocument GetDocument()
        { return _document; }

        public string GetPadding()
        { return _padding; }

        public void SetPadding(string value)
        { _padding = value; }

        public string GetMode()
        { return _mode; }

        public void SetMode(string value)
        { _mode = value; }

        public Encoding GetEncoding()
        { return _encoding; }

        public void SetEncoding(Encoding value)
        { _encoding = value; }
        public string Recipient
        {
            get
            {
                if (_recipient == null)
                    _recipient = string.Empty;
                return _recipient;
            }
            set { _recipient = value; }
        }

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

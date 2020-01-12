using System;
using Org.BouncyCastle.Crypto.Xml;

namespace Org.BouncyCastle.X509
{
    public struct X509IssuerSerial
    {
        private string _issuerName;
        private string _serialNumber;

        internal X509IssuerSerial(string issuerName, string serialNumber)
        {
            if (issuerName == null || issuerName.Length == 0)
                throw new ArgumentException(SR.Arg_EmptyOrNullString, "issuerName");
            if (serialNumber == null || serialNumber.Length == 0)
                throw new ArgumentException(SR.Arg_EmptyOrNullString, "serialNumber");
            _issuerName = issuerName;
            _serialNumber = serialNumber;
        }


        public string IssuerName
        {
            get
            {
                return _issuerName;
            }
            set
            {
                _issuerName = value;
            }
        }

        public string SerialNumber
        {
            get
            {
                return _serialNumber;
            }
            set
            {
                _serialNumber = value;
            }
        }
    }
}

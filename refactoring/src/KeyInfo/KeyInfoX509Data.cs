﻿using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.X509;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfoX509Data : KeyInfoClause
    {
        private ArrayList _certificates = null;
        private ArrayList _issuerSerials = null;
        private ArrayList _subjectKeyIds = null;
        private ArrayList _subjectNames = null;
        private byte[] _CRL = null;
        public KeyInfoX509Data() { }

        public KeyInfoX509Data(byte[] rgbCert)
        {
            if (rgbCert != null) {
                var parser = new X509CertificateParser();
                AddCertificate(parser.ReadCertificate(rgbCert));
            }
        }

        public KeyInfoX509Data(X509Certificate cert)
        {
            AddCertificate(CryptoUtils.CloneCertificate(cert));
        }

        public KeyInfoX509Data(X509Certificate cert, IEnumerable<X509Certificate> additional, X509IncludeOption includeOption)
        {
            if (cert == null)
                throw new ArgumentNullException(nameof(cert));

            X509Certificate certificate = CryptoUtils.CloneCertificate(cert);
            IList<X509Certificate> chain = null;
            switch (includeOption)
            {
                case X509IncludeOption.ExcludeRoot:
                    chain = CryptoUtils.BuildCertificateChain(cert, additional);

                    for (int index = 0; index < (CryptoUtils.IsSelfSigned(chain) ? 1 : chain.Count - 1); index++)
                    {
                        AddCertificate(chain[index]);
                    }
                    break;
                case X509IncludeOption.EndCertOnly:
                    AddCertificate(certificate);
                    break;
                case X509IncludeOption.WholeChain:
                    chain = CryptoUtils.BuildCertificateChain(cert, additional);

                    foreach (var element in chain)
                    {
                        AddCertificate(element);
                    }
                    break;
            }
        }

        public ArrayList Certificates
        {
            get { return _certificates; }
        }

        public void AddCertificate(X509Certificate certificate)
        {
            if (certificate == null)
                throw new ArgumentNullException(nameof(certificate));

            if (_certificates == null)
                _certificates = new ArrayList();

            X509Certificate x509 = certificate;
            _certificates.Add(x509);
        }

        public ArrayList SubjectKeyIds
        {
            get { return _subjectKeyIds; }
        }

        public void AddSubjectKeyId(byte[] subjectKeyId)
        {
            if (_subjectKeyIds == null)
                _subjectKeyIds = new ArrayList();
            _subjectKeyIds.Add(subjectKeyId);
        }

        public void AddSubjectKeyId(string subjectKeyId)
        {
            if (_subjectKeyIds == null)
                _subjectKeyIds = new ArrayList();
            _subjectKeyIds.Add(EncodingUtils.DecodeHexString(subjectKeyId));
        }

        public ArrayList SubjectNames
        {
            get { return _subjectNames; }
        }

        public void AddSubjectName(string subjectName)
        {
            if (_subjectNames == null)
                _subjectNames = new ArrayList();
            _subjectNames.Add(subjectName);
        }

        public ArrayList IssuerSerials
        {
            get { return _issuerSerials; }
        }

        public void AddIssuerSerial(string issuerName, string serialNumber)
        {
            if (string.IsNullOrEmpty(issuerName))
                throw new ArgumentException(SR.Arg_EmptyOrNullString, nameof(issuerName));

            if (string.IsNullOrEmpty(serialNumber))
                throw new ArgumentException(SR.Arg_EmptyOrNullString, nameof(serialNumber));

            BigInteger h;
            try
            {
                h = new BigInteger(serialNumber);
            }
            catch (Exception)
            {
                throw new ArgumentException(SR.Cryptography_Xml_InvalidX509IssuerSerialNumber, nameof(serialNumber));
            }

            if (_issuerSerials == null)
                _issuerSerials = new ArrayList();
            _issuerSerials.Add(CryptoUtils.CreateX509IssuerSerial(issuerName, h.ToString()));
        }

        internal void InternalAddIssuerSerial(string issuerName, string serialNumber)
        {
            if (_issuerSerials == null)
                _issuerSerials = new ArrayList();
            _issuerSerials.Add(CryptoUtils.CreateX509IssuerSerial(issuerName, serialNumber));
        }

        public byte[] GetCRL()
        { return _CRL; }

        public void SetCRL(byte[] value)
        { _CRL = value; }

        private void Clear()
        {
            _CRL = null;
            if (_subjectKeyIds != null) _subjectKeyIds.Clear();
            if (_subjectNames != null) _subjectNames.Clear();
            if (_issuerSerials != null) _issuerSerials.Clear();
            if (_certificates != null) _certificates.Clear();
        }

        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement x509DataElement = xmlDocument.CreateElement("X509Data", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            if (_issuerSerials != null)
            {
                foreach (X509IssuerSerial issuerSerial in _issuerSerials)
                {
                    XmlElement issuerSerialElement = xmlDocument.CreateElement("X509IssuerSerial", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    XmlElement issuerNameElement = xmlDocument.CreateElement("X509IssuerName", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    issuerNameElement.AppendChild(xmlDocument.CreateTextNode(issuerSerial.IssuerName));
                    issuerSerialElement.AppendChild(issuerNameElement);
                    XmlElement serialNumberElement = xmlDocument.CreateElement("X509SerialNumber", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    serialNumberElement.AppendChild(xmlDocument.CreateTextNode(issuerSerial.SerialNumber));
                    issuerSerialElement.AppendChild(serialNumberElement);
                    x509DataElement.AppendChild(issuerSerialElement);
                }
            }

            if (_subjectKeyIds != null)
            {
                foreach (byte[] subjectKeyId in _subjectKeyIds)
                {
                    XmlElement subjectKeyIdElement = xmlDocument.CreateElement("X509SKI", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    subjectKeyIdElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(subjectKeyId)));
                    x509DataElement.AppendChild(subjectKeyIdElement);
                }
            }

            if (_subjectNames != null)
            {
                foreach (string subjectName in _subjectNames)
                {
                    XmlElement subjectNameElement = xmlDocument.CreateElement("X509SubjectName", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    subjectNameElement.AppendChild(xmlDocument.CreateTextNode(subjectName));
                    x509DataElement.AppendChild(subjectNameElement);
                }
            }

            if (_certificates != null)
            {
                foreach (X509Certificate certificate in _certificates)
                {
                    XmlElement x509Element = xmlDocument.CreateElement("X509Certificate", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                    x509Element.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(certificate.GetEncoded())));
                    x509DataElement.AppendChild(x509Element);
                }
            }

            if (_CRL != null)
            {
                XmlElement crlElement = xmlDocument.CreateElement("X509CRL", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
                crlElement.AppendChild(xmlDocument.CreateTextNode(Convert.ToBase64String(_CRL)));
                x509DataElement.AppendChild(crlElement);
            }

            return x509DataElement;
        }

        public override void LoadXml(XmlElement element)
        {
            if (element == null)
                throw new ArgumentNullException(nameof(element));

            XmlNamespaceManager nsm = new XmlNamespaceManager(element.OwnerDocument.NameTable);
            nsm.AddNamespace("ds", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            XmlNodeList x509IssuerSerialNodes = element.SelectNodes("ds:X509IssuerSerial", nsm);
            XmlNodeList x509SKINodes = element.SelectNodes("ds:X509SKI", nsm);
            XmlNodeList x509SubjectNameNodes = element.SelectNodes("ds:X509SubjectName", nsm);
            XmlNodeList x509CertificateNodes = element.SelectNodes("ds:X509Certificate", nsm);
            XmlNodeList x509CRLNodes = element.SelectNodes("ds:X509CRL", nsm);

            if ((x509CRLNodes.Count == 0 && x509IssuerSerialNodes.Count == 0 && x509SKINodes.Count == 0
                    && x509SubjectNameNodes.Count == 0 && x509CertificateNodes.Count == 0)) // Bad X509Data tag, or Empty tag
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "X509Data");

            Clear();

            if (x509CRLNodes.Count != 0)
                _CRL = Convert.FromBase64String(ParserUtils.DiscardWhiteSpaces(x509CRLNodes.Item(0).InnerText));

            foreach (XmlNode issuerSerialNode in x509IssuerSerialNodes)
            {
                XmlNode x509IssuerNameNode = issuerSerialNode.SelectSingleNode("ds:X509IssuerName", nsm);
                XmlNode x509SerialNumberNode = issuerSerialNode.SelectSingleNode("ds:X509SerialNumber", nsm);
                if (x509IssuerNameNode == null || x509SerialNumberNode == null)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "IssuerSerial");
                InternalAddIssuerSerial(x509IssuerNameNode.InnerText.Trim(), x509SerialNumberNode.InnerText.Trim());
            }

            foreach (XmlNode node in x509SKINodes)
            {
                AddSubjectKeyId(Convert.FromBase64String(ParserUtils.DiscardWhiteSpaces(node.InnerText)));
            }

            foreach (XmlNode node in x509SubjectNameNodes)
            {
                AddSubjectName(node.InnerText.Trim());
            }

            var parser = new X509CertificateParser();
            foreach (XmlNode node in x509CertificateNodes)
            {
                var cert = Convert.FromBase64String(ParserUtils.DiscardWhiteSpaces(node.InnerText));
                AddCertificate(parser.ReadCertificate(cert));
            }
        }
    }
}

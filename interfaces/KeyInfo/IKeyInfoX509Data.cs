// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections;
using System.Xml;
using Org.BouncyCastle.X509;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfoX509Data
    {
        ArrayList Certificates { get; }
        byte[] CRL { get; set; }
        ArrayList IssuerSerials { get; }
        ArrayList SubjectKeyIds { get; }
        ArrayList SubjectNames { get; }

        void AddCertificate(X509Certificate certificate);
        void AddIssuerSerial(string issuerName, string serialNumber);
        void AddSubjectKeyId(byte[] subjectKeyId);
        void AddSubjectKeyId(string subjectKeyId);
        void AddSubjectName(string subjectName);
        XmlElement GetXml();
        void LoadXml(XmlElement element);
    }
}
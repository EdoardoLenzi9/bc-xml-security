// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections; IKeyInfoX509Data
using System.Xml; IKeyInfoX509Data
using Org.BouncyCastle.X509; IKeyInfoX509Data

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IKeyInfoX509Data
    {
        ArrayList Certificates { get; }; IKeyInfoX509Data
        byte[] CRL { get; set; }; IKeyInfoX509Data
        ArrayList IssuerSerials { get; }; IKeyInfoX509Data
        ArrayList SubjectKeyIds { get; }; IKeyInfoX509Data
        ArrayList SubjectNames { get; }; IKeyInfoX509Data

        void AddCertificate(X509Certificate certificate); IKeyInfoX509Data
        void AddIssuerSerial(string issuerName, string serialNumber); IKeyInfoX509Data
        void AddSubjectKeyId(byte[] subjectKeyId); IKeyInfoX509Data
        void AddSubjectKeyId(string subjectKeyId); IKeyInfoX509Data
        void AddSubjectName(string subjectName); IKeyInfoX509Data
        XmlElement GetXml(); IKeyInfoX509Data
        void LoadXml(XmlElement element); IKeyInfoX509Data
    }
}
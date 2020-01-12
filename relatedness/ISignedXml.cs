// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System; ISignedXml
using System.Collections; ISignedXml
using System.Collections.ObjectModel; ISignedXml
using System.Xml; ISignedXml
using Org.BouncyCastle.X509; ISignedXml

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignedXml
    {
        EncryptedXml EncryptedXml { get; set; }; ISignedXml
        bool IsCacheValid { get; set; }; ISignedXml
        KeyInfo KeyInfo { get; set; }; ISignedXml
        Collection<string> SafeCanonicalizationMethods { get; }; ISignedXml
        Signature Signature { get; }; ISignedXml
        Func<SignedXml, bool> SignatureFormatValidator { get; set; }; ISignedXml
        string SignatureLength { get; }; ISignedXml
        string SignatureMethod { get; }; ISignedXml
        byte[] SignatureValue { get; }; ISignedXml
        SignedInfo SignedInfo { get; }; ISignedXml
        AsymmetricKeyParameter SigningKey { get; set; }; ISignedXml
        string SigningKeyName { get; set; }; ISignedXml

        void AddObject(DataObject dataObject); ISignedXml
        void AddReference(Reference reference); ISignedXml
        bool CheckSignature(); ISignedXml
        bool CheckSignature(AsymmetricKeyParameter key); ISignedXml
        bool CheckSignature(IMac macAlg); ISignedXml
        bool CheckSignature(X509Certificate certificate, bool verifySignatureOnly); ISignedXml
        bool CheckSignatureReturningKey(out AsymmetricKeyParameter signingKey); ISignedXml
        void ComputeSignature(); ISignedXml
        void ComputeSignature(IMac macAlg); ISignedXml
        XmlElement GetIdElement(XmlDocument document, string idValue); ISignedXml
        int GetReferenceLevel(int index, ArrayList references); ISignedXml
        XmlElement GetXml(); ISignedXml
        void LoadXml(XmlElement value); ISignedXml
    }
}
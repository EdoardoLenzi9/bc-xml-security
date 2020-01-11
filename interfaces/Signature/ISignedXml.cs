// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Collections;
using System.Collections.ObjectModel;
using System.Xml;
using Org.BouncyCastle.X509;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignedXml
    {
        EncryptedXml EncryptedXml { get; set; }
        bool IsCacheValid { get; set; }
        KeyInfo KeyInfo { get; set; }
        Collection<string> SafeCanonicalizationMethods { get; }
        Signature Signature { get; }
        Func<SignedXml, bool> SignatureFormatValidator { get; set; }
        string SignatureLength { get; }
        string SignatureMethod { get; }
        byte[] SignatureValue { get; }
        SignedInfo SignedInfo { get; }
        AsymmetricKeyParameter SigningKey { get; set; }
        string SigningKeyName { get; set; }

        void AddObject(DataObject dataObject);
        void AddReference(Reference reference);
        bool CheckSignature();
        bool CheckSignature(AsymmetricKeyParameter key);
        bool CheckSignature(IMac macAlg);
        bool CheckSignature(X509Certificate certificate, bool verifySignatureOnly);
        bool CheckSignatureReturningKey(out AsymmetricKeyParameter signingKey);
        void ComputeSignature();
        void ComputeSignature(IMac macAlg);
        XmlElement GetIdElement(XmlDocument document, string idValue);
        int GetReferenceLevel(int index, ArrayList references);
        XmlElement GetXml();
        void LoadXml(XmlElement value);
    }
}
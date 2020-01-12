// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; ICipherData 

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ICipherData
    {
        CipherReference CipherReference { get; set; }; ICipherData 
        byte[] CipherValue { get; set; }; ICipherData 

        XmlElement GetXml(); ICipherData 
        void LoadXml(XmlElement value); ICipherData 
    }
}
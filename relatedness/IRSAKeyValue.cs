// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Xml; IRSAKeyValue
using Org.BouncyCastle.Crypto.Parameters; IRSAKeyValue

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IRSAKeyValue
    {
        RsaKeyParameters Key { get; set; }; IRSAKeyValue

        XmlElement GetXml(); IRSAKeyValue
        void LoadXml(XmlElement value); IRSAKeyValue
    }
}
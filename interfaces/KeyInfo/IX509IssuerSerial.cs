// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

namespace Org.BouncyCastle.X509
{
    public interface IX509IssuerSerial
    {
        string IssuerName { get; set; }
        string SerialNumber { get; set; }
    }
}
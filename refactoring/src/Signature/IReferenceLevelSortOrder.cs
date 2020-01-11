﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReferenceLevelSortOrder
    {
        ArrayList GetReferences();
        void SetReferences(ArrayList value);
        int Compare(object a, object b);
    }
}
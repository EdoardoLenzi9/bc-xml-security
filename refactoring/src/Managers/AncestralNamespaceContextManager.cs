// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal abstract class AncestralNamespaceContextManager
    {
        internal ArrayList _ancestorStack = new ArrayList();

        internal NamespaceFrame GetScopeAt(int i)
        {
            return (NamespaceFrame)_ancestorStack[i];
        }

        internal NamespaceFrame GetCurrentScope()
        {
            return GetScopeAt(_ancestorStack.Count - 1);
        }

        protected XmlAttribute GetNearestNamespaceWithMatchingPrefix(string nsPrefix, out int depth, bool isRender = true)
        {
            XmlAttribute attr = null;
            depth = -1;
            for (int i = _ancestorStack.Count - 1; i >= 0; i--)
            {
                var scope = GetScopeAt(i);
                attr = isRender
                    ? scope.GetRendered(nsPrefix)
                    : scope.GetUnrendered(nsPrefix);

                if (attr != null)
                {
                    depth = i;
                    return attr;
                }
            }
            return null;
        }

        internal void EnterElementContext()
        {
            _ancestorStack.Add(new NamespaceFrame());
        }

        internal void ExitElementContext()
        {
            _ancestorStack.RemoveAt(_ancestorStack.Count - 1);
        }

        internal abstract void TrackNamespaceNode(XmlAttribute attr, SortedList nsListToRender, Hashtable nsLocallyDeclared);
        internal abstract void TrackXmlNamespaceNode(XmlAttribute attr, SortedList nsListToRender, SortedList attrListToRender, Hashtable nsLocallyDeclared);
        internal abstract void GetNamespacesToRender(XmlElement element, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared);

        internal void LoadUnrenderedNamespaces(Hashtable nsLocallyDeclared)
        {
            object[] attrs = new object[nsLocallyDeclared.Count];
            nsLocallyDeclared.Values.CopyTo(attrs, 0);
            foreach (object attr in attrs)
            {
                AddUnrendered((XmlAttribute)attr);
            }
        }

        internal void LoadRenderedNamespaces(SortedList nsRenderedList)
        {
            foreach (object attr in nsRenderedList.GetKeyList())
            {
                AddRendered((XmlAttribute)attr);
            }
        }

        internal void AddRendered(XmlAttribute attr)
        {
            GetCurrentScope().AddRendered(attr);
        }

        internal void AddUnrendered(XmlAttribute attr)
        {
            GetCurrentScope().AddUnrendered(attr);
        }
    }
}

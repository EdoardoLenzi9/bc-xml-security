// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfoRetrievalMethod : KeyInfoClause
    {
        private string _uri;
        private string _type;

        //
        // public constructors
        //

        public KeyInfoRetrievalMethod() { }

        public KeyInfoRetrievalMethod(string strUri)
        {
            _uri = strUri;
        }

        public KeyInfoRetrievalMethod(string strUri, string typeName)
        {
            _uri = strUri;
            _type = typeName;
        }

        //
        // public properties
        //

        public string GetUri()
        { return _uri; }

        //
        // public properties
        //

        public void SetUri(string value)
        { _uri = value; }

        public string Type
        {
            get { return _type; }
            set { _type = value; }
        }

        public override XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        internal override XmlElement GetXml(XmlDocument xmlDocument)
        {
            // Create the actual element
            XmlElement retrievalMethodElement = xmlDocument.CreateElement("RetrievalMethod", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);

            if (!string.IsNullOrEmpty(_uri))
                retrievalMethodElement.SetAttribute("URI", _uri);
            if (!string.IsNullOrEmpty(_type))
                retrievalMethodElement.SetAttribute("Type", _type);

            return retrievalMethodElement;
        }

        public override void LoadXml(XmlElement element)
        {
            if (element == null)
                throw new ArgumentNullException(nameof(element));
            _uri = Utils.GetAttribute(element, "URI", NS.XmlDsigNamespaceUrl);
            _type = Utils.GetAttribute(element, "Type", NS.XmlDsigNamespaceUrl);
        }
    }
}

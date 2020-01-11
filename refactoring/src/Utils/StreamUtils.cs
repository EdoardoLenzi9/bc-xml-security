// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.IO;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class StreamUtils
    {
        // The maximum number of characters in an XML document (0 means no limit).
        internal const int MaxCharactersInDocument = 0;

        // The entity expansion limit. This is used to prevent entity expansion denial of service attacks.
        internal const long MaxCharactersFromEntities = (long)1e7;

        // The default XML Dsig recursion limit.
        // This should be within limits of real world scenarios.
        // Keeping this number low will preserve some stack space
        internal const int XmlDsigSearchDepth = 20;

        private StreamUtils() { }


        internal static XmlReader PreProcessStreamInput(Stream inputStream, XmlResolver xmlResolver, string baseUri)
        {
            XmlReaderSettings settings = GetSecureXmlReaderSettings(xmlResolver);
            XmlReader reader = XmlReader.Create(inputStream, settings, baseUri);
            return reader;
        }

        internal static XmlReaderSettings GetSecureXmlReaderSettings(XmlResolver xmlResolver)
        {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.XmlResolver = xmlResolver;
            settings.DtdProcessing = DtdProcessing.Parse;
            settings.MaxCharactersFromEntities = MaxCharactersFromEntities;
            settings.MaxCharactersInDocument = MaxCharactersInDocument;
            return settings;
        }

        internal static XmlDocument PreProcessDocumentInput(XmlDocument document, XmlResolver xmlResolver, string baseUri)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));

            MyXmlDocument doc = new MyXmlDocument();
            doc.PreserveWhitespace = document.PreserveWhitespace;

            // Normalize the document
            using (TextReader stringReader = new StringReader(document.OuterXml))
            {
                XmlReaderSettings settings = new XmlReaderSettings();
                settings.XmlResolver = xmlResolver;
                settings.DtdProcessing = DtdProcessing.Parse;
                settings.MaxCharactersFromEntities = MaxCharactersFromEntities;
                settings.MaxCharactersInDocument = MaxCharactersInDocument;
                XmlReader reader = XmlReader.Create(stringReader, settings, baseUri);
                doc.Load(reader);
            }
            return doc;
        }

        internal static XmlDocument PreProcessElementInput(XmlElement elem, XmlResolver xmlResolver, string baseUri)
        {
            if (elem == null)
                throw new ArgumentNullException(nameof(elem));

            MyXmlDocument doc = new MyXmlDocument();
            doc.PreserveWhitespace = true;
            // Normalize the document
            using (TextReader stringReader = new StringReader(elem.OuterXml))
            {
                XmlReaderSettings settings = new XmlReaderSettings();
                settings.XmlResolver = xmlResolver;
                settings.DtdProcessing = DtdProcessing.Parse;
                settings.MaxCharactersFromEntities = MaxCharactersFromEntities;
                settings.MaxCharactersInDocument = MaxCharactersInDocument;
                XmlReader reader = XmlReader.Create(stringReader, settings, baseUri);
                doc.Load(reader);
            }
            return doc;
        }

        internal static XmlDocument DiscardComments(XmlDocument document)
        {
            XmlNodeList nodeList = document.SelectNodes("//comment()");
            if (nodeList != null)
            {
                foreach (XmlNode node1 in nodeList)
                {
                    node1.ParentNode.RemoveChild(node1);
                }
            }
            return document;
        }







        // Writes one stream (starting from the current position) into
        // an output stream, connecting them up and reading until
        // hitting the end of the input stream.
        // returns the number of bytes copied
        internal static long Pump(Stream input, Stream output)
        {
            // Use MemoryStream's WriteTo(Stream) method if possible
            MemoryStream inputMS = input as MemoryStream;
            if (inputMS != null && inputMS.Position == 0)
            {
                inputMS.WriteTo(output);
                return inputMS.Length;
            }

            const int count = 4096;
            byte[] bytes = new byte[count];
            int numBytes;
            long totalBytes = 0;

            while ((numBytes = input.Read(bytes, 0, count)) > 0)
            {
                output.Write(bytes, 0, numBytes);
                totalBytes += numBytes;
            }

            return totalBytes;
        }





    }
}

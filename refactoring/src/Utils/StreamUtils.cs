using System;
using System.IO;
using System.Xml;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class StreamUtils
    {
        internal const int MaxCharactersInDocument = 0;
        internal const long MaxCharactersFromEntities = (long)1e7;
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


        internal static long Pump(Stream input, Stream output)
        {
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

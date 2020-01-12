

using System;
using System.Collections;
using System.IO;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class XmlDsigXsltTransform : Transform
    {
        private Type[] _inputTypes = { typeof(Stream), typeof(XmlDocument), typeof(XmlNodeList) };
        private Type[] _outputTypes = { typeof(Stream) };
        private XmlNodeList _xslNodes;
        private string _xslFragment;
        private Stream _inputStream;
        private bool _includeComments = false;

        public XmlDsigXsltTransform()
        {
            Algorithm = NS.XmlDsigXsltTransformUrl;
        }

        public XmlDsigXsltTransform(bool includeComments)
        {
            _includeComments = includeComments;
            Algorithm = NS.XmlDsigXsltTransformUrl;
        }

        public override Type[] InputTypes
        {
            get
            {
                return _inputTypes;
            }
        }

        public override Type[] OutputTypes
        {
            get
            {
                return _outputTypes;
            }
        }

        public override void LoadInnerXml(XmlNodeList nodeList)
        {
            if (nodeList == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
            XmlElement firstDataElement = null;
            int count = 0;
            foreach (XmlNode node in nodeList)
            {
                if (node is XmlWhitespace) continue;
                if (node is XmlElement)
                {
                    if (count != 0)
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
                    firstDataElement = node as XmlElement;
                    count++;
                    continue;
                }
                count++;
            }
            if (count != 1 || firstDataElement == null)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
            _xslNodes = nodeList;
            _xslFragment = firstDataElement.OuterXml.Trim(null);
        }

        protected override XmlNodeList GetInnerXml()
        {
            return _xslNodes;
        }

        public override void LoadInput(object obj)
        {
            if (_inputStream != null)
                _inputStream.Close();
            _inputStream = new MemoryStream();
            if (obj is Stream)
            {
                _inputStream = (Stream)obj;
            }
            else if (obj is XmlNodeList)
            {
                CanonicalXml xmlDoc = new CanonicalXml((XmlNodeList)obj, null, _includeComments);
                byte[] buffer = xmlDoc.GetBytes();
                if (buffer == null) return;
                _inputStream.Write(buffer, 0, buffer.Length);
                _inputStream.Flush();
                _inputStream.Position = 0;
            }
            else if (obj is XmlDocument)
            {
                CanonicalXml xmlDoc = new CanonicalXml((XmlDocument)obj, null, _includeComments);
                byte[] buffer = xmlDoc.GetBytes();
                if (buffer == null) return;
                _inputStream.Write(buffer, 0, buffer.Length);
                _inputStream.Flush();
                _inputStream.Position = 0;
            }
        }

        public override object GetOutput()
        {

            XslCompiledTransform xslt = new XslCompiledTransform();
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.XmlResolver = null;
            settings.MaxCharactersFromEntities = StreamUtils.MaxCharactersFromEntities;
            settings.MaxCharactersInDocument = StreamUtils.MaxCharactersInDocument;
            using (StringReader sr = new StringReader(_xslFragment))
            {
                XmlReader readerXsl = XmlReader.Create(sr, settings, (string)null);
                xslt.Load(readerXsl, XsltSettings.Default, null);

                XmlReader reader = XmlReader.Create(_inputStream, settings, BaseURI);
                XPathDocument inputData = new XPathDocument(reader, XmlSpace.Preserve);

                MemoryStream ms = new MemoryStream();
                XmlWriter writer = new XmlTextWriter(ms, null);

                xslt.Transform(inputData, null, writer);
                ms.Position = 0;
                return ms;
            }
        }

        public override object GetOutput(Type type)
        {
            if (type != typeof(Stream) && !type.IsSubclassOf(typeof(Stream)))
                throw new ArgumentException(SR.Cryptography_Xml_TransformIncorrectInputType, nameof(type));
            return (Stream)GetOutput();
        }
    }
}

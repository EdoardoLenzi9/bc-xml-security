﻿



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

namespace Org.BouncyCastle.Crypto.Xml
{
    public class XmlDsigC14NTransform : Transform
    {
        private Type[] _inputTypes = { typeof(Stream), typeof(XmlDocument), typeof(XmlNodeList) };
        private Type[] _outputTypes = { typeof(Stream) };
        private CanonicalXml _cXml;
        private bool _includeComments = false;

        public XmlDsigC14NTransform()
        {
            Algorithm = NS.XmlDsigC14NTransformUrl;
        }

        public XmlDsigC14NTransform(bool includeComments)
        {
            _includeComments = includeComments;
            Algorithm = (includeComments ? NS.XmlDsigC14NWithCommentsTransformUrl : NS.XmlDsigC14NTransformUrl);
        }

        public override Type[] InputTypes
        {
            get { return _inputTypes; }
        }

        public override Type[] OutputTypes
        {
            get { return _outputTypes; }
        }

        public override void LoadInnerXml(XmlNodeList nodeList)
        {
            if (nodeList != null && nodeList.Count > 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_UnknownTransform);
        }

        protected override XmlNodeList GetInnerXml()
        {
            return null;
        }

        public override void LoadInput(object obj)
        {
            XmlResolver resolver = (ResolverSet ? _xmlResolver : new XmlSecureResolver(new XmlUrlResolver(), BaseURI));
            if (obj is Stream)
            {
                _cXml = new CanonicalXml((Stream)obj, _includeComments, resolver, BaseURI);
                return;
            }
            if (obj is XmlDocument)
            {
                _cXml = new CanonicalXml((XmlDocument)obj, resolver, _includeComments);
                return;
            }
            if (obj is XmlNodeList)
            {
                _cXml = new CanonicalXml((XmlNodeList)obj, resolver, _includeComments);
            }
            else
            {
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(obj));
            }
        }

        public override object GetOutput()
        {
            return new MemoryStream(_cXml.GetBytes());
        }

        public override object GetOutput(Type type)
        {
            if (type != typeof(Stream) && !type.IsSubclassOf(typeof(Stream)))
                throw new ArgumentException(SR.Cryptography_Xml_TransformIncorrectInputType, nameof(type));
            return new MemoryStream(_cXml.GetBytes());
        }

        public override void GetDigestedOutput(IHash hash)
        {
            _cXml.GetDigestedBytes(hash);
        }
    }
}

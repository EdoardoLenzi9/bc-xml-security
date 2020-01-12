using System;
using System.Collections;
using System.Xml;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Org.BouncyCastle.Crypto.Xml.Utils;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class KeyInfo : IEnumerable
    {
        private string _id = null;
        private readonly ArrayList _keyInfoClauses;


        public KeyInfo()
        {
            _keyInfoClauses = new ArrayList();
        }

        public string GetId()
        { return _id; }


        public void SetId(string value)
        { _id = value; }

        public XmlElement GetXml()
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.PreserveWhitespace = true;
            return GetXml(xmlDocument);
        }

        internal XmlElement GetXml(XmlDocument xmlDocument)
        {
            XmlElement keyInfoElement = xmlDocument.CreateElement("KeyInfo", XmlNameSpace.Url[NS.XmlDsigNamespaceUrl]);
            if (!string.IsNullOrEmpty(_id))
            {
                keyInfoElement.SetAttribute("Id", _id);
            }

            for (int i = 0; i < _keyInfoClauses.Count; ++i)
            {
                XmlElement xmlElement = ((KeyInfoClause)_keyInfoClauses[i]).GetXml(xmlDocument);
                if (xmlElement != null)
                {
                    keyInfoElement.AppendChild(xmlElement);
                }
            }
            return keyInfoElement;
        }

        public void LoadXml(XmlElement value)
        {
            if (value == null)
                throw new ArgumentNullException(nameof(value));

            XmlElement keyInfoElement = value;
            _id = ElementUtils.GetAttribute(keyInfoElement, "Id", NS.XmlDsigNamespaceUrl);
            if (!ElementUtils.VerifyAttributes(keyInfoElement, "Id"))
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "KeyInfo");

            XmlNode child = keyInfoElement.FirstChild;
            while (child != null)
            {
                XmlElement elem = child as XmlElement;
                if (elem != null)
                {
                    string kicString = elem.NamespaceURI + " " + elem.LocalName;
                    if (kicString == "http://www.w3.org/2000/09/xmldsig# KeyValue")
                    {
                        if (!ElementUtils.VerifyAttributes(elem, (string[])null))
                        {
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidElement, "KeyInfo/KeyValue");
                        }
                        XmlNodeList nodeList2 = elem.ChildNodes;
                        foreach (XmlNode node2 in nodeList2)
                        {
                            XmlElement elem2 = node2 as XmlElement;
                            if (elem2 != null)
                            {
                                kicString += "/" + elem2.LocalName;
                                break;
                            }
                        }
                    }

                    KeyInfoClause keyInfoClause = CryptoHelpers.CreateFromName<KeyInfoClause>(kicString);
                    if (keyInfoClause == null)
                        keyInfoClause = new KeyInfoNode();

                    keyInfoClause.LoadXml(elem);
                    AddClause(keyInfoClause);
                }
                child = child.NextSibling;
            }
        }

        public int Count
        {
            get { return _keyInfoClauses.Count; }
        }

        public void AddClause(KeyInfoClause clause)
        {
            _keyInfoClauses.Add(clause);
        }

        public IEnumerator GetEnumerator()
        {
            return _keyInfoClauses.GetEnumerator();
        }

        public IEnumerator GetEnumerator(Type requestedObjectType)
        {
            ArrayList requestedList = new ArrayList();

            object tempObj;
            IEnumerator tempEnum = _keyInfoClauses.GetEnumerator();

            while (tempEnum.MoveNext())
            {
                tempObj = tempEnum.Current;
                if (requestedObjectType.Equals(tempObj.GetType()))
                    requestedList.Add(tempObj);
            }

            return requestedList.GetEnumerator();
        }
    }
}

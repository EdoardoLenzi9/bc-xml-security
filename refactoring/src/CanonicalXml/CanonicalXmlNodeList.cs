﻿using System;
using System.Xml;
using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal class CanonicalXmlNodeList : XmlNodeList, IList
    {
        private readonly ArrayList _nodeArray;

        internal CanonicalXmlNodeList()
        {
            _nodeArray = new ArrayList();
        }

        public override XmlNode Item(int index)
        {
            return (XmlNode)_nodeArray[index];
        }

        public override IEnumerator GetEnumerator()
        {
            return _nodeArray.GetEnumerator();
        }

        public override int Count
        {
            get { return _nodeArray.Count; }
        }

        public int Add(object value)
        {
            if (!(value is XmlNode))
            {
                ArgumentException argumentException = new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, "node");
                throw argumentException;
            }

            return _nodeArray.Add(value);
        }

        public void Clear()
        {
            _nodeArray.Clear();
        }

        public bool Contains(object value)
        {
            return _nodeArray.Contains(value);
        }

        public int IndexOf(object value)
        {
            return _nodeArray.IndexOf(value);
        }

        public void Insert(int index, object value)
        {
            if (!(value is XmlNode))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));
            _nodeArray.Insert(index, value);
        }

        public void Remove(object value)
        {
            _nodeArray.Remove(value);
        }

        public void RemoveAt(int index)
        {
            _nodeArray.RemoveAt(index);
        }

        public bool IsFixedSize
        {
            get { return _nodeArray.IsFixedSize; }
        }

        public bool IsReadOnly
        {
            get { return _nodeArray.IsReadOnly; }
        }

        object IList.this[int index]
        {
            get { return _nodeArray[index]; }
            set
            {
                if (!(value is XmlNode))
                    throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));
                _nodeArray[index] = value;
            }
        }

        public void CopyTo(Array array, int index)
        {
            _nodeArray.CopyTo(array, index);
        }

        public object SyncRoot
        {
            get { return _nodeArray.SyncRoot; }
        }

        public bool IsSynchronized
        {
            get { return _nodeArray.IsSynchronized; }
        }
    }
}

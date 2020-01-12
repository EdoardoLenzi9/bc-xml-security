﻿using System;
using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class EncryptionPropertyCollection : IList
    {
        private readonly ArrayList _props;

        public EncryptionPropertyCollection()
        {
            _props = new ArrayList();
        }

        public IEnumerator GetEnumerator()
        {
            return _props.GetEnumerator();
        }

        public int Count
        {
            get { return _props.Count; }
        }

        int IList.Add(object value)
        {
            if (!(value is EncryptionProperty))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

            return _props.Add(value);
        }

        public int Add(EncryptionProperty value)
        {
            return _props.Add(value);
        }

        public void Clear()
        {
            _props.Clear();
        }

        bool IList.Contains(object value)
        {
            if (!(value is EncryptionProperty))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

            return _props.Contains(value);
        }

        public bool Contains(EncryptionProperty value)
        {
            return _props.Contains(value);
        }

        int IList.IndexOf(object value)
        {
            if (!(value is EncryptionProperty))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

            return _props.IndexOf(value);
        }

        public int IndexOf(EncryptionProperty value)
        {
            return _props.IndexOf(value);
        }

        void IList.Insert(int index, object value)
        {
            if (!(value is EncryptionProperty))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

            _props.Insert(index, value);
        }

        public void Insert(int index, EncryptionProperty value)
        {
            _props.Insert(index, value);
        }

        void IList.Remove(object value)
        {
            if (!(value is EncryptionProperty))
                throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

            _props.Remove(value);
        }

        public void Remove(EncryptionProperty value)
        {
            _props.Remove(value);
        }

        public void RemoveAt(int index)
        {
            _props.RemoveAt(index);
        }

        public bool IsFixedSize
        {
            get { return _props.IsFixedSize; }
        }

        public bool IsReadOnly
        {
            get { return _props.IsReadOnly; }
        }

        public EncryptionProperty Item(int index)
        {
            return (EncryptionProperty)_props[index];
        }

        [System.Runtime.CompilerServices.IndexerName("ItemOf")]
        public EncryptionProperty this[int index]
        {
            get
            {
                return (EncryptionProperty)((IList)this)[index];
            }
            set
            {
                ((IList)this)[index] = value;
            }
        }

        object IList.this[int index]
        {
            get { return _props[index]; }
            set
            {
                if (!(value is EncryptionProperty))
                    throw new ArgumentException(SR.Cryptography_Xml_IncorrectObjectType, nameof(value));

                _props[index] = value;
            }
        }

        public void CopyTo(Array array, int index)
        {
            _props.CopyTo(array, index);
        }

        public void CopyTo(EncryptionProperty[] array, int index)
        {
            _props.CopyTo(array, index);
        }

        public object SyncRoot
        {
            get { return _props.SyncRoot; }
        }

        public bool IsSynchronized
        {
            get { return _props.IsSynchronized; }
        }
    }
}

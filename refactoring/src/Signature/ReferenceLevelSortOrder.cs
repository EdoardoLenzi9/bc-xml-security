using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class ReferenceLevelSortOrder : IComparer, IReferenceLevelSortOrder
    {
        SignedXml signedXml = new SignedXml();
        private ArrayList _references = null;
        public ReferenceLevelSortOrder() { }

        public ArrayList References
        {
            get { return _references; }
            set { _references = value; }
        }

        public int Compare(object a, object b)
        {
            Reference referenceA = a as Reference;
            Reference referenceB = b as Reference;

            // Get the indexes
            int iIndexA = 0;
            int iIndexB = 0;
            int i = 0;
            foreach (Reference reference in References)
            {
                if (reference == referenceA) iIndexA = i;
                if (reference == referenceB) iIndexB = i;
                i++;
            }

            int iLevelA = signedXml.GetReferenceLevel(iIndexA, References);
            int iLevelB = signedXml.GetReferenceLevel(iIndexB, References);
            return iLevelA.CompareTo(iLevelB);
        }
    }
}

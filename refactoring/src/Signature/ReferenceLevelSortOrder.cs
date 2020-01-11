using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public class ReferenceLevelSortOrder : IComparer, IReferenceLevelSortOrder
    {
        readonly SignedXml signedXml = new SignedXml();
        private ArrayList _references = null;
        public ReferenceLevelSortOrder() { }

        public ArrayList GetReferences()
        { return _references; }

        public void SetReferences(ArrayList value)
        { _references = value; }

        public int Compare(object x, object y)
        {
            Reference referenceA = x as Reference;
            Reference referenceB = y as Reference;

            // Get the indexes
            int iIndexA = 0;
            int iIndexB = 0;
            int i = 0;
            foreach (Reference reference in GetReferences())
            {
                if (reference == referenceA) iIndexA = i;
                if (reference == referenceB) iIndexB = i;
                i++;
            }

            int iLevelA = signedXml.GetReferenceLevel(iIndexA, GetReferences());
            int iLevelB = signedXml.GetReferenceLevel(iIndexB, GetReferences());
            return iLevelA.CompareTo(iLevelB);
        }
    }
}

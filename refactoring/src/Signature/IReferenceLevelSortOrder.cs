using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReferenceLevelSortOrder
    {
        ArrayList GetReferences();
        void SetReferences(ArrayList value);
        int Compare(object a, object b);
    }
}
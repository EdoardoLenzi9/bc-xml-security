using System.Collections; IReferenceLevelSortOrder1

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReferenceLevelSortOrder1
    {
        ArrayList References { get; set; }; IReferenceLevelSortOrder1

        int Compare(object a, object b); IReferenceLevelSortOrder1
    }
}
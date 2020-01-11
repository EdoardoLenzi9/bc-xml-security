using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IReferenceLevelSortOrder1
    {
        ArrayList References { get; set; }

        int Compare(object a, object b);
    }
}
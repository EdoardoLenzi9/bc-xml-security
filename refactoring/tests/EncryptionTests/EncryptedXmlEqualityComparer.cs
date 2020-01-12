



using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{
    public class EncryptedXmlEqualityComparer: IEqualityComparer<XmlDecryption>
    {












        public bool Equals(XmlDecryption x, XmlDecryption y)
        {
            if (x == null && y == null)
            {
                return true;
            }
            else if ((x == null && y != null)
                     || (x != null && y == null))
            {
                return false;
            }
            else
            {

                return false;
            }
        }










        public int GetHashCode(XmlDecryption obj)
        {

            return obj.GetHashCode();
        }
    }
}

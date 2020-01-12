using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class Validator
    {
        public  static void checkNull(object o)
        {
            if (o == null)
            {
                throw new ArgumentNullException(nameof(o));
            }
        }
    }
}

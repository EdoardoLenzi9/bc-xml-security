



using System.IO;

namespace Org.BouncyCastle.Crypto.Xml
{
    public interface IRelDecryptor
    {
        Stream Decrypt(EncryptionMethod encryptionMethod, KeyInfo keyInfo, Stream toDecrypt);
    }
}

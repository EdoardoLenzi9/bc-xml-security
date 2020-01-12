namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface IDsaDigestSigner2
    {
        byte[] GenerateSignature(); IDsaDigestSigner2 
        bool VerifySignature(byte[] signature); IDsaDigestSigner2 
    }
}
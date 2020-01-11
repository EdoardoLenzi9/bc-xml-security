namespace Org.BouncyCastle.Crypto.Xml
{
    internal interface IDsaDigestSigner2
    {
        byte[] GenerateSignature();
        bool VerifySignature(byte[] signature);
    }
}
namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignerHashWrapper
    {
        void BlockUpdate(byte[] input, int inOff, int length);
        int DoFinal(byte[] output, int outOff);
        int GetHashSize();
        void Reset();
    }
}
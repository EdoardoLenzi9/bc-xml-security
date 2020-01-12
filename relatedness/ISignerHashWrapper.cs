namespace Org.BouncyCastle.Crypto.Xml
{
    public interface ISignerHashWrapper
    {
        void BlockUpdate(byte[] input, int inOff, int length); ISignerHashWrapper
        int DoFinal(byte[] output, int outOff); ISignerHashWrapper
        int GetHashSize(); ISignerHashWrapper
        void Reset(); ISignerHashWrapper
    }
}
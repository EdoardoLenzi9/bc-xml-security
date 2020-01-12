namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class DataReference : EncryptedReference
    {
        public DataReference() : base()
        {
            ReferenceType = "DataReference";
        }

        public DataReference(string uri) : base(uri)
        {
            ReferenceType = "DataReference";
        }

        public DataReference(string uri, TransformChain transformChain) : base(uri, transformChain)
        {
            ReferenceType = "DataReference";
        }
    }
}

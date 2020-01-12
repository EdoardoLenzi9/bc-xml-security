namespace Org.BouncyCastle.Crypto.Xml
{
    public sealed class KeyReference : EncryptedReference
    {
        public KeyReference() : base()
        {
            ReferenceType = "KeyReference";
        }

        public KeyReference(string uri) : base(uri)
        {
            ReferenceType = "KeyReference";
        }

        public KeyReference(string uri, TransformChain transformChain) : base(uri, transformChain)
        {
            ReferenceType = "KeyReference";
        }
    }
}

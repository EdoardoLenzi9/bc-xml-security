
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{

    public class TransformFixture : IDisposable
    {

        public XmlTransform XmlTransformInstance; 

        public TransformFixture(XmlElement element){
            XmlTransformInstance = new XmlTransform(element);
        }

        public void Dispose(){
            XmlTransformInstance._baseUri = null;
            XmlTransformInstance._xmlResolver = null;
            XmlTransformInstance._bResolverSet = false;
            XmlTransformInstance._signedXml = null;
            XmlTransformInstance._reference = null;
            XmlTransformInstance._propagatedNamespaces = null;
            XmlTransformInstance._context = null;
            
            XmlTransformInstance = null;
        }
    }
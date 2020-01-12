



















using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Resolvers;
using Org.BouncyCastle.Crypto.Xml.Constants;
using Xunit;

namespace Org.BouncyCastle.Crypto.Xml.Tests
{



    public class UnprotectedXmlDsigExcC14NTransform : XmlDsigExcC14NTransform
    {
        public UnprotectedXmlDsigExcC14NTransform()
        {
        }

        public UnprotectedXmlDsigExcC14NTransform(bool includeComments)
            : base(includeComments)
        {
        }

        public UnprotectedXmlDsigExcC14NTransform(string inclusiveNamespacesPrefixList)
            : base(inclusiveNamespacesPrefixList)
        {
        }

        public UnprotectedXmlDsigExcC14NTransform(bool includeComments, string inclusiveNamespacesPrefixList)
            : base(includeComments, inclusiveNamespacesPrefixList)
        {
        }

        public XmlNodeList UnprotectedGetInnerXml()
        {
            return base.GetInnerXml();
        }
    }

    public class XmlDsigExcC14NTransformTest
    {

        protected UnprotectedXmlDsigExcC14NTransform transform;

        public XmlDsigExcC14NTransformTest()
        {
            transform = new UnprotectedXmlDsigExcC14NTransform();
        }

        [Fact] // ctor ()
        public void Constructor1()
        {
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);
        }

        [Fact] // ctor (Boolean)
        public void Constructor2()
        {
            transform = new UnprotectedXmlDsigExcC14NTransform(true);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#WithComments", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(false);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);
        }

        [Fact] // ctor (String)
        public void Constructor3()
        {
            transform = new UnprotectedXmlDsigExcC14NTransform(null);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(string.Empty);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal(string.Empty, transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform("#default xsd");
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal("#default xsd", transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);
        }

        [Fact] // ctor (Boolean, String)
        public void Constructor4()
        {
            transform = new UnprotectedXmlDsigExcC14NTransform(true, null);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#WithComments", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(true, string.Empty);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#WithComments", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal(string.Empty, transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(true, "#default xsd");
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#WithComments", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal("#default xsd", transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(false, null);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Null(transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(false, string.Empty);
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal(string.Empty, transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);

            transform = new UnprotectedXmlDsigExcC14NTransform(false, "#default xsd");
            Assert.Equal("http://www.w3.org/2001/10/xml-exc-c14n#", XmlNameSpace.Url[transform.Algorithm]);
            Assert.Equal("#default xsd", transform.InclusiveNamespacesPrefixList);
            CheckProperties(transform);
        }

        void CheckProperties(XmlDsigExcC14NTransform transform)
        {
            Type[] input = transform.InputTypes;
            Assert.True((input.Length == 3), "Input #");

            bool istream = false;
            bool ixmldoc = false;
            bool ixmlnl = false;
            foreach (Type t in input)
            {
                if (t.ToString() == "System.IO.Stream")
                    istream = true;
                if (t.ToString() == "System.Xml.XmlDocument")
                    ixmldoc = true;
                if (t.ToString() == "System.Xml.XmlNodeList")
                    ixmlnl = true;
            }
            Assert.True(istream, "Input Stream");
            Assert.True(ixmldoc, "Input XmlDocument");
            Assert.True(ixmlnl, "Input XmlNodeList");

            Type[] output = transform.OutputTypes;
            Assert.True((output.Length == 1), "Output #");

            bool ostream = false;
            foreach (Type t in output)
            {
                if (t.ToString() == "System.IO.Stream")
                    ostream = true;
            }
            Assert.True(ostream, "Output Stream");
        }

        [Fact]
        public void Types()
        {
            Type[] input = transform.InputTypes;
            input[0] = null;
            input[1] = null;
            input[2] = null;

            foreach (Type t in transform.InputTypes)
            {
                Assert.Null(t);
            }

            XmlDsigExcC14NTransform t2 = new XmlDsigExcC14NTransform();
            foreach (Type t in t2.InputTypes)
            {
                Assert.NotNull(t);
            }
        }

        [Fact]
        public void GetInnerXml()
        {
            XmlNodeList xnl = transform.UnprotectedGetInnerXml();
            Assert.Null(xnl);
        }

        private string Stream2String(Stream s)
        {
            StringBuilder sb = new StringBuilder();
            int b = s.ReadByte();
            while (b != -1)
            {
                sb.Append(Convert.ToChar(b));
                b = s.ReadByte();
            }
            return sb.ToString();
        }

        static string xml = "<Test  attrib='at ' xmlns=\"http://www.go-mono.com/\" > \r\n &#xD; <Toto/> text &amp; </Test   >";

        static string c14xml2 = "<Test xmlns=\"http://www.go-mono.com/\" attrib=\"at \"> \n &#xD; <Toto></Toto> text &amp; </Test>";



        static string c14xml3 = "<Test xmlns=\"http://www.go-mono.com/\" attrib=\"at \"> &#xD;\n &#xD; <Toto></Toto> text &amp; </Test>";

        private XmlDocument GetDoc()
        {
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.LoadXml(xml);
            return doc;
        }

        [Fact]
        public void LoadInputAsXmlDocument()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal(c14xml3, output);
        }

        [Fact(Skip = "https://github.com/dotnet/corefx/issues/16685")]

        public void LoadInputAsXmlNodeList()
        {
            XmlDocument doc = GetDoc();

            transform.LoadInput(doc.ChildNodes);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal("<Test></Test>", output);
        }

        [Fact(Skip = "https://github.com/dotnet/corefx/issues/16685")]



        public void LoadInputAsXmlNodeList2()
        {
            XmlDocument doc = GetDoc();
            transform.LoadInput(doc.SelectNodes("//*"));
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            string expected = @"<Test><Toto></Toto></Test>";
            Assert.Equal(expected, output);
        }

        [Fact]
        public void LoadInputAsStream()
        {
            MemoryStream ms = new MemoryStream();
            byte[] x = Encoding.ASCII.GetBytes(xml);
            ms.Write(x, 0, x.Length);
            ms.Position = 0;
            transform.LoadInput(ms);
            Stream s = (Stream)transform.GetOutput();
            string output = Stream2String(s);
            Assert.Equal(c14xml2, output);
        }

        [Fact]
        public void LoadInputWithUnsupportedType()
        {
            byte[] bad = { 0xBA, 0xD };
            AssertExtensions.Throws<ArgumentException>("obj", () => transform.LoadInput(bad));
        }

        [Fact]
        public void UnsupportedOutput()
        {
            XmlDocument doc = new XmlDocument();
            AssertExtensions.Throws<ArgumentException>("type", () => transform.GetOutput(doc.GetType()));
        }

        [Fact]
        public void ExcC14NSpecExample1()
        {
            XmlPreloadedResolver resolver = new XmlPreloadedResolver();
            resolver.Add(TestHelpers.ToUri("doc.dtd"), "");
            string res = ExecuteXmlDSigExcC14NTransform(ExcC14NSpecExample1Input);
            Assert.Equal(ExcC14NSpecExample1Output, res);
        }

        [Fact]
        public void ExcC14NSpecExample2()
        {
            string res = ExecuteXmlDSigExcC14NTransform(ExcC14NSpecExample2Input);
            Assert.Equal(ExcC14NSpecExample2Output, res);
        }

        [Fact]
        public void ExcC14NSpecExample3()
        {
            string res = ExecuteXmlDSigExcC14NTransform(ExcC14NSpecExample3Input);
            Assert.Equal(ExcC14NSpecExample3Output, res);
        }

        [Fact]

        public void ExcC14NSpecExample4()
        {
            string res = ExecuteXmlDSigExcC14NTransform(ExcC14NSpecExample4Input);
            Assert.Equal(ExcC14NSpecExample4Output, res);
        }

        [Fact]
        public void ExcC14NSpecExample5()
        {
            XmlPreloadedResolver resolver = new XmlPreloadedResolver();
            resolver.Add(TestHelpers.ToUri("doc.txt"), "world");
            string input = ExcC14NSpecExample5Input;
            string res = ExecuteXmlDSigExcC14NTransform(input, resolver);
            Assert.Equal(ExcC14NSpecExample5Output, res);
        }

        [Fact]
        public void ExcC14NSpecExample6()
        {
            string res = ExecuteXmlDSigExcC14NTransform(ExcC14NSpecExample6Input);
            Assert.Equal(ExcC14NSpecExample6Output, res);
        }

        private string ExecuteXmlDSigExcC14NTransform(string InputXml, XmlResolver resolver = null)
        {
            XmlDocument doc = new XmlDocument();
            doc.XmlResolver = resolver;
            doc.PreserveWhitespace = true;
            doc.LoadXml(InputXml);




            UTF8Encoding utf8 = new UTF8Encoding();
            byte[] data = utf8.GetBytes(InputXml.ToString());
            Stream stream = new MemoryStream(data);
            var settings = new XmlReaderSettings
            {
                ValidationType = ValidationType.None,
                DtdProcessing = DtdProcessing.Parse,
                XmlResolver = resolver
            };
            using (XmlReader reader = XmlReader.Create(stream, settings))
            {
                doc.Load(reader);
                transform.LoadInput(doc);
                return Stream2String((Stream) transform.GetOutput());
            }
        }








        static string ExcC14NSpecExample1Input =
                "<?xml version=\"1.0\"?>\n" +
                "\n" +
                "<?xml-stylesheet   href=\"doc.xsl\"\n" +
                "   type=\"text/xsl\"   ?>\n" +
                "\n" +
                "<!DOCTYPE doc SYSTEM \"doc.dtd\">\n" +
                "\n" +
                "<doc>Hello, world!<!-- Comment 1 --></doc>\n" +
                "\n" +
                "<?pi-without-data     ?>\n\n" +
                "<!-- Comment 2 -->\n\n" +
                "<!-- Comment 3 -->\n";
        static string ExcC14NSpecExample1Output =
                "<?xml-stylesheet href=\"doc.xsl\"\n" +
                "   type=\"text/xsl\"   ?>\n" +
                "<doc>Hello, world!</doc>\n" +
                "<?pi-without-data?>";





        static string ExcC14NSpecExample2Input =
                "<doc>\n" +
                "  <clean>   </clean>\n" +
                "   <dirty>   A   B   </dirty>\n" +
                "   <mixed>\n" +
                "      A\n" +
                "      <clean>   </clean>\n" +
                "      B\n" +
                "      <dirty>   A   B   </dirty>\n" +
                "      C\n" +
                "   </mixed>\n" +
                "</doc>\n";
        static string ExcC14NSpecExample2Output =
                "<doc>\n" +
                "  <clean>   </clean>\n" +
                "   <dirty>   A   B   </dirty>\n" +
                "   <mixed>\n" +
                "      A\n" +
                "      <clean>   </clean>\n" +
                "      B\n" +
                "      <dirty>   A   B   </dirty>\n" +
                "      C\n" +
                "   </mixed>\n" +
                "</doc>";





        static string ExcC14NSpecExample3Input =
                "<!DOCTYPE doc [<!ATTLIST e9 attr CDATA \"default\">]>\n" +
                "<doc>\n" +
                "   <e1   />\n" +
                "   <e2   ></e2>\n" +
                "   <e3    name = \"elem3\"   id=\"elem3\"    />\n" +
                "   <e4    name=\"elem4\"   id=\"elem4\"    ></e4>\n" +
                "   <e5 a:attr=\"out\" b:attr=\"sorted\" attr2=\"all\" attr=\"I\'m\"\n" +
                "       xmlns:b=\"http://www.ietf.org\" \n" +
                "       xmlns:a=\"http://www.w3.org\"\n" +
                "       xmlns=\"http://www.uvic.ca\"/>\n" +
                "   <e6 xmlns=\"\" xmlns:a=\"http://www.w3.org\">\n" +
                "       <e7 xmlns=\"http://www.ietf.org\">\n" +
                "           <e8 xmlns=\"\" xmlns:a=\"http://www.w3.org\">\n" +
                "               <e9 xmlns=\"\" xmlns:a=\"http://www.ietf.org\"/>\n" +
                "           </e8>\n" +
                "       </e7>\n" +
                "   </e6>\n" +
                "</doc>\n";
        static string ExcC14NSpecExample3Output =
                "<doc>\n" +
                "   <e1></e1>\n" +
                "   <e2></e2>\n" +
                "   <e3 id=\"elem3\" name=\"elem3\"></e3>\n" +
                "   <e4 id=\"elem4\" name=\"elem4\"></e4>\n" +
                "   <e5 xmlns=\"http://www.uvic.ca\" xmlns:a=\"http://www.w3.org\" xmlns:b=\"http://www.ietf.org\" attr=\"I\'m\" attr2=\"all\" b:attr=\"sorted\" a:attr=\"out\"></e5>\n" +
                    "   <e6>\n" +
                "       <e7 xmlns=\"http://www.ietf.org\">\n" +
                "           <e8 xmlns=\"\">\n" +
                "               <e9 attr=\"default\"></e9>\n" +

                "           </e8>\n" +
                "       </e7>\n" +
                "   </e6>\n" +
                "</doc>";












        static string ExcC14NSpecExample4Input =
                "<!DOCTYPE doc [<!ATTLIST normId id ID #IMPLIED>]>\n" +
                "<doc>\n" +
                "   <text>First line&#x0d;&#10;Second line</text>\n" +
                "   <value>&#x32;</value>\n" +
                "   <compute><![CDATA[value>\"0\" && value<\"10\" ?\"valid\":\"error\"]]></compute>\n" +
                "   <compute expr=\'value>\"0\" &amp;&amp; value&lt;\"10\" ?\"valid\":\"error\"\'>valid</compute>\n" +
                "   <norm attr=\' &apos;   &#x20;&#13;&#xa;&#9;   &apos; \'/>\n" +

                "</doc>\n";
        static string ExcC14NSpecExample4Output =
                "<doc>\n" +
                "   <text>First line&#xD;\n" +
                "Second line</text>\n" +
                "   <value>2</value>\n" +
                "   <compute>value&gt;\"0\" &amp;&amp; value&lt;\"10\" ?\"valid\":\"error\"</compute>\n" +
                "   <compute expr=\"value>&quot;0&quot; &amp;&amp; value&lt;&quot;10&quot; ?&quot;valid&quot;:&quot;error&quot;\">valid</compute>\n" +
                "   <norm attr=\" \'    &#xD;&#xA;&#x9;   \' \"></norm>\n" +

                "</doc>";





        static string ExcC14NSpecExample5Input =>
                "<!DOCTYPE doc [\n" +
                "<!ATTLIST doc attrExtEnt ENTITY #IMPLIED>\n" +
                "<!ENTITY ent1 \"Hello\">\n" +
                $"<!ENTITY ent2 SYSTEM \"doc.txt\">\n" +
                "<!ENTITY entExt SYSTEM \"earth.gif\" NDATA gif>\n" +
                "<!NOTATION gif SYSTEM \"viewgif.exe\">\n" +
                "]>\n" +
                "<doc attrExtEnt=\"entExt\">\n" +
                "   &ent1;, &ent2;!\n" +
                "</doc>\n" +
                "\n" +
                $"<!-- Let doc.txt contain \"world\" (excluding the quotes) -->\n";
        static string ExcC14NSpecExample5Output =
                "<doc attrExtEnt=\"entExt\">\n" +
                "   Hello, world!\n" +
                "</doc>";





        static string ExcC14NSpecExample6Input =
                    "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n" +
                    "<doc>&#169;</doc>\n";
        static string ExcC14NSpecExample6Output =
                "<doc>\xC2\xA9</doc>";

        [Fact]
        public void SimpleNamespacePrefixes()
        {
            string input = "<a:Action xmlns:a='urn:foo'>http://tempuri.org/IFoo/Echo</a:Action>";
            string expected = @"<a:Action xmlns:a=""urn:foo"">http://tempuri.org/IFoo/Echo</a:Action>";

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(input);
            XmlDsigExcC14NTransform t = new XmlDsigExcC14NTransform();
            t.LoadInput(doc);
            Stream s = t.GetOutput() as Stream;
            Assert.Equal(new StreamReader(s, Encoding.UTF8).ReadToEnd(), expected);
        }

        [Fact]
        public void GetDigestedOutput_Null()
        {
            Assert.Throws<NullReferenceException>(() => new XmlDsigExcC14NTransform().GetDigestedOutput(null));
        }
    }
}


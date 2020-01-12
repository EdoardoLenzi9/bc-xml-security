ArrayList Certificates { get; }; IKeyInfoX509Data
ArrayList IssuerSerials { get; }; IKeyInfoX509Data

ArrayList References { get; set; }; IReferenceLevelSortOrder1
ArrayList References { get; }; ISignedInfo

ArrayList SubjectKeyIds { get; }; IKeyInfoX509Data
ArrayList SubjectNames { get; }; IKeyInfoX509Data
AsymmetricKeyParameter SigningKey { get; set; }; ISignedXml
CipherData CipherData { get; set; }; IEncryptedType
CipherReference CipherReference { get; set; }; ICipherData 
Collection<string> SafeCanonicalizationMethods { get; }; ISignedXml
DsaPublicKeyParameters Key { get; set; }; IDSAKeyValue 
Encoding Encoding { get; set; }; IEncryptedXml
EncryptedData Encrypt(XmlElement inputElement, X509Certificate certificate); IEncryptedXml
EncryptedData Encrypt(XmlElement inputElement, string keyName); IEncryptedXml
EncryptedKey EncryptedKey { get; set; }; IKeyInfoEncryptedKey
EncryptedReference Item(int index); IReferenceList
EncryptedReference this[int index] { get; set; }; IReferenceList
EncryptedXml EncryptedXml { get; set; }; ISignedXml
EncryptionMethod EncryptionMethod { get; set; }; IEncryptedType
EncryptionProperty Item(int index); IEncryptionPropertyCollection
EncryptionProperty this[int index] { get; set; }; IEncryptionPropertyCollection
EncryptionPropertyCollection EncryptionProperties { get; }; IEncryptedType
Func<SignedXml, bool> SignatureFormatValidator { get; set; }; ISignedXml
ICipherParameters GetDecryptionKey(EncryptedData encryptedData, string symmetricAlgorithmUri); IEncryptedXml

IEnumerator GetEnumerator(); ICanonicalXmlNodeList 
IEnumerator GetEnumerator(); IEncryptionPropertyCollection
IEnumerator GetEnumerator(); IKeyInfo
IEnumerator GetEnumerator(); IReferenceList
IEnumerator GetEnumerator(); ISignedInfo
IEnumerator GetEnumerator(Type requestedObjectType); IKeyInfo

IList ObjectList { get; set; }; ISignature
KeyInfo KeyInfo { get; set; }; IEncryptedType
KeyInfo KeyInfo { get; set; }; ISignature
KeyInfo KeyInfo { get; set; }; ISignedXml
ReferenceList ReferenceList { get; }; IEncryptedKey
RsaKeyParameters Key { get; set; }; IRSAKeyValue
Signature Signature { get; }; ISignedXml
SignedInfo SignedInfo { get; set; }; ISignature
SignedInfo SignedInfo { get; }; ISignedXml
Transform CanonicalizationMethodObject { get; }; ISignedInfo
TransformChain TransformChain { get; set; }; IEncryptedReference
TransformChain TransformChain { get; set; }; IReference

XmlAttribute CreateAttribute(string prefix, string localName, string namespaceURI); ICanonicalXmlDocument 
XmlCDataSection CreateCDataSection(string data); ICanonicalXmlDocument 
XmlComment CreateComment(string data); ICanonicalXmlDocument 
XmlElement CreateElement(string prefix, string localName, string namespaceURI); ICanonicalXmlDocument 

XmlElement GetIdElement(XmlDocument document, string idValue); IEncryptedXml
XmlElement GetIdElement(XmlDocument document, string idValue); ISignedXml

XmlElement GetXml(); ICipherData 
XmlElement GetXml(); ICipherReference 
XmlElement GetXml(); IDSAKeyValue 
XmlElement GetXml(); IDataObject 
XmlElement GetXml(); IEncryptedData
XmlElement GetXml(); IEncryptedKey
XmlElement GetXml(); IEncryptedReference
XmlElement GetXml(); IEncryptedType
XmlElement GetXml(); IEncryptionMethod
XmlElement GetXml(); IEncryptionProperty
XmlElement GetXml(); IKeyInfo
XmlElement GetXml(); IKeyInfoClause
XmlElement GetXml(); IKeyInfoEncryptedKey
XmlElement GetXml(); IKeyInfoName
XmlElement GetXml(); IKeyInfoNode
XmlElement GetXml(); IKeyInfoRetrievalMethod
XmlElement GetXml(); IKeyInfoX509Data
XmlElement GetXml(); IRSAKeyValue
XmlElement GetXml(); IReference
XmlElement GetXml(); ISignature
XmlElement GetXml(); ISignedInfo
XmlElement GetXml(); ISignedXml

XmlElement PropertyElement { get; set; }; IEncryptionProperty
XmlElement Value { get; set; }; IKeyInfoNode
XmlEntityReference CreateEntityReference(string name); ICanonicalXmlDocument 
XmlNode Item(int index); ICanonicalXmlNodeList 
XmlNodeList Data { get; set; }; IDataObject 
XmlProcessingInstruction CreateProcessingInstruction(string target, string data); ICanonicalXmlDocument 
XmlResolver Resolver { get; set; }; IEncryptedXml
XmlSignificantWhitespace CreateSignificantWhitespace(string text); ICanonicalXmlDocument 
XmlText CreateTextNode(string text); ICanonicalXmlDocument 
XmlWhitespace CreateWhitespace(string prefix); ICanonicalXmlDocument 
bool CheckSignature(); ISignedXml
bool CheckSignature(AsymmetricKeyParameter key); ISignedXml
bool CheckSignature(IMac macAlg); ISignedXml
bool CheckSignature(X509Certificate certificate, bool verifySignatureOnly); ISignedXml
bool CheckSignatureReturningKey(out AsymmetricKeyParameter signingKey); ISignedXml

bool Contains(EncryptionProperty value); IEncryptionPropertyCollection
bool Contains(object value); ICanonicalXmlNodeList 
bool Contains(object value); IReferenceList

bool IncludeComments { get; }; ICanonicalXmlComment 
bool IsCacheValid { get; set; }; ISignedXml

bool IsFixedSize { get; }; ICanonicalXmlNodeList 
bool IsFixedSize { get; }; IEncryptionPropertyCollection

bool IsInNodeSet { get; set; }; ICanonicalXmlCDataSection 
bool IsInNodeSet { get; set; }; ICanonicalXmlComment 
bool IsInNodeSet { get; set; }; ICanonicalXmlDocument 
bool IsInNodeSet { get; set; }; ICanonicalXmlElement 
bool IsInNodeSet { get; set; }; ICanonicalXmlEntityReference 
bool IsInNodeSet { get; set; }; ICanonicalXmlProcessingInstruction 
bool IsInNodeSet { get; set; }; ICanonicalXmlSignificantWhitespace 
bool IsInNodeSet { get; set; }; ICanonicalXmlText 
bool IsInNodeSet { get; set; }; ICanonicalXmlWhitespace 
bool IsInNodeSet { get; set; };ICanonicalXml 

bool IsReadOnly { get; }; ICanonicalXmlNodeList 
bool IsReadOnly { get; }; IEncryptionPropertyCollection
bool IsReadOnly { get; }; ISignedInfo

bool IsSynchronized { get; }; ICanonicalXmlNodeList 
bool IsSynchronized { get; }; IEncryptionPropertyCollection
bool IsSynchronized { get; }; IReferenceList
bool IsSynchronized { get; }; ISignedInfo

bool VerifySignature(byte[] signature); IDsaDigestSigner2 
byte[] CRL { get; set; }; IKeyInfoX509Data
byte[] CipherValue { get; set; }; ICipherData 
byte[] DecryptData(EncryptedData encryptedData, ICipherParameters symmetricAlgorithm); IEncryptedXml
byte[] DecryptEncryptedKey(EncryptedKey encryptedKey, RsaKeyParameters privateKey = null); IEncryptedXml
byte[] DigestValue { get; set; }; IReference
byte[] EncryptData(XmlElement inputElement, ICipherParameters symmetricAlgorithm, bool content); IEncryptedXml
byte[] EncryptData(byte[] plaintext, ICipherParameters symmetricAlgorithm); IEncryptedXml
byte[] GenerateSignature(); IDsaDigestSigner2 
byte[] GetDecryptionIV(EncryptedData encryptedData, string symmetricAlgorithmUri); IEncryptedXml

byte[] SignatureValue { get; set; }; ISignature
byte[] SignatureValue { get; }; ISignedXml

int Add(EncryptionProperty value); IEncryptionPropertyCollection
int Add(object value); ICanonicalXmlNodeList 
int Add(object value); IReferenceList

int Compare(object a, object b); INamespaceSortOrder
int Compare(object a, object b); IReferenceLevelSortOrder1

int Count { get; }; ICanonicalXmlNodeList 
int Count { get; }; IEncryptionPropertyCollection
int Count { get; }; IKeyInfo
int Count { get; }; IReferenceList
int Count { get; }; ISignedInfo

int DoFinal(byte[] output, int outOff); ISignerHashWrapper
int GetHashSize(); ISignerHashWrapper
int GetReferenceLevel(int index, ArrayList references); ISignedXml

int IndexOf(EncryptionProperty value); IEncryptionPropertyCollection
int IndexOf(object value); ICanonicalXmlNodeList 
int IndexOf(object value); IReferenceList

int KeySize { get; set; }; IEncryptionMethod
int XmlDSigSearchDepth { get; set; }; IEncryptedXml

object SyncRoot { get; }; ICanonicalXmlNodeList 
object SyncRoot { get; }; IEncryptionPropertyCollection
object SyncRoot { get; }; IReferenceList
object SyncRoot { get; }; ISignedInfo

string CanonicalizationMethod { get; set; }; ISignedInfo
string CarriedKeyName { get; set; }; IEncryptedKey
string DigestMethod { get; set; }; IReference

string Encoding { get; set; }; IDataObject 
string Encoding { get; set; }; IEncryptedType

string Id { get; set; }; IDataObject 
string Id { get; set; }; IEncryptedType
string Id { get; set; }; IKeyInfo
string Id { get; set; }; IReference
string Id { get; set; }; ISignature
string Id { get; set; }; ISignedInfo
string Id { get; }; IEncryptionProperty

string IssuerName { get; set; }; IX509IssuerSerial
string KeyAlgorithm { get; set; }; IEncryptionMethod

string MimeType { get; set; }; IDataObject 
string MimeType { get; set; }; IEncryptedType

string Mode { get; set; }; IEncryptedXml
string Padding { get; set; }; IEncryptedXml

string Recipient { get; set; }; IEncryptedKey
string Recipient { get; set; }; IEncryptedXml

string SerialNumber { get; set; }; IX509IssuerSerial

string SignatureLength { get; set; }; ISignedInfo
string SignatureLength { get; }; ISignedXml

string SignatureMethod { get; set; }; ISignedInfo
string SignatureMethod { get; }; ISignedXml

string SigningKeyName { get; set; }; ISignedXml
string Target { get; }; IEncryptionProperty

string Type { get; set; }; IEncryptedType
string Type { get; set; }; IKeyInfoRetrievalMethod
string Type { get; set; }; IReference

string Uri { get; set; }; IEncryptedReference
string Uri { get; set; }; IKeyInfoRetrievalMethod
string Uri { get; set; }; IReference

string Value { get; set; }; IKeyInfoName
void AddCertificate(X509Certificate certificate); IKeyInfoX509Data
void AddClause(KeyInfoClause clause); IKeyInfo
void AddIssuerSerial(string issuerName, string serialNumber); IKeyInfoX509Data
void AddKeyNameMapping(string keyName, object keyObject); IEncryptedXml

void AddObject(DataObject dataObject); ISignature
void AddObject(DataObject dataObject); ISignedXml

void AddProperty(EncryptionProperty ep); IEncryptedType

void AddReference(DataReference dataReference); IEncryptedKey
void AddReference(KeyReference keyReference); IEncryptedKey
void AddReference(Reference reference); ISignedInfo
void AddReference(Reference reference); ISignedXml

void AddSubjectKeyId(byte[] subjectKeyId); IKeyInfoX509Data
void AddSubjectKeyId(string subjectKeyId); IKeyInfoX509Data
void AddSubjectName(string subjectName); IKeyInfoX509Data

void AddTransform(Transform transform); IEncryptedReference
void AddTransform(Transform transform); IReference

void BlockUpdate(byte[] input, int inOff, int length); ISignerHashWrapper

void Clear(); ICanonicalXmlNodeList 
void Clear(); IEncryptionPropertyCollection
void Clear(); IReferenceList

void ClearKeyNameMappings(); IEncryptedXml

void ComputeSignature(); ISignedXml
void ComputeSignature(IMac macAlg); ISignedXml

void CopyTo(Array array, int index); ICanonicalXmlNodeList 
void CopyTo(Array array, int index); IEncryptionPropertyCollection
void CopyTo(Array array, int index); IReferenceList
void CopyTo(Array array, int index); ISignedInfo

void CopyTo(EncryptionProperty[] array, int index); IEncryptionPropertyCollection
void DecryptDocument(); IEncryptedXml

void Insert(int index, EncryptionProperty value); IEncryptionPropertyCollection
void Insert(int index, object value); ICanonicalXmlNodeList 
void Insert(int index, object value); IReferenceList

void LoadXml(XmlElement element); IKeyInfoClause
void LoadXml(XmlElement element); IKeyInfoX509Data
void LoadXml(XmlElement value); ICipherData 
void LoadXml(XmlElement value); ICipherReference 
void LoadXml(XmlElement value); IDSAKeyValue 
void LoadXml(XmlElement value); IDataObject 
void LoadXml(XmlElement value); IEncryptedData
void LoadXml(XmlElement value); IEncryptedKey
void LoadXml(XmlElement value); IEncryptedReference
void LoadXml(XmlElement value); IEncryptedType
void LoadXml(XmlElement value); IEncryptionMethod
void LoadXml(XmlElement value); IEncryptionProperty
void LoadXml(XmlElement value); IKeyInfo
void LoadXml(XmlElement value); IKeyInfoEncryptedKey
void LoadXml(XmlElement value); IKeyInfoName
void LoadXml(XmlElement value); IKeyInfoNode
void LoadXml(XmlElement value); IKeyInfoRetrievalMethod
void LoadXml(XmlElement value); IRSAKeyValue
void LoadXml(XmlElement value); IReference
void LoadXml(XmlElement value); ISignature
void LoadXml(XmlElement value); ISignedInfo
void LoadXml(XmlElement value); ISignedXml

void Remove(EncryptionProperty value); IEncryptionPropertyCollection
void Remove(object value); ICanonicalXmlNodeList 
void Remove(object value); IReferenceList
void RemoveAt(int index); ICanonicalXmlNodeList 
void RemoveAt(int index); IEncryptionPropertyCollection
void RemoveAt(int index); IReferenceList

void ReplaceData(XmlElement inputElement, byte[] decryptedData); IEncryptedXml
void Reset(); ISignerHashWrapper

void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlCDataSection 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlComment 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlDocument 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlElement 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlEntityReference 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlProcessingInstruction 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlSignificantWhitespace 

void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlText 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlWhitespace 
void Write(StringBuilder strBuilder, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXml 

void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlCDataSection 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlComment 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlElement 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlEntityReference 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlProcessingInstruction 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlSignificantWhitespace 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlText 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlWhitespace 
void WriteHash(IHash hash, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXml 
void WriteHash(IHash signer, DocPosition docPos, AncestralNamespaceContextManager anc); ICanonicalXmlDocument 




void GetNamespacesToRender(XmlElement element, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared); C14NAncestralNamespaceContextManager 
void GetNamespacesToRender(XmlElement element, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared); ExcAncestralNamespaceContextManager 
void TrackNamespaceNode(XmlAttribute attr, SortedList nsListToRender, Hashtable nsLocallyDeclared); C14NAncestralNamespaceContextManager 
void TrackNamespaceNode(XmlAttribute attr, SortedList nsListToRender, Hashtable nsLocallyDeclared); ExcAncestralNamespaceContextManager 
void TrackXmlNamespaceNode(XmlAttribute attr, SortedList nsListToRender, SortedList attrListToRender, Hashtable nsLocallyDeclared); C14NAncestralNamespaceContextManager 
void TrackXmlNamespaceNode(XmlAttribute attr, SortedList nsListToRender, SortedList attrListToRender, Hashtable nsLocallyDeclared); ExcAncestralNamespaceContextManager 
bool HasNonRedundantInclusivePrefix(XmlAttribute attr); ExcAncestralNamespaceContextManager 
void GatherNamespaceToRender(string nsPrefix, SortedList nsListToRender, Hashtable nsLocallyDeclared); ExcAncestralNamespaceContextManager 
void GetNamespaceToRender(string nsPrefix, SortedList attrListToRender, SortedList nsListToRender, Hashtable nsLocallyDeclared); C14NAncestralNamespaceContextManager 
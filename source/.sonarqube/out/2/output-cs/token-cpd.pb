—L
MC:\code\bc-xml-security\refactoring\samples\EncryptingDecryptingAsymmetric.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class -
!EncryptingAndDecryptingAsymmetric 2
{ 
private 
static 
XmlDocument "
LoadXmlFromString# 4
(4 5
string5 ;
xml< ?
)? @
{ 	
var 
doc 
= 
new 
XmlDocument %
(% &
)& '
;' (
doc 
. 
PreserveWhitespace "
=# $
true% )
;) *
doc 
. 
LoadXml 
( 
xml 
) 
; 
return 
doc 
; 
} 	
private 
static 
void 
Encrypt #
(# $
XmlDocument$ /
doc0 3
,3 4
string5 ;
elementName< G
,G H
stringI O
encryptionElementIDP c
,c d
RsaKeyParameterse u
rsaKeyv |
,| }
string	~ Ñ
keyName
Ö å
,
å ç
bool
é í
useOAEP
ì ö
)
ö õ
{ 	
var   
elementToEncrypt    
=  ! "
(  # $

XmlElement  $ .
)  . /
doc  / 2
.  2 3 
GetElementsByTagName  3 G
(  G H
elementName  H S
)  S T
[  T U
$num  U V
]  V W
;  W X
var"" 
sessionKeyData"" 
=""  ,
 EncryptingAndDecryptingSymmetric""! A
.""A B
GenerateBlock""B O
(""O P
$num""P S
)""S T
;""T U
var## 
sessionKeyIV## 
=## ,
 EncryptingAndDecryptingSymmetric## ?
.##? @
GenerateBlock##@ M
(##M N
$num##N Q
)##Q R
;##R S
var$$ 

sessionKey$$ 
=$$ 
new$$  
ParametersWithIV$$! 1
($$1 2
new$$2 5
KeyParameter$$6 B
($$B C
sessionKeyData$$C Q
)$$Q R
,$$R S
sessionKeyIV$$T `
)$$` a
;$$a b
var'' 
encryptedKey'' 
='' 
new'' "
EncryptedKey''# /
(''/ 0
)''0 1
{(( 

CipherData)) 
=)) 
new))  

CipherData))! +
())+ ,
EncryptedXml)), 8
.))8 9

EncryptKey))9 C
())C D
sessionKeyData))D R
,))R S
rsaKey))T Z
,))Z [
useOAEP))\ c
)))c d
)))d e
,))e f
EncryptionMethod**  
=**! "
new**# &
EncryptionMethod**' 7
(**7 8
useOAEP**8 ?
?**@ A
EncryptedXml**B N
.**N O
XmlEncRSAOAEPUrl**O _
:**` a
EncryptedXml**b n
.**n o
XmlEncRSA15Url**o }
)**} ~
}++ 
;++ 
encryptedKey11 
.11 
AddReference11 %
(11% &
new11& )
DataReference11* 7
(117 8
)118 9
{22 
Uri33 
=33 
$str33 
+33 
encryptionElementID33 /
}44 
)44 
;44 
var66 
encryptedData66 
=66 
new66  #
EncryptedData66$ 1
(661 2
)662 3
{77 
Type88 
=88 
EncryptedXml88 #
.88# $
XmlEncElementUrl88$ 4
,884 5
Id99 
=99 
encryptionElementID99 (
,99( )
EncryptionMethod==  
===! "
new==# &
EncryptionMethod==' 7
(==7 8
EncryptedXml==8 D
.==D E
XmlEncAES256Url==E T
)==T U
}>> 
;>> 
encryptedData@@ 
.@@ 
KeyInfo@@ !
.@@! "
	AddClause@@" +
(@@+ ,
new@@, /
KeyInfoEncryptedKey@@0 C
(@@C D
encryptedKey@@D P
)@@P Q
)@@Q R
;@@R S
encryptedKeyAA 
.AA 
KeyInfoAA  
.AA  !
	AddClauseAA! *
(AA* +
newAA+ .
KeyInfoNameAA/ :
(AA: ;
)AA; <
{BB 
ValueCC 
=CC 
keyNameCC 
}DD 
)DD 
;DD 
varFF 
encryptedXmlFF 
=FF 
newFF "
EncryptedXmlFF# /
(FF/ 0
)FF0 1
;FF1 2
encryptedDataGG 
.GG 

CipherDataGG $
.GG$ %
CipherValueGG% 0
=GG1 2
encryptedXmlGG3 ?
.GG? @
EncryptDataGG@ K
(GGK L
elementToEncryptGGL \
,GG\ ]

sessionKeyGG^ h
,GGh i
falseGGj o
)GGo p
;GGp q
EncryptedXmlII 
.II 
ReplaceElementII '
(II' (
elementToEncryptII( 8
,II8 9
encryptedDataII: G
,IIG H
falseIII N
)IIN O
;IIO P
}JJ 	
publicLL 
staticLL 
voidLL 
DecryptLL "
(LL" #
XmlDocumentLL# .
docLL/ 2
,LL2 3
RsaKeyParametersLL4 D
rsaKeyLLE K
,LLK L
stringLLM S
keyNameLLT [
)LL[ \
{MM 	
varNN 
	encryptedNN 
=NN 
newNN 
EncryptedXmlNN  ,
(NN, -
docNN- 0
)NN0 1
;NN1 2
	encryptedOO 
.OO 
AddKeyNameMappingOO '
(OO' (
keyNameOO( /
,OO/ 0
rsaKeyOO1 7
)OO7 8
;OO8 9
	encryptedPP 
.PP 
DecryptDocumentPP %
(PP% &
)PP& '
;PP' (
}QQ 	
publicSS 
voidSS )
AsymmetricEncryptionRoundtripSS 1
(SS1 2
boolSS2 6
useOAEPSS7 >
)SS> ?
{TT 	
constUU 
stringUU !
exampleXmlRootElementUU .
=UU/ 0
$strUU1 :
;UU: ;
constVV 
stringVV 

exampleXmlVV #
=VV$ %
$strVY& 
;YY 
var[[ 
keyGen[[ 
=[[ 
GeneratorUtilities[[ +
.[[+ ,
GetKeyPairGenerator[[, ?
([[? @
$str[[@ E
)[[E F
;[[F G
keyGen\\ 
.\\ 
Init\\ 
(\\ 
new\\ #
KeyGenerationParameters\\ 3
(\\3 4
new\\4 7
SecureRandom\\8 D
(\\D E
)\\E F
,\\F G
$num\\H L
)\\L M
)\\M N
;\\N O
var]] 
key]] 
=]] 
keyGen]] 
.]] 
GenerateKeyPair]] ,
(]], -
)]]- .
;]]. /
XmlDocument__ 
xmlDocToEncrypt__ '
=__( )
LoadXmlFromString__* ;
(__; <

exampleXml__< F
)__F G
;__G H
Encrypt`` 
(`` 
xmlDocToEncrypt`` #
,``# $!
exampleXmlRootElement``% :
,``: ;
$str``< O
,``O P
(``Q R
RsaKeyParameters``R b
)``b c
key``c f
.``f g
Public``g m
,``m n
$str``o w
,``w x
useOAEP	``y Ä
)
``Ä Å
;
``Å Ç
Consolebb 
.bb 
	WriteLinebb 
(bb 
$strbb `
)bb` a
;bba b
Consolecc 
.cc 
	WriteLinecc 
(cc 
$strcc -
,cc- .
useOAEPcc/ 6
)cc6 7
;cc7 8
Consoledd 
.dd 
	WriteLinedd 
(dd 
$strdd 3
)dd3 4
;dd4 5
Consoleee 
.ee 
	WriteLineee 
(ee 
)ee 
;ee  
Consoleff 
.ff 
	WriteLineff 
(ff 
xmlDocToEncryptff -
.ff- .
OuterXmlff. 6
)ff6 7
;ff7 8
Consolegg 
.gg 
	WriteLinegg 
(gg 
)gg 
;gg  
XmlDocumentii 
xmlDocToDecryptii '
=ii( )
LoadXmlFromStringii* ;
(ii; <
xmlDocToEncryptii< K
.iiK L
OuterXmliiL T
)iiT U
;iiU V
Decryptjj 
(jj 
xmlDocToDecryptjj #
,jj# $
(jj% &
RsaKeyParametersjj& 6
)jj6 7
keyjj7 :
.jj: ;
Privatejj; B
,jjB C
$strjjD L
)jjL M
;jjM N
Consolell 
.ll 
	WriteLinell 
(ll 
$strll 3
)ll3 4
;ll4 5
Consolemm 
.mm 
	WriteLinemm 
(mm 
)mm 
;mm  
Consolenn 
.nn 
	WriteLinenn 
(nn 
xmlDocToDecryptnn -
.nn- .
OuterXmlnn. 6
)nn6 7
;nn7 8
Consoleoo 
.oo 
	WriteLineoo 
(oo 
)oo 
;oo  
}pp 	
publicrr 
voidrr )
AsymmetricEncryptionRoundtriprr 1
(rr1 2
)rr2 3
{ss 	)
AsymmetricEncryptionRoundtriptt )
(tt) *
falsett* /
)tt/ 0
;tt0 1)
AsymmetricEncryptionRoundtripuu )
(uu) *
trueuu* .
)uu. /
;uu/ 0
}vv 	
}ww 
}xx Ûq
LC:\code\bc-xml-security\refactoring\samples\EncryptingDecryptingSymmetric.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class ,
 EncryptingAndDecryptingSymmetric 1
{ 
private 
static 
XmlDocument "
LoadXmlFromString# 4
(4 5
string5 ;
xml< ?
)? @
{ 	
var 
doc 
= 
new 
XmlDocument %
(% &
)& '
;' (
doc 
. 
PreserveWhitespace "
=# $
true% )
;) *
doc 
. 
LoadXml 
( 
xml 
) 
; 
return 
doc 
; 
} 	
private 
static 
void 
EncryptElement *
(* +
XmlDocument+ 6
doc7 :
,: ;
string< B
elementNameC N
,N O
ICipherParametersP a
keyb e
)e f
{ 	
var   
elementToEncrypt    
=  ! "
(  # $

XmlElement  $ .
)  . /
doc  / 2
.  2 3 
GetElementsByTagName  3 G
(  G H
elementName  H S
)  S T
[  T U
$num  U V
]  V W
;  W X
var"" 
encryptedXml"" 
="" 
new"" "
EncryptedXml""# /
(""/ 0
)""0 1
;""1 2
var## 
encryptedData## 
=## 
new##  #
EncryptedData##$ 1
(##1 2
)##2 3
{$$ 
Type%% 
=%% 
EncryptedXml%% #
.%%# $
XmlEncElementUrl%%$ 4
,%%4 5
EncryptionMethod&&  
=&&! "
new&&# &
EncryptionMethod&&' 7
(&&7 8#
GetEncryptionMethodName&&8 O
(&&O P
key&&P S
)&&S T
)&&T U
}'' 
;'' 
encryptedData)) 
.)) 

CipherData)) $
.))$ %
CipherValue))% 0
=))1 2
encryptedXml))3 ?
.))? @
EncryptData))@ K
())K L
elementToEncrypt))L \
,))\ ]
key))^ a
,))a b
false))c h
)))h i
;))i j
EncryptedXml++ 
.++ 
ReplaceElement++ '
(++' (
elementToEncrypt++( 8
,++8 9
encryptedData++: G
,++G H
false++I N
)++N O
;++O P
},, 	
private.. 
static.. 
void.. 
Decrypt.. #
(..# $
XmlDocument..$ /
doc..0 3
,..3 4
ICipherParameters..5 F
key..G J
)..J K
{// 	
var00 
encryptedElement00  
=00! "
(00# $

XmlElement00$ .
)00. /
doc00/ 2
.002 3 
GetElementsByTagName003 G
(00G H
$str00H W
)00W X
[00X Y
$num00Y Z
]00Z [
;00[ \
var22 
encryptedData22 
=22 
new22  #
EncryptedData22$ 1
(221 2
)222 3
;223 4
encryptedData33 
.33 
LoadXml33 !
(33! "
encryptedElement33" 2
)332 3
;333 4
var55 
encryptedXml55 
=55 
new55 "
EncryptedXml55# /
(55/ 0
)550 1
;551 2
byte77 
[77 
]77 
	rgbOutput77 
=77 
encryptedXml77 +
.77+ ,
DecryptData77, 7
(777 8
encryptedData778 E
,77E F
key77G J
)77J K
;77K L
encryptedXml99 
.99 
ReplaceData99 $
(99$ %
encryptedElement99% 5
,995 6
	rgbOutput997 @
)99@ A
;99A B
}:: 	
private<< 
void<< (
SymmetricEncryptionRoundtrip<< 1
(<<1 2
Func<<2 6
<<<6 7
ICipherParameters<<7 H
><<H I
algorithmFactory<<J Z
)<<Z [
{== 	
const>> 
string>> !
ExampleXmlRootElement>> .
=>>/ 0
$str>>1 :
;>>: ;
const?? 
string?? 

ExampleXml?? #
=??$ %
$str?B& 
;BB 
varDD 
algDD 
=DD 
algorithmFactoryDD &
(DD& '
)DD' (
;DD( )
XmlDocumentFF 
xmlDocToEncryptFF '
=FF( )
LoadXmlFromStringFF* ;
(FF; <

ExampleXmlFF< F
)FFF G
;FFG H
EncryptElementGG 
(GG 
xmlDocToEncryptGG *
,GG* +!
ExampleXmlRootElementGG, A
,GGA B
algGGC F
)GGF G
;GGG H
ConsoleII 
.II 
	WriteLineII 
(II 
$strII `
)II` a
;IIa b
ConsoleJJ 
.JJ 
	WriteLineJJ 
(JJ 
$strJJ .
,JJ. /#
GetEncryptionMethodNameJJ0 G
(JJG H
algJJH K
)JJK L
)JJL M
;JJM N
ConsoleKK 
.KK 
	WriteLineKK 
(KK 
$strKK 3
)KK3 4
;KK4 5
ConsoleLL 
.LL 
	WriteLineLL 
(LL 
)LL 
;LL  
ConsoleMM 
.MM 
	WriteLineMM 
(MM 
xmlDocToEncryptMM -
.MM- .
OuterXmlMM. 6
)MM6 7
;MM7 8
ConsoleNN 
.NN 
	WriteLineNN 
(NN 
)NN 
;NN  
XmlDocumentPP 
xmlDocToDecryptPP '
=PP( )
LoadXmlFromStringPP* ;
(PP; <
xmlDocToEncryptPP< K
.PPK L
OuterXmlPPL T
)PPT U
;PPU V
DecryptQQ 
(QQ 
xmlDocToDecryptQQ #
,QQ# $
algQQ% (
)QQ( )
;QQ) *
ConsoleSS 
.SS 
	WriteLineSS 
(SS 
$strSS 3
)SS3 4
;SS4 5
ConsoleTT 
.TT 
	WriteLineTT 
(TT 
)TT 
;TT  
ConsoleUU 
.UU 
	WriteLineUU 
(UU 
xmlDocToDecryptUU -
.UU- .
OuterXmlUU. 6
)UU6 7
;UU7 8
ConsoleVV 
.VV 
	WriteLineVV 
(VV 
)VV 
;VV  
}WW 	
publicYY 
voidYY (
SymmetricEncryptionRoundtripYY 0
(YY0 1
)YY1 2
{ZZ 	
foreach[[ 
([[ 
var[[ 
factory[[  
in[[! #"
GetSymmetricAlgorithms[[$ :
([[: ;
)[[; <
)[[< =(
SymmetricEncryptionRoundtrip\\ ,
(\\, -
factory\\- 4
)\\4 5
;\\5 6
}]] 	
private__ 
static__ 
readonly__ 
SecureRandom__  ,
_random__- 4
=__5 6
new__7 :
SecureRandom__; G
(__G H
)__H I
;__I J
internalaa 
staticaa 
byteaa 
[aa 
]aa 
GenerateBlockaa ,
(aa, -
intaa- 0

sizeInBitsaa1 ;
)aa; <
{bb 	
varcc 
resultcc 
=cc 
newcc 
bytecc !
[cc! "

sizeInBitscc" ,
/cc- .
$numcc/ 0
]cc0 1
;cc1 2
_randomdd 
.dd 
	NextBytesdd 
(dd 
resultdd $
)dd$ %
;dd% &
returnee 
resultee 
;ee 
}ff 	
internalhh 
statichh 
IEnumerablehh #
<hh# $
Funchh$ (
<hh( )
ICipherParametershh) :
>hh: ;
>hh; <"
GetSymmetricAlgorithmshh= S
(hhS T
boolhhT X
skipDeshhY `
=hha b
falsehhc h
)hhh i
{ii 	
ICipherParametersjj 
	CreateDesjj '
(jj' (
)jj( )
{kk 
varll 
keyll 
=ll 
GenerateBlockll '
(ll' (
$numll( *
)ll* +
;ll+ ,
varmm 
ivmm 
=mm 
GenerateBlockmm &
(mm& '
$nummm' )
)mm) *
;mm* +
returnnn 
newnn 
ParametersWithIVnn +
(nn+ ,
newnn, /
DesParametersnn0 =
(nn= >
keynn> A
)nnA B
,nnB C
ivnnD F
)nnF G
;nnG H
}oo 
ICipherParametersqq 
CreateTripleDesqq -
(qq- .
)qq. /
{rr 
varss 
keyss 
=ss 
GenerateBlockss '
(ss' (
$numss( +
)ss+ ,
;ss, -
vartt 
ivtt 
=tt 
GenerateBlocktt &
(tt& '
$numtt' )
)tt) *
;tt* +
returnuu 
newuu 
ParametersWithIVuu +
(uu+ ,
newuu, /
DesEdeParametersuu0 @
(uu@ A
keyuuA D
)uuD E
,uuE F
ivuuG I
)uuI J
;uuJ K
}vv 
ICipherParametersxx 
	CreateAesxx '
(xx' (
intxx( +
sizexx, 0
)xx0 1
{yy 
varzz 
keyzz 
=zz 
GenerateBlockzz '
(zz' (
sizezz( ,
)zz, -
;zz- .
var{{ 
iv{{ 
={{ 
GenerateBlock{{ &
({{& '
$num{{' *
){{* +
;{{+ ,
return|| 
new|| 
ParametersWithIV|| +
(||+ ,
new||, /
KeyParameter||0 <
(||< =
key||= @
)||@ A
,||A B
iv||C E
)||E F
;||F G
}}} 
if 
( 
! 
skipDes 
) 
yield
ÄÄ 
return
ÄÄ 
(
ÄÄ 
)
ÄÄ 
=>
ÄÄ  "
	CreateDes
ÄÄ# ,
(
ÄÄ, -
)
ÄÄ- .
;
ÄÄ. /
yield
ÅÅ 
return
ÅÅ 
(
ÅÅ 
)
ÅÅ 
=>
ÅÅ 
CreateTripleDes
ÅÅ .
(
ÅÅ. /
)
ÅÅ/ 0
;
ÅÅ0 1
yield
ÇÇ 
return
ÇÇ 
(
ÇÇ 
)
ÇÇ 
=>
ÇÇ 
	CreateAes
ÇÇ (
(
ÇÇ( )
$num
ÇÇ) ,
)
ÇÇ, -
;
ÇÇ- .
yield
ÉÉ 
return
ÉÉ 
(
ÉÉ 
)
ÉÉ 
=>
ÉÉ 
	CreateAes
ÉÉ (
(
ÉÉ( )
$num
ÉÉ) ,
)
ÉÉ, -
;
ÉÉ- .
yield
ÑÑ 
return
ÑÑ 
(
ÑÑ 
)
ÑÑ 
=>
ÑÑ 
	CreateAes
ÑÑ (
(
ÑÑ( )
$num
ÑÑ) ,
)
ÑÑ, -
;
ÑÑ- .
}
ÖÖ 	
internal
áá 
static
áá 
string
áá %
GetEncryptionMethodName
áá 6
(
áá6 7
ICipherParameters
áá7 H
param
ááI N
,
ááN O
bool
ááP T
keyWrap
ááU \
=
áá] ^
false
áá_ d
)
áád e
{
àà 	
var
ââ 
iv
ââ 
=
ââ 
param
ââ 
as
ââ 
ParametersWithIV
ââ .
;
ââ. /
var
ää 
key
ää 
=
ää 
iv
ää 
!=
ää 
null
ää  
?
ää! "
iv
ää# %
.
ää% &

Parameters
ää& 0
as
ää1 3
KeyParameter
ää4 @
:
ääA B
param
ääC H
as
ääI K
KeyParameter
ääL X
;
ääX Y
if
åå 
(
åå 
key
åå 
is
åå 
DesEdeParameters
åå '
)
åå' (
{
åå) *
return
çç 
keyWrap
çç 
?
çç  
EncryptedXml
çç! -
.
çç- .'
XmlEncTripleDESKeyWrapUrl
çç. G
:
ççH I
EncryptedXml
ççJ V
.
ççV W 
XmlEncTripleDESUrl
ççW i
;
ççi j
}
éé 
else
éé 
if
éé 
(
éé 
key
éé 
is
éé 
DesParameters
éé +
)
éé+ ,
{
éé- .
return
èè 
keyWrap
èè 
?
èè  
EncryptedXml
èè! -
.
èè- .'
XmlEncTripleDESKeyWrapUrl
èè. G
:
èèH I
EncryptedXml
èèJ V
.
èèV W
XmlEncDESUrl
èèW c
;
èèc d
}
êê 
else
êê 
{
êê 
switch
ëë 
(
ëë 
key
ëë 
.
ëë 
GetKey
ëë "
(
ëë" #
)
ëë# $
.
ëë$ %
Length
ëë% +
*
ëë, -
$num
ëë. /
)
ëë/ 0
{
ëë1 2
case
íí 
$num
íí 
:
íí 
return
ìì 
keyWrap
ìì &
?
ìì' (
EncryptedXml
ìì) 5
.
ìì5 6$
XmlEncAES128KeyWrapUrl
ìì6 L
:
ììM N
EncryptedXml
ììO [
.
ìì[ \
XmlEncAES128Url
ìì\ k
;
ììk l
case
îî 
$num
îî 
:
îî 
return
ïï 
keyWrap
ïï &
?
ïï' (
EncryptedXml
ïï) 5
.
ïï5 6$
XmlEncAES192KeyWrapUrl
ïï6 L
:
ïïM N
EncryptedXml
ïïO [
.
ïï[ \
XmlEncAES192Url
ïï\ k
;
ïïk l
case
ññ 
$num
ññ 
:
ññ 
return
óó 
keyWrap
óó &
?
óó' (
EncryptedXml
óó) 5
.
óó5 6$
XmlEncAES256KeyWrapUrl
óó6 L
:
óóM N
EncryptedXml
óóO [
.
óó[ \
XmlEncAES256Url
óó\ k
;
óók l
}
òò 
}
ôô 
throw
õõ 
new
õõ 
ArgumentException
õõ '
(
õõ' (
$"
õõ( *'
The specified algorithm `
õõ* C
{
õõC D
key
õõD G
.
õõG H
GetType
õõH O
(
õõO P
)
õõP Q
.
õõQ R
FullName
õõR Z
}
õõZ [5
&` is not supported for XML Encryption.õõ[ Å
"õõÅ Ç
)õõÇ É
;õõÉ Ñ
}
úú 	
}
ùù 
}ûû ≤P
SC:\code\bc-xml-security\refactoring\samples\EncryptingDecryptingSymmetricKeyWrap.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class 0
$EncryptingDecryptingSymmetricKeyWrap 5
{ 
private 
static 
XmlDocument "
LoadXmlFromString# 4
(4 5
string5 ;
xml< ?
)? @
{ 	
var 
doc 
= 
new 
XmlDocument %
(% &
)& '
;' (
doc 
. 
PreserveWhitespace "
=# $
true% )
;) *
doc 
. 
LoadXml 
( 
xml 
) 
; 
return 
doc 
; 
} 	
private 
static 
void 
Encrypt #
(# $
XmlDocument$ /
doc0 3
,3 4
string5 ;
elementName< G
,G H
stringI O
encryptionElementIDP c
,c d
ICipherParameterse v
keyw z
,z {
string	| Ç
keyName
É ä
,
ä ã
Func
å ê
<
ê ë
ICipherParameters
ë ¢
>
¢ £
innerKeyFactory
§ ≥
)
≥ ¥
{ 	
var 
elementToEncrypt  
=! "
(# $

XmlElement$ .
). /
doc/ 2
.2 3 
GetElementsByTagName3 G
(G H
elementNameH S
)S T
[T U
$numU V
]V W
;W X
ICipherParameters 
innerKey &
=' (
innerKeyFactory) 8
(8 9
)9 :
;: ;
var!! 
encryptedKey!! 
=!! 
new!! "
EncryptedKey!!# /
(!!/ 0
)!!0 1
{"" 

CipherData## 
=## 
new##  

CipherData##! +
(##+ ,
EncryptedXml##, 8
.##8 9

EncryptKey##9 C
(##C D
(##D E
(##E F
KeyParameter##F R
)##R S
(##S T
(##T U
ParametersWithIV##U e
)##e f
innerKey##f n
)##n o
.##o p

Parameters##p z
)##z {
.##{ |
GetKey	##| Ç
(
##Ç É
)
##É Ñ
,
##Ñ Ö
(
##Ü á
KeyParameter
##á ì
)
##ì î
(
##î ï
(
##ï ñ
ParametersWithIV
##ñ ¶
)
##¶ ß
key
##ß ™
)
##™ ´
.
##´ ¨

Parameters
##¨ ∂
)
##∂ ∑
)
##∑ ∏
,
##∏ π
EncryptionMethod$$  
=$$! "
new$$# &
EncryptionMethod$$' 7
($$7 8,
 EncryptingAndDecryptingSymmetric$$8 X
.$$X Y#
GetEncryptionMethodName$$Y p
($$p q
key$$q t
,$$t u
keyWrap$$v }
:$$} ~
true	$$ É
)
$$É Ñ
)
$$Ñ Ö
}%% 
;%% 
encryptedKey++ 
.++ 
AddReference++ %
(++% &
new++& )
DataReference++* 7
(++7 8
)++8 9
{,, 
Uri-- 
=-- 
$str-- 
+-- 
encryptionElementID-- /
}.. 
).. 
;.. 
var00 
encryptedData00 
=00 
new00  #
EncryptedData00$ 1
(001 2
)002 3
{11 
Type22 
=22 
EncryptedXml22 #
.22# $
XmlEncElementUrl22$ 4
,224 5
Id33 
=33 
encryptionElementID33 (
,33( )
EncryptionMethod77  
=77! "
new77# &
EncryptionMethod77' 7
(777 8,
 EncryptingAndDecryptingSymmetric778 X
.77X Y#
GetEncryptionMethodName77Y p
(77p q
innerKey77q y
,77y z
keyWrap	77{ Ç
:
77Ç É
false
77Ñ â
)
77â ä
)
77ä ã
}88 
;88 
encryptedData:: 
.:: 
KeyInfo:: !
.::! "
	AddClause::" +
(::+ ,
new::, /
KeyInfoEncryptedKey::0 C
(::C D
encryptedKey::D P
)::P Q
)::Q R
;::R S
encryptedKey;; 
.;; 
KeyInfo;;  
.;;  !
	AddClause;;! *
(;;* +
new;;+ .
KeyInfoName;;/ :
(;;: ;
);;; <
{<< 
Value== 
=== 
keyName== 
}>> 
)>> 
;>> 
var@@ 
encryptedXml@@ 
=@@ 
new@@ "
EncryptedXml@@# /
(@@/ 0
)@@0 1
;@@1 2
encryptedDataAA 
.AA 

CipherDataAA $
.AA$ %
CipherValueAA% 0
=AA1 2
encryptedXmlAA3 ?
.AA? @
EncryptDataAA@ K
(AAK L
elementToEncryptAAL \
,AA\ ]
innerKeyAA^ f
,AAf g
falseAAh m
)AAm n
;AAn o
EncryptedXmlCC 
.CC 
ReplaceElementCC '
(CC' (
elementToEncryptCC( 8
,CC8 9
encryptedDataCC: G
,CCG H
falseCCI N
)CCN O
;CCO P
}DD 	
publicFF 
staticFF 
voidFF 
DecryptFF "
(FF" #
XmlDocumentFF# .
docFF/ 2
,FF2 3
ICipherParametersFF4 E
keyFFF I
,FFI J
stringFFK Q
keyNameFFR Y
)FFY Z
{GG 	
varHH 
	encryptedHH 
=HH 
newHH 
EncryptedXmlHH  ,
(HH, -
docHH- 0
)HH0 1
;HH1 2
	encryptedII 
.II 
AddKeyNameMappingII '
(II' (
keyNameII( /
,II/ 0
keyII1 4
)II4 5
;II5 6
	encryptedJJ 
.JJ 
DecryptDocumentJJ %
(JJ% &
)JJ& '
;JJ' (
}KK 	
publicMM 
voidMM /
#SymmetricKeyWrapEncryptionRoundtripMM 7
(MM7 8
FuncMM8 <
<MM< =
ICipherParametersMM= N
>MMN O

keyFactoryMMP Z
,MMZ [
FuncMM\ `
<MM` a
ICipherParametersMMa r
>MMr s
innerKeyFactory	MMt É
)
MMÉ Ñ
{NN 	
constOO 
stringOO !
exampleXmlRootElementOO .
=OO/ 0
$strOO1 :
;OO: ;
constPP 
stringPP 

exampleXmlPP #
=PP$ %
$strPS& 
;SS 
constTT 
stringTT 
keyNameTT  
=TT! "
$strTT# .
;TT. /
ICipherParametersVV 
keyVV !
=VV" #

keyFactoryVV$ .
(VV. /
)VV/ 0
;VV0 1
XmlDocumentWW 
xmlDocToEncryptWW '
=WW( )
LoadXmlFromStringWW* ;
(WW; <

exampleXmlWW< F
)WWF G
;WWG H
EncryptXX 
(XX 
xmlDocToEncryptXX #
,XX# $!
exampleXmlRootElementXX% :
,XX: ;
$strXX< O
,XXO P
keyXXQ T
,XXT U
keyNameXXV ]
,XX] ^
innerKeyFactoryXX_ n
)XXn o
;XXo p
ConsoleZZ 
.ZZ 
	WriteLineZZ 
(ZZ 
$strZZ `
)ZZ` a
;ZZa b
Console[[ 
.[[ 
	WriteLine[[ 
([[ 
$str[[ .
,[[. /,
 EncryptingAndDecryptingSymmetric[[0 P
.[[P Q#
GetEncryptionMethodName[[Q h
([[h i
key[[i l
,[[l m
keyWrap[[n u
:[[u v
true[[w {
)[[{ |
)[[| }
;[[} ~
Console\\ 
.\\ 
	WriteLine\\ 
(\\ 
$str\\ 3
)\\3 4
;\\4 5
Console]] 
.]] 
	WriteLine]] 
(]] 
)]] 
;]]  
Console^^ 
.^^ 
	WriteLine^^ 
(^^ 
xmlDocToEncrypt^^ -
.^^- .
OuterXml^^. 6
)^^6 7
;^^7 8
Console__ 
.__ 
	WriteLine__ 
(__ 
)__ 
;__  
XmlDocumentaa 
xmlDocToDecryptaa '
=aa( )
LoadXmlFromStringaa* ;
(aa; <
xmlDocToEncryptaa< K
.aaK L
OuterXmlaaL T
)aaT U
;aaU V
Decryptbb 
(bb 
xmlDocToDecryptbb #
,bb# $
keybb% (
,bb( )
keyNamebb* 1
)bb1 2
;bb2 3
Consoledd 
.dd 
	WriteLinedd 
(dd 
$strdd 3
)dd3 4
;dd4 5
Consoleee 
.ee 
	WriteLineee 
(ee 
)ee 
;ee  
Consoleff 
.ff 
	WriteLineff 
(ff 
xmlDocToDecryptff -
.ff- .
OuterXmlff. 6
)ff6 7
;ff7 8
Consolegg 
.gg 
	WriteLinegg 
(gg 
)gg 
;gg  
}hh 	
publicjj 
voidjj /
#SymmetricKeyWrapEncryptionRoundtripjj 7
(jj7 8
)jj8 9
{kk 	
foreachmm 
(mm 
varmm 
factorymm  
inmm! #,
 EncryptingAndDecryptingSymmetricmm$ D
.mmD E"
GetSymmetricAlgorithmsmmE [
(mm[ \
skipDesmm\ c
:mmc d
truemme i
)mmi j
)mmj k
foreachnn 
(nn 
varnn 
innerFactorynn )
innn* ,,
 EncryptingAndDecryptingSymmetricnn- M
.nnM N"
GetSymmetricAlgorithmsnnN d
(nnd e
skipDesnne l
:nnl m
truennn r
)nnr s
)nns t/
#SymmetricKeyWrapEncryptionRoundtripoo 7
(oo7 8
factoryoo8 ?
,oo? @
innerFactoryooA M
)ooM N
;ooN O
}pp 	
}qq 
}rr èm
<C:\code\bc-xml-security\refactoring\samples\GostUtilities.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
class 	
GostUtilities
 
{ 
class  
GostSignatureFactory "
:# $
ISignatureFactory% 6
{ 	
private 
readonly 
AlgorithmIdentifier 0
algID1 6
;6 7
private 
readonly 
string #
	algorithm$ -
;- .
private 
readonly "
AsymmetricKeyParameter 3

privateKey4 >
;> ?
private 
readonly 
SecureRandom )
random* 0
;0 1
public!!  
GostSignatureFactory!! '
(!!' (
string!!( .
	algorithm!!/ 8
,!!8 9"
AsymmetricKeyParameter!!: P

privateKey!!Q [
)!![ \
:"" 
this"" 
("" 
	algorithm""  
,""  !

privateKey""" ,
,"", -
null"". 2
)""2 3
{## 
}%% 
public''  
GostSignatureFactory'' '
(''' (
string''( .
	algorithm''/ 8
,''8 9"
AsymmetricKeyParameter'': P

privateKey''Q [
,''[ \
SecureRandom''] i
random''j p
)''p q
{(( 
if)) 
()) 
	algorithm)) 
==))  
null))! %
)))% &
throw** 
new** !
ArgumentNullException** 3
(**3 4
nameof**4 :
(**: ;
	algorithm**; D
)**D E
)**E F
;**F G
if++ 
(++ 

privateKey++ 
==++ !
null++" &
)++& '
throw,, 
new,, !
ArgumentNullException,, 3
(,,3 4
nameof,,4 :
(,,: ;

privateKey,,; E
),,E F
),,F G
;,,G H
if-- 
(-- 
!-- 

privateKey-- 
.--  
	IsPrivate--  )
)--) *
throw.. 
new.. 
ArgumentException.. /
(../ 0
$str..0 Q
,..Q R
nameof..S Y
(..Y Z

privateKey..Z d
)..d e
)..e f
;..f g
this00 
.00 
	algorithm00 
=00  
	algorithm00! *
;00* +
this11 
.11 

privateKey11 
=11  !

privateKey11" ,
;11, -
this22 
.22 
random22 
=22 
random22 $
;22$ %
this33 
.33 
algID33 
=33 
new33  
AlgorithmIdentifier33! 4
(334 5
new335 8
DerObjectIdentifier339 L
(33L M
	algorithm33M V
)33V W
)33W X
;33X Y
}44 
public66 
Object66 
AlgorithmDetails66 *
{77 
get88 
{88 
return88 
this88 !
.88! "
algID88" '
;88' (
}88) *
}99 
public;; 
IStreamCalculator;; $
CreateCalculator;;% 5
(;;5 6
);;6 7
{<< 
ISigner== 
signer== 
;== 
if>> 
(>> 
algID>> 
.>> 
	Algorithm>> #
.>># $
Equals>>$ *
(>>* +(
RosstandartObjectIdentifiers>>+ G
.>>G H3
'id_tc26_signwithdigest_gost_3410_12_256>>H o
)>>o p
)>>p q
signer?? 
=?? 
new??   
Gost3410DigestSigner??! 5
(??5 6
new??6 9
ECGost3410Signer??: J
(??J K
)??K L
,??L M
new??N Q#
Gost3411_2012_256Digest??R i
(??i j
)??j k
)??k l
;??l m
else@@ 
if@@ 
(@@ 
algID@@ 
.@@ 
	Algorithm@@ (
.@@( )
Equals@@) /
(@@/ 0(
RosstandartObjectIdentifiers@@0 L
.@@L M3
'id_tc26_signwithdigest_gost_3410_12_512@@M t
)@@t u
)@@u v
signerAA 
=AA 
newAA   
Gost3410DigestSignerAA! 5
(AA5 6
newAA6 9
ECGost3410SignerAA: J
(AAJ K
)AAK L
,AAL M
newAAN Q#
Gost3411_2012_512DigestAAR i
(AAi j
)AAj k
)AAk l
;AAl m
elseBB 
ifBB 
(BB 
algIDBB 
.BB 
	AlgorithmBB (
.BB( )
EqualsBB) /
(BB/ 0&
CryptoProObjectIdentifiersBB0 J
.BBJ K*
GostR3411x94WithGostR3410x2001BBK i
)BBi j
)BBj k
signerCC 
=CC 
newCC   
Gost3410DigestSignerCC! 5
(CC5 6
newCC6 9
ECGost3410SignerCC: J
(CCJ K
)CCK L
,CCL M
newCCN Q
Gost3411DigestCCR `
(CC` a
)CCa b
)CCb c
;CCc d
elseDD 
ifDD 
(DD 
algIDDD 
.DD 
	AlgorithmDD (
.DD( )
EqualsDD) /
(DD/ 0&
CryptoProObjectIdentifiersDD0 J
.DDJ K(
GostR3411x94WithGostR3410x94DDK g
)DDg h
)DDh i
signerEE 
=EE 
newEE   
Gost3410DigestSignerEE! 5
(EE5 6
newEE6 9
Gost3410SignerEE: H
(EEH I
)EEI J
,EEJ K
newEEL O
Gost3411DigestEEP ^
(EE^ _
)EE_ `
)EE` a
;EEa b
elseFF 
throwGG 
newGG $
SecurityUtilityExceptionGG 6
(GG6 7
$strGG7 @
+GGA B
	algorithmGGC L
+GGM N
$strGGO a
)GGa b
;GGb c
signerII 
.II 
InitII 
(II 
trueII  
,II  !
ParameterUtilitiesII" 4
.II4 5

WithRandomII5 ?
(II? @

privateKeyII@ J
,IIJ K
randomIIL R
)IIR S
)IIS T
;IIT U
returnKK 
newKK &
DefaultSignatureCalculatorKK 5
(KK5 6
signerKK6 <
)KK< =
;KK= >
}LL 
}MM 	
privateOO 
staticOO 
readonlyOO 
SecureRandomOO  ,
_randomOO- 4
=OO5 6
newOO7 :
SecureRandomOO; G
(OOG H
)OOH I
;OOI J
publicQQ 
staticQQ #
AsymmetricCipherKeyPairQQ -
GenerateGostKeyPairQQ. A
(QQA B
DerObjectIdentifierQQB U 
publicKeyParamSetOidQQV j
,QQj k
DerObjectIdentifierQQl 
digestParamSetOid
QQÄ ë
)
QQë í
{RR 	
varSS 
curveSS 
=SS !
ECGost3410NamedCurvesSS -
.SS- .
GetByOidSS. 6
(SS6 7 
publicKeyParamSetOidSS7 K
)SSK L
;SSL M
varTT 
ecpTT 
=TT 
newTT #
ECNamedDomainParametersTT 1
(TT1 2 
publicKeyParamSetOidTT2 F
,TTF G
curveTTH M
)TTM N
;TTN O
varUU 

gostParamsUU 
=UU 
newUU   
ECGost3410ParametersUU! 5
(UU5 6
ecpUU6 9
,UU9 : 
publicKeyParamSetOidUU; O
,UUO P
digestParamSetOidUUQ b
,UUb c
nullUUd h
)UUh i
;UUi j
varVV 
paramVV 
=VV 
newVV %
ECKeyGenerationParametersVV 5
(VV5 6

gostParamsVV6 @
,VV@ A
_randomVVB I
)VVI J
;VVJ K
varWW 
	generatorWW 
=WW 
newWW 
ECKeyPairGeneratorWW  2
(WW2 3
)WW3 4
;WW4 5
	generatorXX 
.XX 
InitXX 
(XX 
paramXX  
)XX  !
;XX! "
returnYY 
	generatorYY 
.YY 
GenerateKeyPairYY ,
(YY, -
)YY- .
;YY. /
}ZZ 	
public\\ 
static\\ 
X509Certificate\\ %)
GenerateSelfSignedCertificate\\& C
(\\C D
out\\D G"
AsymmetricKeyParameter\\H ^

privateKey\\_ i
)\\i j
{]] 	
var^^ 
keypair^^ 
=^^ 
GenerateGostKeyPair^^ -
(^^- .(
RosstandartObjectIdentifiers__ ,
.__, -.
"id_tc26_gost_3410_12_512_paramSetA__- O
,__O P(
RosstandartObjectIdentifiers`` ,
.``, -$
id_tc26_gost_3411_12_512``- E
)``E F
;``F G
varbb 
	generatorbb 
=bb 
newbb &
X509V3CertificateGeneratorbb  :
(bb: ;
)bb; <
;bb< =
	generatorcc 
.cc 
SetSerialNumbercc %
(cc% &
newcc& )

BigIntegercc* 4
(cc4 5
$numcc5 7
*cc8 9
$numcc: ;
,cc; <
_randomcc= D
)ccD E
)ccE F
;ccF G
	generatordd 
.dd 
SetIssuerDNdd !
(dd! "
newdd" %
X509Namedd& .
(dd. /
$strdd/ ;
)dd; <
)dd< =
;dd= >
	generatoree 
.ee 
SetSubjectDNee "
(ee" #
newee# &
X509Nameee' /
(ee/ 0
$stree0 A
)eeA B
)eeB C
;eeC D
	generatorff 
.ff 
SetNotBeforeff "
(ff" #
DateTimeff# +
.ff+ ,
Todayff, 1
.ff1 2
AddDaysff2 9
(ff9 :
-ff: ;
$numff; <
)ff< =
)ff= >
;ff> ?
	generatorgg 
.gg 
SetNotAftergg !
(gg! "
DateTimegg" *
.gg* +
Todaygg+ 0
.gg0 1
AddYearsgg1 9
(gg9 :
$numgg: ;
)gg; <
)gg< =
;gg= >
	generatorhh 
.hh 
SetPublicKeyhh "
(hh" #
keypairhh# *
.hh* +
Publichh+ 1
)hh1 2
;hh2 3
varjj 
keyUsagejj 
=jj 
newjj 
KeyUsagejj '
(jj' (
KeyUsagejj( 0
.jj0 1
DigitalSignaturejj1 A
|jjB C
KeyUsagejjD L
.jjL M
NonRepudiationjjM [
)jj[ \
;jj\ ]
	generatorkk 
.kk 
AddExtensionkk "
(kk" #
X509Extensionskk# 1
.kk1 2
KeyUsagekk2 :
,kk: ;
truekk< @
,kk@ A
keyUsagekkB J
)kkJ K
;kkK L
varmm 
signFactorymm 
=mm 
newmm ! 
GostSignatureFactorymm" 6
(mm6 7(
RosstandartObjectIdentifiersnn ,
.nn, -3
'id_tc26_signwithdigest_gost_3410_12_512nn- T
.nnT U
ToStringnnU ]
(nn] ^
)nn^ _
,nn_ `
keypairoo 
.oo 
Privateoo 
)oo  
;oo  !

privateKeyqq 
=qq 
keypairqq  
.qq  !
Privateqq! (
;qq( )
returnss 
	generatorss 
.ss 
Generatess %
(ss% &
signFactoryss& 1
)ss1 2
;ss2 3
}tt 	
publicvv 
staticvv 
bytevv 
[vv 
]vv 
CreatePKCS12vv )
(vv) *
X509Certificatevv* 9
certificatevv: E
,vvE F"
AsymmetricKeyParametervvG ]

privateKeyvv^ h
,vvh i
stringvvj p
passwordvvq y
)vvy z
{ww 	
varxx 
builderxx 
=xx 
newxx 
Pkcs12StoreBuilderxx 0
(xx0 1
)xx1 2
;xx2 3
builderyy 
.yy 
SetUseDerEncodingyy %
(yy% &
trueyy& *
)yy* +
;yy+ ,
varzz 
storezz 
=zz 
builderzz 
.zz  
Buildzz  %
(zz% &
)zz& '
;zz' (
var|| 
	certEntry|| 
=|| 
new||  
X509CertificateEntry||  4
(||4 5
certificate||5 @
)||@ A
;||A B
store}} 
.}} 
SetKeyEntry}} 
(}} 
$str}} *
,}}* +
new~~ 
AsymmetricKeyEntry~~ &
(~~& '

privateKey~~' 1
)~~1 2
,~~2 3
new  
X509CertificateEntry (
[( )
]) *
{+ ,
	certEntry- 6
}7 8
)8 9
;9 :
byte
ÅÅ 
[
ÅÅ 
]
ÅÅ 
pfxBytes
ÅÅ 
;
ÅÅ 
using
ÇÇ 
(
ÇÇ 
MemoryStream
ÇÇ 
stream
ÇÇ  &
=
ÇÇ' (
new
ÇÇ) ,
MemoryStream
ÇÇ- 9
(
ÇÇ9 :
)
ÇÇ: ;
)
ÇÇ; <
{
ÇÇ= >
store
ÉÉ 
.
ÉÉ 
Save
ÉÉ 
(
ÉÉ 
stream
ÉÉ !
,
ÉÉ! "
password
ÉÉ# +
.
ÉÉ+ ,
ToCharArray
ÉÉ, 7
(
ÉÉ7 8
)
ÉÉ8 9
,
ÉÉ9 :
new
ÉÉ; >
SecureRandom
ÉÉ? K
(
ÉÉK L
)
ÉÉL M
)
ÉÉM N
;
ÉÉN O
pfxBytes
ÑÑ 
=
ÑÑ 
stream
ÑÑ !
.
ÑÑ! "
ToArray
ÑÑ" )
(
ÑÑ) *
)
ÑÑ* +
;
ÑÑ+ ,
}
ÖÖ 
return
áá 
Pkcs12Utilities
áá "
.
áá" #%
ConvertToDefiniteLength
áá# :
(
áá: ;
pfxBytes
áá; C
)
ááC D
;
ááD E
}
àà 	
}
ââ 
}ää È&
6C:\code\bc-xml-security\refactoring\samples\Program.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
class 	
Program
 
{		 
static

 
void

 
Main

 
(

 
string

 
[

  
]

  !
args

" &
)

& '
{ 	
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
Console 
. 
	WriteLine 
( 
$str ;
); <
;< =
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
var 
test1 
= 
new 
SigningAndVerifying /
(/ 0
)0 1
;1 2
test1 
. +
SignedXmlHasVerifiableSignature 1
(1 2
)2 3
;3 4
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
Console 
. 
	WriteLine 
( 
$str X
)X Y
;Y Z
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
var 
test2 
= 
new 8
,SigningAndVerifyingWithCustomSignatureMethod H
(H I
)I J
;J K
test2 
. +
SignedXmlHasVerifiableSignature 1
(1 2
)2 3
;3 4
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
Console 
. 
	WriteLine 
( 
$str R
)R S
;S T
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
var 
test3 
= 
new $
SigningVerifyingX509Cert 4
(4 5
)5 6
;6 7
test3 
. 6
*SignedXmlHasCertificateVerifiableSignature <
(< =
)= >
;> ?
Console 
. 
	WriteLine 
( 
$str `
)` a
;a b
Console 
. 
	WriteLine 
( 
$str P
)P Q
;Q R
Console   
.   
	WriteLine   
(   
$str   `
)  ` a
;  a b
var!! 
test3_1!! 
=!! 
new!!  
SigningVerifyingGost!! 2
(!!2 3
)!!3 4
;!!4 5
test3_1"" 
."" 6
*SignedXmlHasCertificateVerifiableSignature"" >
(""> ?
)""? @
;""@ A
Console$$ 
.$$ 
	WriteLine$$ 
($$ 
$str$$ `
)$$` a
;$$a b
Console%% 
.%% 
	WriteLine%% 
(%% 
$str%% U
)%%U V
;%%V W
Console&& 
.&& 
	WriteLine&& 
(&& 
$str&& `
)&&` a
;&&a b
var'' 
test4'' 
='' 
new'' ,
 EncryptingAndDecryptingSymmetric'' <
(''< =
)''= >
;''> ?
test4(( 
.(( (
SymmetricEncryptionRoundtrip(( .
(((. /
)((/ 0
;((0 1
Console** 
.** 
	WriteLine** 
(** 
$str** `
)**` a
;**a b
Console++ 
.++ 
	WriteLine++ 
(++ 
$str++ c
)++c d
;++d e
Console,, 
.,, 
	WriteLine,, 
(,, 
$str,, `
),,` a
;,,a b
var-- 
test5-- 
=-- 
new-- 0
$EncryptingDecryptingSymmetricKeyWrap-- @
(--@ A
)--A B
;--B C
test5.. 
... /
#SymmetricKeyWrapEncryptionRoundtrip.. 5
(..5 6
)..6 7
;..7 8
Console00 
.00 
	WriteLine00 
(00 
$str00 `
)00` a
;00a b
Console11 
.11 
	WriteLine11 
(11 
$str11 D
)11D E
;11E F
Console22 
.22 
	WriteLine22 
(22 
$str22 `
)22` a
;22a b
var33 
test633 
=33 
new33 -
!EncryptingAndDecryptingAsymmetric33 =
(33= >
)33> ?
;33? @
test644 
.44 )
AsymmetricEncryptionRoundtrip44 /
(44/ 0
)440 1
;441 2
}55 	
}66 
}77 Ò
FC:\code\bc-xml-security\refactoring\samples\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str .
). /
]/ 0
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *û.
?C:\code\bc-xml-security\refactoring\samples\SigningVerifying.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class 
SigningAndVerifying $
{ 
const 
string 

ExampleXml 
=  !
$str" 
; 
private 
static 
void 
SignXml #
(# $
XmlDocument$ /
doc0 3
,3 4
RsaKeyParameters5 E
keyF I
)I J
{ 	
var 
	signedXml 
= 
new 
	SignedXml  )
() *
doc* -
)- .
{ 

SigningKey   
=   
key    
}!! 
;!! 
var## 
	reference## 
=## 
new## 
	Reference##  )
(##) *
)##* +
;##+ ,
	reference$$ 
.$$ 
Uri$$ 
=$$ 
$str$$ 
;$$ 
	reference&& 
.&& 
AddTransform&& "
(&&" #
new&&# &.
"XmlDsigEnvelopedSignatureTransform&&' I
(&&I J
)&&J K
)&&K L
;&&L M
	signedXml(( 
.(( 
AddReference(( "
(((" #
	reference((# ,
)((, -
;((- .
	signedXml** 
.** 
ComputeSignature** &
(**& '
)**' (
;**( )

XmlElement++ 
xmlDigitalSignature++ *
=+++ ,
	signedXml++- 6
.++6 7
GetXml++7 =
(++= >
)++> ?
;++? @
doc,, 
.,, 
DocumentElement,, 
.,,  
AppendChild,,  +
(,,+ ,
doc,,, /
.,,/ 0

ImportNode,,0 :
(,,: ;
xmlDigitalSignature,,; N
,,,N O
true,,P T
),,T U
),,U V
;,,V W
}-- 	
private// 
static// 
bool// 
	VerifyXml// %
(//% &
string//& ,
signedXmlText//- :
,//: ;
RsaKeyParameters//< L
key//M P
)//P Q
{00 	
XmlDocument11 
xmlDoc11 
=11  
new11! $
XmlDocument11% 0
(110 1
)111 2
;112 3
xmlDoc22 
.22 
PreserveWhitespace22 %
=22& '
true22( ,
;22, -
xmlDoc33 
.33 
LoadXml33 
(33 
signedXmlText33 (
)33( )
;33) *
	SignedXml55 
	signedXml55 
=55  !
new55" %
	SignedXml55& /
(55/ 0
xmlDoc550 6
)556 7
;557 8
var66 
signatureNode66 
=66 
(66  !

XmlElement66! +
)66+ ,
xmlDoc66, 2
.662 3 
GetElementsByTagName663 G
(66G H
$str66H S
)66S T
[66T U
$num66U V
]66V W
;66W X
	signedXml77 
.77 
LoadXml77 
(77 
signatureNode77 +
)77+ ,
;77, -
return88 
	signedXml88 
.88 
CheckSignature88 +
(88+ ,
key88, /
)88/ 0
;880 1
}99 	
public;; 
void;; +
SignedXmlHasVerifiableSignature;; 3
(;;3 4
);;4 5
{<< 	
var== 
keyGen== 
=== 
GeneratorUtilities== +
.==+ ,
GetKeyPairGenerator==, ?
(==? @
$str==@ E
)==E F
;==F G
keyGen>> 
.>> 
Init>> 
(>> 
new>> #
KeyGenerationParameters>> 3
(>>3 4
new>>4 7
SecureRandom>>8 D
(>>D E
)>>E F
,>>F G
$num>>H L
)>>L M
)>>M N
;>>N O
var?? 
pair?? 
=?? 
keyGen?? 
.?? 
GenerateKeyPair?? -
(??- .
)??. /
;??/ 0
varAA 
xmlDocAA 
=AA 
newAA 
XmlDocumentAA (
(AA( )
)AA) *
;AA* +
xmlDocBB 
.BB 
PreserveWhitespaceBB %
=BB& '
trueBB( ,
;BB, -
xmlDocCC 
.CC 
LoadXmlCC 
(CC 

ExampleXmlCC %
)CC% &
;CC& '
SignXmlDD 
(DD 
xmlDocDD 
,DD 
(DD 
RsaKeyParametersDD -
)DD- .
pairDD. 2
.DD2 3
PrivateDD3 :
)DD: ;
;DD; <
ConsoleFF 
.FF 
	WriteLineFF 
(FF 
$strFF 0
)FF0 1
;FF1 2
ConsoleGG 
.GG 
	WriteLineGG 
(GG 
)GG 
;GG  
ConsoleHH 
.HH 
	WriteLineHH 
(HH 
xmlDocHH $
.HH$ %
OuterXmlHH% -
)HH- .
;HH. /
varJJ 
resultJJ 
=JJ 
	VerifyXmlJJ "
(JJ" #
xmlDocJJ# )
.JJ) *
OuterXmlJJ* 2
,JJ2 3
(JJ4 5
RsaKeyParametersJJ5 E
)JJE F
pairJJF J
.JJJ K
PublicJJK Q
)JJQ R
;JJR S
ConsoleLL 
.LL 
	WriteLineLL 
(LL 
)LL 
;LL  
ConsoleMM 
.MM 
	WriteLineMM 
(MM 
$strMM B
,MMB C
resultMMD J
?MMK L
$strMMM T
:MMU V
$strMMW `
)MM` a
;MMa b
ConsoleNN 
.NN 
	WriteLineNN 
(NN 
)NN 
;NN  
}OO 	
}PP 
}QQ Ö9
XC:\code\bc-xml-security\refactoring\samples\SigningVerifyingWithCustomSignatureMethod.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class 8
,SigningAndVerifyingWithCustomSignatureMethod =
{ 
const 
string 

ExampleXml 
=  !
$str" 
; 
private 
static 
void 
SignXml #
(# $
XmlDocument$ /
doc0 3
,3 4
RsaKeyParameters5 E
keyF I
,I J
stringK Q
signatureMethodR a
,a b
stringc i
digestMethodj v
)v w
{ 	
var 
	signedXml 
= 
new 
	SignedXml  )
() *
doc* -
)- .
{ 

SigningKey   
=   
key    
}!! 
;!! 
	signedXml## 
.## 

SignedInfo##  
.##  !
SignatureMethod##! 0
=##1 2
signatureMethod##3 B
;##B C
var%% 
	reference%% 
=%% 
new%% 
	Reference%%  )
(%%) *
)%%* +
;%%+ ,
	reference&& 
.&& 
Uri&& 
=&& 
$str&& 
;&& 
	reference(( 
.(( 
AddTransform(( "
(((" #
new((# &.
"XmlDsigEnvelopedSignatureTransform((' I
(((I J
)((J K
)((K L
;((L M
	reference)) 
.)) 
DigestMethod)) "
=))# $
digestMethod))% 1
;))1 2
	signedXml++ 
.++ 
AddReference++ "
(++" #
	reference++# ,
)++, -
;++- .
	signedXml-- 
.-- 
ComputeSignature-- &
(--& '
)--' (
;--( )

XmlElement.. 
xmlDigitalSignature.. *
=..+ ,
	signedXml..- 6
...6 7
GetXml..7 =
(..= >
)..> ?
;..? @
doc// 
.// 
DocumentElement// 
.//  
AppendChild//  +
(//+ ,
doc//, /
./// 0

ImportNode//0 :
(//: ;
xmlDigitalSignature//; N
,//N O
true//P T
)//T U
)//U V
;//V W
}00 	
private22 
static22 
bool22 
	VerifyXml22 %
(22% &
string22& ,
signedXmlText22- :
,22: ;
RsaKeyParameters22< L
key22M P
)22P Q
{33 	
XmlDocument44 
xmlDoc44 
=44  
new44! $
XmlDocument44% 0
(440 1
)441 2
;442 3
xmlDoc55 
.55 
PreserveWhitespace55 %
=55& '
true55( ,
;55, -
xmlDoc66 
.66 
LoadXml66 
(66 
signedXmlText66 (
)66( )
;66) *
	SignedXml88 
	signedXml88 
=88  !
new88" %
	SignedXml88& /
(88/ 0
xmlDoc880 6
)886 7
;887 8
var99 
signatureNode99 
=99 
(99  !

XmlElement99! +
)99+ ,
xmlDoc99, 2
.992 3 
GetElementsByTagName993 G
(99G H
$str99H S
)99S T
[99T U
$num99U V
]99V W
;99W X
	signedXml:: 
.:: 
LoadXml:: 
(:: 
signatureNode:: +
)::+ ,
;::, -
return;; 
	signedXml;; 
.;; 
CheckSignature;; +
(;;+ ,
key;;, /
);;/ 0
;;;0 1
}<< 	
private?? 
void?? +
SignedXmlHasVerifiableSignature?? 4
(??4 5
string??5 ;
signatureMethod??< K
,??K L
string??M S
digestMethod??T `
)??` a
{@@ 	
varAA 
keyGenAA 
=AA 
GeneratorUtilitiesAA +
.AA+ ,
GetKeyPairGeneratorAA, ?
(AA? @
$strAA@ E
)AAE F
;AAF G
keyGenBB 
.BB 
InitBB 
(BB 
newBB #
KeyGenerationParametersBB 3
(BB3 4
newBB4 7
SecureRandomBB8 D
(BBD E
)BBE F
,BBF G
$numBBH L
)BBL M
)BBM N
;BBN O
varCC 
pairCC 
=CC 
keyGenCC 
.CC 
GenerateKeyPairCC -
(CC- .
)CC. /
;CC/ 0
varEE 
xmlDocEE 
=EE 
newEE 
XmlDocumentEE (
(EE( )
)EE) *
;EE* +
xmlDocFF 
.FF 
PreserveWhitespaceFF %
=FF& '
trueFF( ,
;FF, -
xmlDocGG 
.GG 
LoadXmlGG 
(GG 

ExampleXmlGG %
)GG% &
;GG& '
SignXmlHH 
(HH 
xmlDocHH 
,HH 
(HH 
RsaKeyParametersHH -
)HH- .
pairHH. 2
.HH2 3
PrivateHH3 :
,HH: ;
signatureMethodHH< K
,HHK L
digestMethodHHM Y
)HHY Z
;HHZ [
ConsoleJJ 
.JJ 
	WriteLineJJ 
(JJ 
$strJJ 0
)JJ0 1
;JJ1 2
ConsoleKK 
.KK 
	WriteLineKK 
(KK 
)KK 
;KK  
ConsoleLL 
.LL 
	WriteLineLL 
(LL 
xmlDocLL $
.LL$ %
OuterXmlLL% -
)LL- .
;LL. /
varNN 
resultNN 
=NN 
	VerifyXmlNN "
(NN" #
xmlDocNN# )
.NN) *
OuterXmlNN* 2
,NN2 3
(NN4 5
RsaKeyParametersNN5 E
)NNE F
pairNNF J
.NNJ K
PublicNNK Q
)NNQ R
;NNR S
ConsolePP 
.PP 
	WriteLinePP 
(PP 
)PP 
;PP  
ConsoleQQ 
.QQ 
	WriteLineQQ 
(QQ 
$strQQ B
,QQB C
resultQQD J
?QQK L
$strQQM T
:QQU V
$strQQW `
)QQ` a
;QQa b
ConsoleRR 
.RR 
	WriteLineRR 
(RR 
)RR 
;RR  
}SS 	
publicUU 
voidUU +
SignedXmlHasVerifiableSignatureUU 3
(UU3 4
)UU4 5
{VV 	+
SignedXmlHasVerifiableSignatureWW +
(WW+ ,
$strWW, _
,WW_ `
$str	WWa ä
)
WWä ã
;
WWã å+
SignedXmlHasVerifiableSignatureXX +
(XX+ ,
$strXX, _
,XX_ `
$str	XXa ê
)
XXê ë
;
XXë í+
SignedXmlHasVerifiableSignatureYY +
(YY+ ,
$strYY, _
,YY_ `
$str	YYa ä
)
YYä ã
;
YYã å+
SignedXmlHasVerifiableSignatureZZ +
(ZZ+ ,
$strZZ, _
,ZZ_ `
$str	ZZa ä
)
ZZä ã
;
ZZã å
}[[ 	
}\\ 
}]] —A
CC:\code\bc-xml-security\refactoring\samples\SigningVerifyingGost.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class  
SigningVerifyingGost %
{ 
const 
string 

ExampleXml 
=  !
$str" 
; 
private 
static 
void 
SignXml #
(# $
XmlDocument$ /
doc0 3
,3 4
X509Certificate5 D
certE I
,I J"
AsymmetricKeyParameterK a
keyb e
)e f
{ 	
var 
	signedXml 
= 
new 
	SignedXml  )
() *
doc* -
)- .
{ 

SigningKey 
= 
key  
,  !
} 
; 
var!! 
	reference!! 
=!! 
new!! 
	Reference!!  )
(!!) *
)!!* +
;!!+ ,
	reference"" 
."" 
Uri"" 
="" 
$str"" 
;"" 
	reference## 
.## 
AddTransform## "
(##" #
new### &.
"XmlDsigEnvelopedSignatureTransform##' I
(##I J
)##J K
)##K L
;##L M
	reference$$ 
.$$ 
DigestMethod$$ "
=$$# $
	SignedXml$$% .
.$$. /(
XmlDsigGost3411_2012_512_Url$$/ K
;$$K L
	signedXml%% 
.%% 
AddReference%% "
(%%" #
	reference%%# ,
)%%, -
;%%- .
	signedXml'' 
.'' 
KeyInfo'' 
='' 
new''  #
KeyInfo''$ +
(''+ ,
)'', -
;''- .
	signedXml(( 
.(( 
KeyInfo(( 
.(( 
	AddClause(( '
(((' (
new((( +
KeyInfoX509Data((, ;
(((; <
cert((< @
)((@ A
)((A B
;((B C
	signedXml** 
.** 

SignedInfo**  
.**  !
SignatureMethod**! 0
=**1 2
	SignedXml**3 <
.**< =(
XmlDsigGost3410_2012_512_Url**= Y
;**Y Z
	signedXml,, 
.,, 
ComputeSignature,, &
(,,& '
),,' (
;,,( )

XmlElement.. 
xmlDigitalSignature.. *
=..+ ,
	signedXml..- 6
...6 7
GetXml..7 =
(..= >
)..> ?
;..? @
doc// 
.// 
DocumentElement// 
.//  
AppendChild//  +
(//+ ,
doc//, /
./// 0

ImportNode//0 :
(//: ;
xmlDigitalSignature//; N
,//N O
true//P T
)//T U
)//U V
;//V W
}00 	
private22 
static22 
bool22 
	VerifyXml22 %
(22% &
string22& ,
signedXmlText22- :
,22: ;
X509Certificate22< K
certificate22L W
)22W X
{33 	
XmlDocument44 
xmlDoc44 
=44  
new44! $
XmlDocument44% 0
(440 1
)441 2
;442 3
xmlDoc55 
.55 
PreserveWhitespace55 %
=55& '
true55( ,
;55, -
xmlDoc66 
.66 
LoadXml66 
(66 
signedXmlText66 (
)66( )
;66) *
	SignedXml88 
	signedXml88 
=88  !
new88" %
	SignedXml88& /
(88/ 0
xmlDoc880 6
)886 7
;887 8
var99 
signatureNode99 
=99 
(99  !

XmlElement99! +
)99+ ,
xmlDoc99, 2
.992 3 
GetElementsByTagName993 G
(99G H
$str99H S
)99S T
[99T U
$num99U V
]99V W
;99W X
	signedXml:: 
.:: 
LoadXml:: 
(:: 
signatureNode:: +
)::+ ,
;::, -
returnAA 
	signedXmlAA 
.AA 
CheckSignatureAA +
(AA+ ,
)AAV W
;AAW X
}BB 	
publicDD 
voidDD 6
*SignedXmlHasCertificateVerifiableSignatureDD >
(DD> ?
)DD? @
{EE 	
varFF 
x509certFF 
=FF $
GetSampleX509CertificateFF 3
(FF3 4
)FF4 5
;FF5 6
varGG 
xmlDocGG 
=GG 
newGG 
XmlDocumentGG (
(GG( )
)GG) *
;GG* +
xmlDocHH 
.HH 
PreserveWhitespaceHH %
=HH& '
trueHH( ,
;HH, -
xmlDocII 
.II 
LoadXmlII 
(II 

ExampleXmlII %
)II% &
;II& '
SignXmlKK 
(KK 
xmlDocKK 
,KK 
x509certKK $
.KK$ %
Item1KK% *
,KK* +
x509certKK, 4
.KK4 5
Item2KK5 :
)KK: ;
;KK; <
ConsoleMM 
.MM 
	WriteLineMM 
(MM 
$strMM 0
)MM0 1
;MM1 2
ConsoleNN 
.NN 
	WriteLineNN 
(NN 
)NN 
;NN  
ConsoleOO 
.OO 
	WriteLineOO 
(OO 
xmlDocOO $
.OO$ %
OuterXmlOO% -
)OO- .
;OO. /
varQQ 
resultQQ 
=QQ 
	VerifyXmlQQ "
(QQ" #
xmlDocQQ# )
.QQ) *
OuterXmlQQ* 2
,QQ2 3
x509certQQ4 <
.QQ< =
Item1QQ= B
)QQB C
;QQC D
ConsoleSS 
.SS 
	WriteLineSS 
(SS 
)SS 
;SS  
ConsoleTT 
.TT 
	WriteLineTT 
(TT 
$strTT B
,TTB C
resultTTD J
?TTK L
$strTTM T
:TTU V
$strTTW `
)TT` a
;TTa b
ConsoleUU 
.UU 
	WriteLineUU 
(UU 
)UU 
;UU  
}VV 	
privateXX 
staticXX 
readonlyXX 
byteXX  $
[XX$ %
]XX% &
	SamplePfxXX' 0
=XX1 2
ConvertXX3 :
.XX: ;
FromBase64StringXX; K
(XXK L
$str	YY Á

)
YYÁ
 Ë

;
YYË
 È

public[[ 
static[[ 
Tuple[[ 
<[[ 
X509Certificate[[ +
,[[+ ,"
AsymmetricKeyParameter[[- C
>[[C D$
GetSampleX509Certificate[[E ]
([[] ^
)[[^ _
{\\ 	
Pkcs12Store__ 
store__ 
=__ 
new__  #
Pkcs12Store__$ /
(__/ 0
)__0 1
;__1 2
charaa 
[aa 
]aa 
passwordaa 
=aa 
$straa $
.aa$ %
ToCharArrayaa% 0
(aa0 1
)aa1 2
;aa2 3
usingbb 
(bb 
MemoryStreambb 
msbb  "
=bb# $
newbb% (
MemoryStreambb) 5
(bb5 6
	SamplePfxbb6 ?
)bb? @
)bb@ A
storecc 
.cc 
Loadcc 
(cc 
mscc 
,cc 
passwordcc '
)cc' (
;cc( )
stringee 
aliasee 
=ee 
storeee  
.ee  !
Aliasesee! (
.ee( )
Castee) -
<ee- .
stringee. 4
>ee4 5
(ee5 6
)ee6 7
.ee7 8
Firstee8 =
(ee= >
)ee> ?
;ee? @
X509Certificateff 
certff  
=ff! "
storeff# (
.ff( )
GetCertificateff) 7
(ff7 8
aliasff8 =
)ff= >
.ff> ?
Certificateff? J
;ffJ K"
AsymmetricKeyParametergg "
privKeygg# *
=gg+ ,
storegg- 2
.gg2 3
GetKeygg3 9
(gg9 :
aliasgg: ?
)gg? @
.gg@ A
KeyggA D
;ggD E
returnii 
Tupleii 
.ii 
Createii 
(ii  
certii  $
,ii$ %
privKeyii& -
)ii- .
;ii. /
}jj 	
}kk 
}ll †;
GC:\code\bc-xml-security\refactoring\samples\SigningVerifyingX509Cert.cs
	namespace 	

_SignedXml
 
. 
Samples 
{ 
public 

class $
SigningVerifyingX509Cert )
{ 
const 
string 

ExampleXml 
=  !
$str" 
; 
private 
static 
void 
SignXml #
(# $
XmlDocument$ /
doc0 3
,3 4"
AsymmetricKeyParameter5 K
keyL O
)O P
{ 	
var 
	signedXml 
= 
new 
	SignedXml  )
() *
doc* -
)- .
{ 

SigningKey 
= 
key  
} 
; 
var$$ 
	reference$$ 
=$$ 
new$$ 
	Reference$$  )
($$) *
)$$* +
;$$+ ,
	reference%% 
.%% 
Uri%% 
=%% 
$str%% 
;%% 
	reference&& 
.&& 
AddTransform&& "
(&&" #
new&&# &.
"XmlDsigEnvelopedSignatureTransform&&' I
(&&I J
)&&J K
)&&K L
;&&L M
	signedXml'' 
.'' 
AddReference'' "
(''" #
	reference''# ,
)'', -
;''- .
	signedXml)) 
.)) 
ComputeSignature)) &
())& '
)))' (
;))( )

XmlElement++ 
xmlDigitalSignature++ *
=+++ ,
	signedXml++- 6
.++6 7
GetXml++7 =
(++= >
)++> ?
;++? @
doc,, 
.,, 
DocumentElement,, 
.,,  
AppendChild,,  +
(,,+ ,
doc,,, /
.,,/ 0

ImportNode,,0 :
(,,: ;
xmlDigitalSignature,,; N
,,,N O
true,,P T
),,T U
),,U V
;,,V W
}-- 	
private// 
static// 
bool// 
	VerifyXml// %
(//% &
string//& ,
signedXmlText//- :
,//: ;
X509Certificate//< K
certificate//L W
)//W X
{00 	
XmlDocument11 
xmlDoc11 
=11  
new11! $
XmlDocument11% 0
(110 1
)111 2
;112 3
xmlDoc22 
.22 
PreserveWhitespace22 %
=22& '
true22( ,
;22, -
xmlDoc33 
.33 
LoadXml33 
(33 
signedXmlText33 (
)33( )
;33) *
	SignedXml55 
	signedXml55 
=55  !
new55" %
	SignedXml55& /
(55/ 0
xmlDoc550 6
)556 7
;557 8
var66 
signatureNode66 
=66 
(66  !

XmlElement66! +
)66+ ,
xmlDoc66, 2
.662 3 
GetElementsByTagName663 G
(66G H
$str66H S
)66S T
[66T U
$num66U V
]66V W
;66W X
	signedXml77 
.77 
LoadXml77 
(77 
signatureNode77 +
)77+ ,
;77, -
return>> 
	signedXml>> 
.>> 
CheckSignature>> +
(>>+ ,
certificate>>, 7
,>>7 8
verifySignatureOnly>>9 L
:>>L M
true>>N R
)>>R S
;>>S T
}?? 	
publicAA 
voidAA 6
*SignedXmlHasCertificateVerifiableSignatureAA >
(AA> ?
)AA? @
{BB 	
varCC 
x509certCC 
=CC $
GetSampleX509CertificateCC 3
(CC3 4
)CC4 5
;CC5 6
varDD 
xmlDocDD 
=DD 
newDD 
XmlDocumentDD (
(DD( )
)DD) *
;DD* +
xmlDocEE 
.EE 
PreserveWhitespaceEE %
=EE& '
trueEE( ,
;EE, -
xmlDocFF 
.FF 
LoadXmlFF 
(FF 

ExampleXmlFF %
)FF% &
;FF& '
SignXmlHH 
(HH 
xmlDocHH 
,HH 
x509certHH $
.HH$ %
Item2HH% *
)HH* +
;HH+ ,
ConsoleJJ 
.JJ 
	WriteLineJJ 
(JJ 
$strJJ 0
)JJ0 1
;JJ1 2
ConsoleKK 
.KK 
	WriteLineKK 
(KK 
)KK 
;KK  
ConsoleLL 
.LL 
	WriteLineLL 
(LL 
xmlDocLL $
.LL$ %
OuterXmlLL% -
)LL- .
;LL. /
varNN 
resultNN 
=NN 
	VerifyXmlNN "
(NN" #
xmlDocNN# )
.NN) *
OuterXmlNN* 2
,NN2 3
x509certNN4 <
.NN< =
Item1NN= B
)NNB C
;NNC D
ConsolePP 
.PP 
	WriteLinePP 
(PP 
)PP 
;PP  
ConsoleQQ 
.QQ 
	WriteLineQQ 
(QQ 
$strQQ B
,QQB C
resultQQD J
?QQK L
$strQQM T
:QQU V
$strQQW `
)QQ` a
;QQa b
ConsoleRR 
.RR 
	WriteLineRR 
(RR 
)RR 
;RR  
}SS 	
privateUU 
staticUU 
readonlyUU 
byteUU  $
[UU$ %
]UU% &
	SamplePfxUU' 0
=UU1 2
ConvertUU3 :
.UU: ;
FromBase64StringUU; K
(UUK L
$str	VV ì
)
VVì î
;
VVî ï
publicXX 
staticXX 
TupleXX 
<XX 
X509CertificateXX +
,XX+ ,"
AsymmetricKeyParameterXX- C
>XXC D$
GetSampleX509CertificateXXE ]
(XX] ^
)XX^ _
{YY 	
Pkcs12StoreZZ 
storeZZ 
=ZZ 
newZZ  #
Pkcs12StoreZZ$ /
(ZZ/ 0
)ZZ0 1
;ZZ1 2
char\\ 
[\\ 
]\\ 
password\\ 
=\\ 
$str\\ $
.\\$ %
ToCharArray\\% 0
(\\0 1
)\\1 2
;\\2 3
using]] 
(]] 
MemoryStream]] 
ms]]  "
=]]# $
new]]% (
MemoryStream]]) 5
(]]5 6
	SamplePfx]]6 ?
)]]? @
)]]@ A
store^^ 
.^^ 
Load^^ 
(^^ 
ms^^ 
,^^ 
password^^ '
)^^' (
;^^( )
string`` 
alias`` 
=`` 
store``  
.``  !
Aliases``! (
.``( )
Cast``) -
<``- .
string``. 4
>``4 5
(``5 6
)``6 7
.``7 8
First``8 =
(``= >
)``> ?
;``? @
X509Certificateaa 
certaa  
=aa! "
storeaa# (
.aa( )
GetCertificateaa) 7
(aa7 8
aliasaa8 =
)aa= >
.aa> ?
Certificateaa? J
;aaJ K"
AsymmetricKeyParameterbb "
privKeybb# *
=bb+ ,
storebb- 2
.bb2 3
GetKeybb3 9
(bb9 :
aliasbb: ?
)bb? @
.bb@ A
KeybbA D
;bbD E
returndd 
Tupledd 
.dd 
Createdd 
(dd  
certdd  $
,dd$ %
privKeydd& -
)dd- .
;dd. /
}ee 	
}ff 
}gg 
û<
KC:\code\bc-xml-security\refactoring\src\AncestralNamespaceContextManager.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
abstract 
class ,
 AncestralNamespaceContextManager <
{ 
internal 
	ArrayList 
_ancestorStack )
=* +
new, /
	ArrayList0 9
(9 :
): ;
;; <
internal 
NamespaceFrame 

GetScopeAt  *
(* +
int+ .
i/ 0
)0 1
{ 	
return 
( 
NamespaceFrame "
)" #
_ancestorStack# 1
[1 2
i2 3
]3 4
;4 5
} 	
internal 
NamespaceFrame 
GetCurrentScope  /
(/ 0
)0 1
{ 	
return 

GetScopeAt 
( 
_ancestorStack ,
., -
Count- 2
-3 4
$num5 6
)6 7
;7 8
} 	
	protected 
XmlAttribute 9
-GetNearestRenderedNamespaceWithMatchingPrefix L
(L M
stringM S
nsPrefixT \
,\ ]
out^ a
intb e
depthf k
)k l
{ 	
XmlAttribute 
attr 
= 
null  $
;$ %
depth 
= 
- 
$num 
; 
for 
( 
int 
i 
= 
_ancestorStack '
.' (
Count( -
-. /
$num0 1
;1 2
i3 4
>=5 7
$num8 9
;9 :
i; <
--< >
)> ?
{   
if!! 
(!! 
(!! 
attr!! 
=!! 

GetScopeAt!! &
(!!& '
i!!' (
)!!( )
.!!) *
GetRendered!!* 5
(!!5 6
nsPrefix!!6 >
)!!> ?
)!!? @
!=!!A C
null!!D H
)!!H I
{"" 
depth## 
=## 
i## 
;## 
return$$ 
attr$$ 
;$$  
}%% 
}&& 
return'' 
null'' 
;'' 
}(( 	
	protected** 
XmlAttribute** ;
/GetNearestUnrenderedNamespaceWithMatchingPrefix** N
(**N O
string**O U
nsPrefix**V ^
,**^ _
out**` c
int**d g
depth**h m
)**m n
{++ 	
XmlAttribute,, 
attr,, 
=,, 
null,,  $
;,,$ %
depth-- 
=-- 
--- 
$num-- 
;-- 
for.. 
(.. 
int.. 
i.. 
=.. 
_ancestorStack.. '
...' (
Count..( -
-... /
$num..0 1
;..1 2
i..3 4
>=..5 7
$num..8 9
;..9 :
i..; <
--..< >
)..> ?
{// 
if00 
(00 
(00 
attr00 
=00 

GetScopeAt00 &
(00& '
i00' (
)00( )
.00) *
GetUnrendered00* 7
(007 8
nsPrefix008 @
)00@ A
)00A B
!=00C E
null00F J
)00J K
{11 
depth22 
=22 
i22 
;22 
return33 
attr33 
;33  
}44 
}55 
return66 
null66 
;66 
}77 	
internal99 
void99 
EnterElementContext99 )
(99) *
)99* +
{:: 	
_ancestorStack;; 
.;; 
Add;; 
(;; 
new;; "
NamespaceFrame;;# 1
(;;1 2
);;2 3
);;3 4
;;;4 5
}<< 	
internal>> 
void>> 
ExitElementContext>> (
(>>( )
)>>) *
{?? 	
_ancestorStack@@ 
.@@ 
RemoveAt@@ #
(@@# $
_ancestorStack@@$ 2
.@@2 3
Count@@3 8
-@@9 :
$num@@; <
)@@< =
;@@= >
}AA 	
internalCC 
abstractCC 
voidCC 
TrackNamespaceNodeCC 1
(CC1 2
XmlAttributeCC2 >
attrCC? C
,CCC D

SortedListCCE O
nsListToRenderCCP ^
,CC^ _
	HashtableCC` i
nsLocallyDeclaredCCj {
)CC{ |
;CC| }
internalDD 
abstractDD 
voidDD !
TrackXmlNamespaceNodeDD 4
(DD4 5
XmlAttributeDD5 A
attrDDB F
,DDF G

SortedListDDH R
nsListToRenderDDS a
,DDa b

SortedListDDc m
attrListToRenderDDn ~
,DD~ 
	Hashtable
DDÄ â
nsLocallyDeclared
DDä õ
)
DDõ ú
;
DDú ù
internalEE 
abstractEE 
voidEE !
GetNamespacesToRenderEE 4
(EE4 5

XmlElementEE5 ?
elementEE@ G
,EEG H

SortedListEEI S
attrListToRenderEET d
,EEd e

SortedListEEf p
nsListToRenderEEq 
,	EE Ä
	Hashtable
EEÅ ä
nsLocallyDeclared
EEã ú
)
EEú ù
;
EEù û
internalGG 
voidGG $
LoadUnrenderedNamespacesGG .
(GG. /
	HashtableGG/ 8
nsLocallyDeclaredGG9 J
)GGJ K
{HH 	
objectII 
[II 
]II 
attrsII 
=II 
newII  
objectII! '
[II' (
nsLocallyDeclaredII( 9
.II9 :
CountII: ?
]II? @
;II@ A
nsLocallyDeclaredJJ 
.JJ 
ValuesJJ $
.JJ$ %
CopyToJJ% +
(JJ+ ,
attrsJJ, 1
,JJ1 2
$numJJ3 4
)JJ4 5
;JJ5 6
foreachKK 
(KK 
objectKK 
attrKK  
inKK! #
attrsKK$ )
)KK) *
{LL 
AddUnrenderedMM 
(MM 
(MM 
XmlAttributeMM +
)MM+ ,
attrMM, 0
)MM0 1
;MM1 2
}NN 
}OO 	
internalQQ 
voidQQ "
LoadRenderedNamespacesQQ ,
(QQ, -

SortedListQQ- 7
nsRenderedListQQ8 F
)QQF G
{RR 	
foreachSS 
(SS 
objectSS 
attrSS  
inSS! #
nsRenderedListSS$ 2
.SS2 3

GetKeyListSS3 =
(SS= >
)SS> ?
)SS? @
{TT 
AddRenderedUU 
(UU 
(UU 
XmlAttributeUU )
)UU) *
attrUU* .
)UU. /
;UU/ 0
}VV 
}WW 	
internalYY 
voidYY 
AddRenderedYY !
(YY! "
XmlAttributeYY" .
attrYY/ 3
)YY3 4
{ZZ 	
GetCurrentScope[[ 
([[ 
)[[ 
.[[ 
AddRendered[[ )
([[) *
attr[[* .
)[[. /
;[[/ 0
}\\ 	
internal^^ 
void^^ 
AddUnrendered^^ #
(^^# $
XmlAttribute^^$ 0
attr^^1 5
)^^5 6
{__ 	
GetCurrentScope`` 
(`` 
)`` 
.`` 
AddUnrendered`` +
(``+ ,
attr``, 0
)``0 1
;``1 2
}aa 	
}bb 
}cc ﬁ
=C:\code\bc-xml-security\refactoring\src\AttributeSortOrder.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
AttributeSortOrder %
:& '
	IComparer( 1
{ 
internal 
AttributeSortOrder #
(# $
)$ %
{& '
}( )
public 
int 
Compare 
( 
object !
a" #
,# $
object% +
b, -
)- .
{ 	
XmlNode 
nodeA 
= 
a 
as  
XmlNode! (
;( )
XmlNode 
nodeB 
= 
b 
as  
XmlNode! (
;( )
if 
( 
( 
nodeA 
== 
null 
) 
||  "
(# $
nodeB$ )
==* ,
null- 1
)1 2
)2 3
throw 
new 
ArgumentException +
(+ ,
), -
;- .
int 
namespaceCompare  
=! "
string# )
.) *
CompareOrdinal* 8
(8 9
nodeA9 >
.> ?
NamespaceURI? K
,K L
nodeBM R
.R S
NamespaceURIS _
)_ `
;` a
if 
( 
namespaceCompare  
!=! #
$num$ %
)% &
return' -
namespaceCompare. >
;> ?
return 
string 
. 
CompareOrdinal (
(( )
nodeA) .
.. /
	LocalName/ 8
,8 9
nodeB: ?
.? @
	LocalName@ I
)I J
;J K
} 	
} 
} ßL
OC:\code\bc-xml-security\refactoring\src\C14NAncestralNamespaceContextManager.cs
	namespace

 	
Org


 
.

 
BouncyCastle

 
.

 
Crypto

 !
.

! "
Xml

" %
{ 
internal 
class 0
$C14NAncestralNamespaceContextManager 7
:8 9,
 AncestralNamespaceContextManager: Z
{ 
internal 0
$C14NAncestralNamespaceContextManager 5
(5 6
)6 7
{8 9
}: ;
private 
void  
GetNamespaceToRender )
() *
string* 0
nsPrefix1 9
,9 :

SortedList; E
attrListToRenderF V
,V W

SortedListX b
nsListToRenderc q
,q r
	Hashtables |
nsLocallyDeclared	} é
)
é è
{ 	
foreach 
( 
object 
a 
in  
nsListToRender! /
./ 0

GetKeyList0 :
(: ;
); <
)< =
{ 
if 
( 
Utils 
. 
HasNamespacePrefix ,
(, -
(- .
XmlAttribute. :
): ;
a; <
,< =
nsPrefix> F
)F G
)G H
return 
; 
} 
foreach 
( 
object 
a 
in  
attrListToRender! 1
.1 2

GetKeyList2 <
(< =
)= >
)> ?
{ 
if 
( 
( 
( 
XmlAttribute "
)" #
a# $
)$ %
.% &
	LocalName& /
./ 0
Equals0 6
(6 7
nsPrefix7 ?
)? @
)@ A
return 
; 
} 
int 
rDepth 
; 
XmlAttribute   
local   
=    
(  ! "
XmlAttribute  " .
)  . /
nsLocallyDeclared  / @
[  @ A
nsPrefix  A I
]  I J
;  J K
XmlAttribute!! 

rAncestral!! #
=!!$ %9
-GetNearestRenderedNamespaceWithMatchingPrefix!!& S
(!!S T
nsPrefix!!T \
,!!\ ]
out!!^ a
rDepth!!b h
)!!h i
;!!i j
if"" 
("" 
local"" 
!="" 
null"" 
)"" 
{## 
if$$ 
($$ 
Utils$$ 
.$$ '
IsNonRedundantNamespaceDecl$$ 5
($$5 6
local$$6 ;
,$$; <

rAncestral$$= G
)$$G H
)$$H I
{%% 
nsLocallyDeclared&& %
.&&% &
Remove&&& ,
(&&, -
nsPrefix&&- 5
)&&5 6
;&&6 7
if'' 
('' 
Utils'' 
.'' 
IsXmlNamespaceNode'' 0
(''0 1
local''1 6
)''6 7
)''7 8
attrListToRender(( (
.((( )
Add(() ,
(((, -
local((- 2
,((2 3
null((4 8
)((8 9
;((9 :
else)) 
nsListToRender** &
.**& '
Add**' *
(*** +
local**+ 0
,**0 1
null**2 6
)**6 7
;**7 8
}++ 
},, 
else-- 
{.. 
int// 
uDepth// 
;// 
XmlAttribute00 

uAncestral00 '
=00( );
/GetNearestUnrenderedNamespaceWithMatchingPrefix00* Y
(00Y Z
nsPrefix00Z b
,00b c
out00d g
uDepth00h n
)00n o
;00o p
if11 
(11 

uAncestral11 
!=11 !
null11" &
&&11' )
uDepth11* 0
>111 2
rDepth113 9
&&11: <
Utils11= B
.11B C'
IsNonRedundantNamespaceDecl11C ^
(11^ _

uAncestral11_ i
,11i j

rAncestral11k u
)11u v
)11v w
{22 
if33 
(33 
Utils33 
.33 
IsXmlNamespaceNode33 0
(330 1

uAncestral331 ;
)33; <
)33< =
attrListToRender44 (
.44( )
Add44) ,
(44, -

uAncestral44- 7
,447 8
null449 =
)44= >
;44> ?
else55 
nsListToRender66 &
.66& '
Add66' *
(66* +

uAncestral66+ 5
,665 6
null667 ;
)66; <
;66< =
}77 
}88 
}99 	
internal;; 
override;; 
void;; !
GetNamespacesToRender;; 4
(;;4 5

XmlElement;;5 ?
element;;@ G
,;;G H

SortedList;;I S
attrListToRender;;T d
,;;d e

SortedList;;f p
nsListToRender;;q 
,	;; Ä
	Hashtable
;;Å ä
nsLocallyDeclared
;;ã ú
)
;;ú ù
{<< 	
XmlAttribute== 
attrib== 
===  !
null==" &
;==& '
object>> 
[>> 
]>> 
attrs>> 
=>> 
new>>  
object>>! '
[>>' (
nsLocallyDeclared>>( 9
.>>9 :
Count>>: ?
]>>? @
;>>@ A
nsLocallyDeclared?? 
.?? 
Values?? $
.??$ %
CopyTo??% +
(??+ ,
attrs??, 1
,??1 2
$num??3 4
)??4 5
;??5 6
foreach@@ 
(@@ 
object@@ 
a@@ 
in@@  
attrs@@! &
)@@& '
{AA 
attribBB 
=BB 
(BB 
XmlAttributeBB &
)BB& '
aBB' (
;BB( )
intCC 
rDepthCC 
;CC 
XmlAttributeDD 

rAncestralDD '
=DD( )9
-GetNearestRenderedNamespaceWithMatchingPrefixDD* W
(DDW X
UtilsDDX ]
.DD] ^
GetNamespacePrefixDD^ p
(DDp q
attribDDq w
)DDw x
,DDx y
outDDz }
rDepth	DD~ Ñ
)
DDÑ Ö
;
DDÖ Ü
ifEE 
(EE 
UtilsEE 
.EE '
IsNonRedundantNamespaceDeclEE 5
(EE5 6
attribEE6 <
,EE< =

rAncestralEE> H
)EEH I
)EEI J
{FF 
nsLocallyDeclaredGG %
.GG% &
RemoveGG& ,
(GG, -
UtilsGG- 2
.GG2 3
GetNamespacePrefixGG3 E
(GGE F
attribGGF L
)GGL M
)GGM N
;GGN O
ifHH 
(HH 
UtilsHH 
.HH 
IsXmlNamespaceNodeHH 0
(HH0 1
attribHH1 7
)HH7 8
)HH8 9
attrListToRenderII (
.II( )
AddII) ,
(II, -
attribII- 3
,II3 4
nullII5 9
)II9 :
;II: ;
elseJJ 
nsListToRenderKK &
.KK& '
AddKK' *
(KK* +
attribKK+ 1
,KK1 2
nullKK3 7
)KK7 8
;KK8 9
}LL 
}MM 
forOO 
(OO 
intOO 
iOO 
=OO 
_ancestorStackOO '
.OO' (
CountOO( -
-OO. /
$numOO0 1
;OO1 2
iOO3 4
>=OO5 7
$numOO8 9
;OO9 :
iOO; <
--OO< >
)OO> ?
{PP 
foreachQQ 
(QQ 
objectQQ 
aQQ  !
inQQ" $

GetScopeAtQQ% /
(QQ/ 0
iQQ0 1
)QQ1 2
.QQ2 3
GetUnrenderedQQ3 @
(QQ@ A
)QQA B
.QQB C
ValuesQQC I
)QQI J
{RR 
attribSS 
=SS 
(SS 
XmlAttributeSS *
)SS* +
aSS+ ,
;SS, -
ifTT 
(TT 
attribTT 
!=TT !
nullTT" &
)TT& ' 
GetNamespaceToRenderUU ,
(UU, -
UtilsUU- 2
.UU2 3
GetNamespacePrefixUU3 E
(UUE F
attribUUF L
)UUL M
,UUM N
attrListToRenderUUO _
,UU_ `
nsListToRenderUUa o
,UUo p
nsLocallyDeclared	UUq Ç
)
UUÇ É
;
UUÉ Ñ
}VV 
}WW 
}XX 	
internalZZ 
overrideZZ 
voidZZ 
TrackNamespaceNodeZZ 1
(ZZ1 2
XmlAttributeZZ2 >
attrZZ? C
,ZZC D

SortedListZZE O
nsListToRenderZZP ^
,ZZ^ _
	HashtableZZ` i
nsLocallyDeclaredZZj {
)ZZ{ |
{[[ 	
nsLocallyDeclared\\ 
.\\ 
Add\\ !
(\\! "
Utils\\" '
.\\' (
GetNamespacePrefix\\( :
(\\: ;
attr\\; ?
)\\? @
,\\@ A
attr\\B F
)\\F G
;\\G H
}]] 	
internal__ 
override__ 
void__ !
TrackXmlNamespaceNode__ 4
(__4 5
XmlAttribute__5 A
attr__B F
,__F G

SortedList__H R
nsListToRender__S a
,__a b

SortedList__c m
attrListToRender__n ~
,__~ 
	Hashtable
__Ä â
nsLocallyDeclared
__ä õ
)
__õ ú
{`` 	
nsLocallyDeclaredaa 
.aa 
Addaa !
(aa! "
Utilsaa" '
.aa' (
GetNamespacePrefixaa( :
(aa: ;
attraa; ?
)aa? @
,aa@ A
attraaB F
)aaF G
;aaG H
}bb 	
}cc 
}dd §&
EC:\code\bc-xml-security\refactoring\src\CanonicalizationDispatcher.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class &
CanonicalizationDispatcher -
{ 
private &
CanonicalizationDispatcher *
(* +
)+ ,
{- .
}/ 0
public 
static 
void 
Write  
(  !
XmlNode! (
node) -
,- .
StringBuilder/ <

strBuilder= G
,G H
DocPositionI T
docPosU [
,[ \,
 AncestralNamespaceContextManager] }
anc	~ Å
)
Å Ç
{ 	
if 
( 
node 
is  
ICanonicalizableNode ,
), -
{ 
( 
(  
ICanonicalizableNode &
)& '
node' +
)+ ,
., -
Write- 2
(2 3

strBuilder3 =
,= >
docPos? E
,E F
ancG J
)J K
;K L
} 
else 
{ 
WriteGenericNode  
(  !
node! %
,% &

strBuilder' 1
,1 2
docPos3 9
,9 :
anc; >
)> ?
;? @
} 
} 	
public 
static 
void 
WriteGenericNode +
(+ ,
XmlNode, 3
node4 8
,8 9
StringBuilder: G

strBuilderH R
,R S
DocPositionT _
docPos` f
,f g-
 AncestralNamespaceContextManager	h à
anc
â å
)
å ç
{   	
if!! 
(!! 
node!! 
==!! 
null!! 
)!! 
throw"" 
new"" !
ArgumentNullException"" /
(""/ 0
nameof""0 6
(""6 7
node""7 ;
)""; <
)""< =
;""= >
XmlNodeList$$ 

childNodes$$ "
=$$# $
node$$% )
.$$) *

ChildNodes$$* 4
;$$4 5
foreach%% 
(%% 
XmlNode%% 
	childNode%% &
in%%' )

childNodes%%* 4
)%%4 5
{&& 
Write'' 
('' 
	childNode'' 
,''  

strBuilder''! +
,''+ ,
docPos''- 3
,''3 4
anc''5 8
)''8 9
;''9 :
}(( 
})) 	
public++ 
static++ 
void++ 
	WriteHash++ $
(++$ %
XmlNode++% ,
node++- 1
,++1 2
IHash++3 8
hash++9 =
,++= >
DocPosition++? J
docPos++K Q
,++Q R,
 AncestralNamespaceContextManager++S s
anc++t w
)++w x
{,, 	
if-- 
(-- 
node-- 
is--  
ICanonicalizableNode-- ,
)--, -
{.. 
(// 
(//  
ICanonicalizableNode// &
)//& '
node//' +
)//+ ,
.//, -
	WriteHash//- 6
(//6 7
hash//7 ;
,//; <
docPos//= C
,//C D
anc//E H
)//H I
;//I J
}00 
else11 
{22  
WriteHashGenericNode33 $
(33$ %
node33% )
,33) *
hash33+ /
,33/ 0
docPos331 7
,337 8
anc339 <
)33< =
;33= >
}44 
}55 	
public77 
static77 
void77  
WriteHashGenericNode77 /
(77/ 0
XmlNode770 7
node778 <
,77< =
IHash77> C
hash77D H
,77H I
DocPosition77J U
docPos77V \
,77\ ],
 AncestralNamespaceContextManager77^ ~
anc	77 Ç
)
77Ç É
{88 	
if99 
(99 
node99 
==99 
null99 
)99 
throw:: 
new:: !
ArgumentNullException:: /
(::/ 0
nameof::0 6
(::6 7
node::7 ;
)::; <
)::< =
;::= >
XmlNodeList<< 

childNodes<< "
=<<# $
node<<% )
.<<) *

ChildNodes<<* 4
;<<4 5
foreach== 
(== 
XmlNode== 
	childNode== &
in==' )

childNodes==* 4
)==4 5
{>> 
	WriteHash?? 
(?? 
	childNode?? #
,??# $
hash??% )
,??) *
docPos??+ 1
,??1 2
anc??3 6
)??6 7
;??7 8
}@@ 
}AA 	
}BB 
}CC ´Y
7C:\code\bc-xml-security\refactoring\src\CanonicalXml.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
CanonicalXml 
{ 
private  
CanonicalXmlDocument $
_c14nDoc% -
;- .
private 0
$C14NAncestralNamespaceContextManager 4
_ancMgr5 <
;< =
internal 
CanonicalXml 
( 
Stream $
inputStream% 0
,0 1
bool2 6
includeComments7 F
,F G
XmlResolverH S
resolverT \
,\ ]
string^ d

strBaseUrie o
)o p
{ 	
if 
( 
inputStream 
== 
null #
)# $
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
inputStream7 B
)B C
)C D
;D E
_c14nDoc 
= 
new  
CanonicalXmlDocument /
(/ 0
true0 4
,4 5
includeComments6 E
)E F
;F G
_c14nDoc 
. 
XmlResolver  
=! "
resolver# +
;+ ,
_c14nDoc 
. 
Load 
( 
Utils 
.  !
PreProcessStreamInput  5
(5 6
inputStream6 A
,A B
resolverC K
,K L

strBaseUriM W
)W X
)X Y
;Y Z
_ancMgr 
= 
new 0
$C14NAncestralNamespaceContextManager >
(> ?
)? @
;@ A
}   	
internal"" 
CanonicalXml"" 
("" 
XmlDocument"" )
document""* 2
,""2 3
XmlResolver""4 ?
resolver""@ H
)""H I
:""J K
this""L P
(""P Q
document""Q Y
,""Y Z
resolver""[ c
,""c d
false""e j
)""j k
{""l m
}""n o
internal## 
CanonicalXml## 
(## 
XmlDocument## )
document##* 2
,##2 3
XmlResolver##4 ?
resolver##@ H
,##H I
bool##J N
includeComments##O ^
)##^ _
{$$ 	
if%% 
(%% 
document%% 
==%% 
null%%  
)%%  !
throw&& 
new&& !
ArgumentNullException&& /
(&&/ 0
nameof&&0 6
(&&6 7
document&&7 ?
)&&? @
)&&@ A
;&&A B
_c14nDoc(( 
=(( 
new((  
CanonicalXmlDocument(( /
(((/ 0
true((0 4
,((4 5
includeComments((6 E
)((E F
;((F G
_c14nDoc)) 
.)) 
XmlResolver))  
=))! "
resolver))# +
;))+ ,
_c14nDoc** 
.** 
Load** 
(** 
new** 
XmlNodeReader** +
(**+ ,
document**, 4
)**4 5
)**5 6
;**6 7
_ancMgr++ 
=++ 
new++ 0
$C14NAncestralNamespaceContextManager++ >
(++> ?
)++? @
;++@ A
},, 	
internal.. 
CanonicalXml.. 
(.. 
XmlNodeList.. )
nodeList..* 2
,..2 3
XmlResolver..4 ?
resolver..@ H
,..H I
bool..J N
includeComments..O ^
)..^ _
{// 	
if00 
(00 
nodeList00 
==00 
null00  
)00  !
throw11 
new11 !
ArgumentNullException11 /
(11/ 0
nameof110 6
(116 7
nodeList117 ?
)11? @
)11@ A
;11A B
XmlDocument33 
doc33 
=33 
Utils33 #
.33# $
GetOwnerDocument33$ 4
(334 5
nodeList335 =
)33= >
;33> ?
if44 
(44 
doc44 
==44 
null44 
)44 
throw55 
new55 
ArgumentException55 +
(55+ ,
nameof55, 2
(552 3
nodeList553 ;
)55; <
)55< =
;55= >
_c14nDoc77 
=77 
new77  
CanonicalXmlDocument77 /
(77/ 0
false770 5
,775 6
includeComments777 F
)77F G
;77G H
_c14nDoc88 
.88 
XmlResolver88  
=88! "
resolver88# +
;88+ ,
_c14nDoc99 
.99 
Load99 
(99 
new99 
XmlNodeReader99 +
(99+ ,
doc99, /
)99/ 0
)990 1
;991 2
_ancMgr:: 
=:: 
new:: 0
$C14NAncestralNamespaceContextManager:: >
(::> ?
)::? @
;::@ A&
MarkInclusionStateForNodes<< &
(<<& '
nodeList<<' /
,<</ 0
doc<<1 4
,<<4 5
_c14nDoc<<6 >
)<<> ?
;<<? @
}== 	
private?? 
static?? 
void?? 
MarkNodeAsIncluded?? .
(??. /
XmlNode??/ 6
node??7 ;
)??; <
{@@ 	
ifAA 
(AA 
nodeAA 
isAA  
ICanonicalizableNodeAA ,
)AA, -
(BB 
(BB  
ICanonicalizableNodeBB &
)BB& '
nodeBB' +
)BB+ ,
.BB, -
IsInNodeSetBB- 8
=BB9 :
trueBB; ?
;BB? @
}CC 	
privateEE 
staticEE 
voidEE &
MarkInclusionStateForNodesEE 6
(EE6 7
XmlNodeListEE7 B
nodeListEEC K
,EEK L
XmlDocumentEEM X
	inputRootEEY b
,EEb c
XmlDocumentEEd o
rootEEp t
)EEt u
{FF 	 
CanonicalXmlNodeListGG  
elementListGG! ,
=GG- .
newGG/ 2 
CanonicalXmlNodeListGG3 G
(GGG H
)GGH I
;GGI J 
CanonicalXmlNodeListHH   
elementListCanonicalHH! 5
=HH6 7
newHH8 ; 
CanonicalXmlNodeListHH< P
(HHP Q
)HHQ R
;HHR S
elementListII 
.II 
AddII 
(II 
	inputRootII %
)II% &
;II& ' 
elementListCanonicalJJ  
.JJ  !
AddJJ! $
(JJ$ %
rootJJ% )
)JJ) *
;JJ* +
intKK 
indexKK 
=KK 
$numKK 
;KK 
doMM 
{NN 
XmlNodeOO 
currentNodeOO #
=OO$ %
(OO& '
XmlNodeOO' .
)OO. /
elementListOO/ :
[OO: ;
indexOO; @
]OO@ A
;OOA B
XmlNodePP  
currentNodeCanonicalPP ,
=PP- .
(PP/ 0
XmlNodePP0 7
)PP7 8 
elementListCanonicalPP8 L
[PPL M
indexPPM R
]PPR S
;PPS T
XmlNodeListQQ 

childNodesQQ &
=QQ' (
currentNodeQQ) 4
.QQ4 5

ChildNodesQQ5 ?
;QQ? @
XmlNodeListRR 
childNodesCanonicalRR /
=RR0 1 
currentNodeCanonicalRR2 F
.RRF G

ChildNodesRRG Q
;RRQ R
forSS 
(SS 
intSS 
iSS 
=SS 
$numSS 
;SS 
iSS  !
<SS" #

childNodesSS$ .
.SS. /
CountSS/ 4
;SS4 5
iSS6 7
++SS7 9
)SS9 :
{TT 
elementListUU 
.UU  
AddUU  #
(UU# $

childNodesUU$ .
[UU. /
iUU/ 0
]UU0 1
)UU1 2
;UU2 3 
elementListCanonicalVV (
.VV( )
AddVV) ,
(VV, -
childNodesCanonicalVV- @
[VV@ A
iVVA B
]VVB C
)VVC D
;VVD E
ifXX 
(XX 
UtilsXX 
.XX 

NodeInListXX (
(XX( )

childNodesXX) 3
[XX3 4
iXX4 5
]XX5 6
,XX6 7
nodeListXX8 @
)XX@ A
)XXA B
{YY 
MarkNodeAsIncludedZZ *
(ZZ* +
childNodesCanonicalZZ+ >
[ZZ> ?
iZZ? @
]ZZ@ A
)ZZA B
;ZZB C
}[[ "
XmlAttributeCollection]] *
attribNodes]]+ 6
=]]7 8

childNodes]]9 C
[]]C D
i]]D E
]]]E F
.]]F G

Attributes]]G Q
;]]Q R
if^^ 
(^^ 
attribNodes^^ #
!=^^$ &
null^^' +
)^^+ ,
{__ 
for`` 
(`` 
int``  
j``! "
=``# $
$num``% &
;``& '
j``( )
<``* +
attribNodes``, 7
.``7 8
Count``8 =
;``= >
j``? @
++``@ B
)``B C
{aa 
ifbb 
(bb  
Utilsbb  %
.bb% &

NodeInListbb& 0
(bb0 1
attribNodesbb1 <
[bb< =
jbb= >
]bb> ?
,bb? @
nodeListbbA I
)bbI J
)bbJ K
{cc 
MarkNodeAsIncludeddd  2
(dd2 3
childNodesCanonicaldd3 F
[ddF G
iddG H
]ddH I
.ddI J

AttributesddJ T
.ddT U
ItemddU Y
(ddY Z
jddZ [
)dd[ \
)dd\ ]
;dd] ^
}ee 
}ff 
}gg 
}hh 
indexii 
++ii 
;ii 
}jj 
whilejj 
(jj 
indexjj 
<jj 
elementListjj (
.jj( )
Countjj) .
)jj. /
;jj/ 0
}kk 	
internalmm 
bytemm 
[mm 
]mm 
GetBytesmm  
(mm  !
)mm! "
{nn 	
StringBuilderoo 
sboo 
=oo 
newoo "
StringBuilderoo# 0
(oo0 1
)oo1 2
;oo2 3
_c14nDocpp 
.pp 
Writepp 
(pp 
sbpp 
,pp 
DocPositionpp *
.pp* +
BeforeRootElementpp+ <
,pp< =
_ancMgrpp> E
)ppE F
;ppF G
UTF8Encodingqq 
utf8qq 
=qq 
newqq  #
UTF8Encodingqq$ 0
(qq0 1
falseqq1 6
)qq6 7
;qq7 8
returnrr 
utf8rr 
.rr 
GetBytesrr  
(rr  !
sbrr! #
.rr# $
ToStringrr$ ,
(rr, -
)rr- .
)rr. /
;rr/ 0
}ss 	
internaluu 
voiduu 
GetDigestedBytesuu &
(uu& '
IHashuu' ,
signeruu- 3
)uu3 4
{vv 	
_c14nDocww 
.ww 
	WriteHashww 
(ww 
signerww %
,ww% &
DocPositionww' 2
.ww2 3
BeforeRootElementww3 D
,wwD E
_ancMgrwwF M
)wwM N
;wwN O
}xx 	
}yy 
}zz „ 
@C:\code\bc-xml-security\refactoring\src\CanonicalXmlAttribute.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class !
CanonicalXmlAttribute (
:) *
XmlAttribute+ 7
,7 8 
ICanonicalizableNode9 M
{ 
private 
bool 
_isInNodeSet !
;! "
public !
CanonicalXmlAttribute $
($ %
string% +
prefix, 2
,2 3
string4 :
	localName; D
,D E
stringF L
namespaceURIM Y
,Y Z
XmlDocument[ f
docg j
,j k
booll p)
defaultNodeSetInclusionState	q ç
)
ç é
: 
base 
( 
prefix 
, 
	localName $
,$ %
namespaceURI& 2
,2 3
doc4 7
)7 8
{ 	
IsInNodeSet 
= (
defaultNodeSetInclusionState 6
;6 7
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	

strBuilder   
.   
Append   
(   
$str   !
+  " #
Name  $ (
+  ) *
$str  + 0
)  0 1
;  1 2

strBuilder!! 
.!! 
Append!! 
(!! 
Utils!! #
.!!# $ 
EscapeAttributeValue!!$ 8
(!!8 9
Value!!9 >
)!!> ?
)!!? @
;!!@ A

strBuilder"" 
."" 
Append"" 
("" 
$str"" "
)""" #
;""# $
}## 	
public%% 
void%% 
	WriteHash%% 
(%% 
IHash%% #
hash%%$ (
,%%( )
DocPosition%%* 5
docPos%%6 <
,%%< =,
 AncestralNamespaceContextManager%%> ^
anc%%_ b
)%%b c
{&& 	
UTF8Encoding'' 
utf8'' 
='' 
new''  #
UTF8Encoding''$ 0
(''0 1
false''1 6
)''6 7
;''7 8
byte(( 
[(( 
](( 
rgbData(( 
=(( 
utf8(( !
.((! "
GetBytes((" *
(((* +
$str((+ .
+((/ 0
Name((1 5
+((6 7
$str((8 =
)((= >
;((> ?
hash)) 
.)) 
BlockUpdate)) 
()) 
rgbData)) $
,))$ %
$num))& '
,))' (
rgbData))) 0
.))0 1
Length))1 7
)))7 8
;))8 9
rgbData** 
=** 
utf8** 
.** 
GetBytes** #
(**# $
Utils**$ )
.**) * 
EscapeAttributeValue*** >
(**> ?
Value**? D
)**D E
)**E F
;**F G
hash++ 
.++ 
BlockUpdate++ 
(++ 
rgbData++ $
,++$ %
$num++& '
,++' (
rgbData++) 0
.++0 1
Length++1 7
)++7 8
;++8 9
rgbData,, 
=,, 
utf8,, 
.,, 
GetBytes,, #
(,,# $
$str,,$ (
),,( )
;,,) *
hash-- 
.-- 
BlockUpdate-- 
(-- 
rgbData-- $
,--$ %
$num--& '
,--' (
rgbData--) 0
.--0 1
Length--1 7
)--7 8
;--8 9
}.. 	
}// 
}00 «
CC:\code\bc-xml-security\refactoring\src\CanonicalXmlCDataSection.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class $
CanonicalXmlCDataSection +
:, -
XmlCDataSection. =
,= > 
ICanonicalizableNode? S
{ 
private 
bool 
_isInNodeSet !
;! "
public $
CanonicalXmlCDataSection '
(' (
string( .
data/ 3
,3 4
XmlDocument5 @
docA D
,D E
boolF J(
defaultNodeSetInclusionStateK g
)g h
:i j
basek o
(o p
datap t
,t u
docv y
)y z
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if 
( 
IsInNodeSet 
) 

strBuilder 
. 
Append !
(! "
Utils" '
.' (
EscapeCData( 3
(3 4
Data4 8
)8 9
)9 :
;: ;
}   	
public"" 
void"" 
	WriteHash"" 
("" 
IHash"" #
hash""$ (
,""( )
DocPosition""* 5
docPos""6 <
,""< =,
 AncestralNamespaceContextManager""> ^
anc""_ b
)""b c
{## 	
if$$ 
($$ 
IsInNodeSet$$ 
)$$ 
{%% 
UTF8Encoding&& 
utf8&& !
=&&" #
new&&$ '
UTF8Encoding&&( 4
(&&4 5
false&&5 :
)&&: ;
;&&; <
byte'' 
['' 
]'' 
rgbData'' 
=''  
utf8''! %
.''% &
GetBytes''& .
(''. /
Utils''/ 4
.''4 5
EscapeCData''5 @
(''@ A
Data''A E
)''E F
)''F G
;''G H
hash(( 
.(( 
BlockUpdate((  
(((  !
rgbData((! (
,((( )
$num((* +
,((+ ,
rgbData((- 4
.((4 5
Length((5 ;
)((; <
;((< =
})) 
}** 	
}++ 
},, √0
>C:\code\bc-xml-security\refactoring\src\CanonicalXmlComment.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
CanonicalXmlComment &
:' (

XmlComment) 3
,3 4 
ICanonicalizableNode5 I
{ 
private 
bool 
_isInNodeSet !
;! "
private 
bool 
_includeComments %
;% &
public 
CanonicalXmlComment "
(" #
string# )
comment* 1
,1 2
XmlDocument3 >
doc? B
,B C
boolD H(
defaultNodeSetInclusionStateI e
,e f
boolg k
includeCommentsl {
){ |
: 
base 
( 
comment 
, 
doc 
)  
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
_includeComments 
= 
includeComments .
;. /
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public   
bool   
IncludeComments   #
{!! 	
get"" 
{"" 
return"" 
_includeComments"" )
;"") *
}""+ ,
}## 	
public%% 
void%% 
Write%% 
(%% 
StringBuilder%% '

strBuilder%%( 2
,%%2 3
DocPosition%%4 ?
docPos%%@ F
,%%F G,
 AncestralNamespaceContextManager%%H h
anc%%i l
)%%l m
{&& 	
if'' 
('' 
!'' 
IsInNodeSet'' 
||'' 
!''  !
IncludeComments''! 0
)''0 1
return(( 
;(( 
if** 
(** 
docPos** 
==** 
DocPosition** %
.**% &
AfterRootElement**& 6
)**6 7

strBuilder++ 
.++ 
Append++ !
(++! "
(++" #
char++# '
)++' (
$num++( *
)++* +
;+++ ,

strBuilder,, 
.,, 
Append,, 
(,, 
$str,, $
),,$ %
;,,% &

strBuilder-- 
.-- 
Append-- 
(-- 
Value-- #
)--# $
;--$ %

strBuilder.. 
... 
Append.. 
(.. 
$str.. #
)..# $
;..$ %
if// 
(// 
docPos// 
==// 
DocPosition// %
.//% &
BeforeRootElement//& 7
)//7 8

strBuilder00 
.00 
Append00 !
(00! "
(00" #
char00# '
)00' (
$num00( *
)00* +
;00+ ,
}11 	
public33 
void33 
	WriteHash33 
(33 
IHash33 #
hash33$ (
,33( )
DocPosition33* 5
docPos336 <
,33< =,
 AncestralNamespaceContextManager33> ^
anc33_ b
)33b c
{44 	
if55 
(55 
!55 
IsInNodeSet55 
||55 
!55  !
IncludeComments55! 0
)550 1
return66 
;66 
UTF8Encoding88 
utf888 
=88 
new88  #
UTF8Encoding88$ 0
(880 1
false881 6
)886 7
;887 8
byte99 
[99 
]99 
rgbData99 
=99 
utf899 !
.99! "
GetBytes99" *
(99* +
$str99+ 6
)996 7
;997 8
if:: 
(:: 
docPos:: 
==:: 
DocPosition:: %
.::% &
AfterRootElement::& 6
)::6 7
hash;; 
.;; 
BlockUpdate;;  
(;;  !
rgbData;;! (
,;;( )
$num;;* +
,;;+ ,
rgbData;;- 4
.;;4 5
Length;;5 ;
);;; <
;;;< =
rgbData<< 
=<< 
utf8<< 
.<< 
GetBytes<< #
(<<# $
$str<<$ *
)<<* +
;<<+ ,
hash== 
.== 
BlockUpdate== 
(== 
rgbData== $
,==$ %
$num==& '
,==' (
rgbData==) 0
.==0 1
Length==1 7
)==7 8
;==8 9
rgbData>> 
=>> 
utf8>> 
.>> 
GetBytes>> #
(>># $
Value>>$ )
)>>) *
;>>* +
hash?? 
.?? 
BlockUpdate?? 
(?? 
rgbData?? $
,??$ %
$num??& '
,??' (
rgbData??) 0
.??0 1
Length??1 7
)??7 8
;??8 9
rgbData@@ 
=@@ 
utf8@@ 
.@@ 
GetBytes@@ #
(@@# $
$str@@$ )
)@@) *
;@@* +
hashAA 
.AA 
BlockUpdateAA 
(AA 
rgbDataAA $
,AA$ %
$numAA& '
,AA' (
rgbDataAA) 0
.AA0 1
LengthAA1 7
)AA7 8
;AA8 9
ifBB 
(BB 
docPosBB 
==BB 
DocPositionBB %
.BB% &
BeforeRootElementBB& 7
)BB7 8
{CC 
rgbDataDD 
=DD 
utf8DD 
.DD 
GetBytesDD '
(DD' (
$strDD( 3
)DD3 4
;DD4 5
hashEE 
.EE 
BlockUpdateEE  
(EE  !
rgbDataEE! (
,EE( )
$numEE* +
,EE+ ,
rgbDataEE- 4
.EE4 5
LengthEE5 ;
)EE; <
;EE< =
}FF 
}GG 	
}HH 
}II ÎK
?C:\code\bc-xml-security\refactoring\src\CanonicalXmlDocument.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class  
CanonicalXmlDocument '
:( )
XmlDocument* 5
,5 6 
ICanonicalizableNode7 K
{ 
private 
bool )
_defaultNodeSetInclusionState 2
;2 3
private 
bool 
_includeComments %
;% &
private 
bool 
_isInNodeSet !
;! "
public  
CanonicalXmlDocument #
(# $
bool$ ((
defaultNodeSetInclusionState) E
,E F
boolG K
includeCommentsL [
)[ \
:] ^
base_ c
(c d
)d e
{ 	
PreserveWhitespace 
=  
true! %
;% &
_includeComments 
= 
includeComments .
;. /
_isInNodeSet 
= )
_defaultNodeSetInclusionState 8
=9 :(
defaultNodeSetInclusionState; W
;W X
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
}   	
public"" 
void"" 
Write"" 
("" 
StringBuilder"" '

strBuilder""( 2
,""2 3
DocPosition""4 ?
docPos""@ F
,""F G,
 AncestralNamespaceContextManager""H h
anc""i l
)""l m
{## 	
docPos$$ 
=$$ 
DocPosition$$  
.$$  !
BeforeRootElement$$! 2
;$$2 3
foreach%% 
(%% 
XmlNode%% 
	childNode%% &
in%%' )

ChildNodes%%* 4
)%%4 5
{&& 
if'' 
('' 
	childNode'' 
.'' 
NodeType'' &
==''' )
XmlNodeType''* 5
.''5 6
Element''6 =
)''= >
{(( &
CanonicalizationDispatcher)) .
.)). /
Write))/ 4
())4 5
	childNode))5 >
,))> ?

strBuilder))@ J
,))J K
DocPosition))L W
.))W X
InRootElement))X e
,))e f
anc))g j
)))j k
;))k l
docPos** 
=** 
DocPosition** (
.**( )
AfterRootElement**) 9
;**9 :
}++ 
else,, 
{-- &
CanonicalizationDispatcher.. .
.... /
Write../ 4
(..4 5
	childNode..5 >
,..> ?

strBuilder..@ J
,..J K
docPos..L R
,..R S
anc..T W
)..W X
;..X Y
}// 
}00 
}11 	
public33 
void33 
	WriteHash33 
(33 
IHash33 #
signer33$ *
,33* +
DocPosition33, 7
docPos338 >
,33> ?,
 AncestralNamespaceContextManager33@ `
anc33a d
)33d e
{44 	
docPos55 
=55 
DocPosition55  
.55  !
BeforeRootElement55! 2
;552 3
foreach66 
(66 
XmlNode66 
	childNode66 &
in66' )

ChildNodes66* 4
)664 5
{77 
if88 
(88 
	childNode88 
.88 
NodeType88 &
==88' )
XmlNodeType88* 5
.885 6
Element886 =
)88= >
{99 &
CanonicalizationDispatcher:: .
.::. /
	WriteHash::/ 8
(::8 9
	childNode::9 B
,::B C
signer::D J
,::J K
DocPosition::L W
.::W X
InRootElement::X e
,::e f
anc::g j
)::j k
;::k l
docPos;; 
=;; 
DocPosition;; (
.;;( )
AfterRootElement;;) 9
;;;9 :
}<< 
else== 
{>> &
CanonicalizationDispatcher?? .
.??. /
	WriteHash??/ 8
(??8 9
	childNode??9 B
,??B C
signer??D J
,??J K
docPos??L R
,??R S
anc??T W
)??W X
;??X Y
}@@ 
}AA 
}BB 	
publicDD 
overrideDD 

XmlElementDD "
CreateElementDD# 0
(DD0 1
stringDD1 7
prefixDD8 >
,DD> ?
stringDD@ F
	localNameDDG P
,DDP Q
stringDDR X
namespaceURIDDY e
)DDe f
{EE 	
returnFF 
newFF 
CanonicalXmlElementFF *
(FF* +
prefixFF+ 1
,FF1 2
	localNameFF3 <
,FF< =
namespaceURIFF> J
,FFJ K
thisFFL P
,FFP Q)
_defaultNodeSetInclusionStateFFR o
)FFo p
;FFp q
}GG 	
publicII 
overrideII 
XmlAttributeII $
CreateAttributeII% 4
(II4 5
stringII5 ;
prefixII< B
,IIB C
stringIID J
	localNameIIK T
,IIT U
stringIIV \
namespaceURIII] i
)IIi j
{JJ 	
returnKK 
newKK !
CanonicalXmlAttributeKK ,
(KK, -
prefixKK- 3
,KK3 4
	localNameKK5 >
,KK> ?
namespaceURIKK@ L
,KKL M
thisKKN R
,KKR S)
_defaultNodeSetInclusionStateKKT q
)KKq r
;KKr s
}LL 	
	protectedNN 
overrideNN 
XmlAttributeNN '"
CreateDefaultAttributeNN( >
(NN> ?
stringNN? E
prefixNNF L
,NNL M
stringNNN T
	localNameNNU ^
,NN^ _
stringNN` f
namespaceURINNg s
)NNs t
{OO 	
returnPP 
newPP !
CanonicalXmlAttributePP ,
(PP, -
prefixPP- 3
,PP3 4
	localNamePP5 >
,PP> ?
namespaceURIPP@ L
,PPL M
thisPPN R
,PPR S)
_defaultNodeSetInclusionStatePPT q
)PPq r
;PPr s
}QQ 	
publicSS 
overrideSS 
XmlTextSS 
CreateTextNodeSS  .
(SS. /
stringSS/ 5
textSS6 :
)SS: ;
{TT 	
returnUU 
newUU 
CanonicalXmlTextUU '
(UU' (
textUU( ,
,UU, -
thisUU. 2
,UU2 3)
_defaultNodeSetInclusionStateUU4 Q
)UUQ R
;UUR S
}VV 	
publicXX 
overrideXX 
XmlWhitespaceXX %
CreateWhitespaceXX& 6
(XX6 7
stringXX7 =
prefixXX> D
)XXD E
{YY 	
returnZZ 
newZZ "
CanonicalXmlWhitespaceZZ -
(ZZ- .
prefixZZ. 4
,ZZ4 5
thisZZ6 :
,ZZ: ;)
_defaultNodeSetInclusionStateZZ< Y
)ZZY Z
;ZZZ [
}[[ 	
public]] 
override]] $
XmlSignificantWhitespace]] 0'
CreateSignificantWhitespace]]1 L
(]]L M
string]]M S
text]]T X
)]]X Y
{^^ 	
return__ 
new__ -
!CanonicalXmlSignificantWhitespace__ 8
(__8 9
text__9 =
,__= >
this__? C
,__C D)
_defaultNodeSetInclusionState__E b
)__b c
;__c d
}`` 	
publicbb 
overridebb $
XmlProcessingInstructionbb 0'
CreateProcessingInstructionbb1 L
(bbL M
stringbbM S
targetbbT Z
,bbZ [
stringbb\ b
databbc g
)bbg h
{cc 	
returndd 
newdd -
!CanonicalXmlProcessingInstructiondd 8
(dd8 9
targetdd9 ?
,dd? @
dataddA E
,ddE F
thisddG K
,ddK L)
_defaultNodeSetInclusionStateddM j
)ddj k
;ddk l
}ee 	
publicgg 
overridegg 

XmlCommentgg "
CreateCommentgg# 0
(gg0 1
stringgg1 7
datagg8 <
)gg< =
{hh 	
returnii 
newii 
CanonicalXmlCommentii *
(ii* +
dataii+ /
,ii/ 0
thisii1 5
,ii5 6)
_defaultNodeSetInclusionStateii7 T
,iiT U
_includeCommentsiiV f
)iif g
;iig h
}jj 	
publicll 
overridell 
XmlEntityReferencell *!
CreateEntityReferencell+ @
(ll@ A
stringllA G
namellH L
)llL M
{mm 	
returnnn 
newnn '
CanonicalXmlEntityReferencenn 2
(nn2 3
namenn3 7
,nn7 8
thisnn9 =
,nn= >)
_defaultNodeSetInclusionStatenn? \
)nn\ ]
;nn] ^
}oo 	
publicqq 
overrideqq 
XmlCDataSectionqq '
CreateCDataSectionqq( :
(qq: ;
stringqq; A
dataqqB F
)qqF G
{rr 	
returnss 
newss $
CanonicalXmlCDataSectionss /
(ss/ 0
datass0 4
,ss4 5
thisss6 :
,ss: ;)
_defaultNodeSetInclusionStatess< Y
)ssY Z
;ssZ [
}tt 	
}uu 
}vv ¸á
>C:\code\bc-xml-security\refactoring\src\CanonicalXmlElement.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
CanonicalXmlElement &
:' (

XmlElement) 3
,3 4 
ICanonicalizableNode5 I
{ 
private 
bool 
_isInNodeSet !
;! "
public 
CanonicalXmlElement "
(" #
string# )
prefix* 0
,0 1
string2 8
	localName9 B
,B C
stringD J
namespaceURIK W
,W X
XmlDocumentY d
doce h
,h i
boolj n)
defaultNodeSetInclusionState	o ã
)
ã å
: 
base 
( 
prefix 
, 
	localName $
,$ %
namespaceURI& 2
,2 3
doc4 7
)7 8
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
	Hashtable   
nsLocallyDeclared   '
=  ( )
new  * -
	Hashtable  . 7
(  7 8
)  8 9
;  9 :

SortedList!! 
nsListToRender!! %
=!!& '
new!!( +

SortedList!!, 6
(!!6 7
new!!7 :
NamespaceSortOrder!!; M
(!!M N
)!!N O
)!!O P
;!!P Q

SortedList"" 
attrListToRender"" '
=""( )
new""* -

SortedList"". 8
(""8 9
new""9 <
AttributeSortOrder""= O
(""O P
)""P Q
)""Q R
;""R S"
XmlAttributeCollection$$ "
attrList$$# +
=$$, -

Attributes$$. 8
;$$8 9
if%% 
(%% 
attrList%% 
!=%% 
null%%  
)%%  !
{&& 
foreach'' 
('' 
XmlAttribute'' %
attr''& *
in''+ -
attrList''. 6
)''6 7
{(( 
if)) 
()) 
()) 
()) !
CanonicalXmlAttribute)) /
)))/ 0
attr))0 4
)))4 5
.))5 6
IsInNodeSet))6 A
||))B D
Utils))E J
.))J K
IsNamespaceNode))K Z
())Z [
attr))[ _
)))_ `
||))a c
Utils))d i
.))i j
IsXmlNamespaceNode))j |
())| }
attr	))} Å
)
))Å Ç
)
))Ç É
{** 
if++ 
(++ 
Utils++ !
.++! "
IsNamespaceNode++" 1
(++1 2
attr++2 6
)++6 7
)++7 8
{,, 
anc-- 
.--  
TrackNamespaceNode--  2
(--2 3
attr--3 7
,--7 8
nsListToRender--9 G
,--G H
nsLocallyDeclared--I Z
)--Z [
;--[ \
}.. 
else// 
if// 
(//  !
Utils//! &
.//& '
IsXmlNamespaceNode//' 9
(//9 :
attr//: >
)//> ?
)//? @
{00 
anc11 
.11  !
TrackXmlNamespaceNode11  5
(115 6
attr116 :
,11: ;
nsListToRender11< J
,11J K
attrListToRender11L \
,11\ ]
nsLocallyDeclared11^ o
)11o p
;11p q
}22 
else33 
if33 
(33  !
IsInNodeSet33! ,
)33, -
{44 
attrListToRender55 ,
.55, -
Add55- 0
(550 1
attr551 5
,555 6
null557 ;
)55; <
;55< =
}66 
}77 
}88 
}99 
if;; 
(;; 
!;; 
Utils;; 
.;;  
IsCommittedNamespace;; +
(;;+ ,
this;;, 0
,;;0 1
Prefix;;2 8
,;;8 9
NamespaceURI;;: F
);;F G
);;G H
{<< 
string== 
name== 
=== 
(== 
(==  
Prefix==  &
.==& '
Length==' -
>==. /
$num==0 1
)==1 2
?==3 4
$str==5 <
+=== >
$str==? B
+==C D
Prefix==E K
:==L M
$str==N U
)==U V
;==V W
XmlAttribute>> 
nsattrib>> %
=>>& '
(>>( )
XmlAttribute>>) 5
)>>5 6
OwnerDocument>>6 C
.>>C D
CreateAttribute>>D S
(>>S T
name>>T X
)>>X Y
;>>Y Z
nsattrib?? 
.?? 
Value?? 
=??  
NamespaceURI??! -
;??- .
anc@@ 
.@@ 
TrackNamespaceNode@@ &
(@@& '
nsattrib@@' /
,@@/ 0
nsListToRender@@1 ?
,@@? @
nsLocallyDeclared@@A R
)@@R S
;@@S T
}AA 
ifCC 
(CC 
IsInNodeSetCC 
)CC 
{DD 
ancEE 
.EE !
GetNamespacesToRenderEE )
(EE) *
thisEE* .
,EE. /
attrListToRenderEE0 @
,EE@ A
nsListToRenderEEB P
,EEP Q
nsLocallyDeclaredEER c
)EEc d
;EEd e

strBuilderGG 
.GG 
AppendGG !
(GG! "
$strGG" %
+GG& '
NameGG( ,
)GG, -
;GG- .
foreachHH 
(HH 
objectHH 
attrHH  $
inHH% '
nsListToRenderHH( 6
.HH6 7

GetKeyListHH7 A
(HHA B
)HHB C
)HHC D
{II 
(JJ 
attrJJ 
asJJ !
CanonicalXmlAttributeJJ 2
)JJ2 3
.JJ3 4
WriteJJ4 9
(JJ9 :

strBuilderJJ: D
,JJD E
docPosJJF L
,JJL M
ancJJN Q
)JJQ R
;JJR S
}KK 
foreachLL 
(LL 
objectLL 
attrLL  $
inLL% '
attrListToRenderLL( 8
.LL8 9

GetKeyListLL9 C
(LLC D
)LLD E
)LLE F
{MM 
(NN 
attrNN 
asNN !
CanonicalXmlAttributeNN 2
)NN2 3
.NN3 4
WriteNN4 9
(NN9 :

strBuilderNN: D
,NND E
docPosNNF L
,NNL M
ancNNN Q
)NNQ R
;NNR S
}OO 

strBuilderPP 
.PP 
AppendPP !
(PP! "
$strPP" %
)PP% &
;PP& '
}QQ 
ancSS 
.SS 
EnterElementContextSS #
(SS# $
)SS$ %
;SS% &
ancTT 
.TT $
LoadUnrenderedNamespacesTT (
(TT( )
nsLocallyDeclaredTT) :
)TT: ;
;TT; <
ancUU 
.UU "
LoadRenderedNamespacesUU &
(UU& '
nsListToRenderUU' 5
)UU5 6
;UU6 7
XmlNodeListWW 

childNodesWW "
=WW# $

ChildNodesWW% /
;WW/ 0
foreachXX 
(XX 
XmlNodeXX 
	childNodeXX &
inXX' )

childNodesXX* 4
)XX4 5
{YY &
CanonicalizationDispatcherZZ *
.ZZ* +
WriteZZ+ 0
(ZZ0 1
	childNodeZZ1 :
,ZZ: ;

strBuilderZZ< F
,ZZF G
docPosZZH N
,ZZN O
ancZZP S
)ZZS T
;ZZT U
}[[ 
anc]] 
.]] 
ExitElementContext]] "
(]]" #
)]]# $
;]]$ %
if__ 
(__ 
IsInNodeSet__ 
)__ 
{`` 

strBuilderaa 
.aa 
Appendaa !
(aa! "
$straa" &
+aa' (
Nameaa) -
+aa. /
$straa0 3
)aa3 4
;aa4 5
}bb 
}cc 	
publicee 
voidee 
	WriteHashee 
(ee 
IHashee #
hashee$ (
,ee( )
DocPositionee* 5
docPosee6 <
,ee< =,
 AncestralNamespaceContextManageree> ^
ancee_ b
)eeb c
{ff 	
	Hashtablegg 
nsLocallyDeclaredgg '
=gg( )
newgg* -
	Hashtablegg. 7
(gg7 8
)gg8 9
;gg9 :

SortedListhh 
nsListToRenderhh %
=hh& '
newhh( +

SortedListhh, 6
(hh6 7
newhh7 :
NamespaceSortOrderhh; M
(hhM N
)hhN O
)hhO P
;hhP Q

SortedListii 
attrListToRenderii '
=ii( )
newii* -

SortedListii. 8
(ii8 9
newii9 <
AttributeSortOrderii= O
(iiO P
)iiP Q
)iiQ R
;iiR S
UTF8Encodingjj 
utf8jj 
=jj 
newjj  #
UTF8Encodingjj$ 0
(jj0 1
falsejj1 6
)jj6 7
;jj7 8
bytekk 
[kk 
]kk 
rgbDatakk 
;kk "
XmlAttributeCollectionmm "
attrListmm# +
=mm, -

Attributesmm. 8
;mm8 9
ifnn 
(nn 
attrListnn 
!=nn 
nullnn  
)nn  !
{oo 
foreachpp 
(pp 
XmlAttributepp %
attrpp& *
inpp+ -
attrListpp. 6
)pp6 7
{qq 
ifrr 
(rr 
(rr 
(rr !
CanonicalXmlAttributerr /
)rr/ 0
attrrr0 4
)rr4 5
.rr5 6
IsInNodeSetrr6 A
||rrB D
UtilsrrE J
.rrJ K
IsNamespaceNoderrK Z
(rrZ [
attrrr[ _
)rr_ `
||rra c
Utilsrrd i
.rri j
IsXmlNamespaceNoderrj |
(rr| }
attr	rr} Å
)
rrÅ Ç
)
rrÇ É
{ss 
iftt 
(tt 
Utilstt !
.tt! "
IsNamespaceNodett" 1
(tt1 2
attrtt2 6
)tt6 7
)tt7 8
{uu 
ancvv 
.vv  
TrackNamespaceNodevv  2
(vv2 3
attrvv3 7
,vv7 8
nsListToRendervv9 G
,vvG H
nsLocallyDeclaredvvI Z
)vvZ [
;vv[ \
}ww 
elsexx 
ifxx 
(xx  !
Utilsxx! &
.xx& '
IsXmlNamespaceNodexx' 9
(xx9 :
attrxx: >
)xx> ?
)xx? @
{yy 
anczz 
.zz  !
TrackXmlNamespaceNodezz  5
(zz5 6
attrzz6 :
,zz: ;
nsListToRenderzz< J
,zzJ K
attrListToRenderzzL \
,zz\ ]
nsLocallyDeclaredzz^ o
)zzo p
;zzp q
}{{ 
else|| 
if|| 
(||  !
IsInNodeSet||! ,
)||, -
{}} 
attrListToRender~~ ,
.~~, -
Add~~- 0
(~~0 1
attr~~1 5
,~~5 6
null~~7 ;
)~~; <
;~~< =
} 
}
ÄÄ 
}
ÅÅ 
}
ÇÇ 
if
ÑÑ 
(
ÑÑ 
!
ÑÑ 
Utils
ÑÑ 
.
ÑÑ "
IsCommittedNamespace
ÑÑ +
(
ÑÑ+ ,
this
ÑÑ, 0
,
ÑÑ0 1
Prefix
ÑÑ2 8
,
ÑÑ8 9
NamespaceURI
ÑÑ: F
)
ÑÑF G
)
ÑÑG H
{
ÖÖ 
string
ÜÜ 
name
ÜÜ 
=
ÜÜ 
(
ÜÜ 
(
ÜÜ  
Prefix
ÜÜ  &
.
ÜÜ& '
Length
ÜÜ' -
>
ÜÜ. /
$num
ÜÜ0 1
)
ÜÜ1 2
?
ÜÜ3 4
$str
ÜÜ5 <
+
ÜÜ= >
$str
ÜÜ? B
+
ÜÜC D
Prefix
ÜÜE K
:
ÜÜL M
$str
ÜÜN U
)
ÜÜU V
;
ÜÜV W
XmlAttribute
áá 
nsattrib
áá %
=
áá& '
(
áá( )
XmlAttribute
áá) 5
)
áá5 6
OwnerDocument
áá6 C
.
ááC D
CreateAttribute
ááD S
(
ááS T
name
ááT X
)
ááX Y
;
ááY Z
nsattrib
àà 
.
àà 
Value
àà 
=
àà  
NamespaceURI
àà! -
;
àà- .
anc
ââ 
.
ââ  
TrackNamespaceNode
ââ &
(
ââ& '
nsattrib
ââ' /
,
ââ/ 0
nsListToRender
ââ1 ?
,
ââ? @
nsLocallyDeclared
ââA R
)
ââR S
;
ââS T
}
ää 
if
åå 
(
åå 
IsInNodeSet
åå 
)
åå 
{
çç 
anc
éé 
.
éé #
GetNamespacesToRender
éé )
(
éé) *
this
éé* .
,
éé. /
attrListToRender
éé0 @
,
éé@ A
nsListToRender
ééB P
,
ééP Q
nsLocallyDeclared
ééR c
)
ééc d
;
ééd e
rgbData
èè 
=
èè 
utf8
èè 
.
èè 
GetBytes
èè '
(
èè' (
$str
èè( +
+
èè, -
Name
èè. 2
)
èè2 3
;
èè3 4
hash
êê 
.
êê 
BlockUpdate
êê  
(
êê  !
rgbData
êê! (
,
êê( )
$num
êê* +
,
êê+ ,
rgbData
êê- 4
.
êê4 5
Length
êê5 ;
)
êê; <
;
êê< =
foreach
ëë 
(
ëë 
object
ëë 
attr
ëë  $
in
ëë% '
nsListToRender
ëë( 6
.
ëë6 7

GetKeyList
ëë7 A
(
ëëA B
)
ëëB C
)
ëëC D
{
íí 
(
ìì 
attr
ìì 
as
ìì #
CanonicalXmlAttribute
ìì 2
)
ìì2 3
.
ìì3 4
	WriteHash
ìì4 =
(
ìì= >
hash
ìì> B
,
ììB C
docPos
ììD J
,
ììJ K
anc
ììL O
)
ììO P
;
ììP Q
}
îî 
foreach
ïï 
(
ïï 
object
ïï 
attr
ïï  $
in
ïï% '
attrListToRender
ïï( 8
.
ïï8 9

GetKeyList
ïï9 C
(
ïïC D
)
ïïD E
)
ïïE F
{
ññ 
(
óó 
attr
óó 
as
óó #
CanonicalXmlAttribute
óó 2
)
óó2 3
.
óó3 4
	WriteHash
óó4 =
(
óó= >
hash
óó> B
,
óóB C
docPos
óóD J
,
óóJ K
anc
óóL O
)
óóO P
;
óóP Q
}
òò 
rgbData
ôô 
=
ôô 
utf8
ôô 
.
ôô 
GetBytes
ôô '
(
ôô' (
$str
ôô( +
)
ôô+ ,
;
ôô, -
hash
öö 
.
öö 
BlockUpdate
öö  
(
öö  !
rgbData
öö! (
,
öö( )
$num
öö* +
,
öö+ ,
rgbData
öö- 4
.
öö4 5
Length
öö5 ;
)
öö; <
;
öö< =
}
õõ 
anc
ùù 
.
ùù !
EnterElementContext
ùù #
(
ùù# $
)
ùù$ %
;
ùù% &
anc
ûû 
.
ûû &
LoadUnrenderedNamespaces
ûû (
(
ûû( )
nsLocallyDeclared
ûû) :
)
ûû: ;
;
ûû; <
anc
üü 
.
üü $
LoadRenderedNamespaces
üü &
(
üü& '
nsListToRender
üü' 5
)
üü5 6
;
üü6 7
XmlNodeList
°° 

childNodes
°° "
=
°°# $

ChildNodes
°°% /
;
°°/ 0
foreach
¢¢ 
(
¢¢ 
XmlNode
¢¢ 
	childNode
¢¢ &
in
¢¢' )

childNodes
¢¢* 4
)
¢¢4 5
{
££ (
CanonicalizationDispatcher
§§ *
.
§§* +
	WriteHash
§§+ 4
(
§§4 5
	childNode
§§5 >
,
§§> ?
hash
§§@ D
,
§§D E
docPos
§§F L
,
§§L M
anc
§§N Q
)
§§Q R
;
§§R S
}
•• 
anc
ßß 
.
ßß  
ExitElementContext
ßß "
(
ßß" #
)
ßß# $
;
ßß$ %
if
©© 
(
©© 
IsInNodeSet
©© 
)
©© 
{
™™ 
rgbData
´´ 
=
´´ 
utf8
´´ 
.
´´ 
GetBytes
´´ '
(
´´' (
$str
´´( ,
+
´´- .
Name
´´/ 3
+
´´4 5
$str
´´6 9
)
´´9 :
;
´´: ;
hash
¨¨ 
.
¨¨ 
BlockUpdate
¨¨  
(
¨¨  !
rgbData
¨¨! (
,
¨¨( )
$num
¨¨* +
,
¨¨+ ,
rgbData
¨¨- 4
.
¨¨4 5
Length
¨¨5 ;
)
¨¨; <
;
¨¨< =
}
≠≠ 
}
ÆÆ 	
}
ØØ 
}∞∞ Ø
FC:\code\bc-xml-security\refactoring\src\CanonicalXmlEntityReference.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class '
CanonicalXmlEntityReference .
:/ 0
XmlEntityReference1 C
,C D 
ICanonicalizableNodeE Y
{ 
private 
bool 
_isInNodeSet !
;! "
public '
CanonicalXmlEntityReference *
(* +
string+ 1
name2 6
,6 7
XmlDocument8 C
docD G
,G H
boolI M(
defaultNodeSetInclusionStateN j
)j k
: 
base 
( 
name 
, 
doc 
) 
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if   
(   
IsInNodeSet   
)   &
CanonicalizationDispatcher!! *
.!!* +
WriteGenericNode!!+ ;
(!!; <
this!!< @
,!!@ A

strBuilder!!B L
,!!L M
docPos!!N T
,!!T U
anc!!V Y
)!!Y Z
;!!Z [
}"" 	
public$$ 
void$$ 
	WriteHash$$ 
($$ 
IHash$$ #
hash$$$ (
,$$( )
DocPosition$$* 5
docPos$$6 <
,$$< =,
 AncestralNamespaceContextManager$$> ^
anc$$_ b
)$$b c
{%% 	
if&& 
(&& 
IsInNodeSet&& 
)&& &
CanonicalizationDispatcher'' *
.''* + 
WriteHashGenericNode''+ ?
(''? @
this''@ D
,''D E
hash''F J
,''J K
docPos''L R
,''R S
anc''T W
)''W X
;''X Y
}(( 	
})) 
}** ù4
?C:\code\bc-xml-security\refactoring\src\CanonicalXmlNodeList.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class  
CanonicalXmlNodeList '
:( )
XmlNodeList* 5
,5 6
IList7 <
{ 
private 
	ArrayList 

_nodeArray $
;$ %
internal  
CanonicalXmlNodeList %
(% &
)& '
{ 	

_nodeArray 
= 
new 
	ArrayList &
(& '
)' (
;( )
} 	
public 
override 
XmlNode 
Item  $
($ %
int% (
index) .
). /
{ 	
return 
( 
XmlNode 
) 

_nodeArray &
[& '
index' ,
], -
;- .
} 	
public 
override 
IEnumerator #
GetEnumerator$ 1
(1 2
)2 3
{ 	
return 

_nodeArray 
. 
GetEnumerator +
(+ ,
), -
;- .
} 	
public   
override   
int   
Count   !
{!! 	
get"" 
{"" 
return"" 

_nodeArray"" #
.""# $
Count""$ )
;"") *
}""+ ,
}## 	
public&& 
int&& 
Add&& 
(&& 
object&& 
value&& #
)&&# $
{'' 	
if(( 
((( 
!(( 
((( 
value(( 
is(( 
XmlNode(( "
)((" #
)((# $
throw)) 
new)) 
ArgumentException)) +
())+ ,
SR)), .
.)). /0
$Cryptography_Xml_IncorrectObjectType))/ S
,))S T
$str))U [
)))[ \
;))\ ]
return** 

_nodeArray** 
.** 
Add** !
(**! "
value**" '
)**' (
;**( )
}++ 	
public-- 
void-- 
Clear-- 
(-- 
)-- 
{.. 	

_nodeArray// 
.// 
Clear// 
(// 
)// 
;// 
}00 	
public22 
bool22 
Contains22 
(22 
object22 #
value22$ )
)22) *
{33 	
return44 

_nodeArray44 
.44 
Contains44 &
(44& '
value44' ,
)44, -
;44- .
}55 	
public77 
int77 
IndexOf77 
(77 
object77 !
value77" '
)77' (
{88 	
return99 

_nodeArray99 
.99 
IndexOf99 %
(99% &
value99& +
)99+ ,
;99, -
}:: 	
public<< 
void<< 
Insert<< 
(<< 
int<< 
index<< $
,<<$ %
object<<& ,
value<<- 2
)<<2 3
{== 	
if>> 
(>> 
!>> 
(>> 
value>> 
is>> 
XmlNode>> "
)>>" #
)>># $
throw?? 
new?? 
ArgumentException?? +
(??+ ,
SR??, .
.??. /0
$Cryptography_Xml_IncorrectObjectType??/ S
,??S T
nameof??U [
(??[ \
value??\ a
)??a b
)??b c
;??c d

_nodeArray@@ 
.@@ 
Insert@@ 
(@@ 
index@@ #
,@@# $
value@@% *
)@@* +
;@@+ ,
}AA 	
publicCC 
voidCC 
RemoveCC 
(CC 
objectCC !
valueCC" '
)CC' (
{DD 	

_nodeArrayEE 
.EE 
RemoveEE 
(EE 
valueEE #
)EE# $
;EE$ %
}FF 	
publicHH 
voidHH 
RemoveAtHH 
(HH 
intHH  
indexHH! &
)HH& '
{II 	

_nodeArrayJJ 
.JJ 
RemoveAtJJ 
(JJ  
indexJJ  %
)JJ% &
;JJ& '
}KK 	
publicMM 
boolMM 
IsFixedSizeMM 
{NN 	
getOO 
{OO 
returnOO 

_nodeArrayOO #
.OO# $
IsFixedSizeOO$ /
;OO/ 0
}OO1 2
}PP 	
publicRR 
boolRR 

IsReadOnlyRR 
{SS 	
getTT 
{TT 
returnTT 

_nodeArrayTT #
.TT# $

IsReadOnlyTT$ .
;TT. /
}TT0 1
}UU 	
objectWW 
IListWW 
.WW 
thisWW 
[WW 
intWW 
indexWW #
]WW# $
{XX 	
getYY 
{YY 
returnYY 

_nodeArrayYY #
[YY# $
indexYY$ )
]YY) *
;YY* +
}YY, -
setZZ 
{[[ 
if\\ 
(\\ 
!\\ 
(\\ 
value\\ 
is\\ 
XmlNode\\ &
)\\& '
)\\' (
throw]] 
new]] 
ArgumentException]] /
(]]/ 0
SR]]0 2
.]]2 30
$Cryptography_Xml_IncorrectObjectType]]3 W
,]]W X
nameof]]Y _
(]]_ `
value]]` e
)]]e f
)]]f g
;]]g h

_nodeArray^^ 
[^^ 
index^^  
]^^  !
=^^" #
value^^$ )
;^^) *
}__ 
}`` 	
publicbb 
voidbb 
CopyTobb 
(bb 
Arraybb  
arraybb! &
,bb& '
intbb( +
indexbb, 1
)bb1 2
{cc 	

_nodeArraydd 
.dd 
CopyTodd 
(dd 
arraydd #
,dd# $
indexdd% *
)dd* +
;dd+ ,
}ee 	
publicgg 
objectgg 
SyncRootgg 
{hh 	
getii 
{ii 
returnii 

_nodeArrayii #
.ii# $
SyncRootii$ ,
;ii, -
}ii. /
}jj 	
publicll 
boolll 
IsSynchronizedll "
{mm 	
getnn 
{nn 
returnnn 

_nodeArraynn #
.nn# $
IsSynchronizednn$ 2
;nn2 3
}nn4 5
}oo 	
}pp 
}qq ‡6
LC:\code\bc-xml-security\refactoring\src\CanonicalXmlProcessingInstruction.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class -
!CanonicalXmlProcessingInstruction 4
:5 6$
XmlProcessingInstruction7 O
,O P 
ICanonicalizableNodeQ e
{ 
private 
bool 
_isInNodeSet !
;! "
public -
!CanonicalXmlProcessingInstruction 0
(0 1
string1 7
target8 >
,> ?
string@ F
dataG K
,K L
XmlDocumentM X
docY \
,\ ]
bool^ b(
defaultNodeSetInclusionStatec 
)	 Ä
: 
base 
( 
target 
, 
data 
,  
doc! $
)$ %
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if   
(   
!   
IsInNodeSet   
)   
return!! 
;!! 
if## 
(## 
docPos## 
==## 
DocPosition## %
.##% &
AfterRootElement##& 6
)##6 7

strBuilder$$ 
.$$ 
Append$$ !
($$! "
($$" #
char$$# '
)$$' (
$num$$( *
)$$* +
;$$+ ,

strBuilder%% 
.%% 
Append%% 
(%% 
$str%% "
)%%" #
;%%# $

strBuilder&& 
.&& 
Append&& 
(&& 
Name&& "
)&&" #
;&&# $
if'' 
('' 
('' 
Value'' 
!='' 
null'' 
)'' 
&&''  "
(''# $
Value''$ )
.'') *
Length''* 0
>''1 2
$num''3 4
)''4 5
)''5 6

strBuilder(( 
.(( 
Append(( !
(((! "
$str((" %
+((& '
Value((( -
)((- .
;((. /

strBuilder)) 
.)) 
Append)) 
()) 
$str)) "
)))" #
;))# $
if** 
(** 
docPos** 
==** 
DocPosition** %
.**% &
BeforeRootElement**& 7
)**7 8

strBuilder++ 
.++ 
Append++ !
(++! "
(++" #
char++# '
)++' (
$num++( *
)++* +
;+++ ,
},, 	
public.. 
void.. 
	WriteHash.. 
(.. 
IHash.. #
hash..$ (
,..( )
DocPosition..* 5
docPos..6 <
,..< =,
 AncestralNamespaceContextManager..> ^
anc.._ b
)..b c
{// 	
if00 
(00 
!00 
IsInNodeSet00 
)00 
return11 
;11 
UTF8Encoding33 
utf833 
=33 
new33  #
UTF8Encoding33$ 0
(330 1
false331 6
)336 7
;337 8
byte44 
[44 
]44 
rgbData44 
;44 
if55 
(55 
docPos55 
==55 
DocPosition55 %
.55% &
AfterRootElement55& 6
)556 7
{66 
rgbData77 
=77 
utf877 
.77 
GetBytes77 '
(77' (
$str77( 3
)773 4
;774 5
hash88 
.88 
BlockUpdate88  
(88  !
rgbData88! (
,88( )
$num88* +
,88+ ,
rgbData88- 4
.884 5
Length885 ;
)88; <
;88< =
}99 
rgbData:: 
=:: 
utf8:: 
.:: 
GetBytes:: #
(::# $
$str::$ (
)::( )
;::) *
hash;; 
.;; 
BlockUpdate;; 
(;; 
rgbData;; $
,;;$ %
$num;;& '
,;;' (
rgbData;;) 0
.;;0 1
Length;;1 7
);;7 8
;;;8 9
rgbData<< 
=<< 
utf8<< 
.<< 
GetBytes<< #
(<<# $
(<<$ %
Name<<% )
)<<) *
)<<* +
;<<+ ,
hash== 
.== 
BlockUpdate== 
(== 
rgbData== $
,==$ %
$num==& '
,==' (
rgbData==) 0
.==0 1
Length==1 7
)==7 8
;==8 9
if>> 
(>> 
(>> 
Value>> 
!=>> 
null>> 
)>> 
&&>>  "
(>># $
Value>>$ )
.>>) *
Length>>* 0
>>>1 2
$num>>3 4
)>>4 5
)>>5 6
{?? 
rgbData@@ 
=@@ 
utf8@@ 
.@@ 
GetBytes@@ '
(@@' (
$str@@( +
+@@, -
Value@@. 3
)@@3 4
;@@4 5
hashAA 
.AA 
BlockUpdateAA  
(AA  !
rgbDataAA! (
,AA( )
$numAA* +
,AA+ ,
rgbDataAA- 4
.AA4 5
LengthAA5 ;
)AA; <
;AA< =
}BB 
rgbDataCC 
=CC 
utf8CC 
.CC 
GetBytesCC #
(CC# $
$strCC$ (
)CC( )
;CC) *
hashDD 
.DD 
BlockUpdateDD 
(DD 
rgbDataDD $
,DD$ %
$numDD& '
,DD' (
rgbDataDD) 0
.DD0 1
LengthDD1 7
)DD7 8
;DD8 9
ifEE 
(EE 
docPosEE 
==EE 
DocPositionEE %
.EE% &
BeforeRootElementEE& 7
)EE7 8
{FF 
rgbDataGG 
=GG 
utf8GG 
.GG 
GetBytesGG '
(GG' (
$strGG( 3
)GG3 4
;GG4 5
hashHH 
.HH 
BlockUpdateHH  
(HH  !
rgbDataHH! (
,HH( )
$numHH* +
,HH+ ,
rgbDataHH- 4
.HH4 5
LengthHH5 ;
)HH; <
;HH< =
}II 
}JJ 	
}KK 
}LL Û
LC:\code\bc-xml-security\refactoring\src\CanonicalXmlSignificantWhitespace.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class -
!CanonicalXmlSignificantWhitespace 4
:5 6$
XmlSignificantWhitespace7 O
,O P 
ICanonicalizableNodeQ e
{ 
private 
bool 
_isInNodeSet !
;! "
public -
!CanonicalXmlSignificantWhitespace 0
(0 1
string1 7
strData8 ?
,? @
XmlDocumentA L
docM P
,P Q
boolR V(
defaultNodeSetInclusionStateW s
)s t
: 
base 
( 
strData 
, 
doc 
)  
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if   
(   
IsInNodeSet   
&&   
docPos   %
==  & (
DocPosition  ) 4
.  4 5
InRootElement  5 B
)  B C

strBuilder!! 
.!! 
Append!! !
(!!! "
Utils!!" '
.!!' ( 
EscapeWhitespaceData!!( <
(!!< =
Value!!= B
)!!B C
)!!C D
;!!D E
}"" 	
public$$ 
void$$ 
	WriteHash$$ 
($$ 
IHash$$ #
hash$$$ (
,$$( )
DocPosition$$* 5
docPos$$6 <
,$$< =,
 AncestralNamespaceContextManager$$> ^
anc$$_ b
)$$b c
{%% 	
if&& 
(&& 
IsInNodeSet&& 
&&&& 
docPos&& %
==&&& (
DocPosition&&) 4
.&&4 5
InRootElement&&5 B
)&&B C
{'' 
UTF8Encoding(( 
utf8(( !
=((" #
new(($ '
UTF8Encoding((( 4
(((4 5
false((5 :
)((: ;
;((; <
byte)) 
[)) 
])) 
rgbData)) 
=))  
utf8))! %
.))% &
GetBytes))& .
()). /
Utils))/ 4
.))4 5 
EscapeWhitespaceData))5 I
())I J
Value))J O
)))O P
)))P Q
;))Q R
hash** 
.** 
BlockUpdate**  
(**  !
rgbData**! (
,**( )
$num*** +
,**+ ,
rgbData**- 4
.**4 5
Length**5 ;
)**; <
;**< =
}++ 
},, 	
}-- 
}.. µ
;C:\code\bc-xml-security\refactoring\src\CanonicalXmlText.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
CanonicalXmlText #
:$ %
XmlText& -
,- . 
ICanonicalizableNode/ C
{ 
private 
bool 
_isInNodeSet !
;! "
public 
CanonicalXmlText 
(  
string  &
strData' .
,. /
XmlDocument0 ;
doc< ?
,? @
boolA E(
defaultNodeSetInclusionStateF b
)b c
: 
base 
( 
strData 
, 
doc 
)  
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if   
(   
IsInNodeSet   
)   

strBuilder!! 
.!! 
Append!! !
(!!! "
Utils!!" '
.!!' (
EscapeTextData!!( 6
(!!6 7
Value!!7 <
)!!< =
)!!= >
;!!> ?
}"" 	
public$$ 
void$$ 
	WriteHash$$ 
($$ 
IHash$$ #
hash$$$ (
,$$( )
DocPosition$$* 5
docPos$$6 <
,$$< =,
 AncestralNamespaceContextManager$$> ^
anc$$_ b
)$$b c
{%% 	
if&& 
(&& 
IsInNodeSet&& 
)&& 
{'' 
UTF8Encoding(( 
utf8(( !
=((" #
new(($ '
UTF8Encoding((( 4
(((4 5
false((5 :
)((: ;
;((; <
byte)) 
[)) 
])) 
rgbData)) 
=))  
utf8))! %
.))% &
GetBytes))& .
()). /
Utils))/ 4
.))4 5
EscapeTextData))5 C
())C D
Value))D I
)))I J
)))J K
;))K L
hash** 
.** 
BlockUpdate**  
(**  !
rgbData**! (
,**( )
$num*** +
,**+ ,
rgbData**- 4
.**4 5
Length**5 ;
)**; <
;**< =
}++ 
},, 	
}-- 
}.. «
AC:\code\bc-xml-security\refactoring\src\CanonicalXmlWhitespace.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class "
CanonicalXmlWhitespace )
:* +
XmlWhitespace, 9
,9 : 
ICanonicalizableNode; O
{ 
private 
bool 
_isInNodeSet !
;! "
public "
CanonicalXmlWhitespace %
(% &
string& ,
strData- 4
,4 5
XmlDocument6 A
docB E
,E F
boolG K(
defaultNodeSetInclusionStateL h
)h i
: 
base 
( 
strData 
, 
doc 
)  
{ 	
_isInNodeSet 
= (
defaultNodeSetInclusionState 7
;7 8
} 	
public 
bool 
IsInNodeSet 
{ 	
get 
{ 
return 
_isInNodeSet %
;% &
}' (
set 
{ 
_isInNodeSet 
=  
value! &
;& '
}( )
} 	
public 
void 
Write 
( 
StringBuilder '

strBuilder( 2
,2 3
DocPosition4 ?
docPos@ F
,F G,
 AncestralNamespaceContextManagerH h
anci l
)l m
{ 	
if   
(   
IsInNodeSet   
&&   
docPos   %
==  & (
DocPosition  ) 4
.  4 5
InRootElement  5 B
)  B C

strBuilder!! 
.!! 
Append!! !
(!!! "
Utils!!" '
.!!' ( 
EscapeWhitespaceData!!( <
(!!< =
Value!!= B
)!!B C
)!!C D
;!!D E
}"" 	
public$$ 
void$$ 
	WriteHash$$ 
($$ 
IHash$$ #
hash$$$ (
,$$( )
DocPosition$$* 5
docPos$$6 <
,$$< =,
 AncestralNamespaceContextManager$$> ^
anc$$_ b
)$$b c
{%% 	
if&& 
(&& 
IsInNodeSet&& 
&&&& 
docPos&& %
==&&& (
DocPosition&&) 4
.&&4 5
InRootElement&&5 B
)&&B C
{'' 
UTF8Encoding(( 
utf8(( !
=((" #
new(($ '
UTF8Encoding((( 4
(((4 5
false((5 :
)((: ;
;((; <
byte)) 
[)) 
])) 
rgbData)) 
=))  
utf8))! %
.))% &
GetBytes))& .
()). /
Utils))/ 4
.))4 5 
EscapeWhitespaceData))5 I
())I J
Value))J O
)))O P
)))P Q
;))Q R
hash** 
.** 
BlockUpdate**  
(**  !
rgbData**! (
,**( )
$num*** +
,**+ ,
rgbData**- 4
.**4 5
Length**5 ;
)**; <
;**< =
}++ 
},, 	
}-- 
}..  
8C:\code\bc-xml-security\refactoring\src\CertUsageType.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
enum 
CertUsageType 
{ 
Verification 
= 
$num 
, 

Decryption 
= 
$num 
} 
} •N
5C:\code\bc-xml-security\refactoring\src\CipherData.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 

CipherData "
{ 
private 

XmlElement 

_cachedXml %
=& '
null( ,
;, -
private 
CipherReference 
_cipherReference  0
=1 2
null3 7
;7 8
private 
byte 
[ 
] 
_cipherValue #
=$ %
null& *
;* +
public 

CipherData 
( 
) 
{ 
} 
public 

CipherData 
( 
byte 
[ 
]  
cipherValue! ,
), -
{ 	
CipherValue 
= 
cipherValue %
;% &
} 	
public 

CipherData 
( 
CipherReference )
cipherReference* 9
)9 :
{ 	
CipherReference 
= 
cipherReference -
;- .
} 	
private 
bool 

CacheValid 
{ 	
get 
{   
return!! 
(!! 

_cachedXml!! "
!=!!# %
null!!& *
)!!* +
;!!+ ,
}"" 
}## 	
public%% 
CipherReference%% 
CipherReference%% .
{&& 	
get'' 
{'' 
return'' 
_cipherReference'' )
;'') *
}''+ ,
set(( 
{)) 
if** 
(** 
value** 
==** 
null** !
)**! "
throw++ 
new++ !
ArgumentNullException++ 3
(++3 4
nameof++4 :
(++: ;
value++; @
)++@ A
)++A B
;++B C
if,, 
(,, 
CipherValue,, 
!=,,  "
null,,# '
),,' (
throw-- 
new-- 
System-- $
.--$ %
Security--% -
.--- .
Cryptography--. :
.--: ;"
CryptographicException--; Q
(--Q R
SR--R T
.--T U8
+Cryptography_Xml_CipherValueElementRequired	--U Ä
)
--Ä Å
;
--Å Ç
_cipherReference//  
=//! "
value//# (
;//( )

_cachedXml00 
=00 
null00 !
;00! "
}11 
}22 	
public44 
byte44 
[44 
]44 
CipherValue44 !
{55 	
get66 
{66 
return66 
_cipherValue66 %
;66% &
}66' (
set77 
{88 
if99 
(99 
value99 
==99 
null99 !
)99! "
throw:: 
new:: !
ArgumentNullException:: 3
(::3 4
nameof::4 :
(::: ;
value::; @
)::@ A
)::A B
;::B C
if;; 
(;; 
CipherReference;; #
!=;;$ &
null;;' +
);;+ ,
throw<< 
new<< 
System<< $
.<<$ %
Security<<% -
.<<- .
Cryptography<<. :
.<<: ;"
CryptographicException<<; Q
(<<Q R
SR<<R T
.<<T U8
+Cryptography_Xml_CipherValueElementRequired	<<U Ä
)
<<Ä Å
;
<<Å Ç
_cipherValue>> 
=>> 
(>>  
byte>>  $
[>>$ %
]>>% &
)>>& '
value>>' ,
.>>, -
Clone>>- 2
(>>2 3
)>>3 4
;>>4 5

_cachedXml?? 
=?? 
null?? !
;??! "
}@@ 
}AA 	
publicCC 

XmlElementCC 
GetXmlCC  
(CC  !
)CC! "
{DD 	
ifEE 
(EE 

CacheValidEE 
)EE 
returnEE "

_cachedXmlEE# -
;EE- .
XmlDocumentGG 
documentGG  
=GG! "
newGG# &
XmlDocumentGG' 2
(GG2 3
)GG3 4
;GG4 5
documentHH 
.HH 
PreserveWhitespaceHH '
=HH( )
trueHH* .
;HH. /
returnII 
GetXmlII 
(II 
documentII "
)II" #
;II# $
}JJ 	
internalLL 

XmlElementLL 
GetXmlLL "
(LL" #
XmlDocumentLL# .
documentLL/ 7
)LL7 8
{MM 	

XmlElementOO 
cipherDataElementOO (
=OO) *
(OO+ ,

XmlElementOO, 6
)OO6 7
documentOO7 ?
.OO? @
CreateElementOO@ M
(OOM N
$strOON Z
,OOZ [
EncryptedXmlOO\ h
.OOh i
XmlEncNamespaceUrlOOi {
)OO{ |
;OO| }
ifPP 
(PP 
CipherValuePP 
!=PP 
nullPP #
)PP# $
{QQ 

XmlElementRR 
cipherValueElementRR -
=RR. /
documentRR0 8
.RR8 9
CreateElementRR9 F
(RRF G
$strRRG T
,RRT U
EncryptedXmlRRV b
.RRb c
XmlEncNamespaceUrlRRc u
)RRu v
;RRv w
cipherValueElementSS "
.SS" #
AppendChildSS# .
(SS. /
documentSS/ 7
.SS7 8
CreateTextNodeSS8 F
(SSF G
ConvertSSG N
.SSN O
ToBase64StringSSO ]
(SS] ^
CipherValueSS^ i
)SSi j
)SSj k
)SSk l
;SSl m
cipherDataElementTT !
.TT! "
AppendChildTT" -
(TT- .
cipherValueElementTT. @
)TT@ A
;TTA B
}UU 
elseVV 
{WW 
ifYY 
(YY 
CipherReferenceYY #
==YY$ &
nullYY' +
)YY+ ,
throwZZ 
newZZ 
SystemZZ $
.ZZ$ %
SecurityZZ% -
.ZZ- .
CryptographyZZ. :
.ZZ: ;"
CryptographicExceptionZZ; Q
(ZZQ R
SRZZR T
.ZZT U8
+Cryptography_Xml_CipherValueElementRequired	ZZU Ä
)
ZZÄ Å
;
ZZÅ Ç
cipherDataElement[[ !
.[[! "
AppendChild[[" -
([[- .
CipherReference[[. =
.[[= >
GetXml[[> D
([[D E
document[[E M
)[[M N
)[[N O
;[[O P
}\\ 
return]] 
cipherDataElement]] $
;]]$ %
}^^ 	
public`` 
void`` 
LoadXml`` 
(`` 

XmlElement`` &
value``' ,
)``, -
{aa 	
ifbb 
(bb 
valuebb 
==bb 
nullbb 
)bb 
throwcc 
newcc !
ArgumentNullExceptioncc /
(cc/ 0
nameofcc0 6
(cc6 7
valuecc7 <
)cc< =
)cc= >
;cc> ?
XmlNamespaceManageree 
nsmee  #
=ee$ %
newee& )
XmlNamespaceManageree* =
(ee= >
valueee> C
.eeC D
OwnerDocumenteeD Q
.eeQ R
	NameTableeeR [
)ee[ \
;ee\ ]
nsmff 
.ff 
AddNamespaceff 
(ff 
$strff "
,ff" #
EncryptedXmlff$ 0
.ff0 1
XmlEncNamespaceUrlff1 C
)ffC D
;ffD E
XmlNodehh 
cipherValueNodehh #
=hh$ %
valuehh& +
.hh+ ,
SelectSingleNodehh, <
(hh< =
$strhh= N
,hhN O
nsmhhP S
)hhS T
;hhT U
XmlNodeii 
cipherReferenceNodeii '
=ii( )
valueii* /
.ii/ 0
SelectSingleNodeii0 @
(ii@ A
$striiA V
,iiV W
nsmiiX [
)ii[ \
;ii\ ]
ifjj 
(jj 
cipherValueNodejj 
!=jj  "
nulljj# '
)jj' (
{kk 
ifll 
(ll 
cipherReferenceNodell '
!=ll( *
nullll+ /
)ll/ 0
throwmm 
newmm 
Systemmm $
.mm$ %
Securitymm% -
.mm- .
Cryptographymm. :
.mm: ;"
CryptographicExceptionmm; Q
(mmQ R
SRmmR T
.mmT U8
+Cryptography_Xml_CipherValueElementRequired	mmU Ä
)
mmÄ Å
;
mmÅ Ç
_cipherValuenn 
=nn 
Convertnn &
.nn& '
FromBase64Stringnn' 7
(nn7 8
Utilsnn8 =
.nn= >
DiscardWhiteSpacesnn> P
(nnP Q
cipherValueNodennQ `
.nn` a
	InnerTextnna j
)nnj k
)nnk l
;nnl m
}oo 
elsepp 
ifpp 
(pp 
cipherReferenceNodepp (
!=pp) +
nullpp, 0
)pp0 1
{qq 
_cipherReferencerr  
=rr! "
newrr# &
CipherReferencerr' 6
(rr6 7
)rr7 8
;rr8 9
_cipherReferencess  
.ss  !
LoadXmlss! (
(ss( )
(ss) *

XmlElementss* 4
)ss4 5
cipherReferenceNodess5 H
)ssH I
;ssI J
}tt 
elseuu 
{vv 
throwww 
newww 
Systemww  
.ww  !
Securityww! )
.ww) *
Cryptographyww* 6
.ww6 7"
CryptographicExceptionww7 M
(wwM N
SRwwN P
.wwP Q7
+Cryptography_Xml_CipherValueElementRequiredwwQ |
)ww| }
;ww} ~
}xx 

_cachedXml{{ 
={{ 
value{{ 
;{{ 
}|| 	
}}} 
}~~ é4
:C:\code\bc-xml-security\refactoring\src\CipherReference.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
CipherReference '
:( )
EncryptedReference* <
{ 
private 
byte 
[ 
] 
_cipherValue #
;# $
public 
CipherReference 
( 
)  
:! "
base# '
(' (
)( )
{ 	
ReferenceType 
= 
$str -
;- .
} 	
public 
CipherReference 
( 
string %
uri& )
)) *
:+ ,
base- 1
(1 2
uri2 5
)5 6
{ 	
ReferenceType 
= 
$str -
;- .
} 	
public 
CipherReference 
( 
string %
uri& )
,) *
TransformChain+ 9
transformChain: H
)H I
:J K
baseL P
(P Q
uriQ T
,T U
transformChainV d
)d e
{ 	
ReferenceType 
= 
$str -
;- .
} 	
internal 
byte 
[ 
] 
CipherValue #
{   	
get!! 
{"" 
if## 
(## 
!## 

CacheValid## 
)##  
return$$ 
null$$ 
;$$  
return%% 
_cipherValue%% #
;%%# $
}&& 
set'' 
{(( 
_cipherValue)) 
=)) 
value)) $
;))$ %
}** 
}++ 	
public-- 
override-- 

XmlElement-- "
GetXml--# )
(--) *
)--* +
{.. 	
if// 
(// 

CacheValid// 
)// 
return// "

_cachedXml//# -
;//- .
XmlDocument11 
document11  
=11! "
new11# &
XmlDocument11' 2
(112 3
)113 4
;114 5
document22 
.22 
PreserveWhitespace22 '
=22( )
true22* .
;22. /
return33 
GetXml33 
(33 
document33 "
)33" #
;33# $
}44 	
new66 
internal66 

XmlElement66 
GetXml66  &
(66& '
XmlDocument66' 2
document663 ;
)66; <
{77 	
if88 
(88 
ReferenceType88 
==88  
null88! %
)88% &
throw99 
new99 
System99  
.99  !
Security99! )
.99) *
Cryptography99* 6
.996 7"
CryptographicException997 M
(99M N
SR99N P
.99P Q2
&Cryptography_Xml_ReferenceTypeRequired99Q w
)99w x
;99x y

XmlElement<< 
referenceElement<< '
=<<( )
document<<* 2
.<<2 3
CreateElement<<3 @
(<<@ A
ReferenceType<<A N
,<<N O
EncryptedXml<<P \
.<<\ ]
XmlEncNamespaceUrl<<] o
)<<o p
;<<p q
if== 
(== 
!== 
string== 
.== 
IsNullOrEmpty== %
(==% &
Uri==& )
)==) *
)==* +
referenceElement>>  
.>>  !
SetAttribute>>! -
(>>- .
$str>>. 3
,>>3 4
Uri>>5 8
)>>8 9
;>>9 :
ifAA 
(AA 
TransformChainAA 
.AA 
CountAA $
>AA% &
$numAA' (
)AA( )
referenceElementBB  
.BB  !
AppendChildBB! ,
(BB, -
TransformChainBB- ;
.BB; <
GetXmlBB< B
(BBB C
documentBBC K
,BBK L
EncryptedXmlBBM Y
.BBY Z
XmlEncNamespaceUrlBBZ l
)BBl m
)BBm n
;BBn o
returnDD 
referenceElementDD #
;DD# $
}EE 	
publicGG 
overrideGG 
voidGG 
LoadXmlGG $
(GG$ %

XmlElementGG% /
valueGG0 5
)GG5 6
{HH 	
ifII 
(II 
valueII 
==II 
nullII 
)II 
throwJJ 
newJJ !
ArgumentNullExceptionJJ /
(JJ/ 0
nameofJJ0 6
(JJ6 7
valueJJ7 <
)JJ< =
)JJ= >
;JJ> ?
ReferenceTypeLL 
=LL 
valueLL !
.LL! "
	LocalNameLL" +
;LL+ ,
stringMM 
uriMM 
=MM 
UtilsMM 
.MM 
GetAttributeMM +
(MM+ ,
valueMM, 1
,MM1 2
$strMM3 8
,MM8 9
EncryptedXmlMM: F
.MMF G
XmlEncNamespaceUrlMMG Y
)MMY Z
;MMZ [
UriNN 
=NN 
uriNN 
??NN 
throwNN 
newNN "
SystemNN# )
.NN) *
SecurityNN* 2
.NN2 3
CryptographyNN3 ?
.NN? @"
CryptographicExceptionNN@ V
(NNV W
SRNNW Y
.NNY Z(
Cryptography_Xml_UriRequiredNNZ v
)NNv w
;NNw x
XmlNamespaceManagerQQ 
nsmQQ  #
=QQ$ %
newQQ& )
XmlNamespaceManagerQQ* =
(QQ= >
valueQQ> C
.QQC D
OwnerDocumentQQD Q
.QQQ R
	NameTableQQR [
)QQ[ \
;QQ\ ]
nsmRR 
.RR 
AddNamespaceRR 
(RR 
$strRR "
,RR" #
EncryptedXmlRR$ 0
.RR0 1
XmlEncNamespaceUrlRR1 C
)RRC D
;RRD E
XmlNodeSS 
transformsNodeSS "
=SS# $
valueSS% *
.SS* +
SelectSingleNodeSS+ ;
(SS; <
$strSS< L
,SSL M
nsmSSN Q
)SSQ R
;SSR S
ifTT 
(TT 
transformsNodeTT 
!=TT !
nullTT" &
)TT& '
TransformChainUU 
.UU 
LoadXmlUU &
(UU& '
transformsNodeUU' 5
asUU6 8

XmlElementUU9 C
)UUC D
;UUD E

_cachedXmlXX 
=XX 
valueXX 
;XX 
}YY 	
}ZZ 
}[[ Øa
8C:\code\bc-xml-security\refactoring\src\CryptoHelpers.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
static 
class 
CryptoHelpers '
{ 
private 
static 
readonly 
char  $
[$ %
]% &
_invalidChars' 4
=5 6
new7 :
char; ?
[? @
]@ A
{B C
$charD G
,G H
$charI L
,L M
$charN Q
,Q R
$charS V
,V W
$charX [
}\ ]
;] ^
[ 	
System	 
. 
Diagnostics 
. 
CodeAnalysis (
.( )
SuppressMessage) 8
(8 9
$str9 M
,M N
$strO W
,W X
JustificationY f
=g h
$str	i Ç
)
Ç É
]
É Ñ
[ 	
System	 
. 
Diagnostics 
. 
CodeAnalysis (
.( )
SuppressMessage) 8
(8 9
$str9 M
,M N
$strO W
,W X
JustificationY f
=g h
$str	i Ö
)
Ö Ü
]
Ü á
public 
static 
object 
CreateFromKnownName 0
(0 1
string1 7
name8 <
)< =
{ 	
switch 
( 
name 
) 
{ 
case 
$str F
:F G
return 
new  
XmlDsigC14NTransform 3
(3 4
)4 5
;5 6
case 
$str S
:S T
return 
new ,
 XmlDsigC14NWithCommentsTransform ?
(? @
)@ A
;A B
case 
$str >
:> ?
return 
new #
XmlDsigExcC14NTransform 6
(6 7
)7 8
;8 9
case 
$str J
:J K
return   
new   /
#XmlDsigExcC14NWithCommentsTransform   B
(  B C
)  C D
;  D E
case!! 
$str!! ?
:!!? @
return"" 
new"" "
XmlDsigBase64Transform"" 5
(""5 6
)""6 7
;""7 8
case## 
$str## C
:##C D
return$$ 
new$$ !
XmlDsigXPathTransform$$ 4
($$4 5
)$$5 6
;$$6 7
case%% 
$str%% B
:%%B C
return&& 
new&&  
XmlDsigXsltTransform&& 3
(&&3 4
)&&4 5
;&&5 6
case'' 
$str'' L
:''L M
return(( 
new(( .
"XmlDsigEnvelopedSignatureTransform(( A
(((A B
)((B C
;((C D
case)) 
$str)) <
:))< =
return** 
new** "
XmlDecryptionTransform** 5
(**5 6
)**6 7
;**7 8
case++ 
$str++ H
:++H I
return,, 
new,, 
XmlLicenseTransform,, 2
(,,2 3
),,3 4
;,,4 5
case-- 
$str-- B
:--B C
return.. 
new.. 
KeyInfoX509Data.. .
(... /
)../ 0
;..0 1
case// 
$str// A
://A B
return00 
new00 
KeyInfoName00 *
(00* +
)00+ ,
;00, -
case11 
$str11 N
:11N O
return22 
new22 
DSAKeyValue22 *
(22* +
)22+ ,
;22, -
case33 
$str33 N
:33N O
return44 
new44 
RSAKeyValue44 *
(44* +
)44+ ,
;44, -
case55 
$str55 I
:55I J
return66 
new66 "
KeyInfoRetrievalMethod66 5
(665 6
)666 7
;667 8
case77 
$str77 E
:77E F
return88 
new88 
KeyInfoEncryptedKey88 2
(882 3
)883 4
;884 5
case99 
$str99 A
:99A B
case:: 
$str:: K
:::K L
return<< 
new<< 
DsaDigestSigner2<< /
(<</ 0
new<<0 3
	DsaSigner<<4 =
(<<= >
)<<> ?
,<<? @
new<<A D

Sha1Digest<<E O
(<<O P
)<<P Q
)<<Q R
;<<R S
case== 
$str== A
:==A B
case>> 
$str>> K
:>>K L
return?? 
SignerUtilities?? *
.??* +
	GetSigner??+ 4
(??4 5
$str??5 B
)??B C
;??C D
case@@ 
$str@@ H
:@@H I
returnAA 
SignerUtilitiesAA *
.AA* +
	GetSignerAA+ 4
(AA4 5
$strAA5 D
)AAD E
;AAE F
caseBB 
$strBB H
:BBH I
returnCC 
SignerUtilitiesCC *
.CC* +
	GetSignerCC+ 4
(CC4 5
$strCC5 D
)CCD E
;CCE F
caseDD 
$strDD H
:DDH I
returnEE 
SignerUtilitiesEE *
.EE* +
	GetSignerEE+ 4
(EE4 5
$strEE5 D
)EED E
;EEE F
caseFF 
$strFF Y
:FFY Z
caseGG 
$strGG U
:GGU V
returnHH 
SignerUtilitiesHH *
.HH* +
	GetSignerHH+ 4
(HH4 5
$strHH5 M
)HHM N
;HHN O
caseII 
$strII `
:II` a
returnJJ 
newJJ  
Gost3410DigestSignerJJ 3
(JJ3 4
newJJ4 7
ECGost3410SignerJJ8 H
(JJH I
)JJI J
,JJJ K
newJJL O#
Gost3411_2012_256DigestJJP g
(JJg h
)JJh i
)JJi j
;JJj k
caseKK 
$strKK `
:KK` a
returnLL 
newLL  
Gost3410DigestSignerLL 3
(LL3 4
newLL4 7
ECGost3410SignerLL8 H
(LLH I
)LLI J
,LLJ K
newLLL O#
Gost3411_2012_512DigestLLP g
(LLg h
)LLh i
)LLi j
;LLj k
casePP 
$strPP =
:PP= >
returnQQ 
DigestUtilitiesQQ *
.QQ* +
	GetDigestQQ+ 4
(QQ4 5
$strQQ5 <
)QQ< =
;QQ= >
caseRR 
$strRR >
:RR> ?
returnSS 
DigestUtilitiesSS *
.SS* +
	GetDigestSS+ 4
(SS4 5
$strSS5 >
)SS> ?
;SS? @
caseTT 
$strTT D
:TTD E
caseUU 
$strUU 
:UU 
returnVV 
DigestUtilitiesVV *
.VV* +
	GetDigestVV+ 4
(VV4 5
$strVV5 >
)VV> ?
;VV? @
caseWW 
$strWW >
:WW> ?
returnXX 
DigestUtilitiesXX *
.XX* +
	GetDigestXX+ 4
(XX4 5
$strXX5 >
)XX> ?
;XX? @
caseYY 
$strYY A
:YYA B
returnZZ 
DigestUtilitiesZZ *
.ZZ* +
	GetDigestZZ+ 4
(ZZ4 5
$strZZ5 A
)ZZA B
;ZZB C
case[[ 
$str[[ 
:[[ 
return\\ 
DigestUtilities\\ *
.\\* +
	GetDigest\\+ 4
(\\4 5
$str\\5 :
)\\: ;
;\\; <
case]] 
$str]] K
:]]K L
case^^ 
$str^^ G
:^^G H
return__ 
DigestUtilities__ *
.__* +
	GetDigest__+ 4
(__4 5
$str__5 ?
)__? @
;__@ A
case`` 
$str`` S
:``S T
returnaa 
DigestUtilitiesaa *
.aa* +
	GetDigestaa+ 4
(aa4 5
$straa5 H
)aaH I
;aaI J
casebb 
$strbb S
:bbS T
returncc 
DigestUtilitiescc *
.cc* +
	GetDigestcc+ 4
(cc4 5
$strcc5 H
)ccH I
;ccI J
casedd 
$strdd F
:ddF G
returnee 
MacUtilitiesee '
.ee' (
GetMacee( .
(ee. /
$stree/ 9
)ee9 :
;ee: ;
caseff 
$strff I
:ffI J
returngg 
MacUtilitiesgg '
.gg' (
GetMacgg( .
(gg. /
$strgg/ <
)gg< =
;gg= >
casehh 
$strhh I
:hhI J
returnii 
MacUtilitiesii '
.ii' (
GetMacii( .
(ii. /
$strii/ <
)ii< =
;ii= >
casejj 
$strjj I
:jjI J
returnkk 
MacUtilitieskk '
.kk' (
GetMackk( .
(kk. /
$strkk/ <
)kk< =
;kk= >
casell 
$strll L
:llL M
returnmm 
MacUtilitiesmm '
.mm' (
GetMacmm( .
(mm. /
$strmm/ ?
)mm? @
;mm@ A
casenn 
$strnn ?
:nn? @
returnoo 
CipherUtilitiesoo *
.oo* +
	GetCipheroo+ 4
(oo4 5
$stroo5 K
)ooK L
;ooL M
casepp 
$strpp E
:ppE F
returnqq 
CipherUtilitiesqq *
.qq* +
	GetCipherqq+ 4
(qq4 5
$strqq5 N
)qqN O
;qqO P
caserr 
$strrr B
:rrB C
casess 
$strss A
:ssA B
returntt 
newtt %
PaddedBufferedBlockCiphertt 8
(tt8 9
newtt9 <
CbcBlockCiphertt= K
(ttK L
newttL O
RijndaelEnginettP ^
(tt^ _
$numtt_ b
)ttb c
)ttc d
,ttd e
newttf i
Pkcs7Paddingttj v
(ttv w
)ttw x
)ttx y
;tty z
caseuu 
$struu B
:uuB C
casevv 
$strvv A
:vvA B
returnww 
newww %
PaddedBufferedBlockCipherww 8
(ww8 9
newww9 <
CbcBlockCipherww= K
(wwK L
newwwL O
RijndaelEnginewwP ^
(ww^ _
$numww_ b
)wwb c
)wwc d
,wwd e
newwwf i
Pkcs7Paddingwwj v
(wwv w
)www x
)wwx y
;wwy z
casexx 
$strxx B
:xxB C
caseyy 
$stryy A
:yyA B
returnzz 
newzz %
PaddedBufferedBlockCipherzz 8
(zz8 9
newzz9 <
CbcBlockCipherzz= K
(zzK L
newzzL O
RijndaelEnginezzP ^
(zz^ _
$numzz_ b
)zzb c
)zzc d
,zzd e
newzzf i
Pkcs7Paddingzzj v
(zzv w
)zzw x
)zzx y
;zzy z
}{{ 
return}} 
null}} 
;}} 
}~~ 	
public
ÄÄ 
static
ÄÄ 
T
ÄÄ 
CreateFromName
ÄÄ &
<
ÄÄ& '
T
ÄÄ' (
>
ÄÄ( )
(
ÄÄ) *
string
ÄÄ* 0
name
ÄÄ1 5
)
ÄÄ5 6
where
ÄÄ7 <
T
ÄÄ= >
:
ÄÄ? @
class
ÄÄA F
{
ÅÅ 	
if
ÇÇ 
(
ÇÇ 
name
ÇÇ 
==
ÇÇ 
null
ÇÇ 
||
ÇÇ 
name
ÇÇ  $
.
ÇÇ$ %

IndexOfAny
ÇÇ% /
(
ÇÇ/ 0
_invalidChars
ÇÇ0 =
)
ÇÇ= >
>=
ÇÇ? A
$num
ÇÇB C
)
ÇÇC D
{
ÉÉ 
return
ÑÑ 
null
ÑÑ 
;
ÑÑ 
}
ÖÖ 
try
ÜÜ 
{
áá 
return
àà !
CreateFromKnownName
àà *
(
àà* +
name
àà+ /
)
àà/ 0
as
àà1 3
T
àà4 5
;
àà5 6
}
ââ 
catch
ää 
(
ää 
	Exception
ää 
)
ää 
{
ãã 
return
åå 
null
åå 
;
åå 
}
çç 
}
éé 	
}
èè 
}êê  
LC:\code\bc-xml-security\refactoring\src\CryptoSignedXmlRecursionException.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
[ 
Serializable 
] 
public 

class -
!CryptoSignedXmlRecursionException 2
:3 4
XmlException5 A
{ 
public -
!CryptoSignedXmlRecursionException 0
(0 1
)1 2
:3 4
base5 9
(9 :
): ;
{< =
}> ?
public -
!CryptoSignedXmlRecursionException 0
(0 1
string1 7
message8 ?
)? @
:A B
baseC G
(G H
messageH O
)O P
{Q R
}S T
public -
!CryptoSignedXmlRecursionException 0
(0 1
string1 7
message8 ?
,? @
	ExceptionA J
innerK P
)P Q
:R S
baseT X
(X Y
messageY `
,` a
innerb g
)g h
{i j
}k l
	protected -
!CryptoSignedXmlRecursionException 3
(3 4
SerializationInfo4 E
infoF J
,J K
StreamingContextL \
context] d
)d e
:f g
baseh l
(l m
infom q
,q r
contexts z
)z {
{| }
}~ 
} 
} ÄH
5C:\code\bc-xml-security\refactoring\src\DataObject.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class 

DataObject 
{ 
private 
string 
_id 
; 
private 
string 
	_mimeType  
;  !
private 
string 
	_encoding  
;  !
private  
CanonicalXmlNodeList $
_elData% ,
;, -
private 

XmlElement 

_cachedXml %
;% &
public 

DataObject 
( 
) 
{ 	

_cachedXml 
= 
null 
; 
_elData 
= 
new  
CanonicalXmlNodeList .
(. /
)/ 0
;0 1
} 	
public 

DataObject 
( 
string  
id! #
,# $
string% +
mimeType, 4
,4 5
string6 <
encoding= E
,E F

XmlElementG Q
dataR V
)V W
{ 	
if 
( 
data 
== 
null 
) 
throw   
new   !
ArgumentNullException   /
(  / 0
nameof  0 6
(  6 7
data  7 ;
)  ; <
)  < =
;  = >
_id"" 
="" 
id"" 
;"" 
	_mimeType## 
=## 
mimeType##  
;##  !
	_encoding$$ 
=$$ 
encoding$$  
;$$  !
_elData%% 
=%% 
new%%  
CanonicalXmlNodeList%% .
(%%. /
)%%/ 0
;%%0 1
_elData&& 
.&& 
Add&& 
(&& 
data&& 
)&& 
;&& 

_cachedXml'' 
='' 
null'' 
;'' 
}(( 	
public.. 
string.. 
Id.. 
{// 	
get00 
{00 
return00 
_id00 
;00 
}00 
set11 
{22 
_id33 
=33 
value33 
;33 

_cachedXml44 
=44 
null44 !
;44! "
}55 
}66 	
public88 
string88 
MimeType88 
{99 	
get:: 
{:: 
return:: 
	_mimeType:: "
;::" #
}::$ %
set;; 
{<< 
	_mimeType== 
=== 
value== !
;==! "

_cachedXml>> 
=>> 
null>> !
;>>! "
}?? 
}@@ 	
publicBB 
stringBB 
EncodingBB 
{CC 	
getDD 
{DD 
returnDD 
	_encodingDD "
;DD" #
}DD$ %
setEE 
{FF 
	_encodingGG 
=GG 
valueGG !
;GG! "

_cachedXmlHH 
=HH 
nullHH !
;HH! "
}II 
}JJ 	
publicLL 
XmlNodeListLL 
DataLL 
{MM 	
getNN 
{NN 
returnNN 
_elDataNN  
;NN  !
}NN" #
setOO 
{PP 
ifQQ 
(QQ 
valueQQ 
==QQ 
nullQQ !
)QQ! "
throwRR 
newRR !
ArgumentNullExceptionRR 3
(RR3 4
nameofRR4 :
(RR: ;
valueRR; @
)RR@ A
)RRA B
;RRB C
_elDataUU 
=UU 
newUU  
CanonicalXmlNodeListUU 2
(UU2 3
)UU3 4
;UU4 5
foreachVV 
(VV 
XmlNodeVV  
nodeVV! %
inVV& (
valueVV) .
)VV. /
{WW 
_elDataXX 
.XX 
AddXX 
(XX  
nodeXX  $
)XX$ %
;XX% &
}YY 

_cachedXmlZZ 
=ZZ 
nullZZ !
;ZZ! "
}[[ 
}\\ 	
private^^ 
bool^^ 

CacheValid^^ 
{__ 	
get`` 
{aa 
returnbb 
(bb 

_cachedXmlbb "
!=bb# %
nullbb& *
)bb* +
;bb+ ,
}cc 
}dd 	
publicjj 

XmlElementjj 
GetXmljj  
(jj  !
)jj! "
{kk 	
ifll 
(ll 

CacheValidll 
)ll 
returnll "
(ll# $

_cachedXmlll$ .
)ll. /
;ll/ 0
XmlDocumentnn 
documentnn  
=nn! "
newnn# &
XmlDocumentnn' 2
(nn2 3
)nn3 4
;nn4 5
documentoo 
.oo 
PreserveWhitespaceoo '
=oo( )
trueoo* .
;oo. /
returnpp 
GetXmlpp 
(pp 
documentpp "
)pp" #
;pp# $
}qq 	
internalss 

XmlElementss 
GetXmlss "
(ss" #
XmlDocumentss# .
documentss/ 7
)ss7 8
{tt 	

XmlElementuu 
objectElementuu $
=uu% &
documentuu' /
.uu/ 0
CreateElementuu0 =
(uu= >
$struu> F
,uuF G
	SignedXmluuH Q
.uuQ R
XmlDsigNamespaceUrluuR e
)uue f
;uuf g
ifww 
(ww 
!ww 
stringww 
.ww 
IsNullOrEmptyww %
(ww% &
_idww& )
)ww) *
)ww* +
objectElementxx 
.xx 
SetAttributexx *
(xx* +
$strxx+ /
,xx/ 0
_idxx1 4
)xx4 5
;xx5 6
ifyy 
(yy 
!yy 
stringyy 
.yy 
IsNullOrEmptyyy %
(yy% &
	_mimeTypeyy& /
)yy/ 0
)yy0 1
objectElementzz 
.zz 
SetAttributezz *
(zz* +
$strzz+ 5
,zz5 6
	_mimeTypezz7 @
)zz@ A
;zzA B
if{{ 
({{ 
!{{ 
string{{ 
.{{ 
IsNullOrEmpty{{ %
({{% &
	_encoding{{& /
){{/ 0
){{0 1
objectElement|| 
.|| 
SetAttribute|| *
(||* +
$str||+ 5
,||5 6
	_encoding||7 @
)||@ A
;||A B
if~~ 
(~~ 
_elData~~ 
!=~~ 
null~~ 
)~~  
{ 
foreach
ÄÄ 
(
ÄÄ 
XmlNode
ÄÄ  
node
ÄÄ! %
in
ÄÄ& (
_elData
ÄÄ) 0
)
ÄÄ0 1
{
ÅÅ 
objectElement
ÇÇ !
.
ÇÇ! "
AppendChild
ÇÇ" -
(
ÇÇ- .
document
ÇÇ. 6
.
ÇÇ6 7

ImportNode
ÇÇ7 A
(
ÇÇA B
node
ÇÇB F
,
ÇÇF G
true
ÇÇH L
)
ÇÇL M
)
ÇÇM N
;
ÇÇN O
}
ÉÉ 
}
ÑÑ 
return
ÜÜ 
objectElement
ÜÜ  
;
ÜÜ  !
}
áá 	
public
ââ 
void
ââ 
LoadXml
ââ 
(
ââ 

XmlElement
ââ &
value
ââ' ,
)
ââ, -
{
ää 	
if
ãã 
(
ãã 
value
ãã 
==
ãã 
null
ãã 
)
ãã 
throw
åå 
new
åå #
ArgumentNullException
åå /
(
åå/ 0
nameof
åå0 6
(
åå6 7
value
åå7 <
)
åå< =
)
åå= >
;
åå> ?
_id
éé 
=
éé 
Utils
éé 
.
éé 
GetAttribute
éé $
(
éé$ %
value
éé% *
,
éé* +
$str
éé, 0
,
éé0 1
	SignedXml
éé2 ;
.
éé; <!
XmlDsigNamespaceUrl
éé< O
)
ééO P
;
ééP Q
	_mimeType
èè 
=
èè 
Utils
èè 
.
èè 
GetAttribute
èè *
(
èè* +
value
èè+ 0
,
èè0 1
$str
èè2 <
,
èè< =
	SignedXml
èè> G
.
èèG H!
XmlDsigNamespaceUrl
èèH [
)
èè[ \
;
èè\ ]
	_encoding
êê 
=
êê 
Utils
êê 
.
êê 
GetAttribute
êê *
(
êê* +
value
êê+ 0
,
êê0 1
$str
êê2 <
,
êê< =
	SignedXml
êê> G
.
êêG H!
XmlDsigNamespaceUrl
êêH [
)
êê[ \
;
êê\ ]
foreach
íí 
(
íí 
XmlNode
íí 
node
íí !
in
íí" $
value
íí% *
.
íí* +

ChildNodes
íí+ 5
)
íí5 6
{
ìì 
_elData
îî 
.
îî 
Add
îî 
(
îî 
node
îî  
)
îî  !
;
îî! "
}
ïï 

_cachedXml
òò 
=
òò 
value
òò 
;
òò 
}
ôô 	
}
öö 
}õõ ∆

8C:\code\bc-xml-security\refactoring\src\DataReference.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
DataReference %
:& '
EncryptedReference( :
{ 
public 
DataReference 
( 
) 
:  
base! %
(% &
)& '
{ 	
ReferenceType 
= 
$str +
;+ ,
} 	
public 
DataReference 
( 
string #
uri$ '
)' (
:) *
base+ /
(/ 0
uri0 3
)3 4
{ 	
ReferenceType 
= 
$str +
;+ ,
} 	
public 
DataReference 
( 
string #
uri$ '
,' (
TransformChain) 7
transformChain8 F
)F G
:H I
baseJ N
(N O
uriO R
,R S
transformChainT b
)b c
{ 	
ReferenceType 
= 
$str +
;+ ,
} 	
} 
} π
6C:\code\bc-xml-security\refactoring\src\DocPosition.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal

 
enum

 
DocPosition

 
{ 
BeforeRootElement 
, 
InRootElement 
, 
AfterRootElement 
} 
} À
;C:\code\bc-xml-security\refactoring\src\DsaDigestSigner2.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
internal 
class 
DsaDigestSigner2 #
:$ %
DsaDigestSigner& 5
{ 
public 
DsaDigestSigner2 
(  
IDsa  $
dsa% (
,( )
IDigest* 1
digest2 8
)8 9
: 
base 
( 
dsa 
, 
digest 
) 
{ 	
} 	
public 
override 
bool 
VerifySignature ,
(, -
byte- 1
[1 2
]2 3
	signature4 =
)= >
{ 	
int 
sz 
= 
	signature 
. 
Length %
/& '
$num( )
;) *
var 
r 
= 
new 

BigInteger "
(" #
$num# $
,$ %
	signature& /
,/ 0
$num1 2
,2 3
sz4 6
)6 7
;7 8
var 
s 
= 
new 

BigInteger "
(" #
$num# $
,$ %
	signature& /
,/ 0
sz1 3
,3 4
sz5 7
)7 8
;8 9
var 
seq 
= 
new 
DerSequence %
(% &
new& )

DerInteger* 4
(4 5
r5 6
)6 7
,7 8
new9 <

DerInteger= G
(G H
sH I
)I J
)J K
;K L
return 
base 
. 
VerifySignature '
(' (
seq( +
.+ ,
GetDerEncoded, 9
(9 :
): ;
); <
;< =
} 	
public 
override 
byte 
[ 
] 
GenerateSignature 0
(0 1
)1 2
{ 	
var 
result 
= 
base 
. 
GenerateSignature /
(/ 0
)0 1
;1 2
var 
seq 
= 
( 
Asn1Sequence #
)# $

Asn1Object$ .
.. /
FromByteArray/ <
(< =
result= C
)C D
;D E
var 
r 
= 
( 
( 

DerInteger  
)  !
seq! $
[$ %
$num% &
]& '
)' (
.( )
Value) .
;. /
var   
s   
=   
(   
(   

DerInteger    
)    !
seq  ! $
[  $ %
$num  % &
]  & '
)  ' (
.  ( )
Value  ) .
;  . /
return!! 
r!! 
.!! 
ToByteArrayUnsigned!! (
(!!( )
)!!) *
.!!* +
Concat!!+ 1
(!!1 2
s!!2 3
.!!3 4
ToByteArrayUnsigned!!4 G
(!!G H
)!!H I
)!!I J
.!!J K
ToArray!!K R
(!!R S
)!!S T
;!!T U
}"" 	
}## 
}$$ ü¨
6C:\code\bc-xml-security\refactoring\src\DSAKeyValue.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
DSAKeyValue 
: 
KeyInfoClause ,
{ 
private "
DsaPublicKeyParameters &
_key' +
;+ ,
public 
DSAKeyValue 
( 
) 
{ 	
var 
pair 
= 
Utils 
. 
DSAGenerateKeyPair /
(/ 0
)0 1
;1 2
_key 
= 
( "
DsaPublicKeyParameters *
)* +
pair+ /
./ 0
Public0 6
;6 7
} 	
public 
DSAKeyValue 
( "
DsaPublicKeyParameters 1
key2 5
)5 6
{ 	
_key 
= 
key 
; 
} 	
public%% "
DsaPublicKeyParameters%% %
Key%%& )
{&& 	
get'' 
{'' 
return'' 
_key'' 
;'' 
}''  
set(( 
{(( 
_key(( 
=(( 
value(( 
;(( 
}((  !
})) 	
public88 
override88 

XmlElement88 "
GetXml88# )
(88) *
)88* +
{99 	
XmlDocument:: 
xmlDocument:: #
=::$ %
new::& )
XmlDocument::* 5
(::5 6
)::6 7
;::7 8
xmlDocument;; 
.;; 
PreserveWhitespace;; *
=;;+ ,
true;;- 1
;;;1 2
return<< 
GetXml<< 
(<< 
xmlDocument<< %
)<<% &
;<<& '
}== 	
private?? 
const?? 
string?? 
KeyValueElementName?? 0
=??1 2
$str??3 =
;??= >
private@@ 
const@@ 
string@@ "
DSAKeyValueElementName@@ 3
=@@4 5
$str@@6 C
;@@C D
privateCC 
constCC 
stringCC 
PElementNameCC )
=CC* +
$strCC, /
;CC/ 0
privateDD 
constDD 
stringDD 
QElementNameDD )
=DD* +
$strDD, /
;DD/ 0
privateGG 
constGG 
stringGG 
GElementNameGG )
=GG* +
$strGG, /
;GG/ 0
privateHH 
constHH 
stringHH 
JElementNameHH )
=HH* +
$strHH, /
;HH/ 0
privateKK 
constKK 
stringKK 
YElementNameKK )
=KK* +
$strKK, /
;KK/ 0
privateNN 
constNN 
stringNN 
SeedElementNameNN ,
=NN- .
$strNN/ 5
;NN5 6
privateOO 
constOO 
stringOO "
PgenCounterElementNameOO 3
=OO4 5
$strOO6 C
;OOC D
internalQQ 
overrideQQ 

XmlElementQQ $
GetXmlQQ% +
(QQ+ ,
XmlDocumentQQ, 7
xmlDocumentQQ8 C
)QQC D
{RR 	

XmlElementSS 
keyValueElementSS &
=SS' (
xmlDocumentSS) 4
.SS4 5
CreateElementSS5 B
(SSB C
KeyValueElementNameSSC V
,SSV W
	SignedXmlSSX a
.SSa b
XmlDsigNamespaceUrlSSb u
)SSu v
;SSv w

XmlElementTT 
dsaKeyValueElementTT )
=TT* +
xmlDocumentTT, 7
.TT7 8
CreateElementTT8 E
(TTE F"
DSAKeyValueElementNameTTF \
,TT\ ]
	SignedXmlTT^ g
.TTg h
XmlDsigNamespaceUrlTTh {
)TT{ |
;TT| }

XmlElementVV 
pElementVV 
=VV  !
xmlDocumentVV" -
.VV- .
CreateElementVV. ;
(VV; <
PElementNameVV< H
,VVH I
	SignedXmlVVJ S
.VVS T
XmlDsigNamespaceUrlVVT g
)VVg h
;VVh i
pElementWW 
.WW 
AppendChildWW  
(WW  !
xmlDocumentWW! ,
.WW, -
CreateTextNodeWW- ;
(WW; <
ConvertWW< C
.WWC D
ToBase64StringWWD R
(WWR S
_keyWWS W
.WWW X

ParametersWWX b
.WWb c
PWWc d
.WWd e
ToByteArrayUnsignedWWe x
(WWx y
)WWy z
)WWz {
)WW{ |
)WW| }
;WW} ~
dsaKeyValueElementXX 
.XX 
AppendChildXX *
(XX* +
pElementXX+ 3
)XX3 4
;XX4 5

XmlElementZZ 
qElementZZ 
=ZZ  !
xmlDocumentZZ" -
.ZZ- .
CreateElementZZ. ;
(ZZ; <
QElementNameZZ< H
,ZZH I
	SignedXmlZZJ S
.ZZS T
XmlDsigNamespaceUrlZZT g
)ZZg h
;ZZh i
qElement[[ 
.[[ 
AppendChild[[  
([[  !
xmlDocument[[! ,
.[[, -
CreateTextNode[[- ;
([[; <
Convert[[< C
.[[C D
ToBase64String[[D R
([[R S
_key[[S W
.[[W X

Parameters[[X b
.[[b c
Q[[c d
.[[d e
ToByteArrayUnsigned[[e x
([[x y
)[[y z
)[[z {
)[[{ |
)[[| }
;[[} ~
dsaKeyValueElement\\ 
.\\ 
AppendChild\\ *
(\\* +
qElement\\+ 3
)\\3 4
;\\4 5

XmlElement^^ 
gElement^^ 
=^^  !
xmlDocument^^" -
.^^- .
CreateElement^^. ;
(^^; <
GElementName^^< H
,^^H I
	SignedXml^^J S
.^^S T
XmlDsigNamespaceUrl^^T g
)^^g h
;^^h i
gElement__ 
.__ 
AppendChild__  
(__  !
xmlDocument__! ,
.__, -
CreateTextNode__- ;
(__; <
Convert__< C
.__C D
ToBase64String__D R
(__R S
_key__S W
.__W X

Parameters__X b
.__b c
G__c d
.__d e
ToByteArrayUnsigned__e x
(__x y
)__y z
)__z {
)__{ |
)__| }
;__} ~
dsaKeyValueElement`` 
.`` 
AppendChild`` *
(``* +
gElement``+ 3
)``3 4
;``4 5

XmlElementbb 
yElementbb 
=bb  !
xmlDocumentbb" -
.bb- .
CreateElementbb. ;
(bb; <
YElementNamebb< H
,bbH I
	SignedXmlbbJ S
.bbS T
XmlDsigNamespaceUrlbbT g
)bbg h
;bbh i
yElementcc 
.cc 
AppendChildcc  
(cc  !
xmlDocumentcc! ,
.cc, -
CreateTextNodecc- ;
(cc; <
Convertcc< C
.ccC D
ToBase64StringccD R
(ccR S
_keyccS W
.ccW X
YccX Y
.ccY Z
ToByteArrayUnsignedccZ m
(ccm n
)ccn o
)cco p
)ccp q
)ccq r
;ccr s
dsaKeyValueElementdd 
.dd 
AppendChilddd *
(dd* +
yElementdd+ 3
)dd3 4
;dd4 5
ifnn 
(nn 
_keynn 
.nn 

Parametersnn 
.nn   
ValidationParametersnn  4
!=nn5 7
nullnn8 <
)nn< =
{oo 

XmlElementpp 
seedElementpp &
=pp' (
xmlDocumentpp) 4
.pp4 5
CreateElementpp5 B
(ppB C
SeedElementNameppC R
,ppR S
	SignedXmlppT ]
.pp] ^
XmlDsigNamespaceUrlpp^ q
)ppq r
;ppr s
seedElementqq 
.qq 
AppendChildqq '
(qq' (
xmlDocumentqq( 3
.qq3 4
CreateTextNodeqq4 B
(qqB C
ConvertqqC J
.qqJ K
ToBase64StringqqK Y
(qqY Z
_keyqqZ ^
.qq^ _

Parametersqq_ i
.qqi j 
ValidationParametersqqj ~
.qq~ 
GetSeed	qq Ü
(
qqÜ á
)
qqá à
)
qqà â
)
qqâ ä
)
qqä ã
;
qqã å
dsaKeyValueElementrr "
.rr" #
AppendChildrr# .
(rr. /
seedElementrr/ :
)rr: ;
;rr; <

XmlElementtt 
counterElementtt )
=tt* +
xmlDocumenttt, 7
.tt7 8
CreateElementtt8 E
(ttE F"
PgenCounterElementNamettF \
,tt\ ]
	SignedXmltt^ g
.ttg h
XmlDsigNamespaceUrltth {
)tt{ |
;tt| }
counterElementuu 
.uu 
AppendChilduu *
(uu* +
xmlDocumentuu+ 6
.uu6 7
CreateTextNodeuu7 E
(uuE F
ConvertuuF M
.uuM N
ToBase64StringuuN \
(uu\ ]
Utilsuu] b
.uub c!
ConvertIntToByteArrayuuc x
(uux y
_keyuuy }
.uu} ~

Parameters	uu~ à
.
uuà â"
ValidationParameters
uuâ ù
.
uuù û
Counter
uuû •
)
uu• ¶
)
uu¶ ß
)
uuß ®
)
uu® ©
;
uu© ™
dsaKeyValueElementvv "
.vv" #
AppendChildvv# .
(vv. /
counterElementvv/ =
)vv= >
;vv> ?
}ww 
keyValueElementyy 
.yy 
AppendChildyy '
(yy' (
dsaKeyValueElementyy( :
)yy: ;
;yy; <
return{{ 
keyValueElement{{ "
;{{" #
}|| 	
public
çç 
override
çç 
void
çç 
LoadXml
çç $
(
çç$ %

XmlElement
çç% /
value
çç0 5
)
çç5 6
{
éé 	
if
èè 
(
èè 
value
èè 
==
èè 
null
èè 
)
èè 
{
êê 
throw
ëë 
new
ëë #
ArgumentNullException
ëë /
(
ëë/ 0
nameof
ëë0 6
(
ëë6 7
value
ëë7 <
)
ëë< =
)
ëë= >
;
ëë> ?
}
íí 
if
ìì 
(
ìì 
value
ìì 
.
ìì 
Name
ìì 
!=
ìì !
KeyValueElementName
ìì 1
||
îî 
value
îî 
.
îî 
NamespaceURI
îî %
!=
îî& (
	SignedXml
îî) 2
.
îî2 3!
XmlDsigNamespaceUrl
îî3 F
)
îîF G
{
ïï 
throw
ññ 
new
ññ 
System
ññ  
.
ññ  !
Security
ññ! )
.
ññ) *
Cryptography
ññ* 6
.
ññ6 7$
CryptographicException
ññ7 M
(
ññM N
$"
ññN P#
Root element must be 
ññP e
{
ññe f!
KeyValueElementName
ññf y
}
ññy z%
 element in namepsace ññz ê
{ññê ë
	SignedXmlññë ö
.ññö õ#
XmlDsigNamespaceUrlññõ Æ
}ññÆ Ø
"ññØ ∞
)ññ∞ ±
;ññ± ≤
}
óó 
const
ôô 
string
ôô $
xmlDsigNamespacePrefix
ôô /
=
ôô0 1
$str
ôô2 8
;
ôô8 9!
XmlNamespaceManager
öö !
xmlNamespaceManager
öö  3
=
öö4 5
new
öö6 9!
XmlNamespaceManager
öö: M
(
ööM N
value
ööN S
.
ööS T
OwnerDocument
ööT a
.
ööa b
	NameTable
ööb k
)
öök l
;
ööl m!
xmlNamespaceManager
õõ 
.
õõ  
AddNamespace
õõ  ,
(
õõ, -$
xmlDsigNamespacePrefix
õõ- C
,
õõC D
	SignedXml
õõE N
.
õõN O!
XmlDsigNamespaceUrl
õõO b
)
õõb c
;
õõc d
XmlNode
ùù  
dsaKeyValueElement
ùù &
=
ùù' (
value
ùù) .
.
ùù. /
SelectSingleNode
ùù/ ?
(
ùù? @
$"
ùù@ B
{
ùùB C$
xmlDsigNamespacePrefix
ùùC Y
}
ùùY Z
:
ùùZ [
{
ùù[ \$
DSAKeyValueElementName
ùù\ r
}
ùùr s
"
ùùs t
,
ùùt u"
xmlNamespaceManagerùùv â
)ùùâ ä
;ùùä ã
if
ûû 
(
ûû  
dsaKeyValueElement
ûû "
==
ûû# %
null
ûû& *
)
ûû* +
{
üü 
throw
†† 
new
†† 
System
††  
.
††  !
Security
††! )
.
††) *
Cryptography
††* 6
.
††6 7$
CryptographicException
††7 M
(
††M N
$"
††N P
{
††P Q!
KeyValueElementName
††Q d
}
††d e+
 must contain child element ††e Å
{††Å Ç&
DSAKeyValueElementName††Ç ò
}††ò ô
"††ô ö
)††ö õ
;††õ ú
}
°° 
XmlNode
££ 
yNode
££ 
=
££  
dsaKeyValueElement
££ .
.
££. /
SelectSingleNode
££/ ?
(
££? @
$"
££@ B
{
££B C$
xmlDsigNamespacePrefix
££C Y
}
££Y Z
:
££Z [
{
££[ \
YElementName
££\ h
}
££h i
"
££i j
,
££j k!
xmlNamespaceManager
££l 
)££ Ä
;££Ä Å
if
§§ 
(
§§ 
yNode
§§ 
==
§§ 
null
§§ 
)
§§ 
throw
•• 
new
•• 
System
••  
.
••  !
Security
••! )
.
••) *
Cryptography
••* 6
.
••6 7$
CryptographicException
••7 M
(
••M N
$"
••N P
{
••P Q
YElementName
••Q ]
}
••] ^
 is missing
••^ i
"
••i j
)
••j k
;
••k l
XmlNode
ßß 
pNode
ßß 
=
ßß  
dsaKeyValueElement
ßß .
.
ßß. /
SelectSingleNode
ßß/ ?
(
ßß? @
$"
ßß@ B
{
ßßB C$
xmlDsigNamespacePrefix
ßßC Y
}
ßßY Z
:
ßßZ [
{
ßß[ \
PElementName
ßß\ h
}
ßßh i
"
ßßi j
,
ßßj k!
xmlNamespaceManager
ßßl 
)ßß Ä
;ßßÄ Å
XmlNode
®® 
qNode
®® 
=
®®  
dsaKeyValueElement
®® .
.
®®. /
SelectSingleNode
®®/ ?
(
®®? @
$"
®®@ B
{
®®B C$
xmlDsigNamespacePrefix
®®C Y
}
®®Y Z
:
®®Z [
{
®®[ \
QElementName
®®\ h
}
®®h i
"
®®i j
,
®®j k!
xmlNamespaceManager
®®l 
)®® Ä
;®®Ä Å
if
™™ 
(
™™ 
(
™™ 
pNode
™™ 
==
™™ 
null
™™ 
&&
™™ !
qNode
™™" '
!=
™™( *
null
™™+ /
)
™™/ 0
||
™™1 3
(
™™4 5
pNode
™™5 :
!=
™™; =
null
™™> B
&&
™™C E
qNode
™™F K
==
™™L N
null
™™O S
)
™™S T
)
™™T U
throw
´´ 
new
´´ 
System
´´  
.
´´  !
Security
´´! )
.
´´) *
Cryptography
´´* 6
.
´´6 7$
CryptographicException
´´7 M
(
´´M N
$"
´´N P
{
´´P Q
PElementName
´´Q ]
}
´´] ^
 and 
´´^ c
{
´´c d
QElementName
´´d p
}
´´p q.
 can only occour in combination´´q ê
"´´ê ë
)´´ë í
;´´í ì
XmlNode
ÆÆ 
gNode
ÆÆ 
=
ÆÆ  
dsaKeyValueElement
ÆÆ .
.
ÆÆ. /
SelectSingleNode
ÆÆ/ ?
(
ÆÆ? @
$"
ÆÆ@ B
{
ÆÆB C$
xmlDsigNamespacePrefix
ÆÆC Y
}
ÆÆY Z
:
ÆÆZ [
{
ÆÆ[ \
GElementName
ÆÆ\ h
}
ÆÆh i
"
ÆÆi j
,
ÆÆj k!
xmlNamespaceManager
ÆÆl 
)ÆÆ Ä
;ÆÆÄ Å
XmlNode
ØØ 
jNode
ØØ 
=
ØØ  
dsaKeyValueElement
ØØ .
.
ØØ. /
SelectSingleNode
ØØ/ ?
(
ØØ? @
$"
ØØ@ B
{
ØØB C$
xmlDsigNamespacePrefix
ØØC Y
}
ØØY Z
:
ØØZ [
{
ØØ[ \
JElementName
ØØ\ h
}
ØØh i
"
ØØi j
,
ØØj k!
xmlNamespaceManager
ØØl 
)ØØ Ä
;ØØÄ Å
XmlNode
±± 
seedNode
±± 
=
±±  
dsaKeyValueElement
±± 1
.
±±1 2
SelectSingleNode
±±2 B
(
±±B C
$"
±±C E
{
±±E F$
xmlDsigNamespacePrefix
±±F \
}
±±\ ]
:
±±] ^
{
±±^ _
SeedElementName
±±_ n
}
±±n o
"
±±o p
,
±±p q"
xmlNamespaceManager±±r Ö
)±±Ö Ü
;±±Ü á
XmlNode
≤≤ 
pgenCounterNode
≤≤ #
=
≤≤$ % 
dsaKeyValueElement
≤≤& 8
.
≤≤8 9
SelectSingleNode
≤≤9 I
(
≤≤I J
$"
≤≤J L
{
≤≤L M$
xmlDsigNamespacePrefix
≤≤M c
}
≤≤c d
:
≤≤d e
{
≤≤e f$
PgenCounterElementName
≤≤f |
}
≤≤| }
"
≤≤} ~
,
≤≤~ #
xmlNamespaceManager≤≤Ä ì
)≤≤ì î
;≤≤î ï
if
≥≥ 
(
≥≥ 
(
≥≥ 
seedNode
≥≥ 
==
≥≥ 
null
≥≥ !
&&
≥≥" $
pgenCounterNode
≥≥% 4
!=
≥≥5 7
null
≥≥8 <
)
≥≥< =
||
≥≥> @
(
≥≥A B
seedNode
≥≥B J
!=
≥≥K M
null
≥≥N R
&&
≥≥S U
pgenCounterNode
≥≥V e
==
≥≥f h
null
≥≥i m
)
≥≥m n
)
≥≥n o
throw
¥¥ 
new
¥¥ 
System
¥¥  
.
¥¥  !
Security
¥¥! )
.
¥¥) *
Cryptography
¥¥* 6
.
¥¥6 7$
CryptographicException
¥¥7 M
(
¥¥M N
$"
¥¥N P
{
¥¥P Q
SeedElementName
¥¥Q `
}
¥¥` a
 and 
¥¥a f
{
¥¥f g$
PgenCounterElementName
¥¥g }
}
¥¥} ~-
 can only occur in combination¥¥~ ú
"¥¥ú ù
)¥¥ù û
;¥¥û ü
try
∂∂ 
{
∑∑ 
_key
∏∏ 
=
∏∏ 
new
∏∏ $
DsaPublicKeyParameters
∏∏ 1
(
∏∏1 2
new
∏∏2 5
Math
∏∏6 :
.
∏∏: ;

BigInteger
∏∏; E
(
∏∏E F
$num
∏∏F G
,
∏∏G H
Convert
∏∏I P
.
∏∏P Q
FromBase64String
∏∏Q a
(
∏∏a b
yNode
∏∏b g
.
∏∏g h
	InnerText
∏∏h q
)
∏∏q r
)
∏∏r s
,
∏∏s t
new
ππ 
DsaParameters
ππ %
(
ππ% &
new
∫∫ 
Math
∫∫  
.
∫∫  !

BigInteger
∫∫! +
(
∫∫+ ,
$num
∫∫, -
,
∫∫- .
(
∫∫/ 0
pNode
∫∫0 5
!=
∫∫6 8
null
∫∫9 =
)
∫∫= >
?
∫∫? @
Convert
∫∫A H
.
∫∫H I
FromBase64String
∫∫I Y
(
∫∫Y Z
pNode
∫∫Z _
.
∫∫_ `
	InnerText
∫∫` i
)
∫∫i j
:
∫∫k l
null
∫∫m q
)
∫∫q r
,
∫∫r s
new
ªª 
Math
ªª  
.
ªª  !

BigInteger
ªª! +
(
ªª+ ,
$num
ªª, -
,
ªª- .
(
ªª/ 0
qNode
ªª0 5
!=
ªª6 8
null
ªª9 =
)
ªª= >
?
ªª? @
Convert
ªªA H
.
ªªH I
FromBase64String
ªªI Y
(
ªªY Z
qNode
ªªZ _
.
ªª_ `
	InnerText
ªª` i
)
ªªi j
:
ªªk l
null
ªªm q
)
ªªq r
,
ªªr s
new
ºº 
Math
ºº  
.
ºº  !

BigInteger
ºº! +
(
ºº+ ,
$num
ºº, -
,
ºº- .
(
ºº/ 0
gNode
ºº0 5
!=
ºº6 8
null
ºº9 =
)
ºº= >
?
ºº? @
Convert
ººA H
.
ººH I
FromBase64String
ººI Y
(
ººY Z
gNode
ººZ _
.
ºº_ `
	InnerText
ºº` i
)
ººi j
:
ººk l
null
ººm q
)
ººq r
,
ººr s
new
ΩΩ %
DsaValidationParameters
ΩΩ 3
(
ΩΩ3 4
(
ææ 
seedNode
ææ %
!=
ææ& (
null
ææ) -
)
ææ- .
?
ææ/ 0
Convert
ææ1 8
.
ææ8 9
FromBase64String
ææ9 I
(
ææI J
seedNode
ææJ R
.
ææR S
	InnerText
ææS \
)
ææ\ ]
:
ææ^ _
null
ææ` d
,
ææd e
(
øø 
pgenCounterNode
øø ,
!=
øø- /
null
øø0 4
)
øø4 5
?
øø6 7
Utils
øø8 =
.
øø= >#
ConvertByteArrayToInt
øø> S
(
øøS T
Convert
øøT [
.
øø[ \
FromBase64String
øø\ l
(
øøl m
pgenCounterNode
øøm |
.
øø| }
	InnerTextøø} Ü
)øøÜ á
)øøá à
:øøâ ä
$numøøã å
)øøå ç
)øøç é
)øøé è
;øøè ê
}
¿¿ 
catch
¡¡ 
(
¡¡ 
	Exception
¡¡ 
ex
¡¡ 
)
¡¡  
{
¬¬ 
throw
√√ 
new
√√ 
System
√√  
.
√√  !
Security
√√! )
.
√√) *
Cryptography
√√* 6
.
√√6 7$
CryptographicException
√√7 M
(
√√M N
$"
√√N P:
,An error occurred parsing the key components
√√P |
"
√√| }
,
√√} ~
ex√√ Å
)√√Å Ç
;√√Ç É
}
ƒƒ 
}
≈≈ 	
}
∆∆ 
}«« ∞[
8C:\code\bc-xml-security\refactoring\src\EncryptedData.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
EncryptedData %
:& '
EncryptedType( 5
{ 
public 
override 
void 
LoadXml $
($ %

XmlElement% /
value0 5
)5 6
{ 	
if 
( 
value 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
value7 <
)< =
)= >
;> ?
XmlNamespaceManager 
nsm  #
=$ %
new& )
XmlNamespaceManager* =
(= >
value> C
.C D
OwnerDocumentD Q
.Q R
	NameTableR [
)[ \
;\ ]
nsm 
. 
AddNamespace 
( 
$str "
," #
EncryptedXml$ 0
.0 1
XmlEncNamespaceUrl1 C
)C D
;D E
nsm 
. 
AddNamespace 
( 
$str !
,! "
	SignedXml# ,
., -
XmlDsigNamespaceUrl- @
)@ A
;A B
Id 
= 
Utils 
. 
GetAttribute #
(# $
value$ )
,) *
$str+ /
,/ 0
EncryptedXml1 =
.= >
XmlEncNamespaceUrl> P
)P Q
;Q R
Type 
= 
Utils 
. 
GetAttribute %
(% &
value& +
,+ ,
$str- 3
,3 4
EncryptedXml5 A
.A B
XmlEncNamespaceUrlB T
)T U
;U V
MimeType 
= 
Utils 
. 
GetAttribute )
() *
value* /
,/ 0
$str1 ;
,; <
EncryptedXml= I
.I J
XmlEncNamespaceUrlJ \
)\ ]
;] ^
Encoding 
= 
Utils 
. 
GetAttribute )
() *
value* /
,/ 0
$str1 ;
,; <
EncryptedXml= I
.I J
XmlEncNamespaceUrlJ \
)\ ]
;] ^
XmlNode  
encryptionMethodNode (
=) *
value+ 0
.0 1
SelectSingleNode1 A
(A B
$strB X
,X Y
nsmZ ]
)] ^
;^ _
EncryptionMethod 
= 
new "
EncryptionMethod# 3
(3 4
)4 5
;5 6
if 
(  
encryptionMethodNode $
!=% '
null( ,
), -
EncryptionMethod    
.    !
LoadXml  ! (
(  ( ) 
encryptionMethodNode  ) =
as  > @

XmlElement  A K
)  K L
;  L M
KeyInfo## 
=## 
new## 
KeyInfo## !
(##! "
)##" #
;### $
XmlNode$$ 
keyInfoNode$$ 
=$$  !
value$$" '
.$$' (
SelectSingleNode$$( 8
($$8 9
$str$$9 E
,$$E F
nsm$$G J
)$$J K
;$$K L
if%% 
(%% 
keyInfoNode%% 
!=%% 
null%% #
)%%# $
KeyInfo&& 
.&& 
LoadXml&& 
(&&  
keyInfoNode&&  +
as&&, .

XmlElement&&/ 9
)&&9 :
;&&: ;
XmlNode)) 
cipherDataNode)) "
=))# $
value))% *
.))* +
SelectSingleNode))+ ;
()); <
$str))< L
,))L M
nsm))N Q
)))Q R
;))R S
if** 
(** 
cipherDataNode** 
==** !
null**" &
)**& '
throw++ 
new++ 
System++  
.++  !
Security++! )
.++) *
Cryptography++* 6
.++6 7"
CryptographicException++7 M
(++M N
SR++N P
.++P Q.
"Cryptography_Xml_MissingCipherData++Q s
)++s t
;++t u

CipherData-- 
=-- 
new-- 

CipherData-- '
(--' (
)--( )
;--) *

CipherData.. 
... 
LoadXml.. 
(.. 
cipherDataNode.. -
as... 0

XmlElement..1 ;
)..; <
;..< =
XmlNode11 $
encryptionPropertiesNode11 ,
=11- .
value11/ 4
.114 5
SelectSingleNode115 E
(11E F
$str11F `
,11` a
nsm11b e
)11e f
;11f g
if22 
(22 $
encryptionPropertiesNode22 (
!=22) +
null22, 0
)220 1
{33 
XmlNodeList55 #
encryptionPropertyNodes55 3
=554 5$
encryptionPropertiesNode556 N
.55N O
SelectNodes55O Z
(55Z [
$str55[ s
,55s t
nsm55u x
)55x y
;55y z
if66 
(66 #
encryptionPropertyNodes66 +
!=66, .
null66/ 3
)663 4
{77 
foreach88 
(88 
XmlNode88 $
node88% )
in88* ,#
encryptionPropertyNodes88- D
)88D E
{99 
EncryptionProperty:: *
ep::+ -
=::. /
new::0 3
EncryptionProperty::4 F
(::F G
)::G H
;::H I
ep;; 
.;; 
LoadXml;; "
(;;" #
node;;# '
as;;( *

XmlElement;;+ 5
);;5 6
;;;6 7 
EncryptionProperties<< ,
.<<, -
Add<<- 0
(<<0 1
ep<<1 3
)<<3 4
;<<4 5
}== 
}>> 
}?? 

_cachedXmlBB 
=BB 
valueBB 
;BB 
}CC 	
publicEE 
overrideEE 

XmlElementEE "
GetXmlEE# )
(EE) *
)EE* +
{FF 	
ifGG 
(GG 

CacheValidGG 
)GG 
returnGG "
(GG# $

_cachedXmlGG$ .
)GG. /
;GG/ 0
XmlDocumentII 
documentII  
=II! "
newII# &
XmlDocumentII' 2
(II2 3
)II3 4
;II4 5
documentJJ 
.JJ 
PreserveWhitespaceJJ '
=JJ( )
trueJJ* .
;JJ. /
returnKK 
GetXmlKK 
(KK 
documentKK "
)KK" #
;KK# $
}LL 	
internalNN 

XmlElementNN 
GetXmlNN "
(NN" #
XmlDocumentNN# .
documentNN/ 7
)NN7 8
{OO 	

XmlElementQQ  
encryptedDataElementQQ +
=QQ, -
(QQ. /

XmlElementQQ/ 9
)QQ9 :
documentQQ: B
.QQB C
CreateElementQQC P
(QQP Q
$strQQQ `
,QQ` a
EncryptedXmlQQb n
.QQn o
XmlEncNamespaceUrl	QQo Å
)
QQÅ Ç
;
QQÇ É
ifTT 
(TT 
!TT 
stringTT 
.TT 
IsNullOrEmptyTT %
(TT% &
IdTT& (
)TT( )
)TT) * 
encryptedDataElementUU $
.UU$ %
SetAttributeUU% 1
(UU1 2
$strUU2 6
,UU6 7
IdUU8 :
)UU: ;
;UU; <
ifVV 
(VV 
!VV 
stringVV 
.VV 
IsNullOrEmptyVV %
(VV% &
TypeVV& *
)VV* +
)VV+ , 
encryptedDataElementWW $
.WW$ %
SetAttributeWW% 1
(WW1 2
$strWW2 8
,WW8 9
TypeWW: >
)WW> ?
;WW? @
ifXX 
(XX 
!XX 
stringXX 
.XX 
IsNullOrEmptyXX %
(XX% &
MimeTypeXX& .
)XX. /
)XX/ 0 
encryptedDataElementYY $
.YY$ %
SetAttributeYY% 1
(YY1 2
$strYY2 <
,YY< =
MimeTypeYY> F
)YYF G
;YYG H
ifZZ 
(ZZ 
!ZZ 
stringZZ 
.ZZ 
IsNullOrEmptyZZ %
(ZZ% &
EncodingZZ& .
)ZZ. /
)ZZ/ 0 
encryptedDataElement[[ $
.[[$ %
SetAttribute[[% 1
([[1 2
$str[[2 <
,[[< =
Encoding[[> F
)[[F G
;[[G H
if^^ 
(^^ 
EncryptionMethod^^  
!=^^! #
null^^$ (
)^^( ) 
encryptedDataElement__ $
.__$ %
AppendChild__% 0
(__0 1
EncryptionMethod__1 A
.__A B
GetXml__B H
(__H I
document__I Q
)__Q R
)__R S
;__S T
ifbb 
(bb 
KeyInfobb 
.bb 
Countbb 
>bb 
$numbb  !
)bb! " 
encryptedDataElementcc $
.cc$ %
AppendChildcc% 0
(cc0 1
KeyInfocc1 8
.cc8 9
GetXmlcc9 ?
(cc? @
documentcc@ H
)ccH I
)ccI J
;ccJ K
ifff 
(ff 

CipherDataff 
==ff 
nullff "
)ff" #
throwgg 
newgg 
Systemgg  
.gg  !
Securitygg! )
.gg) *
Cryptographygg* 6
.gg6 7"
CryptographicExceptiongg7 M
(ggM N
SRggN P
.ggP Q.
"Cryptography_Xml_MissingCipherDataggQ s
)ggs t
;ggt u 
encryptedDataElementhh  
.hh  !
AppendChildhh! ,
(hh, -

CipherDatahh- 7
.hh7 8
GetXmlhh8 >
(hh> ?
documenthh? G
)hhG H
)hhH I
;hhI J
ifkk 
(kk  
EncryptionPropertieskk $
.kk$ %
Countkk% *
>kk+ ,
$numkk- .
)kk. /
{ll 

XmlElementmm '
encryptionPropertiesElementmm 6
=mm7 8
documentmm9 A
.mmA B
CreateElementmmB O
(mmO P
$strmmP f
,mmf g
EncryptedXmlmmh t
.mmt u
XmlEncNamespaceUrl	mmu á
)
mmá à
;
mmà â
fornn 
(nn 
intnn 
indexnn 
=nn  
$numnn! "
;nn" #
indexnn$ )
<nn* + 
EncryptionPropertiesnn, @
.nn@ A
CountnnA F
;nnF G
indexnnH M
++nnM O
)nnO P
{oo 
EncryptionPropertypp &
eppp' )
=pp* + 
EncryptionPropertiespp, @
.pp@ A
ItemppA E
(ppE F
indexppF K
)ppK L
;ppL M'
encryptionPropertiesElementqq /
.qq/ 0
AppendChildqq0 ;
(qq; <
epqq< >
.qq> ?
GetXmlqq? E
(qqE F
documentqqF N
)qqN O
)qqO P
;qqP Q
}rr  
encryptedDataElementss $
.ss$ %
AppendChildss% 0
(ss0 1'
encryptionPropertiesElementss1 L
)ssL M
;ssM N
}tt 
returnuu  
encryptedDataElementuu '
;uu' (
}vv 	
}ww 
}xx ™¢
7C:\code\bc-xml-security\refactoring\src\EncryptedKey.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
EncryptedKey $
:% &
EncryptedType' 4
{ 
private 
string 

_recipient !
;! "
private 
string 
_carriedKeyName &
;& '
private 
ReferenceList 
_referenceList ,
;, -
public 
EncryptedKey 
( 
) 
{ 
}  !
public 
string 
	Recipient 
{ 	
get 
{ 
if 
( 

_recipient 
== !
null" &
)& '

_recipient 
=  
string! '
.' (
Empty( -
;- .
return 

_recipient !
;! "
} 
set 
{ 

_recipient 
= 
value "
;" #

_cachedXml 
= 
null !
;! "
}   
}!! 	
public## 
string## 
CarriedKeyName## $
{$$ 	
get%% 
{%% 
return%% 
_carriedKeyName%% (
;%%( )
}%%* +
set&& 
{'' 
_carriedKeyName(( 
=((  !
value((" '
;((' (

_cachedXml)) 
=)) 
null)) !
;))! "
}** 
}++ 	
public-- 
ReferenceList-- 
ReferenceList-- *
{.. 	
get// 
{00 
if11 
(11 
_referenceList11 "
==11# %
null11& *
)11* +
_referenceList22 "
=22# $
new22% (
ReferenceList22) 6
(226 7
)227 8
;228 9
return33 
_referenceList33 %
;33% &
}44 
}55 	
public77 
void77 
AddReference77  
(77  !
DataReference77! .
dataReference77/ <
)77< =
{88 	
ReferenceList99 
.99 
Add99 
(99 
dataReference99 +
)99+ ,
;99, -
}:: 	
public<< 
void<< 
AddReference<<  
(<<  !
KeyReference<<! -
keyReference<<. :
)<<: ;
{== 	
ReferenceList>> 
.>> 
Add>> 
(>> 
keyReference>> *
)>>* +
;>>+ ,
}?? 	
publicAA 
overrideAA 
voidAA 
LoadXmlAA $
(AA$ %

XmlElementAA% /
valueAA0 5
)AA5 6
{BB 	
ifCC 
(CC 
valueCC 
==CC 
nullCC 
)CC 
throwDD 
newDD !
ArgumentNullExceptionDD /
(DD/ 0
nameofDD0 6
(DD6 7
valueDD7 <
)DD< =
)DD= >
;DD> ?
XmlNamespaceManagerFF 
nsmFF  #
=FF$ %
newFF& )
XmlNamespaceManagerFF* =
(FF= >
valueFF> C
.FFC D
OwnerDocumentFFD Q
.FFQ R
	NameTableFFR [
)FF[ \
;FF\ ]
nsmGG 
.GG 
AddNamespaceGG 
(GG 
$strGG "
,GG" #
EncryptedXmlGG$ 0
.GG0 1
XmlEncNamespaceUrlGG1 C
)GGC D
;GGD E
nsmHH 
.HH 
AddNamespaceHH 
(HH 
$strHH !
,HH! "
	SignedXmlHH# ,
.HH, -
XmlDsigNamespaceUrlHH- @
)HH@ A
;HHA B
IdJJ 
=JJ 
UtilsJJ 
.JJ 
GetAttributeJJ #
(JJ# $
valueJJ$ )
,JJ) *
$strJJ+ /
,JJ/ 0
EncryptedXmlJJ1 =
.JJ= >
XmlEncNamespaceUrlJJ> P
)JJP Q
;JJQ R
TypeKK 
=KK 
UtilsKK 
.KK 
GetAttributeKK %
(KK% &
valueKK& +
,KK+ ,
$strKK- 3
,KK3 4
EncryptedXmlKK5 A
.KKA B
XmlEncNamespaceUrlKKB T
)KKT U
;KKU V
MimeTypeLL 
=LL 
UtilsLL 
.LL 
GetAttributeLL )
(LL) *
valueLL* /
,LL/ 0
$strLL1 ;
,LL; <
EncryptedXmlLL= I
.LLI J
XmlEncNamespaceUrlLLJ \
)LL\ ]
;LL] ^
EncodingMM 
=MM 
UtilsMM 
.MM 
GetAttributeMM )
(MM) *
valueMM* /
,MM/ 0
$strMM1 ;
,MM; <
EncryptedXmlMM= I
.MMI J
XmlEncNamespaceUrlMMJ \
)MM\ ]
;MM] ^
	RecipientNN 
=NN 
UtilsNN 
.NN 
GetAttributeNN *
(NN* +
valueNN+ 0
,NN0 1
$strNN2 =
,NN= >
EncryptedXmlNN? K
.NNK L
XmlEncNamespaceUrlNNL ^
)NN^ _
;NN_ `
XmlNodePP  
encryptionMethodNodePP (
=PP) *
valuePP+ 0
.PP0 1
SelectSingleNodePP1 A
(PPA B
$strPPB X
,PPX Y
nsmPPZ ]
)PP] ^
;PP^ _
EncryptionMethodSS 
=SS 
newSS "
EncryptionMethodSS# 3
(SS3 4
)SS4 5
;SS5 6
ifTT 
(TT  
encryptionMethodNodeTT $
!=TT% '
nullTT( ,
)TT, -
EncryptionMethodUU  
.UU  !
LoadXmlUU! (
(UU( ) 
encryptionMethodNodeUU) =
asUU> @

XmlElementUUA K
)UUK L
;UUL M
KeyInfoXX 
=XX 
newXX 
KeyInfoXX !
(XX! "
)XX" #
;XX# $
XmlNodeYY 
keyInfoNodeYY 
=YY  !
valueYY" '
.YY' (
SelectSingleNodeYY( 8
(YY8 9
$strYY9 E
,YYE F
nsmYYG J
)YYJ K
;YYK L
ifZZ 
(ZZ 
keyInfoNodeZZ 
!=ZZ 
nullZZ #
)ZZ# $
KeyInfo[[ 
.[[ 
LoadXml[[ 
([[  
keyInfoNode[[  +
as[[, .

XmlElement[[/ 9
)[[9 :
;[[: ;
XmlNode^^ 
cipherDataNode^^ "
=^^# $
value^^% *
.^^* +
SelectSingleNode^^+ ;
(^^; <
$str^^< L
,^^L M
nsm^^N Q
)^^Q R
;^^R S
if__ 
(__ 
cipherDataNode__ 
==__ !
null__" &
)__& '
throw`` 
new`` 
System``  
.``  !
Security``! )
.``) *
Cryptography``* 6
.``6 7"
CryptographicException``7 M
(``M N
SR``N P
.``P Q.
"Cryptography_Xml_MissingCipherData``Q s
)``s t
;``t u

CipherDatabb 
=bb 
newbb 

CipherDatabb '
(bb' (
)bb( )
;bb) *

CipherDatacc 
.cc 
LoadXmlcc 
(cc 
cipherDataNodecc -
ascc. 0

XmlElementcc1 ;
)cc; <
;cc< =
XmlNodeff $
encryptionPropertiesNodeff ,
=ff- .
valueff/ 4
.ff4 5
SelectSingleNodeff5 E
(ffE F
$strffF `
,ff` a
nsmffb e
)ffe f
;fff g
ifgg 
(gg $
encryptionPropertiesNodegg (
!=gg) +
nullgg, 0
)gg0 1
{hh 
XmlNodeListjj #
encryptionPropertyNodesjj 3
=jj4 5$
encryptionPropertiesNodejj6 N
.jjN O
SelectNodesjjO Z
(jjZ [
$strjj[ s
,jjs t
nsmjju x
)jjx y
;jjy z
ifkk 
(kk #
encryptionPropertyNodeskk +
!=kk, .
nullkk/ 3
)kk3 4
{ll 
foreachmm 
(mm 
XmlNodemm $
nodemm% )
inmm* ,#
encryptionPropertyNodesmm- D
)mmD E
{nn 
EncryptionPropertyoo *
epoo+ -
=oo. /
newoo0 3
EncryptionPropertyoo4 F
(ooF G
)ooG H
;ooH I
eppp 
.pp 
LoadXmlpp "
(pp" #
nodepp# '
aspp( *

XmlElementpp+ 5
)pp5 6
;pp6 7 
EncryptionPropertiesqq ,
.qq, -
Addqq- 0
(qq0 1
epqq1 3
)qq3 4
;qq4 5
}rr 
}ss 
}tt 
XmlNodeww 
carriedKeyNameNodeww &
=ww' (
valueww) .
.ww. /
SelectSingleNodeww/ ?
(ww? @
$strww@ T
,wwT U
nsmwwV Y
)wwY Z
;wwZ [
ifxx 
(xx 
carriedKeyNameNodexx "
!=xx# %
nullxx& *
)xx* +
{yy 
CarriedKeyNamezz 
=zz  
carriedKeyNameNodezz! 3
.zz3 4
	InnerTextzz4 =
;zz= >
}{{ 
XmlNode~~ 
referenceListNode~~ %
=~~& '
value~~( -
.~~- .
SelectSingleNode~~. >
(~~> ?
$str~~? R
,~~R S
nsm~~T W
)~~W X
;~~X Y
if 
( 
referenceListNode !
!=" $
null% )
)) *
{
ÄÄ 
XmlNodeList
ÇÇ  
dataReferenceNodes
ÇÇ .
=
ÇÇ/ 0
referenceListNode
ÇÇ1 B
.
ÇÇB C
SelectNodes
ÇÇC N
(
ÇÇN O
$str
ÇÇO b
,
ÇÇb c
nsm
ÇÇd g
)
ÇÇg h
;
ÇÇh i
if
ÉÉ 
(
ÉÉ  
dataReferenceNodes
ÉÉ &
!=
ÉÉ' )
null
ÉÉ* .
)
ÉÉ. /
{
ÑÑ 
foreach
ÖÖ 
(
ÖÖ 
XmlNode
ÖÖ $
node
ÖÖ% )
in
ÖÖ* , 
dataReferenceNodes
ÖÖ- ?
)
ÖÖ? @
{
ÜÜ 
DataReference
áá %
dr
áá& (
=
áá) *
new
áá+ .
DataReference
áá/ <
(
áá< =
)
áá= >
;
áá> ?
dr
àà 
.
àà 
LoadXml
àà "
(
àà" #
node
àà# '
as
àà( *

XmlElement
àà+ 5
)
àà5 6
;
àà6 7
ReferenceList
ââ %
.
ââ% &
Add
ââ& )
(
ââ) *
dr
ââ* ,
)
ââ, -
;
ââ- .
}
ää 
}
ãã 
XmlNodeList
çç 
keyReferenceNodes
çç -
=
çç. /
referenceListNode
çç0 A
.
ççA B
SelectNodes
ççB M
(
ççM N
$str
ççN `
,
çç` a
nsm
ççb e
)
ççe f
;
ççf g
if
éé 
(
éé 
keyReferenceNodes
éé %
!=
éé& (
null
éé) -
)
éé- .
{
èè 
foreach
êê 
(
êê 
XmlNode
êê $
node
êê% )
in
êê* ,
keyReferenceNodes
êê- >
)
êê> ?
{
ëë 
KeyReference
íí $
kr
íí% '
=
íí( )
new
íí* -
KeyReference
íí. :
(
íí: ;
)
íí; <
;
íí< =
kr
ìì 
.
ìì 
LoadXml
ìì "
(
ìì" #
node
ìì# '
as
ìì( *

XmlElement
ìì+ 5
)
ìì5 6
;
ìì6 7
ReferenceList
îî %
.
îî% &
Add
îî& )
(
îî) *
kr
îî* ,
)
îî, -
;
îî- .
}
ïï 
}
ññ 
}
óó 

_cachedXml
öö 
=
öö 
value
öö 
;
öö 
}
õõ 	
public
ùù 
override
ùù 

XmlElement
ùù "
GetXml
ùù# )
(
ùù) *
)
ùù* +
{
ûû 	
if
üü 
(
üü 

CacheValid
üü 
)
üü 
return
üü "

_cachedXml
üü# -
;
üü- .
XmlDocument
°° 
document
°°  
=
°°! "
new
°°# &
XmlDocument
°°' 2
(
°°2 3
)
°°3 4
;
°°4 5
document
¢¢ 
.
¢¢  
PreserveWhitespace
¢¢ '
=
¢¢( )
true
¢¢* .
;
¢¢. /
return
££ 
GetXml
££ 
(
££ 
document
££ "
)
££" #
;
££# $
}
§§ 	
internal
¶¶ 

XmlElement
¶¶ 
GetXml
¶¶ "
(
¶¶" #
XmlDocument
¶¶# .
document
¶¶/ 7
)
¶¶7 8
{
ßß 	

XmlElement
©© !
encryptedKeyElement
©© *
=
©©+ ,
(
©©- .

XmlElement
©©. 8
)
©©8 9
document
©©9 A
.
©©A B
CreateElement
©©B O
(
©©O P
$str
©©P ^
,
©©^ _
EncryptedXml
©©` l
.
©©l m 
XmlEncNamespaceUrl
©©m 
)©© Ä
;©©Ä Å
if
¨¨ 
(
¨¨ 
!
¨¨ 
string
¨¨ 
.
¨¨ 
IsNullOrEmpty
¨¨ %
(
¨¨% &
Id
¨¨& (
)
¨¨( )
)
¨¨) *!
encryptedKeyElement
≠≠ #
.
≠≠# $
SetAttribute
≠≠$ 0
(
≠≠0 1
$str
≠≠1 5
,
≠≠5 6
Id
≠≠7 9
)
≠≠9 :
;
≠≠: ;
if
ÆÆ 
(
ÆÆ 
!
ÆÆ 
string
ÆÆ 
.
ÆÆ 
IsNullOrEmpty
ÆÆ %
(
ÆÆ% &
Type
ÆÆ& *
)
ÆÆ* +
)
ÆÆ+ ,!
encryptedKeyElement
ØØ #
.
ØØ# $
SetAttribute
ØØ$ 0
(
ØØ0 1
$str
ØØ1 7
,
ØØ7 8
Type
ØØ9 =
)
ØØ= >
;
ØØ> ?
if
∞∞ 
(
∞∞ 
!
∞∞ 
string
∞∞ 
.
∞∞ 
IsNullOrEmpty
∞∞ %
(
∞∞% &
MimeType
∞∞& .
)
∞∞. /
)
∞∞/ 0!
encryptedKeyElement
±± #
.
±±# $
SetAttribute
±±$ 0
(
±±0 1
$str
±±1 ;
,
±±; <
MimeType
±±= E
)
±±E F
;
±±F G
if
≤≤ 
(
≤≤ 
!
≤≤ 
string
≤≤ 
.
≤≤ 
IsNullOrEmpty
≤≤ %
(
≤≤% &
Encoding
≤≤& .
)
≤≤. /
)
≤≤/ 0!
encryptedKeyElement
≥≥ #
.
≥≥# $
SetAttribute
≥≥$ 0
(
≥≥0 1
$str
≥≥1 ;
,
≥≥; <
Encoding
≥≥= E
)
≥≥E F
;
≥≥F G
if
¥¥ 
(
¥¥ 
!
¥¥ 
string
¥¥ 
.
¥¥ 
IsNullOrEmpty
¥¥ %
(
¥¥% &
	Recipient
¥¥& /
)
¥¥/ 0
)
¥¥0 1!
encryptedKeyElement
µµ #
.
µµ# $
SetAttribute
µµ$ 0
(
µµ0 1
$str
µµ1 <
,
µµ< =
	Recipient
µµ> G
)
µµG H
;
µµH I
if
∏∏ 
(
∏∏ 
EncryptionMethod
∏∏  
!=
∏∏! #
null
∏∏$ (
)
∏∏( )!
encryptedKeyElement
ππ #
.
ππ# $
AppendChild
ππ$ /
(
ππ/ 0
EncryptionMethod
ππ0 @
.
ππ@ A
GetXml
ππA G
(
ππG H
document
ππH P
)
ππP Q
)
ππQ R
;
ππR S
if
ºº 
(
ºº 
KeyInfo
ºº 
.
ºº 
Count
ºº 
>
ºº 
$num
ºº  !
)
ºº! "!
encryptedKeyElement
ΩΩ #
.
ΩΩ# $
AppendChild
ΩΩ$ /
(
ΩΩ/ 0
KeyInfo
ΩΩ0 7
.
ΩΩ7 8
GetXml
ΩΩ8 >
(
ΩΩ> ?
document
ΩΩ? G
)
ΩΩG H
)
ΩΩH I
;
ΩΩI J
if
¿¿ 
(
¿¿ 

CipherData
¿¿ 
==
¿¿ 
null
¿¿ "
)
¿¿" #
throw
¡¡ 
new
¡¡ 
System
¡¡  
.
¡¡  !
Security
¡¡! )
.
¡¡) *
Cryptography
¡¡* 6
.
¡¡6 7$
CryptographicException
¡¡7 M
(
¡¡M N
SR
¡¡N P
.
¡¡P Q0
"Cryptography_Xml_MissingCipherData
¡¡Q s
)
¡¡s t
;
¡¡t u!
encryptedKeyElement
¬¬ 
.
¬¬  
AppendChild
¬¬  +
(
¬¬+ ,

CipherData
¬¬, 6
.
¬¬6 7
GetXml
¬¬7 =
(
¬¬= >
document
¬¬> F
)
¬¬F G
)
¬¬G H
;
¬¬H I
if
≈≈ 
(
≈≈ "
EncryptionProperties
≈≈ $
.
≈≈$ %
Count
≈≈% *
>
≈≈+ ,
$num
≈≈- .
)
≈≈. /
{
∆∆ 

XmlElement
«« )
encryptionPropertiesElement
«« 6
=
««7 8
document
««9 A
.
««A B
CreateElement
««B O
(
««O P
$str
««P f
,
««f g
EncryptedXml
««h t
.
««t u!
XmlEncNamespaceUrl««u á
)««á à
;««à â
for
»» 
(
»» 
int
»» 
index
»» 
=
»»  
$num
»»! "
;
»»" #
index
»»$ )
<
»»* +"
EncryptionProperties
»», @
.
»»@ A
Count
»»A F
;
»»F G
index
»»H M
++
»»M O
)
»»O P
{
……  
EncryptionProperty
   &
ep
  ' )
=
  * +"
EncryptionProperties
  , @
.
  @ A
Item
  A E
(
  E F
index
  F K
)
  K L
;
  L M)
encryptionPropertiesElement
ÀÀ /
.
ÀÀ/ 0
AppendChild
ÀÀ0 ;
(
ÀÀ; <
ep
ÀÀ< >
.
ÀÀ> ?
GetXml
ÀÀ? E
(
ÀÀE F
document
ÀÀF N
)
ÀÀN O
)
ÀÀO P
;
ÀÀP Q
}
ÃÃ !
encryptedKeyElement
ÕÕ #
.
ÕÕ# $
AppendChild
ÕÕ$ /
(
ÕÕ/ 0)
encryptionPropertiesElement
ÕÕ0 K
)
ÕÕK L
;
ÕÕL M
}
ŒŒ 
if
—— 
(
—— 
ReferenceList
—— 
.
—— 
Count
—— #
>
——$ %
$num
——& '
)
——' (
{
““ 

XmlElement
”” "
referenceListElement
”” /
=
””0 1
document
””2 :
.
””: ;
CreateElement
””; H
(
””H I
$str
””I X
,
””X Y
EncryptedXml
””Z f
.
””f g 
XmlEncNamespaceUrl
””g y
)
””y z
;
””z {
for
‘‘ 
(
‘‘ 
int
‘‘ 
index
‘‘ 
=
‘‘  
$num
‘‘! "
;
‘‘" #
index
‘‘$ )
<
‘‘* +
ReferenceList
‘‘, 9
.
‘‘9 :
Count
‘‘: ?
;
‘‘? @
index
‘‘A F
++
‘‘F H
)
‘‘H I
{
’’ "
referenceListElement
÷÷ (
.
÷÷( )
AppendChild
÷÷) 4
(
÷÷4 5
ReferenceList
÷÷5 B
[
÷÷B C
index
÷÷C H
]
÷÷H I
.
÷÷I J
GetXml
÷÷J P
(
÷÷P Q
document
÷÷Q Y
)
÷÷Y Z
)
÷÷Z [
;
÷÷[ \
}
◊◊ !
encryptedKeyElement
ÿÿ #
.
ÿÿ# $
AppendChild
ÿÿ$ /
(
ÿÿ/ 0"
referenceListElement
ÿÿ0 D
)
ÿÿD E
;
ÿÿE F
}
ŸŸ 
if
‹‹ 
(
‹‹ 
CarriedKeyName
‹‹ 
!=
‹‹ !
null
‹‹" &
)
‹‹& '
{
›› 

XmlElement
ﬁﬁ #
carriedKeyNameElement
ﬁﬁ 0
=
ﬁﬁ1 2
(
ﬁﬁ3 4

XmlElement
ﬁﬁ4 >
)
ﬁﬁ> ?
document
ﬁﬁ? G
.
ﬁﬁG H
CreateElement
ﬁﬁH U
(
ﬁﬁU V
$str
ﬁﬁV f
,
ﬁﬁf g
EncryptedXml
ﬁﬁh t
.
ﬁﬁt u!
XmlEncNamespaceUrlﬁﬁu á
)ﬁﬁá à
;ﬁﬁà â
XmlText
ﬂﬂ  
carriedKeyNameText
ﬂﬂ *
=
ﬂﬂ+ ,
document
ﬂﬂ- 5
.
ﬂﬂ5 6
CreateTextNode
ﬂﬂ6 D
(
ﬂﬂD E
CarriedKeyName
ﬂﬂE S
)
ﬂﬂS T
;
ﬂﬂT U#
carriedKeyNameElement
‡‡ %
.
‡‡% &
AppendChild
‡‡& 1
(
‡‡1 2 
carriedKeyNameText
‡‡2 D
)
‡‡D E
;
‡‡E F!
encryptedKeyElement
·· #
.
··# $
AppendChild
··$ /
(
··/ 0#
carriedKeyNameElement
··0 E
)
··E F
;
··F G
}
‚‚ 
return
‰‰ !
encryptedKeyElement
‰‰ &
;
‰‰& '
}
ÂÂ 	
}
ÊÊ 
}ÁÁ ÁD
=C:\code\bc-xml-security\refactoring\src\EncryptedReference.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

abstract 
class 
EncryptedReference ,
{ 
private 
string 
_uri 
; 
private 
string 
_referenceType %
;% &
private 
TransformChain 
_transformChain .
;. /
internal 

XmlElement 

_cachedXml &
=' (
null) -
;- .
	protected 
EncryptedReference $
($ %
)% &
:' (
this) -
(- .
string. 4
.4 5
Empty5 :
,: ;
new< ?
TransformChain@ N
(N O
)O P
)P Q
{ 	
} 	
	protected 
EncryptedReference $
($ %
string% +
uri, /
)/ 0
:1 2
this3 7
(7 8
uri8 ;
,; <
new= @
TransformChainA O
(O P
)P Q
)Q R
{ 	
} 	
	protected 
EncryptedReference $
($ %
string% +
uri, /
,/ 0
TransformChain1 ?
transformChain@ N
)N O
{ 	
TransformChain 
= 
transformChain +
;+ ,
Uri 
= 
uri 
; 

_cachedXml 
= 
null 
; 
} 	
public!! 
string!! 
Uri!! 
{"" 	
get## 
{## 
return## 
_uri## 
;## 
}##  
set$$ 
{%% 
if&& 
(&& 
value&& 
==&& 
null&& !
)&&! "
throw'' 
new'' !
ArgumentNullException'' 3
(''3 4
SR''4 6
.''6 7(
Cryptography_Xml_UriRequired''7 S
)''S T
;''T U
_uri(( 
=(( 
value(( 
;(( 

_cachedXml)) 
=)) 
null)) !
;))! "
}** 
}++ 	
public-- 
TransformChain-- 
TransformChain-- ,
{.. 	
get// 
{00 
if11 
(11 
_transformChain11 #
==11$ &
null11' +
)11+ ,
_transformChain22 #
=22$ %
new22& )
TransformChain22* 8
(228 9
)229 :
;22: ;
return33 
_transformChain33 &
;33& '
}44 
set55 
{66 
_transformChain77 
=77  !
value77" '
;77' (

_cachedXml88 
=88 
null88 !
;88! "
}99 
}:: 	
public<< 
void<< 
AddTransform<<  
(<<  !
	Transform<<! *
	transform<<+ 4
)<<4 5
{== 	
TransformChain>> 
.>> 
Add>> 
(>> 
	transform>> (
)>>( )
;>>) *
}?? 	
	protectedAA 
stringAA 
ReferenceTypeAA &
{BB 	
getCC 
{CC 
returnCC 
_referenceTypeCC '
;CC' (
}CC) *
setDD 
{EE 
_referenceTypeFF 
=FF  
valueFF! &
;FF& '

_cachedXmlGG 
=GG 
nullGG !
;GG! "
}HH 
}II 	
internalKK 
	protectedKK 
boolKK 

CacheValidKK  *
{LL 	
getMM 
{NN 
returnOO 
(OO 

_cachedXmlOO "
!=OO# %
nullOO& *
)OO* +
;OO+ ,
}PP 
}QQ 	
publicSS 
virtualSS 

XmlElementSS !
GetXmlSS" (
(SS( )
)SS) *
{TT 	
ifUU 
(UU 

CacheValidUU 
)UU 
returnUU "

_cachedXmlUU# -
;UU- .
XmlDocumentWW 
documentWW  
=WW! "
newWW# &
XmlDocumentWW' 2
(WW2 3
)WW3 4
;WW4 5
documentXX 
.XX 
PreserveWhitespaceXX '
=XX( )
trueXX* .
;XX. /
returnYY 
GetXmlYY 
(YY 
documentYY "
)YY" #
;YY# $
}ZZ 	
internal\\ 

XmlElement\\ 
GetXml\\ "
(\\" #
XmlDocument\\# .
document\\/ 7
)\\7 8
{]] 	
if^^ 
(^^ 
ReferenceType^^ 
==^^  
null^^! %
)^^% &
throw__ 
new__ 
System__  
.__  !
Security__! )
.__) *
Cryptography__* 6
.__6 7"
CryptographicException__7 M
(__M N
SR__N P
.__P Q2
&Cryptography_Xml_ReferenceTypeRequired__Q w
)__w x
;__x y

XmlElementbb 
referenceElementbb '
=bb( )
documentbb* 2
.bb2 3
CreateElementbb3 @
(bb@ A
ReferenceTypebbA N
,bbN O
EncryptedXmlbbP \
.bb\ ]
XmlEncNamespaceUrlbb] o
)bbo p
;bbp q
ifcc 
(cc 
!cc 
stringcc 
.cc 
IsNullOrEmptycc %
(cc% &
_uricc& *
)cc* +
)cc+ ,
referenceElementdd  
.dd  !
SetAttributedd! -
(dd- .
$strdd. 3
,dd3 4
_uridd5 9
)dd9 :
;dd: ;
ifgg 
(gg 
TransformChaingg 
.gg 
Countgg $
>gg% &
$numgg' (
)gg( )
referenceElementhh  
.hh  !
AppendChildhh! ,
(hh, -
TransformChainhh- ;
.hh; <
GetXmlhh< B
(hhB C
documenthhC K
,hhK L
	SignedXmlhhM V
.hhV W
XmlDsigNamespaceUrlhhW j
)hhj k
)hhk l
;hhl m
returnjj 
referenceElementjj #
;jj# $
}kk 	
publicmm 
virtualmm 
voidmm 
LoadXmlmm #
(mm# $

XmlElementmm$ .
valuemm/ 4
)mm4 5
{nn 	
ifoo 
(oo 
valueoo 
==oo 
nulloo 
)oo 
throwpp 
newpp !
ArgumentNullExceptionpp /
(pp/ 0
nameofpp0 6
(pp6 7
valuepp7 <
)pp< =
)pp= >
;pp> ?
ReferenceTyperr 
=rr 
valuerr !
.rr! "
	LocalNamerr" +
;rr+ ,
stringtt 
uritt 
=tt 
Utilstt 
.tt 
GetAttributett +
(tt+ ,
valuett, 1
,tt1 2
$strtt3 8
,tt8 9
EncryptedXmltt: F
.ttF G
XmlEncNamespaceUrlttG Y
)ttY Z
;ttZ [
ifuu 
(uu 
uriuu 
==uu 
nulluu 
)uu 
throwvv 
newvv !
ArgumentNullExceptionvv /
(vv/ 0
SRvv0 2
.vv2 3(
Cryptography_Xml_UriRequiredvv3 O
)vvO P
;vvP Q
Uriww 
=ww 
uriww 
;ww 
XmlNamespaceManagerzz 
nsmzz  #
=zz$ %
newzz& )
XmlNamespaceManagerzz* =
(zz= >
valuezz> C
.zzC D
OwnerDocumentzzD Q
.zzQ R
	NameTablezzR [
)zz[ \
;zz\ ]
nsm{{ 
.{{ 
AddNamespace{{ 
({{ 
$str{{ !
,{{! "
	SignedXml{{# ,
.{{, -
XmlDsigNamespaceUrl{{- @
){{@ A
;{{A B
XmlNode|| 
transformsNode|| "
=||# $
value||% *
.||* +
SelectSingleNode||+ ;
(||; <
$str||< K
,||K L
nsm||M P
)||P Q
;||Q R
if}} 
(}} 
transformsNode}} 
!=}} !
null}}" &
)}}& '
TransformChain~~ 
.~~ 
LoadXml~~ &
(~~& '
transformsNode~~' 5
as~~6 8

XmlElement~~9 C
)~~C D
;~~D E

_cachedXml
ÅÅ 
=
ÅÅ 
value
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
}
ÉÉ 
}ÑÑ Ù.
8C:\code\bc-xml-security\refactoring\src\EncryptedType.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

abstract 
class 
EncryptedType '
{ 
private 
string 
_id 
; 
private 
string 
_type 
; 
private 
string 
	_mimeType  
;  !
private 
string 
	_encoding  
;  !
private 
EncryptionMethod  
_encryptionMethod! 2
;2 3
private 

CipherData 
_cipherData &
;& '
private (
EncryptionPropertyCollection ,
_props- 3
;3 4
private 
KeyInfo 
_keyInfo  
;  !
internal 

XmlElement 

_cachedXml &
=' (
null) -
;- .
internal 
bool 

CacheValid  
{ 	
get 
{ 
return 
( 

_cachedXml "
!=# %
null& *
)* +
;+ ,
} 
} 	
public 
virtual 
string 
Id  
{   	
get!! 
{!! 
return!! 
_id!! 
;!! 
}!! 
set"" 
{## 
_id$$ 
=$$ 
value$$ 
;$$ 

_cachedXml%% 
=%% 
null%% !
;%%! "
}&& 
}'' 	
public)) 
virtual)) 
string)) 
Type)) "
{** 	
get++ 
{++ 
return++ 
_type++ 
;++ 
}++  !
set,, 
{-- 
_type.. 
=.. 
value.. 
;.. 

_cachedXml// 
=// 
null// !
;//! "
}00 
}11 	
public33 
virtual33 
string33 
MimeType33 &
{44 	
get55 
{55 
return55 
	_mimeType55 "
;55" #
}55$ %
set66 
{77 
	_mimeType88 
=88 
value88 !
;88! "

_cachedXml99 
=99 
null99 !
;99! "
}:: 
};; 	
public== 
virtual== 
string== 
Encoding== &
{>> 	
get?? 
{?? 
return?? 
	_encoding?? "
;??" #
}??$ %
set@@ 
{AA 
	_encodingBB 
=BB 
valueBB !
;BB! "

_cachedXmlCC 
=CC 
nullCC !
;CC! "
}DD 
}EE 	
publicGG 
KeyInfoGG 
KeyInfoGG 
{HH 	
getII 
{JJ 
ifKK 
(KK 
_keyInfoKK 
==KK 
nullKK  $
)KK$ %
_keyInfoLL 
=LL 
newLL "
KeyInfoLL# *
(LL* +
)LL+ ,
;LL, -
returnMM 
_keyInfoMM 
;MM  
}NN 
setOO 
{OO 
_keyInfoOO 
=OO 
valueOO "
;OO" #
}OO$ %
}PP 	
publicRR 
virtualRR 
EncryptionMethodRR '
EncryptionMethodRR( 8
{SS 	
getTT 
{TT 
returnTT 
_encryptionMethodTT *
;TT* +
}TT, -
setUU 
{VV 
_encryptionMethodWW !
=WW" #
valueWW$ )
;WW) *

_cachedXmlXX 
=XX 
nullXX !
;XX! "
}YY 
}ZZ 	
public\\ 
virtual\\ (
EncryptionPropertyCollection\\ 3 
EncryptionProperties\\4 H
{]] 	
get^^ 
{__ 
if`` 
(`` 
_props`` 
==`` 
null`` "
)``" #
_propsaa 
=aa 
newaa  (
EncryptionPropertyCollectionaa! =
(aa= >
)aa> ?
;aa? @
returnbb 
_propsbb 
;bb 
}cc 
}dd 	
publicff 
voidff 
AddPropertyff 
(ff  
EncryptionPropertyff  2
epff3 5
)ff5 6
{gg 	 
EncryptionPropertieshh  
.hh  !
Addhh! $
(hh$ %
ephh% '
)hh' (
;hh( )
}ii 	
publickk 
virtualkk 

CipherDatakk !

CipherDatakk" ,
{ll 	
getmm 
{nn 
ifoo 
(oo 
_cipherDataoo 
==oo  "
nulloo# '
)oo' (
_cipherDatapp 
=pp  !
newpp" %

CipherDatapp& 0
(pp0 1
)pp1 2
;pp2 3
returnrr 
_cipherDatarr "
;rr" #
}ss 
settt 
{uu 
ifvv 
(vv 
valuevv 
==vv 
nullvv !
)vv! "
throwww 
newww !
ArgumentNullExceptionww 3
(ww3 4
nameofww4 :
(ww: ;
valueww; @
)ww@ A
)wwA B
;wwB C
_cipherDatayy 
=yy 
valueyy #
;yy# $

_cachedXmlzz 
=zz 
nullzz !
;zz! "
}{{ 
}|| 	
public~~ 
abstract~~ 
void~~ 
LoadXml~~ $
(~~$ %

XmlElement~~% /
value~~0 5
)~~5 6
;~~6 7
public 
abstract 

XmlElement "
GetXml# )
() *
)* +
;+ ,
}
ÄÄ 
}ÅÅ  ≥
7C:\code\bc-xml-security\refactoring\src\EncryptedXml.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
EncryptedXml 
{ 
public 
const 
string 
XmlEncNamespaceUrl .
=/ 0
$str1 T
;T U
public 
const 
string 
XmlEncElementUrl ,
=- .
$str/ Y
;Y Z
public 
const 
string #
XmlEncElementContentUrl 3
=4 5
$str6 `
;` a
public 
const 
string !
XmlEncEncryptedKeyUrl 1
=2 3
$str4 c
;c d
public"" 
const"" 
string"" 
XmlEncDESUrl"" (
="") *
$str""+ U
;""U V
public## 
const## 
string## 
XmlEncTripleDESUrl## .
=##/ 0
$str##1 a
;##a b
public$$ 
const$$ 
string$$ 
XmlEncAES128Url$$ +
=$$, -
$str$$. [
;$$[ \
public%% 
const%% 
string%% 
XmlEncAES256Url%% +
=%%, -
$str%%. [
;%%[ \
public&& 
const&& 
string&& 
XmlEncAES192Url&& +
=&&, -
$str&&. [
;&&[ \
public,, 
const,, 
string,, 
XmlEncRSA15Url,, *
=,,+ ,
$str,,- W
;,,W X
public-- 
const-- 
string-- 
XmlEncRSAOAEPUrl-- ,
=--- .
$str--/ `
;--` a
public33 
const33 
string33 %
XmlEncTripleDESKeyWrapUrl33 5
=336 7
$str338 g
;33g h
public44 
const44 
string44 "
XmlEncAES128KeyWrapUrl44 2
=443 4
$str445 a
;44a b
public55 
const55 
string55 "
XmlEncAES256KeyWrapUrl55 2
=553 4
$str555 a
;55a b
public66 
const66 
string66 "
XmlEncAES192KeyWrapUrl66 2
=663 4
$str665 a
;66a b
public<< 
const<< 
string<< 
XmlEncSHA256Url<< +
=<<, -
$str<<. W
;<<W X
public== 
const== 
string== 
XmlEncSHA512Url== +
===, -
$str==. W
;==W X
privateCC 
XmlDocumentCC 
	_documentCC %
;CC% &
privateDD 
XmlResolverDD 
_xmlResolverDD (
;DD( )
privateFF 
constFF 
intFF 
	_capacityFF #
=FF$ %
$numFF& '
;FF' (
privateHH 
	HashtableHH 
_keyNameMappingHH )
;HH) *
privateII 
stringII 
_paddingII 
;II  
privateJJ 
stringJJ 
_modeJJ 
;JJ 
privateKK 
EncodingKK 
	_encodingKK "
;KK" #
privateLL 
stringLL 

_recipientLL !
;LL! "
privateMM 
intMM &
_xmlDsigSearchDepthCounterMM .
=MM/ 0
$numMM1 2
;MM2 3
privateNN 
intNN 
_xmlDsigSearchDepthNN '
;NN' (
publicSS 
EncryptedXmlSS 
(SS 
)SS 
:SS 
thisSS  $
(SS$ %
newSS% (
XmlDocumentSS) 4
(SS4 5
)SS5 6
)SS6 7
{SS8 9
}SS: ;
publicUU 
EncryptedXmlUU 
(UU 
XmlDocumentUU '
documentUU( 0
)UU0 1
{VV 	
	_documentWW 
=WW 
documentWW  
;WW  !
_xmlResolverXX 
=XX 
nullXX 
;XX  
_paddingZZ 
=ZZ 
$strZZ (
;ZZ( )
_mode\\ 
=\\ 
$str\\ 
;\\ 
	_encoding^^ 
=^^ 
Encoding^^  
.^^  !
UTF8^^! %
;^^% &
_keyNameMapping__ 
=__ 
new__ !
	Hashtable__" +
(__+ ,
	_capacity__, 5
)__5 6
;__6 7
_xmlDsigSearchDepth`` 
=``  !
Utils``" '
.``' (
XmlDsigSearchDepth``( :
;``: ;
}aa 	
privatehh 
boolhh '
IsOverXmlDsigRecursionLimithh 0
(hh0 1
)hh1 2
{ii 	
ifjj 
(jj &
_xmlDsigSearchDepthCounterjj *
>jj+ ,
XmlDSigSearchDepthjj- ?
)jj? @
{kk 
returnll 
truell 
;ll 
}mm 
returnnn 
falsenn 
;nn 
}oo 	
publictt 
inttt 
XmlDSigSearchDepthtt %
{uu 	
getvv 
{ww 
returnxx 
_xmlDsigSearchDepthxx *
;xx* +
}yy 
setzz 
{{{ 
_xmlDsigSearchDepth|| #
=||$ %
value||& +
;||+ ,
}}} 
}~~ 	
public
ÅÅ 
XmlResolver
ÅÅ 
Resolver
ÅÅ #
{
ÇÇ 	
get
ÉÉ 
{
ÉÉ 
return
ÉÉ 
_xmlResolver
ÉÉ %
;
ÉÉ% &
}
ÉÉ' (
set
ÑÑ 
{
ÑÑ 
_xmlResolver
ÑÑ 
=
ÑÑ  
value
ÑÑ! &
;
ÑÑ& '
}
ÑÑ( )
}
ÖÖ 	
public
ââ 
string
ââ 
Padding
ââ 
{
ää 	
get
ãã 
{
ãã 
return
ãã 
_padding
ãã !
;
ãã! "
}
ãã# $
set
åå 
{
åå 
_padding
åå 
=
åå 
value
åå "
;
åå" #
}
åå$ %
}
çç 	
public
ëë 
string
ëë 
Mode
ëë 
{
íí 	
get
ìì 
{
ìì 
return
ìì 
_mode
ìì 
;
ìì 
}
ìì  !
set
îî 
{
îî 
_mode
îî 
=
îî 
value
îî 
;
îî  
}
îî! "
}
ïï 	
public
òò 
Encoding
òò 
Encoding
òò  
{
ôô 	
get
öö 
{
öö 
return
öö 
	_encoding
öö "
;
öö" #
}
öö$ %
set
õõ 
{
õõ 
	_encoding
õõ 
=
õõ 
value
õõ #
;
õõ# $
}
õõ% &
}
úú 	
public
†† 
string
†† 
	Recipient
†† 
{
°° 	
get
¢¢ 
{
££ 
if
•• 
(
•• 

_recipient
•• 
==
•• !
null
••" &
)
••& '

_recipient
¶¶ 
=
¶¶  
string
¶¶! '
.
¶¶' (
Empty
¶¶( -
;
¶¶- .
return
ßß 

_recipient
ßß !
;
ßß! "
}
®® 
set
©© 
{
©© 

_recipient
©© 
=
©© 
value
©© $
;
©©$ %
}
©©& '
}
™™ 	
private
∞∞ 
byte
∞∞ 
[
∞∞ 
]
∞∞ 
GetCipherValue
∞∞ %
(
∞∞% &

CipherData
∞∞& 0

cipherData
∞∞1 ;
)
∞∞; <
{
±± 	
if
≤≤ 
(
≤≤ 

cipherData
≤≤ 
==
≤≤ 
null
≤≤ "
)
≤≤" #
throw
≥≥ 
new
≥≥ #
ArgumentNullException
≥≥ /
(
≥≥/ 0
nameof
≥≥0 6
(
≥≥6 7

cipherData
≥≥7 A
)
≥≥A B
)
≥≥B C
;
≥≥C D
Stream
µµ 
inputStream
µµ 
=
µµ  
null
µµ! %
;
µµ% &
if
∑∑ 
(
∑∑ 

cipherData
∑∑ 
.
∑∑ 
CipherValue
∑∑ &
!=
∑∑' )
null
∑∑* .
)
∑∑. /
{
∏∏ 
return
ππ 

cipherData
ππ !
.
ππ! "
CipherValue
ππ" -
;
ππ- .
}
∫∫ 
else
ªª 
if
ªª 
(
ªª 

cipherData
ªª 
.
ªª  
CipherReference
ªª  /
!=
ªª0 2
null
ªª3 7
)
ªª7 8
{
ºº 
if
ΩΩ 
(
ΩΩ 

cipherData
ΩΩ 
.
ΩΩ 
CipherReference
ΩΩ .
.
ΩΩ. /
CipherValue
ΩΩ/ :
!=
ΩΩ; =
null
ΩΩ> B
)
ΩΩB C
return
ææ 

cipherData
ææ %
.
ææ% &
CipherReference
ææ& 5
.
ææ5 6
CipherValue
ææ6 A
;
ææA B
Stream
øø 
decInputStream
øø %
=
øø& '
null
øø( ,
;
øø, -
if
¿¿ 
(
¿¿ 

cipherData
¿¿ 
.
¿¿ 
CipherReference
¿¿ .
.
¿¿. /
Uri
¿¿/ 2
==
¿¿3 5
null
¿¿6 :
)
¿¿: ;
{
¡¡ 
throw
¬¬ 
new
¬¬ 
System
¬¬ $
.
¬¬$ %
Security
¬¬% -
.
¬¬- .
Cryptography
¬¬. :
.
¬¬: ;$
CryptographicException
¬¬; Q
(
¬¬Q R
SR
¬¬R T
.
¬¬T U.
 Cryptography_Xml_UriNotSupported
¬¬U u
)
¬¬u v
;
¬¬v w
}
√√ 
if
≈≈ 
(
≈≈ 

cipherData
≈≈ 
.
≈≈ 
CipherReference
≈≈ .
.
≈≈. /
Uri
≈≈/ 2
.
≈≈2 3
Length
≈≈3 9
==
≈≈: <
$num
≈≈= >
)
≈≈> ?
{
∆∆ 
string
»» 
baseUri
»» "
=
»»# $
(
»»% &
	_document
»»& /
==
»»0 2
null
»»3 7
?
»»8 9
null
»»: >
:
»»? @
	_document
»»A J
.
»»J K
BaseURI
»»K R
)
»»R S
;
»»S T
TransformChain
…… "
tc
……# %
=
……& '

cipherData
……( 2
.
……2 3
CipherReference
……3 B
.
……B C
TransformChain
……C Q
;
……Q R
if
   
(
   
tc
   
==
   
null
   "
)
  " #
{
ÀÀ 
throw
ÃÃ 
new
ÃÃ !
System
ÃÃ" (
.
ÃÃ( )
Security
ÃÃ) 1
.
ÃÃ1 2
Cryptography
ÃÃ2 >
.
ÃÃ> ?$
CryptographicException
ÃÃ? U
(
ÃÃU V
SR
ÃÃV X
.
ÃÃX Y.
 Cryptography_Xml_UriNotSupported
ÃÃY y
)
ÃÃy z
;
ÃÃz {
}
ÕÕ 
decInputStream
ŒŒ "
=
ŒŒ# $
tc
ŒŒ% '
.
ŒŒ' ($
TransformToOctetStream
ŒŒ( >
(
ŒŒ> ?
	_document
ŒŒ? H
,
ŒŒH I
_xmlResolver
ŒŒJ V
,
ŒŒV W
baseUri
ŒŒX _
)
ŒŒ_ `
;
ŒŒ` a
}
œœ 
else
–– 
if
–– 
(
–– 

cipherData
–– #
.
––# $
CipherReference
––$ 3
.
––3 4
Uri
––4 7
[
––7 8
$num
––8 9
]
––9 :
==
––; =
$char
––> A
)
––A B
{
—— 
string
““ 
idref
““  
=
““! "
Utils
““# (
.
““( )#
ExtractIdFromLocalUri
““) >
(
““> ?

cipherData
““? I
.
““I J
CipherReference
““J Y
.
““Y Z
Uri
““Z ]
)
““] ^
;
““^ _

XmlElement
‘‘ 
idElem
‘‘ %
=
‘‘& '
GetIdElement
‘‘( 4
(
‘‘4 5
	_document
‘‘5 >
,
‘‘> ?
idref
‘‘@ E
)
‘‘E F
;
‘‘F G
if
’’ 
(
’’ 
idElem
’’ 
==
’’ !
null
’’" &
||
’’' )
idElem
’’* 0
.
’’0 1
OuterXml
’’1 9
==
’’: <
null
’’= A
)
’’A B
{
÷÷ 
throw
◊◊ 
new
◊◊ !
System
◊◊" (
.
◊◊( )
Security
◊◊) 1
.
◊◊1 2
Cryptography
◊◊2 >
.
◊◊> ?$
CryptographicException
◊◊? U
(
◊◊U V
SR
◊◊V X
.
◊◊X Y.
 Cryptography_Xml_UriNotSupported
◊◊Y y
)
◊◊y z
;
◊◊z {
}
ÿÿ 
inputStream
ŸŸ 
=
ŸŸ  !
new
ŸŸ" %
MemoryStream
ŸŸ& 2
(
ŸŸ2 3
	_encoding
ŸŸ3 <
.
ŸŸ< =
GetBytes
ŸŸ= E
(
ŸŸE F
idElem
ŸŸF L
.
ŸŸL M
OuterXml
ŸŸM U
)
ŸŸU V
)
ŸŸV W
;
ŸŸW X
string
⁄⁄ 
baseUri
⁄⁄ "
=
⁄⁄# $
(
⁄⁄% &
	_document
⁄⁄& /
==
⁄⁄0 2
null
⁄⁄3 7
?
⁄⁄8 9
null
⁄⁄: >
:
⁄⁄? @
	_document
⁄⁄A J
.
⁄⁄J K
BaseURI
⁄⁄K R
)
⁄⁄R S
;
⁄⁄S T
TransformChain
€€ "
tc
€€# %
=
€€& '

cipherData
€€( 2
.
€€2 3
CipherReference
€€3 B
.
€€B C
TransformChain
€€C Q
;
€€Q R
if
‹‹ 
(
‹‹ 
tc
‹‹ 
==
‹‹ 
null
‹‹ "
)
‹‹" #
{
›› 
throw
ﬁﬁ 
new
ﬁﬁ !
System
ﬁﬁ" (
.
ﬁﬁ( )
Security
ﬁﬁ) 1
.
ﬁﬁ1 2
Cryptography
ﬁﬁ2 >
.
ﬁﬁ> ?$
CryptographicException
ﬁﬁ? U
(
ﬁﬁU V
SR
ﬁﬁV X
.
ﬁﬁX Y.
 Cryptography_Xml_UriNotSupported
ﬁﬁY y
)
ﬁﬁy z
;
ﬁﬁz {
}
ﬂﬂ 
decInputStream
‡‡ "
=
‡‡# $
tc
‡‡% '
.
‡‡' ($
TransformToOctetStream
‡‡( >
(
‡‡> ?
inputStream
‡‡? J
,
‡‡J K
_xmlResolver
‡‡L X
,
‡‡X Y
baseUri
‡‡Z a
)
‡‡a b
;
‡‡b c
}
·· 
else
‚‚ 
{
„„ 
throw
‰‰ 
new
‰‰ 
System
‰‰ $
.
‰‰$ %
Security
‰‰% -
.
‰‰- .
Cryptography
‰‰. :
.
‰‰: ;$
CryptographicException
‰‰; Q
(
‰‰Q R
SR
‰‰R T
.
‰‰T U-
Cryptography_Xml_UriNotResolved
‰‰U t
,
‰‰t u

cipherData‰‰v Ä
.‰‰Ä Å
CipherReference‰‰Å ê
.‰‰ê ë
Uri‰‰ë î
)‰‰î ï
;‰‰ï ñ
}
ÂÂ 
byte
ÁÁ 
[
ÁÁ 
]
ÁÁ 
cipherValue
ÁÁ "
=
ÁÁ# $
null
ÁÁ% )
;
ÁÁ) *
using
ËË 
(
ËË 
MemoryStream
ËË #
ms
ËË$ &
=
ËË' (
new
ËË) ,
MemoryStream
ËË- 9
(
ËË9 :
)
ËË: ;
)
ËË; <
{
ÈÈ 
Utils
ÍÍ 
.
ÍÍ 
Pump
ÍÍ 
(
ÍÍ 
decInputStream
ÍÍ -
,
ÍÍ- .
ms
ÍÍ/ 1
)
ÍÍ1 2
;
ÍÍ2 3
cipherValue
ÎÎ 
=
ÎÎ  !
ms
ÎÎ" $
.
ÎÎ$ %
ToArray
ÎÎ% ,
(
ÎÎ, -
)
ÎÎ- .
;
ÎÎ. /
if
ÌÌ 
(
ÌÌ 
inputStream
ÌÌ #
!=
ÌÌ$ &
null
ÌÌ' +
)
ÌÌ+ ,
inputStream
ÓÓ #
.
ÓÓ# $
Close
ÓÓ$ )
(
ÓÓ) *
)
ÓÓ* +
;
ÓÓ+ ,
decInputStream
ÔÔ "
.
ÔÔ" #
Close
ÔÔ# (
(
ÔÔ( )
)
ÔÔ) *
;
ÔÔ* +
}
 

cipherData
ÛÛ 
.
ÛÛ 
CipherReference
ÛÛ *
.
ÛÛ* +
CipherValue
ÛÛ+ 6
=
ÛÛ7 8
cipherValue
ÛÛ9 D
;
ÛÛD E
return
ÙÙ 
cipherValue
ÙÙ "
;
ÙÙ" #
}
ıı 
throw
¯¯ 
new
¯¯ 
System
¯¯ 
.
¯¯ 
Security
¯¯ %
.
¯¯% &
Cryptography
¯¯& 2
.
¯¯2 3$
CryptographicException
¯¯3 I
(
¯¯I J
SR
¯¯J L
.
¯¯L M0
"Cryptography_Xml_MissingCipherData
¯¯M o
)
¯¯o p
;
¯¯p q
}
˘˘ 	
public
ÄÄ 
virtual
ÄÄ 

XmlElement
ÄÄ !
GetIdElement
ÄÄ" .
(
ÄÄ. /
XmlDocument
ÄÄ/ :
document
ÄÄ; C
,
ÄÄC D
string
ÄÄE K
idValue
ÄÄL S
)
ÄÄS T
{
ÅÅ 	
return
ÇÇ 
	SignedXml
ÇÇ 
.
ÇÇ !
DefaultGetIdElement
ÇÇ 0
(
ÇÇ0 1
document
ÇÇ1 9
,
ÇÇ9 :
idValue
ÇÇ; B
)
ÇÇB C
;
ÇÇC D
}
ÉÉ 	
public
ÜÜ 
virtual
ÜÜ 
byte
ÜÜ 
[
ÜÜ 
]
ÜÜ 
GetDecryptionIV
ÜÜ -
(
ÜÜ- .
EncryptedData
ÜÜ. ;
encryptedData
ÜÜ< I
,
ÜÜI J
string
ÜÜK Q#
symmetricAlgorithmUri
ÜÜR g
)
ÜÜg h
{
áá 	
if
àà 
(
àà 
encryptedData
àà 
==
àà  
null
àà! %
)
àà% &
throw
ââ 
new
ââ #
ArgumentNullException
ââ /
(
ââ/ 0
nameof
ââ0 6
(
ââ6 7
encryptedData
ââ7 D
)
ââD E
)
ââE F
;
ââF G
int
ãã 
initBytesSize
ãã 
=
ãã 
$num
ãã  !
;
ãã! "
if
çç 
(
çç #
symmetricAlgorithmUri
çç %
==
çç& (
null
çç) -
)
çç- .
{
éé 
if
èè 
(
èè 
encryptedData
èè !
.
èè! "
EncryptionMethod
èè" 2
==
èè3 5
null
èè6 :
)
èè: ;
throw
êê 
new
êê 
System
êê $
.
êê$ %
Security
êê% -
.
êê- .
Cryptography
êê. :
.
êê: ;$
CryptographicException
êê; Q
(
êêQ R
SR
êêR T
.
êêT U/
!Cryptography_Xml_MissingAlgorithm
êêU v
)
êêv w
;
êêw x#
symmetricAlgorithmUri
ëë %
=
ëë& '
encryptedData
ëë( 5
.
ëë5 6
EncryptionMethod
ëë6 F
.
ëëF G
KeyAlgorithm
ëëG S
;
ëëS T
}
íí 
switch
ìì 
(
ìì #
symmetricAlgorithmUri
ìì )
)
ìì) *
{
îî 
case
ïï 
EncryptedXml
ïï !
.
ïï! "
XmlEncDESUrl
ïï" .
:
ïï. /
case
ññ 
EncryptedXml
ññ !
.
ññ! " 
XmlEncTripleDESUrl
ññ" 4
:
ññ4 5
initBytesSize
óó !
=
óó" #
$num
óó$ %
;
óó% &
break
òò 
;
òò 
case
ôô 
EncryptedXml
ôô !
.
ôô! "
XmlEncAES128Url
ôô" 1
:
ôô1 2
case
öö 
EncryptedXml
öö !
.
öö! "
XmlEncAES192Url
öö" 1
:
öö1 2
case
õõ 
EncryptedXml
õõ !
.
õõ! "
XmlEncAES256Url
õõ" 1
:
õõ1 2
initBytesSize
úú !
=
úú" #
$num
úú$ &
;
úú& '
break
ùù 
;
ùù 
default
ûû 
:
ûû 
throw
†† 
new
†† 
System
†† $
.
††$ %
Security
††% -
.
††- .
Cryptography
††. :
.
††: ;$
CryptographicException
††; Q
(
††Q R
SR
††R T
.
††T U.
 Cryptography_Xml_UriNotSupported
††U u
)
††u v
;
††v w
}
°° 
byte
¢¢ 
[
¢¢ 
]
¢¢ 
IV
¢¢ 
=
¢¢ 
new
¢¢ 
byte
¢¢  
[
¢¢  !
initBytesSize
¢¢! .
]
¢¢. /
;
¢¢/ 0
byte
££ 
[
££ 
]
££ 
cipherValue
££ 
=
££  
GetCipherValue
££! /
(
££/ 0
encryptedData
££0 =
.
££= >

CipherData
££> H
)
££H I
;
££I J
Buffer
§§ 
.
§§ 
	BlockCopy
§§ 
(
§§ 
cipherValue
§§ (
,
§§( )
$num
§§* +
,
§§+ ,
IV
§§- /
,
§§/ 0
$num
§§1 2
,
§§2 3
IV
§§4 6
.
§§6 7
Length
§§7 =
)
§§= >
;
§§> ?
return
•• 
IV
•• 
;
•• 
}
¶¶ 	
public
™™ 
virtual
™™ 
ICipherParameters
™™ (
GetDecryptionKey
™™) 9
(
™™9 :
EncryptedData
™™: G
encryptedData
™™H U
,
™™U V
string
™™W ]#
symmetricAlgorithmUri
™™^ s
)
™™s t
{
´´ 	
if
¨¨ 
(
¨¨ 
encryptedData
¨¨ 
==
¨¨  
null
¨¨! %
)
¨¨% &
throw
≠≠ 
new
≠≠ #
ArgumentNullException
≠≠ /
(
≠≠/ 0
nameof
≠≠0 6
(
≠≠6 7
encryptedData
≠≠7 D
)
≠≠D E
)
≠≠E F
;
≠≠F G
if
ØØ 
(
ØØ 
encryptedData
ØØ 
.
ØØ 
KeyInfo
ØØ %
==
ØØ& (
null
ØØ) -
)
ØØ- .
return
∞∞ 
null
∞∞ 
;
∞∞ 
IEnumerator
±± 
keyInfoEnum
±± #
=
±±$ %
encryptedData
±±& 3
.
±±3 4
KeyInfo
±±4 ;
.
±±; <
GetEnumerator
±±< I
(
±±I J
)
±±J K
;
±±K L$
KeyInfoRetrievalMethod
≤≤ "
kiRetrievalMethod
≤≤# 4
;
≤≤4 5
KeyInfoName
≥≥ 
kiName
≥≥ 
;
≥≥ !
KeyInfoEncryptedKey
¥¥ 
kiEncKey
¥¥  (
;
¥¥( )
EncryptedKey
µµ 
ek
µµ 
=
µµ 
null
µµ "
;
µµ" #
while
∑∑ 
(
∑∑ 
keyInfoEnum
∑∑ 
.
∑∑ 
MoveNext
∑∑ '
(
∑∑' (
)
∑∑( )
)
∑∑) *
{
∏∏ 
kiName
ππ 
=
ππ 
keyInfoEnum
ππ $
.
ππ$ %
Current
ππ% ,
as
ππ- /
KeyInfoName
ππ0 ;
;
ππ; <
if
∫∫ 
(
∫∫ 
kiName
∫∫ 
!=
∫∫ 
null
∫∫ "
)
∫∫" #
{
ªª 
string
ΩΩ 
keyName
ΩΩ "
=
ΩΩ# $
kiName
ΩΩ% +
.
ΩΩ+ ,
Value
ΩΩ, 1
;
ΩΩ1 2
if
ææ 
(
ææ 
_keyNameMapping
ææ '
[
ææ' (
keyName
ææ( /
]
ææ/ 0
as
ææ1 3
ICipherParameters
ææ4 E
!=
ææF H
null
ææI M
)
ææM N
return
øø 
(
øø  
ICipherParameters
øø  1
)
øø1 2
_keyNameMapping
øø2 A
[
øøA B
keyName
øøB I
]
øøI J
;
øøJ K!
XmlNamespaceManager
¡¡ '
nsm
¡¡( +
=
¡¡, -
new
¡¡. 1!
XmlNamespaceManager
¡¡2 E
(
¡¡E F
	_document
¡¡F O
.
¡¡O P
	NameTable
¡¡P Y
)
¡¡Y Z
;
¡¡Z [
nsm
¬¬ 
.
¬¬ 
AddNamespace
¬¬ $
(
¬¬$ %
$str
¬¬% *
,
¬¬* +
EncryptedXml
¬¬, 8
.
¬¬8 9 
XmlEncNamespaceUrl
¬¬9 K
)
¬¬K L
;
¬¬L M
XmlNodeList
√√ 
encryptedKeyList
√√  0
=
√√1 2
	_document
√√3 <
.
√√< =
SelectNodes
√√= H
(
√√H I
$str
√√I ]
,
√√] ^
nsm
√√_ b
)
√√b c
;
√√c d
if
ƒƒ 
(
ƒƒ 
encryptedKeyList
ƒƒ (
!=
ƒƒ) +
null
ƒƒ, 0
)
ƒƒ0 1
{
≈≈ 
foreach
∆∆ 
(
∆∆  !
XmlNode
∆∆! (
encryptedKeyNode
∆∆) 9
in
∆∆: <
encryptedKeyList
∆∆= M
)
∆∆M N
{
«« 

XmlElement
»» &!
encryptedKeyElement
»»' :
=
»»; <
encryptedKeyNode
»»= M
as
»»N P

XmlElement
»»Q [
;
»»[ \
EncryptedKey
…… (
ek1
……) ,
=
……- .
new
……/ 2
EncryptedKey
……3 ?
(
……? @
)
……@ A
;
……A B
ek1
   
.
    
LoadXml
    '
(
  ' (!
encryptedKeyElement
  ( ;
)
  ; <
;
  < =
if
ÀÀ 
(
ÀÀ  
ek1
ÀÀ  #
.
ÀÀ# $
CarriedKeyName
ÀÀ$ 2
==
ÀÀ3 5
keyName
ÀÀ6 =
&&
ÀÀ> @
ek1
ÀÀA D
.
ÀÀD E
	Recipient
ÀÀE N
==
ÀÀO Q
	Recipient
ÀÀR [
)
ÀÀ[ \
{
ÃÃ 
ek
ÕÕ  "
=
ÕÕ# $
ek1
ÕÕ% (
;
ÕÕ( )
break
ŒŒ  %
;
ŒŒ% &
}
œœ 
}
–– 
}
—— 
break
““ 
;
““ 
}
”” 
kiRetrievalMethod
‘‘ !
=
‘‘" #
keyInfoEnum
‘‘$ /
.
‘‘/ 0
Current
‘‘0 7
as
‘‘8 :$
KeyInfoRetrievalMethod
‘‘; Q
;
‘‘Q R
if
’’ 
(
’’ 
kiRetrievalMethod
’’ %
!=
’’& (
null
’’) -
)
’’- .
{
÷÷ 
string
◊◊ 
idref
◊◊  
=
◊◊! "
Utils
◊◊# (
.
◊◊( )#
ExtractIdFromLocalUri
◊◊) >
(
◊◊> ?
kiRetrievalMethod
◊◊? P
.
◊◊P Q
Uri
◊◊Q T
)
◊◊T U
;
◊◊U V
ek
ÿÿ 
=
ÿÿ 
new
ÿÿ 
EncryptedKey
ÿÿ )
(
ÿÿ) *
)
ÿÿ* +
;
ÿÿ+ ,
ek
ŸŸ 
.
ŸŸ 
LoadXml
ŸŸ 
(
ŸŸ 
GetIdElement
ŸŸ +
(
ŸŸ+ ,
	_document
ŸŸ, 5
,
ŸŸ5 6
idref
ŸŸ7 <
)
ŸŸ< =
)
ŸŸ= >
;
ŸŸ> ?
break
⁄⁄ 
;
⁄⁄ 
}
€€ 
kiEncKey
‹‹ 
=
‹‹ 
keyInfoEnum
‹‹ &
.
‹‹& '
Current
‹‹' .
as
‹‹/ 1!
KeyInfoEncryptedKey
‹‹2 E
;
‹‹E F
if
›› 
(
›› 
kiEncKey
›› 
!=
›› 
null
››  $
)
››$ %
{
ﬁﬁ 
ek
ﬂﬂ 
=
ﬂﬂ 
kiEncKey
ﬂﬂ !
.
ﬂﬂ! "
EncryptedKey
ﬂﬂ" .
;
ﬂﬂ. /
break
‡‡ 
;
‡‡ 
}
·· 
}
‚‚ 
if
ÂÂ 
(
ÂÂ 
ek
ÂÂ 
!=
ÂÂ 
null
ÂÂ 
)
ÂÂ 
{
ÊÊ 
if
ÈÈ 
(
ÈÈ #
symmetricAlgorithmUri
ÈÈ )
==
ÈÈ* ,
null
ÈÈ- 1
)
ÈÈ1 2
{
ÍÍ 
if
ÎÎ 
(
ÎÎ 
encryptedData
ÎÎ %
.
ÎÎ% &
EncryptionMethod
ÎÎ& 6
==
ÎÎ7 9
null
ÎÎ: >
)
ÎÎ> ?
throw
ÏÏ 
new
ÏÏ !
System
ÏÏ" (
.
ÏÏ( )
Security
ÏÏ) 1
.
ÏÏ1 2
Cryptography
ÏÏ2 >
.
ÏÏ> ?$
CryptographicException
ÏÏ? U
(
ÏÏU V
SR
ÏÏV X
.
ÏÏX Y/
!Cryptography_Xml_MissingAlgorithm
ÏÏY z
)
ÏÏz {
;
ÏÏ{ |#
symmetricAlgorithmUri
ÌÌ )
=
ÌÌ* +
encryptedData
ÌÌ, 9
.
ÌÌ9 :
EncryptionMethod
ÌÌ: J
.
ÌÌJ K
KeyAlgorithm
ÌÌK W
;
ÌÌW X
}
ÓÓ 
byte
ÔÔ 
[
ÔÔ 
]
ÔÔ 
key
ÔÔ 
=
ÔÔ !
DecryptEncryptedKey
ÔÔ 0
(
ÔÔ0 1
ek
ÔÔ1 3
)
ÔÔ3 4
;
ÔÔ4 5
if
 
(
 
key
 
==
 
null
 
)
  
throw
ÒÒ 
new
ÒÒ 
System
ÒÒ $
.
ÒÒ$ %
Security
ÒÒ% -
.
ÒÒ- .
Cryptography
ÒÒ. :
.
ÒÒ: ;$
CryptographicException
ÒÒ; Q
(
ÒÒQ R
SR
ÒÒR T
.
ÒÒT U3
%Cryptography_Xml_MissingDecryptionKey
ÒÒU z
)
ÒÒz {
;
ÒÒ{ |
IBufferedCipher
ÛÛ 
symAlg
ÛÛ  &
=
ÛÛ' (
CryptoHelpers
ÛÛ) 6
.
ÛÛ6 7
CreateFromName
ÛÛ7 E
<
ÛÛE F
IBufferedCipher
ÛÛF U
>
ÛÛU V
(
ÛÛV W#
symmetricAlgorithmUri
ÛÛW l
)
ÛÛl m
;
ÛÛm n
if
ÙÙ 
(
ÙÙ 
symAlg
ÙÙ 
==
ÙÙ 
null
ÙÙ "
)
ÙÙ" #
{
ıı 
throw
ˆˆ 
new
ˆˆ 
System
ˆˆ $
.
ˆˆ$ %
Security
ˆˆ% -
.
ˆˆ- .
Cryptography
ˆˆ. :
.
ˆˆ: ;$
CryptographicException
ˆˆ; Q
(
ˆˆQ R
SR
ˆˆR T
.
ˆˆT U/
!Cryptography_Xml_MissingAlgorithm
ˆˆU v
)
ˆˆv w
;
ˆˆw x
}
˜˜ 
KeyParameter
˘˘ 
keyParam
˘˘ %
;
˘˘% &
if
˙˙ 
(
˙˙ 
symAlg
˙˙ 
.
˙˙ 
AlgorithmName
˙˙ (
.
˙˙( )
IndexOf
˙˙) 0
(
˙˙0 1
$str
˙˙1 9
,
˙˙9 :
StringComparison
˙˙; K
.
˙˙K L
OrdinalIgnoreCase
˙˙L ]
)
˙˙] ^
>=
˙˙_ a
$num
˙˙b c
)
˙˙c d
keyParam
˚˚ 
=
˚˚ 
new
˚˚ "
DesEdeParameters
˚˚# 3
(
˚˚3 4
key
˚˚4 7
)
˚˚7 8
;
˚˚8 9
else
¸¸ 
if
¸¸ 
(
¸¸ 
symAlg
¸¸ 
.
¸¸  
AlgorithmName
¸¸  -
.
¸¸- .
IndexOf
¸¸. 5
(
¸¸5 6
$str
¸¸6 ;
,
¸¸; <
StringComparison
¸¸= M
.
¸¸M N
OrdinalIgnoreCase
¸¸N _
)
¸¸_ `
>=
¸¸a c
$num
¸¸d e
)
¸¸e f
keyParam
˝˝ 
=
˝˝ 
new
˝˝ "
DesParameters
˝˝# 0
(
˝˝0 1
key
˝˝1 4
)
˝˝4 5
;
˝˝5 6
else
˛˛ 
keyParam
ˇˇ 
=
ˇˇ 
new
ˇˇ "
KeyParameter
ˇˇ# /
(
ˇˇ/ 0
key
ˇˇ0 3
)
ˇˇ3 4
;
ˇˇ4 5
return
ÅÅ 
keyParam
ÅÅ 
;
ÅÅ  
}
ÇÇ 
return
ÉÉ 
null
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
áá 
virtual
áá 
byte
áá 
[
áá 
]
áá !
DecryptEncryptedKey
áá 1
(
áá1 2
EncryptedKey
áá2 >
encryptedKey
áá? K
,
ááK L
RsaKeyParameters
ááM ]

privateKey
áá^ h
=
áái j
null
áák o
)
ááo p
{
àà 	
if
ââ 
(
ââ 
encryptedKey
ââ 
==
ââ 
null
ââ  $
)
ââ$ %
throw
ää 
new
ää #
ArgumentNullException
ää /
(
ää/ 0
nameof
ää0 6
(
ää6 7
encryptedKey
ää7 C
)
ääC D
)
ääD E
;
ääE F
if
ãã 
(
ãã 
encryptedKey
ãã 
.
ãã 
KeyInfo
ãã $
==
ãã% '
null
ãã( ,
)
ãã, -
return
åå 
null
åå 
;
åå 
IEnumerator
éé 
keyInfoEnum
éé #
=
éé$ %
encryptedKey
éé& 2
.
éé2 3
KeyInfo
éé3 :
.
éé: ;
GetEnumerator
éé; H
(
ééH I
)
ééI J
;
ééJ K
KeyInfoName
èè 
kiName
èè 
;
èè 
KeyInfoX509Data
êê 

kiX509Data
êê &
;
êê& '$
KeyInfoRetrievalMethod
ëë "
kiRetrievalMethod
ëë# 4
;
ëë4 5!
KeyInfoEncryptedKey
íí 
kiEncKey
íí  (
;
íí( )
EncryptedKey
ìì 
ek
ìì 
=
ìì 
null
ìì "
;
ìì" #
bool
îî 
fOAEP
îî 
=
îî 
false
îî 
;
îî 
while
ññ 
(
ññ 
keyInfoEnum
ññ 
.
ññ 
MoveNext
ññ '
(
ññ' (
)
ññ( )
)
ññ) *
{
óó 
kiName
òò 
=
òò 
keyInfoEnum
òò $
.
òò$ %
Current
òò% ,
as
òò- /
KeyInfoName
òò0 ;
;
òò; <
if
ôô 
(
ôô 
kiName
ôô 
!=
ôô 
null
ôô "
)
ôô" #
{
öö 
string
úú 
keyName
úú "
=
úú# $
kiName
úú% +
.
úú+ ,
Value
úú, 1
;
úú1 2
object
ùù 
kek
ùù 
=
ùù  
_keyNameMapping
ùù! 0
[
ùù0 1
keyName
ùù1 8
]
ùù8 9
;
ùù9 :
if
ûû 
(
ûû 
kek
ûû 
!=
ûû 
null
ûû #
)
ûû# $
{
üü 
if
†† 
(
†† 
encryptedKey
†† (
.
††( )

CipherData
††) 3
==
††4 6
null
††7 ;
||
††< >
encryptedKey
††? K
.
††K L

CipherData
††L V
.
††V W
CipherValue
††W b
==
††c e
null
††f j
)
††j k
{
°° 
throw
¢¢ !
new
¢¢" %
System
¢¢& ,
.
¢¢, -
Security
¢¢- 5
.
¢¢5 6
Cryptography
¢¢6 B
.
¢¢B C$
CryptographicException
¢¢C Y
(
¢¢Y Z
SR
¢¢Z \
.
¢¢\ ]/
!Cryptography_Xml_MissingAlgorithm
¢¢] ~
)
¢¢~ 
;¢¢ Ä
}
££ 
if
•• 
(
•• 
kek
•• 
is
••  "
KeyParameter
••# /
kp
••0 2
)
••2 3
return
¶¶ "
EncryptedXml
¶¶# /
.
¶¶/ 0

DecryptKey
¶¶0 :
(
¶¶: ;
encryptedKey
¶¶; G
.
¶¶G H

CipherData
¶¶H R
.
¶¶R S
CipherValue
¶¶S ^
,
¶¶^ _
kp
¶¶` b
)
¶¶b c
;
¶¶c d
else
ßß 
if
ßß 
(
ßß  !
kek
ßß! $
is
ßß% '
ParametersWithIV
ßß( 8
piv
ßß9 <
)
ßß< =
return
®® "
EncryptedXml
®®# /
.
®®/ 0

DecryptKey
®®0 :
(
®®: ;
encryptedKey
®®; G
.
®®G H

CipherData
®®H R
.
®®R S
CipherValue
®®S ^
,
®®^ _
piv
®®` c
.
®®c d

Parameters
®®d n
as
®®o q
KeyParameter
®®r ~
)
®®~ 
;®® Ä
fOAEP
´´ 
=
´´ 
(
´´  !
encryptedKey
´´! -
.
´´- .
EncryptionMethod
´´. >
!=
´´? A
null
´´B F
&&
´´G I
encryptedKey
´´J V
.
´´V W
EncryptionMethod
´´W g
.
´´g h
KeyAlgorithm
´´h t
==
´´u w
EncryptedXml´´x Ñ
.´´Ñ Ö 
XmlEncRSAOAEPUrl´´Ö ï
)´´ï ñ
;´´ñ ó
return
¨¨ 
EncryptedXml
¨¨ +
.
¨¨+ ,

DecryptKey
¨¨, 6
(
¨¨6 7
encryptedKey
¨¨7 C
.
¨¨C D

CipherData
¨¨D N
.
¨¨N O
CipherValue
¨¨O Z
,
¨¨Z [
(
¨¨\ ]
RsaKeyParameters
¨¨] m
)
¨¨m n
kek
¨¨n q
,
¨¨q r
fOAEP
¨¨s x
)
¨¨x y
;
¨¨y z
}
≠≠ 
break
ÆÆ 
;
ÆÆ 
}
ØØ 

kiX509Data
∞∞ 
=
∞∞ 
keyInfoEnum
∞∞ (
.
∞∞( )
Current
∞∞) 0
as
∞∞1 3
KeyInfoX509Data
∞∞4 C
;
∞∞C D
if
±± 
(
±± 

kiX509Data
±± 
!=
±± !
null
±±" &
)
±±& '
{
≤≤ 
var
≥≥ 

collection
≥≥ "
=
≥≥# $
Utils
≥≥% *
.
≥≥* +
BuildBagOfCerts
≥≥+ :
(
≥≥: ;

kiX509Data
≥≥; E
,
≥≥E F
CertUsageType
≥≥G T
.
≥≥T U

Decryption
≥≥U _
)
≥≥_ `
;
≥≥` a
foreach
¥¥ 
(
¥¥ 
X509Certificate
¥¥ ,
certificate
¥¥- 8
in
¥¥9 ;

collection
¥¥< F
)
¥¥F G
{
µµ 
if
∂∂ 
(
∂∂ 

privateKey
∂∂ &
!=
∂∂' )
null
∂∂* .
)
∂∂. /
{
∑∑ 
if
∏∏ 
(
∏∏  
encryptedKey
∏∏  ,
.
∏∏, -

CipherData
∏∏- 7
==
∏∏8 :
null
∏∏; ?
||
∏∏@ B
encryptedKey
∏∏C O
.
∏∏O P

CipherData
∏∏P Z
.
∏∏Z [
CipherValue
∏∏[ f
==
∏∏g i
null
∏∏j n
)
∏∏n o
{
ππ 
throw
∫∫  %
new
∫∫& )
System
∫∫* 0
.
∫∫0 1
Security
∫∫1 9
.
∫∫9 :
Cryptography
∫∫: F
.
∫∫F G$
CryptographicException
∫∫G ]
(
∫∫] ^
SR
∫∫^ `
.
∫∫` a0
!Cryptography_Xml_MissingAlgorithm∫∫a Ç
)∫∫Ç É
;∫∫É Ñ
}
ªª 
fOAEP
ºº !
=
ºº" #
(
ºº$ %
encryptedKey
ºº% 1
.
ºº1 2
EncryptionMethod
ºº2 B
!=
ººC E
null
ººF J
&&
ººK M
encryptedKey
ººN Z
.
ººZ [
EncryptionMethod
ºº[ k
.
ººk l
KeyAlgorithm
ººl x
==
ººy {
EncryptedXmlºº| à
.ººà â 
XmlEncRSAOAEPUrlººâ ô
)ººô ö
;ººö õ
return
ΩΩ "
EncryptedXml
ΩΩ# /
.
ΩΩ/ 0

DecryptKey
ΩΩ0 :
(
ΩΩ: ;
encryptedKey
ΩΩ; G
.
ΩΩG H

CipherData
ΩΩH R
.
ΩΩR S
CipherValue
ΩΩS ^
,
ΩΩ^ _

privateKey
ΩΩ` j
,
ΩΩj k
fOAEP
ΩΩl q
)
ΩΩq r
;
ΩΩr s
}
ææ 
}
øø 
break
¿¿ 
;
¿¿ 
}
¡¡ 
kiRetrievalMethod
¬¬ !
=
¬¬" #
keyInfoEnum
¬¬$ /
.
¬¬/ 0
Current
¬¬0 7
as
¬¬8 :$
KeyInfoRetrievalMethod
¬¬; Q
;
¬¬Q R
if
√√ 
(
√√ 
kiRetrievalMethod
√√ %
!=
√√& (
null
√√) -
)
√√- .
{
ƒƒ 
string
≈≈ 
idref
≈≈  
=
≈≈! "
Utils
≈≈# (
.
≈≈( )#
ExtractIdFromLocalUri
≈≈) >
(
≈≈> ?
kiRetrievalMethod
≈≈? P
.
≈≈P Q
Uri
≈≈Q T
)
≈≈T U
;
≈≈U V
ek
∆∆ 
=
∆∆ 
new
∆∆ 
EncryptedKey
∆∆ )
(
∆∆) *
)
∆∆* +
;
∆∆+ ,
ek
«« 
.
«« 
LoadXml
«« 
(
«« 
GetIdElement
«« +
(
««+ ,
	_document
««, 5
,
««5 6
idref
««7 <
)
««< =
)
««= >
;
««> ?
try
»» 
{
…… (
_xmlDsigSearchDepthCounter
ÃÃ 2
++
ÃÃ2 4
;
ÃÃ4 5
if
ÕÕ 
(
ÕÕ )
IsOverXmlDsigRecursionLimit
ÕÕ 7
(
ÕÕ7 8
)
ÕÕ8 9
)
ÕÕ9 :
{
ŒŒ 
throw
–– !
new
––" %/
!CryptoSignedXmlRecursionException
––& G
(
––G H
)
––H I
;
––I J
}
—— 
else
““ 
{
”” 
return
‘‘ "!
DecryptEncryptedKey
‘‘# 6
(
‘‘6 7
ek
‘‘7 9
,
‘‘9 :

privateKey
‘‘; E
)
‘‘E F
;
‘‘F G
}
’’ 
}
÷÷ 
finally
◊◊ 
{
ÿÿ (
_xmlDsigSearchDepthCounter
ŸŸ 2
--
ŸŸ2 4
;
ŸŸ4 5
}
⁄⁄ 
}
€€ 
kiEncKey
‹‹ 
=
‹‹ 
keyInfoEnum
‹‹ &
.
‹‹& '
Current
‹‹' .
as
‹‹/ 1!
KeyInfoEncryptedKey
‹‹2 E
;
‹‹E F
if
›› 
(
›› 
kiEncKey
›› 
!=
›› 
null
››  $
)
››$ %
{
ﬁﬁ 
ek
ﬂﬂ 
=
ﬂﬂ 
kiEncKey
ﬂﬂ !
.
ﬂﬂ! "
EncryptedKey
ﬂﬂ" .
;
ﬂﬂ. /
byte
·· 
[
·· 
]
·· 
encryptionKey
·· (
=
··) *!
DecryptEncryptedKey
··+ >
(
··> ?
ek
··? A
,
··A B

privateKey
··C M
)
··M N
;
··N O
if
‚‚ 
(
‚‚ 
encryptionKey
‚‚ %
!=
‚‚& (
null
‚‚) -
)
‚‚- .
{
„„ 
IBlockCipher
ÂÂ $
blockSymAlg
ÂÂ% 0
=
ÂÂ1 2
CryptoHelpers
ÂÂ3 @
.
ÂÂ@ A
CreateFromName
ÂÂA O
<
ÂÂO P
IBlockCipher
ÂÂP \
>
ÂÂ\ ]
(
ÂÂ] ^
encryptedKey
ÂÂ^ j
.
ÂÂj k
EncryptionMethod
ÂÂk {
.
ÂÂ{ |
KeyAlgorithmÂÂ| à
)ÂÂà â
;ÂÂâ ä
if
ÊÊ 
(
ÊÊ 
blockSymAlg
ÊÊ '
==
ÊÊ( *
null
ÊÊ+ /
)
ÊÊ/ 0
{
ÁÁ 
IBufferedCipher
ËË +
bufferedSymAlg
ËË, :
=
ËË; <
CryptoHelpers
ËË= J
.
ËËJ K
CreateFromName
ËËK Y
<
ËËY Z
IBufferedCipher
ËËZ i
>
ËËi j
(
ËËj k
encryptedKey
ËËk w
.
ËËw x
EncryptionMethodËËx à
.ËËà â
KeyAlgorithmËËâ ï
)ËËï ñ
;ËËñ ó
if
ÈÈ 
(
ÈÈ  
bufferedSymAlg
ÈÈ  .
==
ÈÈ/ 1
null
ÈÈ2 6
)
ÈÈ6 7
{
ÍÍ 
throw
ÎÎ  %
new
ÎÎ& )
System
ÎÎ* 0
.
ÎÎ0 1
Security
ÎÎ1 9
.
ÎÎ9 :
Cryptography
ÎÎ: F
.
ÎÎF G$
CryptographicException
ÎÎG ]
(
ÎÎ] ^
SR
ÎÎ^ `
.
ÎÎ` a0
!Cryptography_Xml_MissingAlgorithmÎÎa Ç
)ÎÎÇ É
;ÎÎÉ Ñ
}
ÏÏ 
}
ÌÌ 
if
ÓÓ 
(
ÓÓ 
encryptedKey
ÓÓ (
.
ÓÓ( )

CipherData
ÓÓ) 3
==
ÓÓ4 6
null
ÓÓ7 ;
||
ÓÓ< >
encryptedKey
ÓÓ? K
.
ÓÓK L

CipherData
ÓÓL V
.
ÓÓV W
CipherValue
ÓÓW b
==
ÓÓc e
null
ÓÓf j
)
ÓÓj k
{
ÔÔ 
throw
 !
new
" %
System
& ,
.
, -
Security
- 5
.
5 6
Cryptography
6 B
.
B C$
CryptographicException
C Y
(
Y Z
SR
Z \
.
\ ]/
!Cryptography_Xml_MissingAlgorithm
] ~
)
~ 
; Ä
}
ÒÒ 
return
ÚÚ 
EncryptedXml
ÚÚ +
.
ÚÚ+ ,

DecryptKey
ÚÚ, 6
(
ÚÚ6 7
encryptedKey
ÚÚ7 C
.
ÚÚC D

CipherData
ÚÚD N
.
ÚÚN O
CipherValue
ÚÚO Z
,
ÚÚZ [
new
ÚÚ\ _
KeyParameter
ÚÚ` l
(
ÚÚl m
encryptionKey
ÚÚm z
)
ÚÚz {
)
ÚÚ{ |
;
ÚÚ| }
}
ÛÛ 
}
ÙÙ 
}
ıı 
return
ˆˆ 
null
ˆˆ 
;
ˆˆ 
}
˜˜ 	
public
ˇˇ 
void
ˇˇ 
AddKeyNameMapping
ˇˇ %
(
ˇˇ% &
string
ˇˇ& ,
keyName
ˇˇ- 4
,
ˇˇ4 5
object
ˇˇ6 <
	keyObject
ˇˇ= F
)
ˇˇF G
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
keyName
ÅÅ 
==
ÅÅ 
null
ÅÅ 
)
ÅÅ  
throw
ÇÇ 
new
ÇÇ #
ArgumentNullException
ÇÇ /
(
ÇÇ/ 0
nameof
ÇÇ0 6
(
ÇÇ6 7
keyName
ÇÇ7 >
)
ÇÇ> ?
)
ÇÇ? @
;
ÇÇ@ A
if
ÉÉ 
(
ÉÉ 
	keyObject
ÉÉ 
==
ÉÉ 
null
ÉÉ !
)
ÉÉ! "
throw
ÑÑ 
new
ÑÑ #
ArgumentNullException
ÑÑ /
(
ÑÑ/ 0
nameof
ÑÑ0 6
(
ÑÑ6 7
	keyObject
ÑÑ7 @
)
ÑÑ@ A
)
ÑÑA B
;
ÑÑB C
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
(
ÜÜ 
	keyObject
ÜÜ 
is
ÜÜ 
RsaKeyParameters
ÜÜ /
)
ÜÜ/ 0
&&
ÜÜ1 3
!
ÜÜ4 5
(
ÜÜ5 6
	keyObject
ÜÜ6 ?
is
ÜÜ@ B
ICipherParameters
ÜÜC T
)
ÜÜT U
)
ÜÜU V
throw
áá 
new
áá 
System
áá  
.
áá  !
Security
áá! )
.
áá) *
Cryptography
áá* 6
.
áá6 7$
CryptographicException
áá7 M
(
ááM N
SR
ááN P
.
ááP QB
3Cryptography_Xml_NotSupportedCryptographicTransformááQ Ñ
)ááÑ Ö
;ááÖ Ü
_keyNameMapping
ââ 
.
ââ 
Add
ââ 
(
ââ  
keyName
ââ  '
,
ââ' (
	keyObject
ââ) 2
)
ââ2 3
;
ââ3 4
}
ää 	
public
åå 
void
åå "
ClearKeyNameMappings
åå (
(
åå( )
)
åå) *
{
çç 	
_keyNameMapping
éé 
.
éé 
Clear
éé !
(
éé! "
)
éé" #
;
éé# $
}
èè 	
public
ìì 
EncryptedData
ìì 
Encrypt
ìì $
(
ìì$ %

XmlElement
ìì% /
inputElement
ìì0 <
,
ìì< =
X509Certificate
ìì> M
certificate
ììN Y
)
ììY Z
{
îî 	
if
ïï 
(
ïï 
inputElement
ïï 
==
ïï 
null
ïï  $
)
ïï$ %
throw
ññ 
new
ññ #
ArgumentNullException
ññ /
(
ññ/ 0
nameof
ññ0 6
(
ññ6 7
inputElement
ññ7 C
)
ññC D
)
ññD E
;
ññE F
if
óó 
(
óó 
certificate
óó 
==
óó 
null
óó #
)
óó# $
throw
òò 
new
òò #
ArgumentNullException
òò /
(
òò/ 0
nameof
òò0 6
(
òò6 7
certificate
òò7 B
)
òòB C
)
òòC D
;
òòD E$
AsymmetricKeyParameter
öö "
rsaPublicKey
öö# /
=
öö0 1
certificate
öö2 =
.
öö= >
GetPublicKey
öö> J
(
ööJ K
)
ööK L
;
ööL M
if
õõ 
(
õõ 
rsaPublicKey
õõ 
==
õõ 
null
õõ  $
||
õõ% '
!
õõ( )
(
õõ) *
rsaPublicKey
õõ* 6
is
õõ7 9
RsaKeyParameters
õõ: J
)
õõJ K
)
õõK L
throw
úú 
new
úú #
NotSupportedException
úú /
(
úú/ 0
SR
úú0 2
.
úú2 3'
NotSupported_KeyAlgorithm
úú3 L
)
úúL M
;
úúM N
EncryptedData
üü 
ed
üü 
=
üü 
new
üü "
EncryptedData
üü# 0
(
üü0 1
)
üü1 2
;
üü2 3
ed
†† 
.
†† 
Type
†† 
=
†† 
EncryptedXml
†† "
.
††" #
XmlEncElementUrl
††# 3
;
††3 4
ed
°° 
.
°° 
EncryptionMethod
°° 
=
°°  !
new
°°" %
EncryptionMethod
°°& 6
(
°°6 7
EncryptedXml
°°7 C
.
°°C D
XmlEncAES256Url
°°D S
)
°°S T
;
°°T U
EncryptedKey
§§ 
ek
§§ 
=
§§ 
new
§§ !
EncryptedKey
§§" .
(
§§. /
)
§§/ 0
;
§§0 1
ek
•• 
.
•• 
EncryptionMethod
•• 
=
••  !
new
••" %
EncryptionMethod
••& 6
(
••6 7
EncryptedXml
••7 C
.
••C D
XmlEncRSA15Url
••D R
)
••R S
;
••S T
ek
¶¶ 
.
¶¶ 
KeyInfo
¶¶ 
.
¶¶ 
	AddClause
¶¶  
(
¶¶  !
new
¶¶! $
KeyInfoX509Data
¶¶% 4
(
¶¶4 5
certificate
¶¶5 @
)
¶¶@ A
)
¶¶A B
;
¶¶B C
IBufferedCipher
©© 
rijn
©©  
=
©©! "
CipherUtilities
©©# 2
.
©©2 3
	GetCipher
©©3 <
(
©©< =
$str
©©= Q
)
©©Q R
;
©©R S
KeyParameter
™™ 
keyParam
™™ !
=
™™" #
new
™™$ '
KeyParameter
™™( 4
(
™™4 5
Utils
™™5 :
.
™™: ;!
GenerateRandomBlock
™™; N
(
™™N O
rijn
™™O S
.
™™S T
GetBlockSize
™™T `
(
™™` a
)
™™a b
)
™™b c
)
™™c d
;
™™d e
ParametersWithIV
´´ 
rijnKey
´´ $
=
´´% &
new
´´' *
ParametersWithIV
´´+ ;
(
´´; <
keyParam
´´< D
,
´´D E
Utils
´´F K
.
´´K L!
GenerateRandomBlock
´´L _
(
´´_ `
rijn
´´` d
.
´´d e
GetBlockSize
´´e q
(
´´q r
)
´´r s
)
´´s t
)
´´t u
;
´´u v
ek
¨¨ 
.
¨¨ 

CipherData
¨¨ 
.
¨¨ 
CipherValue
¨¨ %
=
¨¨& '
EncryptedXml
¨¨( 4
.
¨¨4 5

EncryptKey
¨¨5 ?
(
¨¨? @
keyParam
¨¨@ H
.
¨¨H I
GetKey
¨¨I O
(
¨¨O P
)
¨¨P Q
,
¨¨Q R
(
¨¨S T
RsaKeyParameters
¨¨T d
)
¨¨d e
rsaPublicKey
¨¨e q
,
¨¨q r
false
¨¨s x
)
¨¨x y
;
¨¨y z!
KeyInfoEncryptedKey
ØØ 
kek
ØØ  #
=
ØØ$ %
new
ØØ& )!
KeyInfoEncryptedKey
ØØ* =
(
ØØ= >
ek
ØØ> @
)
ØØ@ A
;
ØØA B
ed
∞∞ 
.
∞∞ 
KeyInfo
∞∞ 
.
∞∞ 
	AddClause
∞∞  
(
∞∞  !
kek
∞∞! $
)
∞∞$ %
;
∞∞% &
ed
±± 
.
±± 

CipherData
±± 
.
±± 
CipherValue
±± %
=
±±& '
EncryptData
±±( 3
(
±±3 4
inputElement
±±4 @
,
±±@ A
rijnKey
±±B I
,
±±I J
false
±±K P
)
±±P Q
;
±±Q R
return
≥≥ 
ed
≥≥ 
;
≥≥ 
}
¥¥ 	
public
ππ 
EncryptedData
ππ 
Encrypt
ππ $
(
ππ$ %

XmlElement
ππ% /
inputElement
ππ0 <
,
ππ< =
string
ππ> D
keyName
ππE L
)
ππL M
{
∫∫ 	
if
ªª 
(
ªª 
inputElement
ªª 
==
ªª 
null
ªª  $
)
ªª$ %
throw
ºº 
new
ºº #
ArgumentNullException
ºº /
(
ºº/ 0
nameof
ºº0 6
(
ºº6 7
inputElement
ºº7 C
)
ººC D
)
ººD E
;
ººE F
if
ΩΩ 
(
ΩΩ 
keyName
ΩΩ 
==
ΩΩ 
null
ΩΩ 
)
ΩΩ  
throw
ææ 
new
ææ #
ArgumentNullException
ææ /
(
ææ/ 0
nameof
ææ0 6
(
ææ6 7
keyName
ææ7 >
)
ææ> ?
)
ææ? @
;
ææ@ A
object
¿¿ 
encryptionKey
¿¿  
=
¿¿! "
null
¿¿# '
;
¿¿' (
if
¡¡ 
(
¡¡ 
_keyNameMapping
¡¡ 
!=
¡¡  "
null
¡¡# '
)
¡¡' (
encryptionKey
¬¬ 
=
¬¬ 
_keyNameMapping
¬¬  /
[
¬¬/ 0
keyName
¬¬0 7
]
¬¬7 8
;
¬¬8 9
if
ƒƒ 
(
ƒƒ 
encryptionKey
ƒƒ 
==
ƒƒ  
null
ƒƒ! %
)
ƒƒ% &
throw
≈≈ 
new
≈≈ 
System
≈≈  
.
≈≈  !
Security
≈≈! )
.
≈≈) *
Cryptography
≈≈* 6
.
≈≈6 7$
CryptographicException
≈≈7 M
(
≈≈M N
SR
≈≈N P
.
≈≈P Q3
%Cryptography_Xml_MissingEncryptionKey
≈≈Q v
)
≈≈v w
;
≈≈w x
ParametersWithIV
»» 
iv
»» 
=
»»  !
encryptionKey
»»" /
as
»»0 2
ParametersWithIV
»»3 C
;
»»C D
KeyParameter
…… 
symKey
…… 
=
……  !
encryptionKey
……" /
as
……0 2
KeyParameter
……3 ?
;
……? @
RsaKeyParameters
   
rsa
    
=
  ! "
encryptionKey
  # 0
as
  1 3
RsaKeyParameters
  4 D
;
  D E
EncryptedData
ÕÕ 
ed
ÕÕ 
=
ÕÕ 
new
ÕÕ "
EncryptedData
ÕÕ# 0
(
ÕÕ0 1
)
ÕÕ1 2
;
ÕÕ2 3
ed
ŒŒ 
.
ŒŒ 
Type
ŒŒ 
=
ŒŒ 
EncryptedXml
ŒŒ "
.
ŒŒ" #
XmlEncElementUrl
ŒŒ# 3
;
ŒŒ3 4
ed
œœ 
.
œœ 
EncryptionMethod
œœ 
=
œœ  !
new
œœ" %
EncryptionMethod
œœ& 6
(
œœ6 7
EncryptedXml
œœ7 C
.
œœC D
XmlEncAES256Url
œœD S
)
œœS T
;
œœT U
string
““ 
encryptionMethod
““ #
=
““$ %
null
““& *
;
““* +
if
”” 
(
”” 
symKey
”” 
==
”” 
null
”” 
&&
”” !
iv
””" $
==
””% '
null
””( ,
)
””, -
{
‘‘ 
encryptionMethod
’’  
=
’’! "
EncryptedXml
’’# /
.
’’/ 0
XmlEncRSA15Url
’’0 >
;
’’> ?
}
÷÷ 
else
◊◊ 
if
◊◊ 
(
◊◊ 
iv
◊◊ 
!=
◊◊ 
null
◊◊ 
)
◊◊  
{
ÿÿ 
symKey
ŸŸ 
=
ŸŸ 
iv
ŸŸ 
.
ŸŸ 

Parameters
ŸŸ &
as
ŸŸ' )
KeyParameter
ŸŸ* 6
;
ŸŸ6 7
}
⁄⁄ 
if
‹‹ 
(
‹‹ 
symKey
‹‹ 
!=
‹‹ 
null
‹‹ 
)
‹‹ 
{
›› 
if
ﬁﬁ 
(
ﬁﬁ 
symKey
ﬁﬁ 
is
ﬁﬁ 
DesParameters
ﬁﬁ +
)
ﬁﬁ+ ,
{
ﬂﬂ 
encryptionMethod
·· $
=
··% &
EncryptedXml
··' 3
.
··3 4'
XmlEncTripleDESKeyWrapUrl
··4 M
;
··M N
}
‚‚ 
else
„„ 
{
‰‰ 
switch
ÊÊ 
(
ÊÊ 
symKey
ÊÊ "
.
ÊÊ" #
GetKey
ÊÊ# )
(
ÊÊ) *
)
ÊÊ* +
.
ÊÊ+ ,
Length
ÊÊ, 2
*
ÊÊ3 4
$num
ÊÊ5 6
)
ÊÊ6 7
{
ÁÁ 
case
ËË 
$num
ËË  
:
ËË  !
encryptionMethod
ÈÈ ,
=
ÈÈ- .
EncryptedXml
ÈÈ/ ;
.
ÈÈ; <$
XmlEncAES128KeyWrapUrl
ÈÈ< R
;
ÈÈR S
break
ÍÍ !
;
ÍÍ! "
case
ÎÎ 
$num
ÎÎ  
:
ÎÎ  !
encryptionMethod
ÏÏ ,
=
ÏÏ- .
EncryptedXml
ÏÏ/ ;
.
ÏÏ; <$
XmlEncAES192KeyWrapUrl
ÏÏ< R
;
ÏÏR S
break
ÌÌ !
;
ÌÌ! "
case
ÓÓ 
$num
ÓÓ  
:
ÓÓ  !
encryptionMethod
ÔÔ ,
=
ÔÔ- .
EncryptedXml
ÔÔ/ ;
.
ÔÔ; <$
XmlEncAES256KeyWrapUrl
ÔÔ< R
;
ÔÔR S
break
 !
;
! "
}
ÒÒ 
}
ÚÚ 
}
ÛÛ 
EncryptedKey
ıı 
ek
ıı 
=
ıı 
new
ıı !
EncryptedKey
ıı" .
(
ıı. /
)
ıı/ 0
;
ıı0 1
ek
ˆˆ 
.
ˆˆ 
EncryptionMethod
ˆˆ 
=
ˆˆ  !
new
ˆˆ" %
EncryptionMethod
ˆˆ& 6
(
ˆˆ6 7
encryptionMethod
ˆˆ7 G
)
ˆˆG H
;
ˆˆH I
ek
˜˜ 
.
˜˜ 
KeyInfo
˜˜ 
.
˜˜ 
	AddClause
˜˜  
(
˜˜  !
new
˜˜! $
KeyInfoName
˜˜% 0
(
˜˜0 1
keyName
˜˜1 8
)
˜˜8 9
)
˜˜9 :
;
˜˜: ;
var
˙˙ 
keydata
˙˙ 
=
˙˙ 
Utils
˙˙ 
.
˙˙  !
GenerateRandomBlock
˙˙  3
(
˙˙3 4
$num
˙˙4 7
/
˙˙8 9
$num
˙˙: ;
)
˙˙; <
;
˙˙< =
var
˚˚ 
ivdata
˚˚ 
=
˚˚ 
Utils
˚˚ 
.
˚˚ !
GenerateRandomBlock
˚˚ 2
(
˚˚2 3
$num
˚˚3 6
/
˚˚7 8
$num
˚˚9 :
)
˚˚: ;
;
˚˚; <
var
¸¸ 
rijn
¸¸ 
=
¸¸ 
new
¸¸ 
ParametersWithIV
¸¸ +
(
¸¸+ ,
new
¸¸, /
KeyParameter
¸¸0 <
(
¸¸< =
keydata
¸¸= D
)
¸¸D E
,
¸¸E F
ivdata
¸¸G M
)
¸¸M N
;
¸¸N O
ek
˝˝ 
.
˝˝ 

CipherData
˝˝ 
.
˝˝ 
CipherValue
˝˝ %
=
˝˝& '
(
˝˝( )
symKey
˝˝) /
==
˝˝0 2
null
˝˝3 7
?
˝˝8 9
EncryptedXml
˝˝: F
.
˝˝F G

EncryptKey
˝˝G Q
(
˝˝Q R
keydata
˝˝R Y
,
˝˝Y Z
rsa
˝˝[ ^
,
˝˝^ _
false
˝˝` e
)
˝˝e f
:
˝˝g h
EncryptedXml
˝˝i u
.
˝˝u v

EncryptKey˝˝v Ä
(˝˝Ä Å
keydata˝˝Å à
,˝˝à â
symKey˝˝ä ê
)˝˝ê ë
)˝˝ë í
;˝˝í ì!
KeyInfoEncryptedKey
ÄÄ 
kek
ÄÄ  #
=
ÄÄ$ %
new
ÄÄ& )!
KeyInfoEncryptedKey
ÄÄ* =
(
ÄÄ= >
ek
ÄÄ> @
)
ÄÄ@ A
;
ÄÄA B
ed
ÅÅ 
.
ÅÅ 
KeyInfo
ÅÅ 
.
ÅÅ 
	AddClause
ÅÅ  
(
ÅÅ  !
kek
ÅÅ! $
)
ÅÅ$ %
;
ÅÅ% &
ed
ÇÇ 
.
ÇÇ 

CipherData
ÇÇ 
.
ÇÇ 
CipherValue
ÇÇ %
=
ÇÇ& '
EncryptData
ÇÇ( 3
(
ÇÇ3 4
inputElement
ÇÇ4 @
,
ÇÇ@ A
rijn
ÇÇB F
,
ÇÇF G
false
ÇÇH M
)
ÇÇM N
;
ÇÇN O
return
ÑÑ 
ed
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
public
ää 
void
ää 
DecryptDocument
ää #
(
ää# $
)
ää$ %
{
ãã 	!
XmlNamespaceManager
çç 
nsm
çç  #
=
çç$ %
new
çç& )!
XmlNamespaceManager
çç* =
(
çç= >
	_document
çç> G
.
ççG H
	NameTable
ççH Q
)
ççQ R
;
ççR S
nsm
éé 
.
éé 
AddNamespace
éé 
(
éé 
$str
éé "
,
éé" #
EncryptedXml
éé$ 0
.
éé0 1 
XmlEncNamespaceUrl
éé1 C
)
ééC D
;
ééD E
XmlNodeList
èè 
encryptedDataList
èè )
=
èè* +
	_document
èè, 5
.
èè5 6
SelectNodes
èè6 A
(
èèA B
$str
èèB W
,
èèW X
nsm
èèY \
)
èè\ ]
;
èè] ^
if
êê 
(
êê 
encryptedDataList
êê !
!=
êê" $
null
êê% )
)
êê) *
{
ëë 
foreach
íí 
(
íí 
XmlNode
íí  
encryptedDataNode
íí! 2
in
íí3 5
encryptedDataList
íí6 G
)
ííG H
{
ìì 

XmlElement
îî "
encryptedDataElement
îî 3
=
îî4 5
encryptedDataNode
îî6 G
as
îîH J

XmlElement
îîK U
;
îîU V
EncryptedData
ïï !
ed
ïï" $
=
ïï% &
new
ïï' *
EncryptedData
ïï+ 8
(
ïï8 9
)
ïï9 :
;
ïï: ;
ed
ññ 
.
ññ 
LoadXml
ññ 
(
ññ "
encryptedDataElement
ññ 3
)
ññ3 4
;
ññ4 5
ICipherParameters
óó %
symAlg
óó& ,
=
óó- .
GetDecryptionKey
óó/ ?
(
óó? @
ed
óó@ B
,
óóB C
null
óóD H
)
óóH I
;
óóI J
if
òò 
(
òò 
symAlg
òò 
==
òò !
null
òò" &
)
òò& '
throw
ôô 
new
ôô !
System
ôô" (
.
ôô( )
Security
ôô) 1
.
ôô1 2
Cryptography
ôô2 >
.
ôô> ?$
CryptographicException
ôô? U
(
ôôU V
SR
ôôV X
.
ôôX Y3
%Cryptography_Xml_MissingDecryptionKey
ôôY ~
)
ôô~ 
;ôô Ä
byte
öö 
[
öö 
]
öö 
	decrypted
öö $
=
öö% &
DecryptData
öö' 2
(
öö2 3
ed
öö3 5
,
öö5 6
symAlg
öö7 =
)
öö= >
;
öö> ?
ReplaceData
õõ 
(
õõ  "
encryptedDataElement
õõ  4
,
õõ4 5
	decrypted
õõ6 ?
)
õõ? @
;
õõ@ A
}
úú 
}
ùù 
}
ûû 	
public
°° 
byte
°° 
[
°° 
]
°° 
EncryptData
°° !
(
°°! "
byte
°°" &
[
°°& '
]
°°' (
	plaintext
°°) 2
,
°°2 3
ICipherParameters
°°4 E 
symmetricAlgorithm
°°F X
)
°°X Y
{
¢¢ 	
if
££ 
(
££ 
	plaintext
££ 
==
££ 
null
££ !
)
££! "
throw
§§ 
new
§§ #
ArgumentNullException
§§ /
(
§§/ 0
nameof
§§0 6
(
§§6 7
	plaintext
§§7 @
)
§§@ A
)
§§A B
;
§§B C
if
•• 
(
••  
symmetricAlgorithm
•• "
==
••# %
null
••& *
)
••* +
throw
¶¶ 
new
¶¶ #
ArgumentNullException
¶¶ /
(
¶¶/ 0
nameof
¶¶0 6
(
¶¶6 7 
symmetricAlgorithm
¶¶7 I
)
¶¶I J
)
¶¶J K
;
¶¶K L
var
®® 
ivParam
®® 
=
®®  
symmetricAlgorithm
®® ,
as
®®- /
ParametersWithIV
®®0 @
;
®®@ A
var
©© 
keyParam
©© 
=
©© 
ivParam
©© "
==
©©# %
null
©©& *
?
©©+ , 
symmetricAlgorithm
©©- ?
as
©©@ B
KeyParameter
©©C O
:
©©P Q
ivParam
©©R Y
.
©©Y Z

Parameters
©©Z d
as
©©e g
KeyParameter
©©h t
;
©©t u
IBufferedCipher
´´ 
enc
´´ 
;
´´  
if
¨¨ 
(
¨¨ 
keyParam
¨¨ 
is
¨¨ 
DesEdeParameters
¨¨ ,
)
¨¨, -
enc
≠≠ 
=
≠≠ 
CipherUtilities
≠≠ %
.
≠≠% &
	GetCipher
≠≠& /
(
≠≠/ 0
$"
≠≠0 2
DESede/
≠≠2 9
{
≠≠9 :
_mode
≠≠: ?
}
≠≠? @
/
≠≠@ A
{
≠≠A B
_padding
≠≠B J
}
≠≠J K
"
≠≠K L
)
≠≠L M
;
≠≠M N
else
ÆÆ 
if
ÆÆ 
(
ÆÆ 
keyParam
ÆÆ 
is
ÆÆ  
DesParameters
ÆÆ! .
)
ÆÆ. /
enc
ØØ 
=
ØØ 
CipherUtilities
ØØ %
.
ØØ% &
	GetCipher
ØØ& /
(
ØØ/ 0
$"
ØØ0 2
DES/
ØØ2 6
{
ØØ6 7
_mode
ØØ7 <
}
ØØ< =
/
ØØ= >
{
ØØ> ?
_padding
ØØ? G
}
ØØG H
"
ØØH I
)
ØØI J
;
ØØJ K
else
∞∞ 
enc
±± 
=
±± 
CipherUtilities
±± %
.
±±% &
	GetCipher
±±& /
(
±±/ 0
$"
±±0 2
AES/
±±2 6
{
±±6 7
_mode
±±7 <
}
±±< =
/
±±= >
{
±±> ?
_padding
±±? G
}
±±G H
"
±±H I
)
±±I J
;
±±J K
enc
≥≥ 
.
≥≥ 
Init
≥≥ 
(
≥≥ 
true
≥≥ 
,
≥≥  
symmetricAlgorithm
≥≥ -
)
≥≥- .
;
≥≥. /
byte
¥¥ 
[
¥¥ 
]
¥¥ 
cipher
¥¥ 
=
¥¥ 
enc
¥¥ 
.
¥¥  
DoFinal
¥¥  '
(
¥¥' (
	plaintext
¥¥( 1
)
¥¥1 2
;
¥¥2 3
byte
∂∂ 
[
∂∂ 
]
∂∂ 
output
∂∂ 
=
∂∂ 
null
∂∂  
;
∂∂  !
if
∑∑ 
(
∑∑ 
_mode
∑∑ 
.
∑∑ 
Equals
∑∑ 
(
∑∑ 
$str
∑∑ "
,
∑∑" #
StringComparison
∑∑$ 4
.
∑∑4 5
OrdinalIgnoreCase
∑∑5 F
)
∑∑F G
)
∑∑G H
{
∏∏ 
output
ππ 
=
ππ 
cipher
ππ 
;
ππ  
}
∫∫ 
else
ªª 
{
ºº 
byte
ΩΩ 
[
ΩΩ 
]
ΩΩ 
IV
ΩΩ 
=
ΩΩ 
(
ΩΩ 
(
ΩΩ 
ParametersWithIV
ΩΩ .
)
ΩΩ. / 
symmetricAlgorithm
ΩΩ/ A
)
ΩΩA B
.
ΩΩB C
GetIV
ΩΩC H
(
ΩΩH I
)
ΩΩI J
;
ΩΩJ K
output
ææ 
=
ææ 
new
ææ 
byte
ææ !
[
ææ! "
cipher
ææ" (
.
ææ( )
Length
ææ) /
+
ææ0 1
IV
ææ2 4
.
ææ4 5
Length
ææ5 ;
]
ææ; <
;
ææ< =
Buffer
øø 
.
øø 
	BlockCopy
øø  
(
øø  !
IV
øø! #
,
øø# $
$num
øø% &
,
øø& '
output
øø( .
,
øø. /
$num
øø0 1
,
øø1 2
IV
øø3 5
.
øø5 6
Length
øø6 <
)
øø< =
;
øø= >
Buffer
¿¿ 
.
¿¿ 
	BlockCopy
¿¿  
(
¿¿  !
cipher
¿¿! '
,
¿¿' (
$num
¿¿) *
,
¿¿* +
output
¿¿, 2
,
¿¿2 3
IV
¿¿4 6
.
¿¿6 7
Length
¿¿7 =
,
¿¿= >
cipher
¿¿? E
.
¿¿E F
Length
¿¿F L
)
¿¿L M
;
¿¿M N
}
¡¡ 
return
¬¬ 
output
¬¬ 
;
¬¬ 
}
√√ 	
public
∆∆ 
byte
∆∆ 
[
∆∆ 
]
∆∆ 
EncryptData
∆∆ !
(
∆∆! "

XmlElement
∆∆" ,
inputElement
∆∆- 9
,
∆∆9 :
ICipherParameters
∆∆; L 
symmetricAlgorithm
∆∆M _
,
∆∆_ `
bool
∆∆a e
content
∆∆f m
)
∆∆m n
{
«« 	
if
»» 
(
»» 
inputElement
»» 
==
»» 
null
»»  $
)
»»$ %
throw
…… 
new
…… #
ArgumentNullException
…… /
(
……/ 0
nameof
……0 6
(
……6 7
inputElement
……7 C
)
……C D
)
……D E
;
……E F
if
   
(
    
symmetricAlgorithm
   "
==
  # %
null
  & *
)
  * +
throw
ÀÀ 
new
ÀÀ #
ArgumentNullException
ÀÀ /
(
ÀÀ/ 0
nameof
ÀÀ0 6
(
ÀÀ6 7 
symmetricAlgorithm
ÀÀ7 I
)
ÀÀI J
)
ÀÀJ K
;
ÀÀK L
byte
ÕÕ 
[
ÕÕ 
]
ÕÕ 
	plainText
ÕÕ 
=
ÕÕ 
(
ÕÕ  
content
ÕÕ  '
?
ÕÕ( )
	_encoding
ÕÕ* 3
.
ÕÕ3 4
GetBytes
ÕÕ4 <
(
ÕÕ< =
inputElement
ÕÕ= I
.
ÕÕI J
InnerXml
ÕÕJ R
)
ÕÕR S
:
ÕÕT U
	_encoding
ÕÕV _
.
ÕÕ_ `
GetBytes
ÕÕ` h
(
ÕÕh i
inputElement
ÕÕi u
.
ÕÕu v
OuterXml
ÕÕv ~
)
ÕÕ~ 
)ÕÕ Ä
;ÕÕÄ Å
return
ŒŒ 
EncryptData
ŒŒ 
(
ŒŒ 
	plainText
ŒŒ (
,
ŒŒ( ) 
symmetricAlgorithm
ŒŒ* <
)
ŒŒ< =
;
ŒŒ= >
}
œœ 	
public
““ 
byte
““ 
[
““ 
]
““ 
DecryptData
““ !
(
““! "
EncryptedData
““" /
encryptedData
““0 =
,
““= >
ICipherParameters
““? P 
symmetricAlgorithm
““Q c
)
““c d
{
”” 	
if
‘‘ 
(
‘‘ 
encryptedData
‘‘ 
==
‘‘  
null
‘‘! %
)
‘‘% &
throw
’’ 
new
’’ #
ArgumentNullException
’’ /
(
’’/ 0
nameof
’’0 6
(
’’6 7
encryptedData
’’7 D
)
’’D E
)
’’E F
;
’’F G
if
÷÷ 
(
÷÷  
symmetricAlgorithm
÷÷ "
==
÷÷# %
null
÷÷& *
)
÷÷* +
throw
◊◊ 
new
◊◊ #
ArgumentNullException
◊◊ /
(
◊◊/ 0
nameof
◊◊0 6
(
◊◊6 7 
symmetricAlgorithm
◊◊7 I
)
◊◊I J
)
◊◊J K
;
◊◊K L
var
ŸŸ 
ivParam
ŸŸ 
=
ŸŸ  
symmetricAlgorithm
ŸŸ ,
as
ŸŸ- /
ParametersWithIV
ŸŸ0 @
;
ŸŸ@ A
var
⁄⁄ 
keyParam
⁄⁄ 
=
⁄⁄ 
ivParam
⁄⁄ "
==
⁄⁄# %
null
⁄⁄& *
?
⁄⁄+ , 
symmetricAlgorithm
⁄⁄- ?
as
⁄⁄@ B
KeyParameter
⁄⁄C O
:
⁄⁄P Q
ivParam
⁄⁄R Y
.
⁄⁄Y Z

Parameters
⁄⁄Z d
as
⁄⁄e g
KeyParameter
⁄⁄h t
;
⁄⁄t u
byte
›› 
[
›› 
]
›› 
cipherValue
›› 
=
››  
GetCipherValue
››! /
(
››/ 0
encryptedData
››0 =
.
››= >

CipherData
››> H
)
››H I
;
››I J
byte
‡‡ 
[
‡‡ 
]
‡‡ 
decryptionIV
‡‡ 
=
‡‡  !
null
‡‡" &
;
‡‡& '
if
·· 
(
·· 
!
·· 
_mode
·· 
.
·· 
Equals
·· 
(
·· 
$str
·· #
,
··# $
StringComparison
··% 5
.
··5 6
OrdinalIgnoreCase
··6 G
)
··G H
)
··H I
decryptionIV
‚‚ 
=
‚‚ 
GetDecryptionIV
‚‚ .
(
‚‚. /
encryptedData
‚‚/ <
,
‚‚< =
null
‚‚> B
)
‚‚B C
;
‚‚C D
byte
‰‰ 
[
‰‰ 
]
‰‰ 
output
‰‰ 
=
‰‰ 
null
‰‰  
;
‰‰  !
int
ÂÂ 
lengthIV
ÂÂ 
=
ÂÂ 
$num
ÂÂ 
;
ÂÂ 
if
ÊÊ 
(
ÊÊ 
decryptionIV
ÊÊ 
!=
ÊÊ 
null
ÊÊ  $
)
ÊÊ$ %
{
ÁÁ  
symmetricAlgorithm
ËË "
=
ËË# $
new
ËË% (
ParametersWithIV
ËË) 9
(
ËË9 :
keyParam
ËË: B
,
ËËB C
decryptionIV
ËËD P
)
ËËP Q
;
ËËQ R
lengthIV
ÈÈ 
=
ÈÈ 
decryptionIV
ÈÈ '
.
ÈÈ' (
Length
ÈÈ( .
;
ÈÈ. /
}
ÍÍ 
IBufferedCipher
ÏÏ 
dec
ÏÏ 
;
ÏÏ  
if
ÌÌ 
(
ÌÌ 
keyParam
ÌÌ 
is
ÌÌ 
DesEdeParameters
ÌÌ ,
)
ÌÌ, -
dec
ÓÓ 
=
ÓÓ 
CipherUtilities
ÓÓ %
.
ÓÓ% &
	GetCipher
ÓÓ& /
(
ÓÓ/ 0
$"
ÓÓ0 2
DESede/
ÓÓ2 9
{
ÓÓ9 :
_mode
ÓÓ: ?
}
ÓÓ? @
/
ÓÓ@ A
{
ÓÓA B
_padding
ÓÓB J
}
ÓÓJ K
"
ÓÓK L
)
ÓÓL M
;
ÓÓM N
else
ÔÔ 
if
ÔÔ 
(
ÔÔ 
keyParam
ÔÔ 
is
ÔÔ  
DesParameters
ÔÔ! .
)
ÔÔ. /
dec
 
=
 
CipherUtilities
 %
.
% &
	GetCipher
& /
(
/ 0
$"
0 2
DES/
2 6
{
6 7
_mode
7 <
}
< =
/
= >
{
> ?
_padding
? G
}
G H
"
H I
)
I J
;
J K
else
ÒÒ 
dec
ÚÚ 
=
ÚÚ 
CipherUtilities
ÚÚ %
.
ÚÚ% &
	GetCipher
ÚÚ& /
(
ÚÚ/ 0
$"
ÚÚ0 2
AES/
ÚÚ2 6
{
ÚÚ6 7
_mode
ÚÚ7 <
}
ÚÚ< =
/
ÚÚ= >
{
ÚÚ> ?
_padding
ÚÚ? G
}
ÚÚG H
"
ÚÚH I
)
ÚÚI J
;
ÚÚJ K
dec
ÙÙ 
.
ÙÙ 
Init
ÙÙ 
(
ÙÙ 
false
ÙÙ 
,
ÙÙ  
symmetricAlgorithm
ÙÙ .
)
ÙÙ. /
;
ÙÙ/ 0
output
ıı 
=
ıı 
dec
ıı 
.
ıı 
DoFinal
ıı  
(
ıı  !
cipherValue
ıı! ,
,
ıı, -
lengthIV
ıı. 6
,
ıı6 7
cipherValue
ıı8 C
.
ııC D
Length
ııD J
-
ııK L
lengthIV
ııM U
)
ııU V
;
ııV W
return
˜˜ 
output
˜˜ 
;
˜˜ 
}
¯¯ 	
public
˚˚ 
void
˚˚ 
ReplaceData
˚˚ 
(
˚˚  

XmlElement
˚˚  *
inputElement
˚˚+ 7
,
˚˚7 8
byte
˚˚9 =
[
˚˚= >
]
˚˚> ?
decryptedData
˚˚@ M
)
˚˚M N
{
¸¸ 	
if
˝˝ 
(
˝˝ 
inputElement
˝˝ 
==
˝˝ 
null
˝˝  $
)
˝˝$ %
throw
˛˛ 
new
˛˛ #
ArgumentNullException
˛˛ /
(
˛˛/ 0
nameof
˛˛0 6
(
˛˛6 7
inputElement
˛˛7 C
)
˛˛C D
)
˛˛D E
;
˛˛E F
if
ˇˇ 
(
ˇˇ 
decryptedData
ˇˇ 
==
ˇˇ  
null
ˇˇ! %
)
ˇˇ% &
throw
ÄÄ 
new
ÄÄ #
ArgumentNullException
ÄÄ /
(
ÄÄ/ 0
nameof
ÄÄ0 6
(
ÄÄ6 7
decryptedData
ÄÄ7 D
)
ÄÄD E
)
ÄÄE F
;
ÄÄF G
XmlNode
ÇÇ 
parent
ÇÇ 
=
ÇÇ 
inputElement
ÇÇ )
.
ÇÇ) *

ParentNode
ÇÇ* 4
;
ÇÇ4 5
if
ÉÉ 
(
ÉÉ 
parent
ÉÉ 
.
ÉÉ 
NodeType
ÉÉ 
==
ÉÉ  "
XmlNodeType
ÉÉ# .
.
ÉÉ. /
Document
ÉÉ/ 7
)
ÉÉ7 8
{
ÑÑ 
XmlDocument
ââ 
importDocument
ââ *
=
ââ+ ,
new
ââ- 0
XmlDocument
ââ1 <
(
ââ< =
)
ââ= >
;
ââ> ?
importDocument
ää 
.
ää  
PreserveWhitespace
ää 1
=
ää2 3
true
ää4 8
;
ää8 9
string
ãã 
decryptedString
ãã &
=
ãã' (
	_encoding
ãã) 2
.
ãã2 3
	GetString
ãã3 <
(
ãã< =
decryptedData
ãã= J
)
ããJ K
;
ããK L
using
åå 
(
åå 
StringReader
åå #
sr
åå$ &
=
åå' (
new
åå) ,
StringReader
åå- 9
(
åå9 :
decryptedString
åå: I
)
ååI J
)
ååJ K
{
çç 
using
éé 
(
éé 
	XmlReader
éé $
xr
éé% '
=
éé( )
	XmlReader
éé* 3
.
éé3 4
Create
éé4 :
(
éé: ;
sr
éé; =
,
éé= >
Utils
éé? D
.
ééD E(
GetSecureXmlReaderSettings
ééE _
(
éé_ `
_xmlResolver
éé` l
)
éél m
)
éém n
)
één o
{
èè 
importDocument
êê &
.
êê& '
Load
êê' +
(
êê+ ,
xr
êê, .
)
êê. /
;
êê/ 0
}
ëë 
}
íí 
XmlNode
îî 
importedNode
îî $
=
îî% &
inputElement
îî' 3
.
îî3 4
OwnerDocument
îî4 A
.
îîA B

ImportNode
îîB L
(
îîL M
importDocument
îîM [
.
îî[ \
DocumentElement
îî\ k
,
îîk l
true
îîm q
)
îîq r
;
îîr s
parent
ññ 
.
ññ 
RemoveChild
ññ "
(
ññ" #
inputElement
ññ# /
)
ññ/ 0
;
ññ0 1
parent
óó 
.
óó 
AppendChild
óó "
(
óó" #
importedNode
óó# /
)
óó/ 0
;
óó0 1
}
òò 
else
ôô 
{
öö 
XmlNode
õõ 
dummy
õõ 
=
õõ 
parent
õõ  &
.
õõ& '
OwnerDocument
õõ' 4
.
õõ4 5
CreateElement
õõ5 B
(
õõB C
parent
õõC I
.
õõI J
Prefix
õõJ P
,
õõP Q
parent
õõR X
.
õõX Y
	LocalName
õõY b
,
õõb c
parent
õõd j
.
õõj k
NamespaceURI
õõk w
)
õõw x
;
õõx y
try
ùù 
{
ûû 
parent
üü 
.
üü 
AppendChild
üü &
(
üü& '
dummy
üü' ,
)
üü, -
;
üü- .
dummy
££ 
.
££ 
InnerXml
££ "
=
££# $
	_encoding
££% .
.
££. /
	GetString
££/ 8
(
££8 9
decryptedData
££9 F
)
££F G
;
££G H
XmlNode
¶¶ 
child
¶¶ !
=
¶¶" #
dummy
¶¶$ )
.
¶¶) *

FirstChild
¶¶* 4
;
¶¶4 5
XmlNode
ßß 
sibling
ßß #
=
ßß$ %
inputElement
ßß& 2
.
ßß2 3
NextSibling
ßß3 >
;
ßß> ?
XmlNode
©© 
	nextChild
©© %
=
©©& '
null
©©( ,
;
©©, -
while
™™ 
(
™™ 
child
™™  
!=
™™! #
null
™™$ (
)
™™( )
{
´´ 
	nextChild
¨¨ !
=
¨¨" #
child
¨¨$ )
.
¨¨) *
NextSibling
¨¨* 5
;
¨¨5 6
parent
≠≠ 
.
≠≠ 
InsertBefore
≠≠ +
(
≠≠+ ,
child
≠≠, 1
,
≠≠1 2
sibling
≠≠3 :
)
≠≠: ;
;
≠≠; <
child
ÆÆ 
=
ÆÆ 
	nextChild
ÆÆ  )
;
ÆÆ) *
}
ØØ 
}
∞∞ 
finally
±± 
{
≤≤ 
parent
¥¥ 
.
¥¥ 
RemoveChild
¥¥ &
(
¥¥& '
dummy
¥¥' ,
)
¥¥, -
;
¥¥- .
}
µµ 
parent
∏∏ 
.
∏∏ 
RemoveChild
∏∏ "
(
∏∏" #
inputElement
∏∏# /
)
∏∏/ 0
;
∏∏0 1
}
ππ 
}
∫∫ 	
public
¡¡ 
static
¡¡ 
void
¡¡ 
ReplaceElement
¡¡ )
(
¡¡) *

XmlElement
¡¡* 4
inputElement
¡¡5 A
,
¡¡A B
EncryptedData
¡¡C P
encryptedData
¡¡Q ^
,
¡¡^ _
bool
¡¡` d
content
¡¡e l
)
¡¡l m
{
¬¬ 	
if
√√ 
(
√√ 
inputElement
√√ 
==
√√ 
null
√√  $
)
√√$ %
throw
ƒƒ 
new
ƒƒ #
ArgumentNullException
ƒƒ /
(
ƒƒ/ 0
nameof
ƒƒ0 6
(
ƒƒ6 7
inputElement
ƒƒ7 C
)
ƒƒC D
)
ƒƒD E
;
ƒƒE F
if
≈≈ 
(
≈≈ 
encryptedData
≈≈ 
==
≈≈  
null
≈≈! %
)
≈≈% &
throw
∆∆ 
new
∆∆ #
ArgumentNullException
∆∆ /
(
∆∆/ 0
nameof
∆∆0 6
(
∆∆6 7
encryptedData
∆∆7 D
)
∆∆D E
)
∆∆E F
;
∆∆F G

XmlElement
…… 
elemED
…… 
=
…… 
encryptedData
……  -
.
……- .
GetXml
……. 4
(
……4 5
inputElement
……5 A
.
……A B
OwnerDocument
……B O
)
……O P
;
……P Q
switch
   
(
   
content
   
)
   
{
ÀÀ 
case
ÃÃ 
true
ÃÃ 
:
ÃÃ 
Utils
ŒŒ 
.
ŒŒ 
RemoveAllChildren
ŒŒ +
(
ŒŒ+ ,
inputElement
ŒŒ, 8
)
ŒŒ8 9
;
ŒŒ9 :
inputElement
––  
.
––  !
AppendChild
––! ,
(
––, -
elemED
––- 3
)
––3 4
;
––4 5
break
—— 
;
—— 
case
““ 
false
““ 
:
““ 
XmlNode
”” 

parentNode
”” &
=
””' (
inputElement
””) 5
.
””5 6

ParentNode
””6 @
;
””@ A

parentNode
’’ 
.
’’ 
ReplaceChild
’’ +
(
’’+ ,
elemED
’’, 2
,
’’2 3
inputElement
’’4 @
)
’’@ A
;
’’A B
break
÷÷ 
;
÷÷ 
}
◊◊ 
}
ÿÿ 	
public
€€ 
static
€€ 
byte
€€ 
[
€€ 
]
€€ 

EncryptKey
€€ '
(
€€' (
byte
€€( ,
[
€€, -
]
€€- .
keyData
€€/ 6
,
€€6 7
KeyParameter
€€8 D 
symmetricAlgorithm
€€E W
)
€€W X
{
‹‹ 	
if
›› 
(
›› 
keyData
›› 
==
›› 
null
›› 
)
››  
throw
ﬁﬁ 
new
ﬁﬁ #
ArgumentNullException
ﬁﬁ /
(
ﬁﬁ/ 0
nameof
ﬁﬁ0 6
(
ﬁﬁ6 7
keyData
ﬁﬁ7 >
)
ﬁﬁ> ?
)
ﬁﬁ? @
;
ﬁﬁ@ A
if
ﬂﬂ 
(
ﬂﬂ  
symmetricAlgorithm
ﬂﬂ "
==
ﬂﬂ# %
null
ﬂﬂ& *
)
ﬂﬂ* +
throw
‡‡ 
new
‡‡ #
ArgumentNullException
‡‡ /
(
‡‡/ 0
nameof
‡‡0 6
(
‡‡6 7 
symmetricAlgorithm
‡‡7 I
)
‡‡I J
)
‡‡J K
;
‡‡K L
if
‚‚ 
(
‚‚  
symmetricAlgorithm
‚‚ "
is
‚‚# %
DesParameters
‚‚& 3
)
‚‚3 4
{
„„ 
return
ÂÂ 
SymmetricKeyWrap
ÂÂ '
.
ÂÂ' (%
TripleDESKeyWrapEncrypt
ÂÂ( ?
(
ÂÂ? @ 
symmetricAlgorithm
ÂÂ@ R
.
ÂÂR S
GetKey
ÂÂS Y
(
ÂÂY Z
)
ÂÂZ [
,
ÂÂ[ \
keyData
ÂÂ] d
)
ÂÂd e
;
ÂÂe f
}
ÊÊ 
else
ÁÁ 
{
ËË 
return
ÍÍ 
SymmetricKeyWrap
ÍÍ '
.
ÍÍ' (
AESKeyWrapEncrypt
ÍÍ( 9
(
ÍÍ9 : 
symmetricAlgorithm
ÍÍ: L
.
ÍÍL M
GetKey
ÍÍM S
(
ÍÍS T
)
ÍÍT U
,
ÍÍU V
keyData
ÍÍW ^
)
ÍÍ^ _
;
ÍÍ_ `
}
ÎÎ 
}
ÏÏ 	
public
ÒÒ 
static
ÒÒ 
byte
ÒÒ 
[
ÒÒ 
]
ÒÒ 

EncryptKey
ÒÒ '
(
ÒÒ' (
byte
ÒÒ( ,
[
ÒÒ, -
]
ÒÒ- .
keyData
ÒÒ/ 6
,
ÒÒ6 7
RsaKeyParameters
ÒÒ8 H
rsa
ÒÒI L
,
ÒÒL M
bool
ÒÒN R
useOAEP
ÒÒS Z
)
ÒÒZ [
{
ÚÚ 	
if
ÛÛ 
(
ÛÛ 
keyData
ÛÛ 
==
ÛÛ 
null
ÛÛ 
)
ÛÛ  
throw
ÙÙ 
new
ÙÙ #
ArgumentNullException
ÙÙ /
(
ÙÙ/ 0
nameof
ÙÙ0 6
(
ÙÙ6 7
keyData
ÙÙ7 >
)
ÙÙ> ?
)
ÙÙ? @
;
ÙÙ@ A
if
ıı 
(
ıı 
rsa
ıı 
==
ıı 
null
ıı 
)
ıı 
throw
ˆˆ 
new
ˆˆ #
ArgumentNullException
ˆˆ /
(
ˆˆ/ 0
nameof
ˆˆ0 6
(
ˆˆ6 7
rsa
ˆˆ7 :
)
ˆˆ: ;
)
ˆˆ; <
;
ˆˆ< =
if
¯¯ 
(
¯¯ 
useOAEP
¯¯ 
)
¯¯ 
{
˘˘ )
RSAOAEPKeyExchangeFormatter
˙˙ +
rsaFormatter
˙˙, 8
=
˙˙9 :
new
˙˙; >)
RSAOAEPKeyExchangeFormatter
˙˙? Z
(
˙˙Z [
rsa
˙˙[ ^
)
˙˙^ _
;
˙˙_ `
return
˚˚ 
rsaFormatter
˚˚ #
.
˚˚# $
CreateKeyExchange
˚˚$ 5
(
˚˚5 6
keyData
˚˚6 =
)
˚˚= >
;
˚˚> ?
}
¸¸ 
else
˝˝ 
{
˛˛ *
RSAPKCS1KeyExchangeFormatter
ˇˇ ,
rsaFormatter
ˇˇ- 9
=
ˇˇ: ;
new
ˇˇ< ?*
RSAPKCS1KeyExchangeFormatter
ˇˇ@ \
(
ˇˇ\ ]
rsa
ˇˇ] `
)
ˇˇ` a
;
ˇˇa b
return
ÄÄ 
rsaFormatter
ÄÄ #
.
ÄÄ# $
CreateKeyExchange
ÄÄ$ 5
(
ÄÄ5 6
keyData
ÄÄ6 =
)
ÄÄ= >
;
ÄÄ> ?
}
ÅÅ 
}
ÇÇ 	
public
ÖÖ 
static
ÖÖ 
byte
ÖÖ 
[
ÖÖ 
]
ÖÖ 

DecryptKey
ÖÖ '
(
ÖÖ' (
byte
ÖÖ( ,
[
ÖÖ, -
]
ÖÖ- .
keyData
ÖÖ/ 6
,
ÖÖ6 7
KeyParameter
ÖÖ8 D 
symmetricAlgorithm
ÖÖE W
)
ÖÖW X
{
ÜÜ 	
if
áá 
(
áá 
keyData
áá 
==
áá 
null
áá 
)
áá  
throw
àà 
new
àà #
ArgumentNullException
àà /
(
àà/ 0
nameof
àà0 6
(
àà6 7
keyData
àà7 >
)
àà> ?
)
àà? @
;
àà@ A
if
ââ 
(
ââ  
symmetricAlgorithm
ââ "
==
ââ# %
null
ââ& *
)
ââ* +
throw
ää 
new
ää #
ArgumentNullException
ää /
(
ää/ 0
nameof
ää0 6
(
ää6 7 
symmetricAlgorithm
ää7 I
)
ääI J
)
ääJ K
;
ääK L
if
åå 
(
åå  
symmetricAlgorithm
åå "
is
åå# %
DesParameters
åå& 3
)
åå3 4
{
çç 
return
èè 
SymmetricKeyWrap
èè '
.
èè' (%
TripleDESKeyWrapDecrypt
èè( ?
(
èè? @ 
symmetricAlgorithm
èè@ R
.
èèR S
GetKey
èèS Y
(
èèY Z
)
èèZ [
,
èè[ \
keyData
èè] d
)
èèd e
;
èèe f
}
êê 
else
ëë 
{
íí 
return
îî 
SymmetricKeyWrap
îî '
.
îî' (
AESKeyWrapDecrypt
îî( 9
(
îî9 : 
symmetricAlgorithm
îî: L
.
îîL M
GetKey
îîM S
(
îîS T
)
îîT U
,
îîU V
keyData
îîW ^
)
îî^ _
;
îî_ `
}
ïï 
}
ññ 	
public
öö 
static
öö 
byte
öö 
[
öö 
]
öö 

DecryptKey
öö '
(
öö' (
byte
öö( ,
[
öö, -
]
öö- .
keyData
öö/ 6
,
öö6 7
RsaKeyParameters
öö8 H
rsa
ööI L
,
ööL M
bool
ööN R
useOAEP
ööS Z
)
ööZ [
{
õõ 	
if
úú 
(
úú 
keyData
úú 
==
úú 
null
úú 
)
úú  
throw
ùù 
new
ùù #
ArgumentNullException
ùù /
(
ùù/ 0
nameof
ùù0 6
(
ùù6 7
keyData
ùù7 >
)
ùù> ?
)
ùù? @
;
ùù@ A
if
ûû 
(
ûû 
rsa
ûû 
==
ûû 
null
ûû 
)
ûû 
throw
üü 
new
üü #
ArgumentNullException
üü /
(
üü/ 0
nameof
üü0 6
(
üü6 7
rsa
üü7 :
)
üü: ;
)
üü; <
;
üü< =
if
°° 
(
°° 
useOAEP
°° 
)
°° 
{
¢¢ +
RSAOAEPKeyExchangeDeformatter
££ -
rsaDeformatter
££. <
=
££= >
new
££? B+
RSAOAEPKeyExchangeDeformatter
££C `
(
££` a
rsa
££a d
)
££d e
;
££e f
return
§§ 
rsaDeformatter
§§ %
.
§§% & 
DecryptKeyExchange
§§& 8
(
§§8 9
keyData
§§9 @
)
§§@ A
;
§§A B
}
•• 
else
¶¶ 
{
ßß ,
RSAPKCS1KeyExchangeDeformatter
®® .
rsaDeformatter
®®/ =
=
®®> ?
new
®®@ C,
RSAPKCS1KeyExchangeDeformatter
®®D b
(
®®b c
rsa
®®c f
)
®®f g
;
®®g h
return
©© 
rsaDeformatter
©© %
.
©©% & 
DecryptKeyExchange
©©& 8
(
©©8 9
keyData
©©9 @
)
©©@ A
;
©©A B
}
™™ 
}
´´ 	
}
¨¨ 
}≠≠ Ë7
;C:\code\bc-xml-security\refactoring\src\EncryptionMethod.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class 
EncryptionMethod !
{ 
private 

XmlElement 

_cachedXml %
=& '
null( ,
;, -
private 
int 
_keySize 
= 
$num  
;  !
private 
string 

_algorithm !
;! "
public 
EncryptionMethod 
(  
)  !
{ 	

_cachedXml 
= 
null 
; 
} 	
public 
EncryptionMethod 
(  
string  &
	algorithm' 0
)0 1
{ 	

_algorithm 
= 
	algorithm "
;" #

_cachedXml 
= 
null 
; 
} 	
private 
bool 

CacheValid 
{ 	
get 
{ 
return   
(   

_cachedXml   "
!=  # %
null  & *
)  * +
;  + ,
}!! 
}"" 	
public$$ 
int$$ 
KeySize$$ 
{%% 	
get&& 
{&& 
return&& 
_keySize&& !
;&&! "
}&&# $
set'' 
{(( 
if)) 
()) 
value)) 
<=)) 
$num)) 
))) 
throw** 
new** '
ArgumentOutOfRangeException** 9
(**9 :
nameof**: @
(**@ A
value**A F
)**F G
,**G H
SR**I K
.**K L+
Cryptography_Xml_InvalidKeySize**L k
)**k l
;**l m
_keySize++ 
=++ 
value++  
;++  !

_cachedXml,, 
=,, 
null,, !
;,,! "
}-- 
}.. 	
public00 
string00 
KeyAlgorithm00 "
{11 	
get22 
{22 
return22 

_algorithm22 #
;22# $
}22% &
set33 
{44 

_algorithm55 
=55 
value55 "
;55" #

_cachedXml66 
=66 
null66 !
;66! "
}77 
}88 	
public:: 

XmlElement:: 
GetXml::  
(::  !
)::! "
{;; 	
if<< 
(<< 

CacheValid<< 
)<< 
return<< "
(<<# $

_cachedXml<<$ .
)<<. /
;<</ 0
XmlDocument>> 
document>>  
=>>! "
new>># &
XmlDocument>>' 2
(>>2 3
)>>3 4
;>>4 5
document?? 
.?? 
PreserveWhitespace?? '
=??( )
true??* .
;??. /
return@@ 
GetXml@@ 
(@@ 
document@@ "
)@@" #
;@@# $
}AA 	
internalCC 

XmlElementCC 
GetXmlCC "
(CC" #
XmlDocumentCC# .
documentCC/ 7
)CC7 8
{DD 	

XmlElementFF #
encryptionMethodElementFF .
=FF/ 0
(FF1 2

XmlElementFF2 <
)FF< =
documentFF= E
.FFE F
CreateElementFFF S
(FFS T
$strFFT f
,FFf g
EncryptedXmlFFh t
.FFt u
XmlEncNamespaceUrl	FFu á
)
FFá à
;
FFà â
ifGG 
(GG 
!GG 
stringGG 
.GG 
IsNullOrEmptyGG %
(GG% &

_algorithmGG& 0
)GG0 1
)GG1 2#
encryptionMethodElementHH '
.HH' (
SetAttributeHH( 4
(HH4 5
$strHH5 @
,HH@ A

_algorithmHHB L
)HHL M
;HHM N
ifII 
(II 
_keySizeII 
>II 
$numII 
)II 
{JJ 

XmlElementLL 
keySizeElementLL )
=LL* +
documentLL, 4
.LL4 5
CreateElementLL5 B
(LLB C
$strLLC L
,LLL M
EncryptedXmlLLN Z
.LLZ [
XmlEncNamespaceUrlLL[ m
)LLm n
;LLn o
keySizeElementMM 
.MM 
AppendChildMM *
(MM* +
documentMM+ 3
.MM3 4
CreateTextNodeMM4 B
(MMB C
_keySizeMMC K
.MMK L
ToStringMML T
(MMT U
nullMMU Y
,MMY Z
nullMM[ _
)MM_ `
)MM` a
)MMa b
;MMb c#
encryptionMethodElementNN '
.NN' (
AppendChildNN( 3
(NN3 4
keySizeElementNN4 B
)NNB C
;NNC D
}OO 
returnPP #
encryptionMethodElementPP *
;PP* +
}QQ 	
publicSS 
voidSS 
LoadXmlSS 
(SS 

XmlElementSS &
valueSS' ,
)SS, -
{TT 	
ifUU 
(UU 
valueUU 
==UU 
nullUU 
)UU 
throwVV 
newVV !
ArgumentNullExceptionVV /
(VV/ 0
nameofVV0 6
(VV6 7
valueVV7 <
)VV< =
)VV= >
;VV> ?
XmlNamespaceManagerXX 
nsmXX  #
=XX$ %
newXX& )
XmlNamespaceManagerXX* =
(XX= >
valueXX> C
.XXC D
OwnerDocumentXXD Q
.XXQ R
	NameTableXXR [
)XX[ \
;XX\ ]
nsmYY 
.YY 
AddNamespaceYY 
(YY 
$strYY "
,YY" #
EncryptedXmlYY$ 0
.YY0 1
XmlEncNamespaceUrlYY1 C
)YYC D
;YYD E

XmlElement[[ #
encryptionMethodElement[[ .
=[[/ 0
value[[1 6
;[[6 7

_algorithm\\ 
=\\ 
Utils\\ 
.\\ 
GetAttribute\\ +
(\\+ ,#
encryptionMethodElement\\, C
,\\C D
$str\\E P
,\\P Q
EncryptedXml\\R ^
.\\^ _
XmlEncNamespaceUrl\\_ q
)\\q r
;\\r s
XmlNode^^ 
keySizeNode^^ 
=^^  !
value^^" '
.^^' (
SelectSingleNode^^( 8
(^^8 9
$str^^9 F
,^^F G
nsm^^H K
)^^K L
;^^L M
if__ 
(__ 
keySizeNode__ 
!=__ 
null__ #
)__# $
{`` 
KeySizeaa 
=aa 
Convertaa !
.aa! "
ToInt32aa" )
(aa) *
Utilsaa* /
.aa/ 0
DiscardWhiteSpacesaa0 B
(aaB C
keySizeNodeaaC N
.aaN O
	InnerTextaaO X
)aaX Y
,aaY Z
nullaa[ _
)aa_ `
;aa` a
}bb 

_cachedXmlee 
=ee 
valueee 
;ee 
}ff 	
}gg 
}hh ¢5
=C:\code\bc-xml-security\refactoring\src\EncryptionProperty.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
EncryptionProperty *
{ 
private 
string 
_target 
; 
private 
string 
_id 
; 
private 

XmlElement 
	_elemProp $
;$ %
private 

XmlElement 

_cachedXml %
=& '
null( ,
;, -
public 
EncryptionProperty !
(! "
)" #
{$ %
}& '
public 
EncryptionProperty !
(! "

XmlElement" ,
elementProperty- <
)< =
{ 	
if 
( 
elementProperty 
==  "
null# '
)' (
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
elementProperty7 F
)F G
)G H
;H I
if 
( 
elementProperty 
.  
	LocalName  )
!=* ,
$str- A
||B D
elementPropertyE T
.T U
NamespaceURIU a
!=b d
EncryptedXmle q
.q r
XmlEncNamespaceUrl	r Ñ
)
Ñ Ö
throw 
new 
System  
.  !
Security! )
.) *
Cryptography* 6
.6 7"
CryptographicException7 M
(M N
SRN P
.P Q6
*Cryptography_Xml_InvalidEncryptionPropertyQ {
){ |
;| }
	_elemProp 
= 
elementProperty '
;' (

_cachedXml 
= 
null 
; 
} 	
public   
string   
Id   
{!! 	
get"" 
{"" 
return"" 
_id"" 
;"" 
}"" 
}## 	
public%% 
string%% 
Target%% 
{&& 	
get'' 
{'' 
return'' 
_target''  
;''  !
}''" #
}(( 	
public** 

XmlElement** 
PropertyElement** )
{++ 	
get,, 
{,, 
return,, 
	_elemProp,, "
;,," #
},,$ %
set-- 
{.. 
if// 
(// 
value// 
==// 
null// !
)//! "
throw00 
new00 !
ArgumentNullException00 3
(003 4
nameof004 :
(00: ;
value00; @
)00@ A
)00A B
;00B C
if11 
(11 
value11 
.11 
	LocalName11 #
!=11$ &
$str11' ;
||11< >
value11? D
.11D E
NamespaceURI11E Q
!=11R T
EncryptedXml11U a
.11a b
XmlEncNamespaceUrl11b t
)11t u
throw22 
new22 
System22 $
.22$ %
Security22% -
.22- .
Cryptography22. :
.22: ;"
CryptographicException22; Q
(22Q R
SR22R T
.22T U6
*Cryptography_Xml_InvalidEncryptionProperty22U 
)	22 Ä
;
22Ä Å
	_elemProp44 
=44 
value44 !
;44! "

_cachedXml55 
=55 
null55 !
;55! "
}66 
}77 	
private99 
bool99 

CacheValid99 
{:: 	
get;; 
{<< 
return== 
(== 

_cachedXml== "
!===# %
null==& *
)==* +
;==+ ,
}>> 
}?? 	
publicAA 

XmlElementAA 
GetXmlAA  
(AA  !
)AA! "
{BB 	
ifCC 
(CC 

CacheValidCC 
)CC 
returnCC "

_cachedXmlCC# -
;CC- .
XmlDocumentEE 
documentEE  
=EE! "
newEE# &
XmlDocumentEE' 2
(EE2 3
)EE3 4
;EE4 5
documentFF 
.FF 
PreserveWhitespaceFF '
=FF( )
trueFF* .
;FF. /
returnGG 
GetXmlGG 
(GG 
documentGG "
)GG" #
;GG# $
}HH 	
internalJJ 

XmlElementJJ 
GetXmlJJ "
(JJ" #
XmlDocumentJJ# .
documentJJ/ 7
)JJ7 8
{KK 	
returnLL 
documentLL 
.LL 

ImportNodeLL &
(LL& '
	_elemPropLL' 0
,LL0 1
trueLL2 6
)LL6 7
asLL8 :

XmlElementLL; E
;LLE F
}MM 	
publicOO 
voidOO 
LoadXmlOO 
(OO 

XmlElementOO &
valueOO' ,
)OO, -
{PP 	
ifQQ 
(QQ 
valueQQ 
==QQ 
nullQQ 
)QQ 
throwRR 
newRR !
ArgumentNullExceptionRR /
(RR/ 0
nameofRR0 6
(RR6 7
valueRR7 <
)RR< =
)RR= >
;RR> ?
ifSS 
(SS 
valueSS 
.SS 
	LocalNameSS 
!=SS  "
$strSS# 7
||SS8 :
valueSS; @
.SS@ A
NamespaceURISSA M
!=SSN P
EncryptedXmlSSQ ]
.SS] ^
XmlEncNamespaceUrlSS^ p
)SSp q
throwTT 
newTT 
SystemTT  
.TT  !
SecurityTT! )
.TT) *
CryptographyTT* 6
.TT6 7"
CryptographicExceptionTT7 M
(TTM N
SRTTN P
.TTP Q6
*Cryptography_Xml_InvalidEncryptionPropertyTTQ {
)TT{ |
;TT| }

_cachedXmlWW 
=WW 
valueWW 
;WW 
_idXX 
=XX 
UtilsXX 
.XX 
GetAttributeXX $
(XX$ %
valueXX% *
,XX* +
$strXX, 0
,XX0 1
EncryptedXmlXX2 >
.XX> ?
XmlEncNamespaceUrlXX? Q
)XXQ R
;XXR S
_targetYY 
=YY 
UtilsYY 
.YY 
GetAttributeYY (
(YY( )
valueYY) .
,YY. /
$strYY0 8
,YY8 9
EncryptedXmlYY: F
.YYF G
XmlEncNamespaceUrlYYG Y
)YYY Z
;YYZ [
	_elemPropZZ 
=ZZ 
valueZZ 
;ZZ 
}[[ 	
}\\ 
}]] ÈW
GC:\code\bc-xml-security\refactoring\src\EncryptionPropertyCollection.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class (
EncryptionPropertyCollection 4
:5 6
IList7 <
{ 
private 
	ArrayList 
_props  
;  !
public (
EncryptionPropertyCollection +
(+ ,
), -
{ 	
_props 
= 
new 
	ArrayList "
(" #
)# $
;$ %
} 	
public 
IEnumerator 
GetEnumerator (
(( )
)) *
{ 	
return 
_props 
. 
GetEnumerator '
(' (
)( )
;) *
} 	
public 
int 
Count 
{ 	
get 
{ 
return 
_props 
.  
Count  %
;% &
}' (
} 	
int 
IList 
. 
Add 
( 
object 
value "
)" #
{   	
if!! 
(!! 
!!! 
(!! 
value!! 
is!! 
EncryptionProperty!! -
)!!- .
)!!. /
throw"" 
new"" 
ArgumentException"" +
(""+ ,
SR"", .
."". /0
$Cryptography_Xml_IncorrectObjectType""/ S
,""S T
nameof""U [
(""[ \
value""\ a
)""a b
)""b c
;""c d
return$$ 
_props$$ 
.$$ 
Add$$ 
($$ 
value$$ #
)$$# $
;$$$ %
}%% 	
public'' 
int'' 
Add'' 
('' 
EncryptionProperty'' )
value''* /
)''/ 0
{(( 	
return)) 
_props)) 
.)) 
Add)) 
()) 
value)) #
)))# $
;))$ %
}** 	
public,, 
void,, 
Clear,, 
(,, 
),, 
{-- 	
_props.. 
... 
Clear.. 
(.. 
).. 
;.. 
}// 	
bool22 
IList22 
.22 
Contains22 
(22 
object22 "
value22# (
)22( )
{33 	
if44 
(44 
!44 
(44 
value44 
is44 
EncryptionProperty44 -
)44- .
)44. /
throw55 
new55 
ArgumentException55 +
(55+ ,
SR55, .
.55. /0
$Cryptography_Xml_IncorrectObjectType55/ S
,55S T
nameof55U [
(55[ \
value55\ a
)55a b
)55b c
;55c d
return77 
_props77 
.77 
Contains77 "
(77" #
value77# (
)77( )
;77) *
}88 	
public:: 
bool:: 
Contains:: 
(:: 
EncryptionProperty:: /
value::0 5
)::5 6
{;; 	
return<< 
_props<< 
.<< 
Contains<< "
(<<" #
value<<# (
)<<( )
;<<) *
}== 	
int@@ 
IList@@ 
.@@ 
IndexOf@@ 
(@@ 
object@@  
value@@! &
)@@& '
{AA 	
ifBB 
(BB 
!BB 
(BB 
valueBB 
isBB 
EncryptionPropertyBB -
)BB- .
)BB. /
throwCC 
newCC 
ArgumentExceptionCC +
(CC+ ,
SRCC, .
.CC. /0
$Cryptography_Xml_IncorrectObjectTypeCC/ S
,CCS T
nameofCCU [
(CC[ \
valueCC\ a
)CCa b
)CCb c
;CCc d
returnEE 
_propsEE 
.EE 
IndexOfEE !
(EE! "
valueEE" '
)EE' (
;EE( )
}FF 	
publicHH 
intHH 
IndexOfHH 
(HH 
EncryptionPropertyHH -
valueHH. 3
)HH3 4
{II 	
returnJJ 
_propsJJ 
.JJ 
IndexOfJJ !
(JJ! "
valueJJ" '
)JJ' (
;JJ( )
}KK 	
voidNN 
IListNN 
.NN 
InsertNN 
(NN 
intNN 
indexNN #
,NN# $
objectNN% +
valueNN, 1
)NN1 2
{OO 	
ifPP 
(PP 
!PP 
(PP 
valuePP 
isPP 
EncryptionPropertyPP -
)PP- .
)PP. /
throwQQ 
newQQ 
ArgumentExceptionQQ +
(QQ+ ,
SRQQ, .
.QQ. /0
$Cryptography_Xml_IncorrectObjectTypeQQ/ S
,QQS T
nameofQQU [
(QQ[ \
valueQQ\ a
)QQa b
)QQb c
;QQc d
_propsSS 
.SS 
InsertSS 
(SS 
indexSS 
,SS  
valueSS! &
)SS& '
;SS' (
}TT 	
publicVV 
voidVV 
InsertVV 
(VV 
intVV 
indexVV $
,VV$ %
EncryptionPropertyVV& 8
valueVV9 >
)VV> ?
{WW 	
_propsXX 
.XX 
InsertXX 
(XX 
indexXX 
,XX  
valueXX! &
)XX& '
;XX' (
}YY 	
void\\ 
IList\\ 
.\\ 
Remove\\ 
(\\ 
object\\  
value\\! &
)\\& '
{]] 	
if^^ 
(^^ 
!^^ 
(^^ 
value^^ 
is^^ 
EncryptionProperty^^ -
)^^- .
)^^. /
throw__ 
new__ 
ArgumentException__ +
(__+ ,
SR__, .
.__. /0
$Cryptography_Xml_IncorrectObjectType__/ S
,__S T
nameof__U [
(__[ \
value__\ a
)__a b
)__b c
;__c d
_propsaa 
.aa 
Removeaa 
(aa 
valueaa 
)aa  
;aa  !
}bb 	
publicdd 
voiddd 
Removedd 
(dd 
EncryptionPropertydd -
valuedd. 3
)dd3 4
{ee 	
_propsff 
.ff 
Removeff 
(ff 
valueff 
)ff  
;ff  !
}gg 	
publicii 
voidii 
RemoveAtii 
(ii 
intii  
indexii! &
)ii& '
{jj 	
_propskk 
.kk 
RemoveAtkk 
(kk 
indexkk !
)kk! "
;kk" #
}ll 	
publicnn 
boolnn 
IsFixedSizenn 
{oo 	
getpp 
{pp 
returnpp 
_propspp 
.pp  
IsFixedSizepp  +
;pp+ ,
}pp- .
}qq 	
publicss 
boolss 

IsReadOnlyss 
{tt 	
getuu 
{uu 
returnuu 
_propsuu 
.uu  

IsReadOnlyuu  *
;uu* +
}uu, -
}vv 	
publicxx 
EncryptionPropertyxx !
Itemxx" &
(xx& '
intxx' *
indexxx+ 0
)xx0 1
{yy 	
returnzz 
(zz 
EncryptionPropertyzz &
)zz& '
_propszz' -
[zz- .
indexzz. 3
]zz3 4
;zz4 5
}{{ 	
[}} 	
System}}	 
.}} 
Runtime}} 
.}} 
CompilerServices}} (
.}}( )
IndexerName}}) 4
(}}4 5
$str}}5 =
)}}= >
]}}> ?
public~~ 
EncryptionProperty~~ !
this~~" &
[~~& '
int~~' *
index~~+ 0
]~~0 1
{ 	
get
ÄÄ 
{
ÅÅ 
return
ÇÇ 
(
ÇÇ  
EncryptionProperty
ÇÇ *
)
ÇÇ* +
(
ÇÇ+ ,
(
ÇÇ, -
IList
ÇÇ- 2
)
ÇÇ2 3
this
ÇÇ3 7
)
ÇÇ7 8
[
ÇÇ8 9
index
ÇÇ9 >
]
ÇÇ> ?
;
ÇÇ? @
}
ÉÉ 
set
ÑÑ 
{
ÖÖ 
(
ÜÜ 
(
ÜÜ 
IList
ÜÜ 
)
ÜÜ 
this
ÜÜ 
)
ÜÜ 
[
ÜÜ 
index
ÜÜ #
]
ÜÜ# $
=
ÜÜ% &
value
ÜÜ' ,
;
ÜÜ, -
}
áá 
}
àà 	
object
ãã 
IList
ãã 
.
ãã 
this
ãã 
[
ãã 
int
ãã 
index
ãã #
]
ãã# $
{
åå 	
get
çç 
{
çç 
return
çç 
_props
çç 
[
çç  
index
çç  %
]
çç% &
;
çç& '
}
çç( )
set
éé 
{
èè 
if
êê 
(
êê 
!
êê 
(
êê 
value
êê 
is
êê  
EncryptionProperty
êê 1
)
êê1 2
)
êê2 3
throw
ëë 
new
ëë 
ArgumentException
ëë /
(
ëë/ 0
SR
ëë0 2
.
ëë2 32
$Cryptography_Xml_IncorrectObjectType
ëë3 W
,
ëëW X
nameof
ëëY _
(
ëë_ `
value
ëë` e
)
ëëe f
)
ëëf g
;
ëëg h
_props
ìì 
[
ìì 
index
ìì 
]
ìì 
=
ìì 
value
ìì  %
;
ìì% &
}
îî 
}
ïï 	
public
óó 
void
óó 
CopyTo
óó 
(
óó 
Array
óó  
array
óó! &
,
óó& '
int
óó( +
index
óó, 1
)
óó1 2
{
òò 	
_props
ôô 
.
ôô 
CopyTo
ôô 
(
ôô 
array
ôô 
,
ôô  
index
ôô! &
)
ôô& '
;
ôô' (
}
öö 	
public
úú 
void
úú 
CopyTo
úú 
(
úú  
EncryptionProperty
úú -
[
úú- .
]
úú. /
array
úú0 5
,
úú5 6
int
úú7 :
index
úú; @
)
úú@ A
{
ùù 	
_props
ûû 
.
ûû 
CopyTo
ûû 
(
ûû 
array
ûû 
,
ûû  
index
ûû! &
)
ûû& '
;
ûû' (
}
üü 	
public
°° 
object
°° 
SyncRoot
°° 
{
¢¢ 	
get
££ 
{
££ 
return
££ 
_props
££ 
.
££  
SyncRoot
££  (
;
££( )
}
££* +
}
§§ 	
public
¶¶ 
bool
¶¶ 
IsSynchronized
¶¶ "
{
ßß 	
get
®® 
{
®® 
return
®® 
_props
®® 
.
®®  
IsSynchronized
®®  .
;
®®. /
}
®®0 1
}
©© 	
}
™™ 
}´´ ü=
NC:\code\bc-xml-security\refactoring\src\ExcAncestralNamespaceContextManager.cs
	namespace

 	
Org


 
.

 
BouncyCastle

 
.

 
Crypto

 !
.

! "
Xml

" %
{ 
internal 
class /
#ExcAncestralNamespaceContextManager 6
:7 8,
 AncestralNamespaceContextManager9 Y
{ 
private 
	Hashtable 
_inclusivePrefixSet -
=. /
null0 4
;4 5
internal /
#ExcAncestralNamespaceContextManager 4
(4 5
string5 ;)
inclusiveNamespacesPrefixList< Y
)Y Z
{ 	
_inclusivePrefixSet 
=  !
Utils" '
.' ($
TokenizePrefixListString( @
(@ A)
inclusiveNamespacesPrefixListA ^
)^ _
;_ `
} 	
private 
bool *
HasNonRedundantInclusivePrefix 3
(3 4
XmlAttribute4 @
attrA E
)E F
{ 	
int 
tmp 
; 
string 
nsPrefix 
= 
Utils #
.# $
GetNamespacePrefix$ 6
(6 7
attr7 ;
); <
;< =
return 
_inclusivePrefixSet &
.& '
ContainsKey' 2
(2 3
nsPrefix3 ;
); <
&&= ?
Utils 
. '
IsNonRedundantNamespaceDecl 1
(1 2
attr2 6
,6 79
-GetNearestRenderedNamespaceWithMatchingPrefix8 e
(e f
nsPrefixf n
,n o
outp s
tmpt w
)w x
)x y
;y z
} 	
private 
void #
GatherNamespaceToRender ,
(, -
string- 3
nsPrefix4 <
,< =

SortedList> H
nsListToRenderI W
,W X
	HashtableY b
nsLocallyDeclaredc t
)t u
{   	
foreach!! 
(!! 
object!! 
a!! 
in!!  
nsListToRender!!! /
.!!/ 0

GetKeyList!!0 :
(!!: ;
)!!; <
)!!< =
{"" 
if## 
(## 
Utils## 
.## 
HasNamespacePrefix## ,
(##, -
(##- .
XmlAttribute##. :
)##: ;
a##; <
,##< =
nsPrefix##> F
)##F G
)##G H
return$$ 
;$$ 
}%% 
int'' 
rDepth'' 
;'' 
XmlAttribute(( 
local(( 
=((  
(((! "
XmlAttribute((" .
)((. /
nsLocallyDeclared((/ @
[((@ A
nsPrefix((A I
]((I J
;((J K
XmlAttribute)) 

rAncestral)) #
=))$ %9
-GetNearestRenderedNamespaceWithMatchingPrefix))& S
())S T
nsPrefix))T \
,))\ ]
out))^ a
rDepth))b h
)))h i
;))i j
if++ 
(++ 
local++ 
!=++ 
null++ 
)++ 
{,, 
if-- 
(-- 
Utils-- 
.-- '
IsNonRedundantNamespaceDecl-- 5
(--5 6
local--6 ;
,--; <

rAncestral--= G
)--G H
)--H I
{.. 
nsLocallyDeclared// %
.//% &
Remove//& ,
(//, -
nsPrefix//- 5
)//5 6
;//6 7
nsListToRender00 "
.00" #
Add00# &
(00& '
local00' ,
,00, -
null00. 2
)002 3
;003 4
}11 
}22 
else33 
{44 
int55 
uDepth55 
;55 
XmlAttribute66 

uAncestral66 '
=66( );
/GetNearestUnrenderedNamespaceWithMatchingPrefix66* Y
(66Y Z
nsPrefix66Z b
,66b c
out66d g
uDepth66h n
)66n o
;66o p
if77 
(77 

uAncestral77 
!=77 !
null77" &
&&77' )
uDepth77* 0
>771 2
rDepth773 9
&&77: <
Utils77= B
.77B C'
IsNonRedundantNamespaceDecl77C ^
(77^ _

uAncestral77_ i
,77i j

rAncestral77k u
)77u v
)77v w
{88 
nsListToRender99 "
.99" #
Add99# &
(99& '

uAncestral99' 1
,991 2
null993 7
)997 8
;998 9
}:: 
};; 
}<< 	
internal>> 
override>> 
void>> !
GetNamespacesToRender>> 4
(>>4 5

XmlElement>>5 ?
element>>@ G
,>>G H

SortedList>>I S
attrListToRender>>T d
,>>d e

SortedList>>f p
nsListToRender>>q 
,	>> Ä
	Hashtable
>>Å ä
nsLocallyDeclared
>>ã ú
)
>>ú ù
{?? 	#
GatherNamespaceToRender@@ #
(@@# $
element@@$ +
.@@+ ,
Prefix@@, 2
,@@2 3
nsListToRender@@4 B
,@@B C
nsLocallyDeclared@@D U
)@@U V
;@@V W
foreachAA 
(AA 
objectAA 
attrAA  
inAA! #
attrListToRenderAA$ 4
.AA4 5

GetKeyListAA5 ?
(AA? @
)AA@ A
)AAA B
{BB 
stringCC 
prefixCC 
=CC 
(CC  !
(CC! "
XmlAttributeCC" .
)CC. /
attrCC/ 3
)CC3 4
.CC4 5
PrefixCC5 ;
;CC; <
ifDD 
(DD 
prefixDD 
.DD 
LengthDD !
>DD" #
$numDD$ %
)DD% &#
GatherNamespaceToRenderEE +
(EE+ ,
prefixEE, 2
,EE2 3
nsListToRenderEE4 B
,EEB C
nsLocallyDeclaredEED U
)EEU V
;EEV W
}FF 
}GG 	
internalII 
overrideII 
voidII 
TrackNamespaceNodeII 1
(II1 2
XmlAttributeII2 >
attrII? C
,IIC D

SortedListIIE O
nsListToRenderIIP ^
,II^ _
	HashtableII` i
nsLocallyDeclaredIIj {
)II{ |
{JJ 	
ifKK 
(KK 
!KK 
UtilsKK 
.KK %
IsXmlPrefixDefinitionNodeKK 0
(KK0 1
attrKK1 5
)KK5 6
)KK6 7
{LL 
ifMM 
(MM *
HasNonRedundantInclusivePrefixMM 2
(MM2 3
attrMM3 7
)MM7 8
)MM8 9
nsListToRenderNN "
.NN" #
AddNN# &
(NN& '
attrNN' +
,NN+ ,
nullNN- 1
)NN1 2
;NN2 3
elseOO 
nsLocallyDeclaredPP %
.PP% &
AddPP& )
(PP) *
UtilsPP* /
.PP/ 0
GetNamespacePrefixPP0 B
(PPB C
attrPPC G
)PPG H
,PPH I
attrPPJ N
)PPN O
;PPO P
}QQ 
}RR 	
internalTT 
overrideTT 
voidTT !
TrackXmlNamespaceNodeTT 4
(TT4 5
XmlAttributeTT5 A
attrTTB F
,TTF G

SortedListTTH R
nsListToRenderTTS a
,TTa b

SortedListTTc m
attrListToRenderTTn ~
,TT~ 
	Hashtable
TTÄ â
nsLocallyDeclared
TTä õ
)
TTõ ú
{UU 	
attrListToRenderWW 
.WW 
AddWW  
(WW  !
attrWW! %
,WW% &
nullWW' +
)WW+ ,
;WW, -
}XX 	
}YY 
}ZZ ∑Y
:C:\code\bc-xml-security\refactoring\src\ExcCanonicalXml.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
ExcCanonicalXml "
{ 
private  
CanonicalXmlDocument $
_c14nDoc% -
;- .
private /
#ExcAncestralNamespaceContextManager 3
_ancMgr4 ;
;; <
internal 
ExcCanonicalXml  
(  !
Stream! '
inputStream( 3
,3 4
bool5 9
includeComments: I
,I J
stringK Q)
inclusiveNamespacesPrefixListR o
,o p
XmlResolverq |
resolver	} Ö
,
Ö Ü
string
á ç

strBaseUri
é ò
)
ò ô
{ 	
if 
( 
inputStream 
== 
null #
)# $
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
inputStream7 B
)B C
)C D
;D E
_c14nDoc 
= 
new  
CanonicalXmlDocument /
(/ 0
true0 4
,4 5
includeComments6 E
)E F
;F G
_c14nDoc 
. 
XmlResolver  
=! "
resolver# +
;+ ,
_c14nDoc 
. 
Load 
( 
Utils 
.  !
PreProcessStreamInput  5
(5 6
inputStream6 A
,A B
resolverC K
,K L

strBaseUriM W
)W X
)X Y
;Y Z
_ancMgr 
= 
new /
#ExcAncestralNamespaceContextManager =
(= >)
inclusiveNamespacesPrefixList> [
)[ \
;\ ]
} 	
internal 
ExcCanonicalXml  
(  !
XmlDocument! ,
document- 5
,5 6
bool7 ;
includeComments< K
,K L
stringM S)
inclusiveNamespacesPrefixListT q
,q r
XmlResolvers ~
resolver	 á
)
á à
{ 	
if 
( 
document 
== 
null  
)  !
throw   
new   !
ArgumentNullException   /
(  / 0
nameof  0 6
(  6 7
document  7 ?
)  ? @
)  @ A
;  A B
_c14nDoc"" 
="" 
new""  
CanonicalXmlDocument"" /
(""/ 0
true""0 4
,""4 5
includeComments""6 E
)""E F
;""F G
_c14nDoc## 
.## 
XmlResolver##  
=##! "
resolver### +
;##+ ,
_c14nDoc$$ 
.$$ 
Load$$ 
($$ 
new$$ 
XmlNodeReader$$ +
($$+ ,
document$$, 4
)$$4 5
)$$5 6
;$$6 7
_ancMgr%% 
=%% 
new%% /
#ExcAncestralNamespaceContextManager%% =
(%%= >)
inclusiveNamespacesPrefixList%%> [
)%%[ \
;%%\ ]
}&& 	
internal(( 
ExcCanonicalXml((  
(((  !
XmlNodeList((! ,
nodeList((- 5
,((5 6
bool((7 ;
includeComments((< K
,((K L
string((M S)
inclusiveNamespacesPrefixList((T q
,((q r
XmlResolver((s ~
resolver	(( á
)
((á à
{)) 	
if** 
(** 
nodeList** 
==** 
null**  
)**  !
throw++ 
new++ !
ArgumentNullException++ /
(++/ 0
nameof++0 6
(++6 7
nodeList++7 ?
)++? @
)++@ A
;++A B
XmlDocument-- 
doc-- 
=-- 
Utils-- #
.--# $
GetOwnerDocument--$ 4
(--4 5
nodeList--5 =
)--= >
;--> ?
if.. 
(.. 
doc.. 
==.. 
null.. 
).. 
throw// 
new// 
ArgumentException// +
(//+ ,
nameof//, 2
(//2 3
nodeList//3 ;
)//; <
)//< =
;//= >
_c14nDoc11 
=11 
new11  
CanonicalXmlDocument11 /
(11/ 0
false110 5
,115 6
includeComments117 F
)11F G
;11G H
_c14nDoc22 
.22 
XmlResolver22  
=22! "
resolver22# +
;22+ ,
_c14nDoc33 
.33 
Load33 
(33 
new33 
XmlNodeReader33 +
(33+ ,
doc33, /
)33/ 0
)330 1
;331 2
_ancMgr44 
=44 
new44 /
#ExcAncestralNamespaceContextManager44 =
(44= >)
inclusiveNamespacesPrefixList44> [
)44[ \
;44\ ]&
MarkInclusionStateForNodes66 &
(66& '
nodeList66' /
,66/ 0
doc661 4
,664 5
_c14nDoc666 >
)66> ?
;66? @
}77 	
internal99 
byte99 
[99 
]99 
GetBytes99  
(99  !
)99! "
{:: 	
StringBuilder;; 
sb;; 
=;; 
new;; "
StringBuilder;;# 0
(;;0 1
);;1 2
;;;2 3
_c14nDoc<< 
.<< 
Write<< 
(<< 
sb<< 
,<< 
DocPosition<< *
.<<* +
BeforeRootElement<<+ <
,<<< =
_ancMgr<<> E
)<<E F
;<<F G
UTF8Encoding== 
utf8== 
=== 
new==  #
UTF8Encoding==$ 0
(==0 1
false==1 6
)==6 7
;==7 8
return>> 
utf8>> 
.>> 
GetBytes>>  
(>>  !
sb>>! #
.>># $
ToString>>$ ,
(>>, -
)>>- .
)>>. /
;>>/ 0
}?? 	
internalAA 
voidAA 
GetDigestedBytesAA &
(AA& '
IHashAA' ,
hashAA- 1
)AA1 2
{BB 	
_c14nDocCC 
.CC 
	WriteHashCC 
(CC 
hashCC #
,CC# $
DocPositionCC% 0
.CC0 1
BeforeRootElementCC1 B
,CCB C
_ancMgrCCD K
)CCK L
;CCL M
}DD 	
privateFF 
staticFF 
voidFF &
MarkInclusionStateForNodesFF 6
(FF6 7
XmlNodeListFF7 B
nodeListFFC K
,FFK L
XmlDocumentFFM X
	inputRootFFY b
,FFb c
XmlDocumentFFd o
rootFFp t
)FFt u
{GG 	 
CanonicalXmlNodeListHH  
elementListHH! ,
=HH- .
newHH/ 2 
CanonicalXmlNodeListHH3 G
(HHG H
)HHH I
;HHI J 
CanonicalXmlNodeListII   
elementListCanonicalII! 5
=II6 7
newII8 ; 
CanonicalXmlNodeListII< P
(IIP Q
)IIQ R
;IIR S
elementListJJ 
.JJ 
AddJJ 
(JJ 
	inputRootJJ %
)JJ% &
;JJ& ' 
elementListCanonicalKK  
.KK  !
AddKK! $
(KK$ %
rootKK% )
)KK) *
;KK* +
intLL 
indexLL 
=LL 
$numLL 
;LL 
doNN 
{OO 
XmlNodePP 
currentNodePP #
=PP$ %
(PP& '
XmlNodePP' .
)PP. /
elementListPP/ :
[PP: ;
indexPP; @
]PP@ A
;PPA B
XmlNodeQQ  
currentNodeCanonicalQQ ,
=QQ- .
(QQ/ 0
XmlNodeQQ0 7
)QQ7 8 
elementListCanonicalQQ8 L
[QQL M
indexQQM R
]QQR S
;QQS T
XmlNodeListRR 

childNodesRR &
=RR' (
currentNodeRR) 4
.RR4 5

ChildNodesRR5 ?
;RR? @
XmlNodeListSS 
childNodesCanonicalSS /
=SS0 1 
currentNodeCanonicalSS2 F
.SSF G

ChildNodesSSG Q
;SSQ R
forTT 
(TT 
intTT 
iTT 
=TT 
$numTT 
;TT 
iTT  !
<TT" #

childNodesTT$ .
.TT. /
CountTT/ 4
;TT4 5
iTT6 7
++TT7 9
)TT9 :
{UU 
elementListVV 
.VV  
AddVV  #
(VV# $

childNodesVV$ .
[VV. /
iVV/ 0
]VV0 1
)VV1 2
;VV2 3 
elementListCanonicalWW (
.WW( )
AddWW) ,
(WW, -
childNodesCanonicalWW- @
[WW@ A
iWWA B
]WWB C
)WWC D
;WWD E
ifYY 
(YY 
UtilsYY 
.YY 

NodeInListYY (
(YY( )

childNodesYY) 3
[YY3 4
iYY4 5
]YY5 6
,YY6 7
nodeListYY8 @
)YY@ A
)YYA B
{ZZ 
MarkNodeAsIncluded[[ *
([[* +
childNodesCanonical[[+ >
[[[> ?
i[[? @
][[@ A
)[[A B
;[[B C
}\\ "
XmlAttributeCollection^^ *
attribNodes^^+ 6
=^^7 8

childNodes^^9 C
[^^C D
i^^D E
]^^E F
.^^F G

Attributes^^G Q
;^^Q R
if__ 
(__ 
attribNodes__ #
!=__$ &
null__' +
)__+ ,
{`` 
foraa 
(aa 
intaa  
jaa! "
=aa# $
$numaa% &
;aa& '
jaa( )
<aa* +
attribNodesaa, 7
.aa7 8
Countaa8 =
;aa= >
jaa? @
++aa@ B
)aaB C
{bb 
ifcc 
(cc  
Utilscc  %
.cc% &

NodeInListcc& 0
(cc0 1
attribNodescc1 <
[cc< =
jcc= >
]cc> ?
,cc? @
nodeListccA I
)ccI J
)ccJ K
{dd 
MarkNodeAsIncludedee  2
(ee2 3
childNodesCanonicalee3 F
[eeF G
ieeG H
]eeH I
.eeI J

AttributeseeJ T
.eeT U
ItemeeU Y
(eeY Z
jeeZ [
)ee[ \
)ee\ ]
;ee] ^
}ff 
}gg 
}hh 
}ii 
indexjj 
++jj 
;jj 
}kk 
whilekk 
(kk 
indexkk 
<kk 
elementListkk (
.kk( )
Countkk) .
)kk. /
;kk/ 0
}ll 	
privatenn 
staticnn 
voidnn 
MarkNodeAsIncludednn .
(nn. /
XmlNodenn/ 6
nodenn7 ;
)nn; <
{oo 	
ifpp 
(pp 
nodepp 
ispp  
ICanonicalizableNodepp ,
)pp, -
(qq 
(qq  
ICanonicalizableNodeqq &
)qq& '
nodeqq' +
)qq+ ,
.qq, -
IsInNodeSetqq- 8
=qq9 :
trueqq; ?
;qq? @
}rr 	
}ss 
}tt ü1
7C:\code\bc-xml-security\refactoring\src\HashWrappers.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

	interface 
IHash 
{		 
void

 
Reset

 
(

 
)

 
;

 
void 
BlockUpdate 
( 
byte 
[ 
] 
input  %
,% &
int' *
inOff+ 0
,0 1
int2 5
length6 <
)< =
;= >
int 
GetHashSize 
( 
) 
; 
int 
DoFinal 
( 
byte 
[ 
] 
output !
,! "
int# &
outOff' -
)- .
;. /
} 
public 

class 
SignerHashWrapper "
:# $
IHash% *
{ 
private 
readonly 
ISigner  
_hash! &
;& '
public 
SignerHashWrapper  
(  !
ISigner! (
signer) /
)/ 0
{ 	
_hash 
= 
signer 
; 
} 	
public 
void 
BlockUpdate 
(  
byte  $
[$ %
]% &
input' ,
,, -
int. 1
inOff2 7
,7 8
int9 <
length= C
)C D
{ 	
_hash 
. 
BlockUpdate 
( 
input #
,# $
inOff% *
,* +
length, 2
)2 3
;3 4
} 	
public 
int 
DoFinal 
( 
byte 
[  
]  !
output" (
,( )
int* -
outOff. 4
)4 5
{ 	
throw   
new   !
NotSupportedException   +
(  + ,
)  , -
;  - .
}!! 	
public## 
int## 
GetHashSize## 
(## 
)##  
{$$ 	
throw%% 
new%% !
NotSupportedException%% +
(%%+ ,
)%%, -
;%%- .
}&& 	
public(( 
void(( 
Reset(( 
((( 
)(( 
{)) 	
_hash** 
.** 
Reset** 
(** 
)** 
;** 
}++ 	
},, 
public.. 

class.. 
MacHashWrapper.. 
:..  !
IHash.." '
{// 
private00 
readonly00 
IMac00 
_hash00 #
;00# $
public22 
MacHashWrapper22 
(22 
IMac22 "
mac22# &
)22& '
{33 	
_hash44 
=44 
mac44 
;44 
}55 	
public77 
void77 
BlockUpdate77 
(77  
byte77  $
[77$ %
]77% &
input77' ,
,77, -
int77. 1
inOff772 7
,777 8
int779 <
length77= C
)77C D
{88 	
_hash99 
.99 
BlockUpdate99 
(99 
input99 #
,99# $
inOff99% *
,99* +
length99, 2
)992 3
;993 4
}:: 	
public<< 
int<< 
DoFinal<< 
(<< 
byte<< 
[<<  
]<<  !
output<<" (
,<<( )
int<<* -
outOff<<. 4
)<<4 5
{== 	
return>> 
_hash>> 
.>> 
DoFinal>>  
(>>  !
output>>! '
,>>' (
outOff>>) /
)>>/ 0
;>>0 1
}?? 	
publicAA 
intAA 
GetHashSizeAA 
(AA 
)AA  
{BB 	
returnCC 
_hashCC 
.CC 

GetMacSizeCC #
(CC# $
)CC$ %
;CC% &
}DD 	
publicFF 
voidFF 
ResetFF 
(FF 
)FF 
{GG 	
_hashHH 
.HH 
ResetHH 
(HH 
)HH 
;HH 
}II 	
}JJ 
publicLL 

classLL 
DigestHashWrapperLL "
:LL# $
IHashLL% *
{MM 
privateNN 
readonlyNN 
IDigestNN  
_hashNN! &
;NN& '
publicPP 
DigestHashWrapperPP  
(PP  !
IDigestPP! (
digestPP) /
)PP/ 0
{QQ 	
_hashRR 
=RR 
digestRR 
;RR 
}SS 	
publicUU 
voidUU 
BlockUpdateUU 
(UU  
byteUU  $
[UU$ %
]UU% &
inputUU' ,
,UU, -
intUU. 1
inOffUU2 7
,UU7 8
intUU9 <
lengthUU= C
)UUC D
{VV 	
_hashWW 
.WW 
BlockUpdateWW 
(WW 
inputWW #
,WW# $
inOffWW% *
,WW* +
lengthWW, 2
)WW2 3
;WW3 4
}XX 	
publicZZ 
intZZ 
DoFinalZZ 
(ZZ 
byteZZ 
[ZZ  
]ZZ  !
outputZZ" (
,ZZ( )
intZZ* -
outOffZZ. 4
)ZZ4 5
{[[ 	
return\\ 
_hash\\ 
.\\ 
DoFinal\\  
(\\  !
output\\! '
,\\' (
outOff\\) /
)\\/ 0
;\\0 1
}]] 	
public__ 
int__ 
GetHashSize__ 
(__ 
)__  
{`` 	
returnaa 
_hashaa 
.aa 
GetDigestSizeaa &
(aa& '
)aa' (
;aa( )
}bb 	
publicdd 
voiddd 
Resetdd 
(dd 
)dd 
{ee 	
_hashff 
.ff 
Resetff 
(ff 
)ff 
;ff 
}gg 	
}hh 
}ii ˜
?C:\code\bc-xml-security\refactoring\src\ICanonicalizableNode.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
	interface  
ICanonicalizableNode +
{ 
bool 
IsInNodeSet 
{ 	
get 
; 
set 
; 
} 	
void 
Write 
( 
StringBuilder  

strBuilder! +
,+ ,
DocPosition- 8
docPos9 ?
,? @,
 AncestralNamespaceContextManagerA a
ancb e
)e f
;f g
void 
	WriteHash 
( 
IHash 
hash !
,! "
DocPosition# .
docPos/ 5
,5 6,
 AncestralNamespaceContextManager7 W
ancX [
)[ \
;\ ]
} 
} œ
8C:\code\bc-xml-security\refactoring\src\IRelDecryptor.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public		 

	interface		 
IRelDecryptor		 "
{

 
Stream 
Decrypt 
( 
EncryptionMethod '
encryptionMethod( 8
,8 9
KeyInfo: A
keyInfoB I
,I J
StreamK Q
	toDecryptR [
)[ \
;\ ]
} 
} øO
2C:\code\bc-xml-security\refactoring\src\KeyInfo.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
KeyInfo 
: 
IEnumerable &
{ 
private 
string 
_id 
= 
null !
;! "
private 
	ArrayList 
_keyInfoClauses )
;) *
public 
KeyInfo 
( 
) 
{ 	
_keyInfoClauses 
= 
new !
	ArrayList" +
(+ ,
), -
;- .
} 	
public 
string 
Id 
{   	
get!! 
{!! 
return!! 
_id!! 
;!! 
}!! 
set"" 
{"" 
_id"" 
="" 
value"" 
;"" 
}""  
}## 	
public%% 

XmlElement%% 
GetXml%%  
(%%  !
)%%! "
{&& 	
XmlDocument'' 
xmlDocument'' #
=''$ %
new''& )
XmlDocument''* 5
(''5 6
)''6 7
;''7 8
xmlDocument(( 
.(( 
PreserveWhitespace(( *
=((+ ,
true((- 1
;((1 2
return)) 
GetXml)) 
()) 
xmlDocument)) %
)))% &
;))& '
}** 	
internal,, 

XmlElement,, 
GetXml,, "
(,," #
XmlDocument,,# .
xmlDocument,,/ :
),,: ;
{-- 	

XmlElement// 
keyInfoElement// %
=//& '
xmlDocument//( 3
.//3 4
CreateElement//4 A
(//A B
$str//B K
,//K L
	SignedXml//M V
.//V W
XmlDsigNamespaceUrl//W j
)//j k
;//k l
if00 
(00 
!00 
string00 
.00 
IsNullOrEmpty00 %
(00% &
_id00& )
)00) *
)00* +
{11 
keyInfoElement22 
.22 
SetAttribute22 +
(22+ ,
$str22, 0
,220 1
_id222 5
)225 6
;226 7
}33 
for66 
(66 
int66 
i66 
=66 
$num66 
;66 
i66 
<66 
_keyInfoClauses66  /
.66/ 0
Count660 5
;665 6
++667 9
i669 :
)66: ;
{77 

XmlElement88 

xmlElement88 %
=88& '
(88( )
(88) *
KeyInfoClause88* 7
)887 8
_keyInfoClauses888 G
[88G H
i88H I
]88I J
)88J K
.88K L
GetXml88L R
(88R S
xmlDocument88S ^
)88^ _
;88_ `
if99 
(99 

xmlElement99 
!=99 !
null99" &
)99& '
{:: 
keyInfoElement;; "
.;;" #
AppendChild;;# .
(;;. /

xmlElement;;/ 9
);;9 :
;;;: ;
}<< 
}== 
return>> 
keyInfoElement>> !
;>>! "
}?? 	
publicAA 
voidAA 
LoadXmlAA 
(AA 

XmlElementAA &
valueAA' ,
)AA, -
{BB 	
ifCC 
(CC 
valueCC 
==CC 
nullCC 
)CC 
throwDD 
newDD !
ArgumentNullExceptionDD /
(DD/ 0
nameofDD0 6
(DD6 7
valueDD7 <
)DD< =
)DD= >
;DD> ?

XmlElementFF 
keyInfoElementFF %
=FF& '
valueFF( -
;FF- .
_idGG 
=GG 
UtilsGG 
.GG 
GetAttributeGG $
(GG$ %
keyInfoElementGG% 3
,GG3 4
$strGG5 9
,GG9 :
	SignedXmlGG; D
.GGD E
XmlDsigNamespaceUrlGGE X
)GGX Y
;GGY Z
ifHH 
(HH 
!HH 
UtilsHH 
.HH 
VerifyAttributesHH '
(HH' (
keyInfoElementHH( 6
,HH6 7
$strHH8 <
)HH< =
)HH= >
throwII 
newII 
SystemII  
.II  !
SecurityII! )
.II) *
CryptographyII* 6
.II6 7"
CryptographicExceptionII7 M
(IIM N
SRIIN P
.IIP Q+
Cryptography_Xml_InvalidElementIIQ p
,IIp q
$strIIr {
)II{ |
;II| }
XmlNodeKK 
childKK 
=KK 
keyInfoElementKK *
.KK* +

FirstChildKK+ 5
;KK5 6
whileLL 
(LL 
childLL 
!=LL 
nullLL  
)LL  !
{MM 

XmlElementNN 
elemNN 
=NN  !
childNN" '
asNN( *

XmlElementNN+ 5
;NN5 6
ifOO 
(OO 
elemOO 
!=OO 
nullOO  
)OO  !
{PP 
stringRR 
	kicStringRR $
=RR% &
elemRR' +
.RR+ ,
NamespaceURIRR, 8
+RR9 :
$strRR; >
+RR? @
elemRRA E
.RRE F
	LocalNameRRF O
;RRO P
ifTT 
(TT 
	kicStringTT !
==TT" $
$strTT% R
)TTR S
{UU 
ifVV 
(VV 
!VV 
UtilsVV "
.VV" #
VerifyAttributesVV# 3
(VV3 4
elemVV4 8
,VV8 9
(VV: ;
stringVV; A
[VVA B
]VVB C
)VVC D
nullVVD H
)VVH I
)VVI J
{WW 
throwXX !
newXX" %
SystemXX& ,
.XX, -
SecurityXX- 5
.XX5 6
CryptographyXX6 B
.XXB C"
CryptographicExceptionXXC Y
(XXY Z
SRXXZ \
.XX\ ]+
Cryptography_Xml_InvalidElementXX] |
,XX| }
$str	XX~ ê
)
XXê ë
;
XXë í
}YY 
XmlNodeListZZ #
	nodeList2ZZ$ -
=ZZ. /
elemZZ0 4
.ZZ4 5

ChildNodesZZ5 ?
;ZZ? @
foreach[[ 
([[  !
XmlNode[[! (
node2[[) .
in[[/ 1
	nodeList2[[2 ;
)[[; <
{\\ 

XmlElement]] &
elem2]]' ,
=]]- .
node2]]/ 4
as]]5 7

XmlElement]]8 B
;]]B C
if^^ 
(^^  
elem2^^  %
!=^^& (
null^^) -
)^^- .
{__ 
	kicString``  )
+=``* ,
$str``- 0
+``1 2
elem2``3 8
.``8 9
	LocalName``9 B
;``B C
breakaa  %
;aa% &
}bb 
}cc 
}dd 
KeyInfoClauseff !
keyInfoClauseff" /
=ff0 1
CryptoHelpersff2 ?
.ff? @
CreateFromNameff@ N
<ffN O
KeyInfoClauseffO \
>ff\ ]
(ff] ^
	kicStringff^ g
)ffg h
;ffh i
ifhh 
(hh 
keyInfoClausehh %
==hh& (
nullhh) -
)hh- .
keyInfoClauseii %
=ii& '
newii( +
KeyInfoNodeii, 7
(ii7 8
)ii8 9
;ii9 :
keyInfoClausell !
.ll! "
LoadXmlll" )
(ll) *
elemll* .
)ll. /
;ll/ 0
	AddClausenn 
(nn 
keyInfoClausenn +
)nn+ ,
;nn, -
}oo 
childpp 
=pp 
childpp 
.pp 
NextSiblingpp )
;pp) *
}qq 
}rr 	
publictt 
inttt 
Counttt 
{uu 	
getvv 
{vv 
returnvv 
_keyInfoClausesvv (
.vv( )
Countvv) .
;vv. /
}vv0 1
}ww 	
public}} 
void}} 
	AddClause}} 
(}} 
KeyInfoClause}} +
clause}}, 2
)}}2 3
{~~ 	
_keyInfoClauses 
. 
Add 
(  
clause  &
)& '
;' (
}
ÄÄ 	
public
ÇÇ 
IEnumerator
ÇÇ 
GetEnumerator
ÇÇ (
(
ÇÇ( )
)
ÇÇ) *
{
ÉÉ 	
return
ÑÑ 
_keyInfoClauses
ÑÑ "
.
ÑÑ" #
GetEnumerator
ÑÑ# 0
(
ÑÑ0 1
)
ÑÑ1 2
;
ÑÑ2 3
}
ÖÖ 	
public
áá 
IEnumerator
áá 
GetEnumerator
áá (
(
áá( )
Type
áá) -!
requestedObjectType
áá. A
)
ááA B
{
àà 	
	ArrayList
ââ 
requestedList
ââ #
=
ââ$ %
new
ââ& )
	ArrayList
ââ* 3
(
ââ3 4
)
ââ4 5
;
ââ5 6
object
ãã 
tempObj
ãã 
;
ãã 
IEnumerator
åå 
tempEnum
åå  
=
åå! "
_keyInfoClauses
åå# 2
.
åå2 3
GetEnumerator
åå3 @
(
åå@ A
)
ååA B
;
ååB C
while
éé 
(
éé 
tempEnum
éé 
.
éé 
MoveNext
éé $
(
éé$ %
)
éé% &
)
éé& '
{
èè 
tempObj
êê 
=
êê 
tempEnum
êê "
.
êê" #
Current
êê# *
;
êê* +
if
ëë 
(
ëë !
requestedObjectType
ëë '
.
ëë' (
Equals
ëë( .
(
ëë. /
tempObj
ëë/ 6
.
ëë6 7
GetType
ëë7 >
(
ëë> ?
)
ëë? @
)
ëë@ A
)
ëëA B
requestedList
íí !
.
íí! "
Add
íí" %
(
íí% &
tempObj
íí& -
)
íí- .
;
íí. /
}
ìì 
return
ïï 
requestedList
ïï  
.
ïï  !
GetEnumerator
ïï! .
(
ïï. /
)
ïï/ 0
;
ïï0 1
}
ññ 	
}
óó 
}òò ß

8C:\code\bc-xml-security\refactoring\src\KeyInfoClause.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public		 

abstract		 
class		 
KeyInfoClause		 '
{

 
	protected 
KeyInfoClause 
(  
)  !
{" #
}$ %
public 
abstract 

XmlElement "
GetXml# )
() *
)* +
;+ ,
internal 
virtual 

XmlElement #
GetXml$ *
(* +
XmlDocument+ 6
xmlDocument7 B
)B C
{ 	

XmlElement 
keyInfo 
=  
GetXml! '
(' (
)( )
;) *
return 
( 

XmlElement 
) 
xmlDocument *
.* +

ImportNode+ 5
(5 6
keyInfo6 =
,= >
true? C
)C D
;D E
} 	
public 
abstract 
void 
LoadXml $
($ %

XmlElement% /
element0 7
)7 8
;8 9
} 
} ∫
>C:\code\bc-xml-security\refactoring\src\KeyInfoEncryptedKey.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
KeyInfoEncryptedKey $
:% &
KeyInfoClause' 4
{ 
private 
EncryptedKey 
_encryptedKey *
;* +
public 
KeyInfoEncryptedKey "
(" #
)# $
{% &
}' (
public 
KeyInfoEncryptedKey "
(" #
EncryptedKey# /
encryptedKey0 <
)< =
{ 	
_encryptedKey 
= 
encryptedKey (
;( )
} 	
public 
EncryptedKey 
EncryptedKey (
{ 	
get 
{ 
return 
_encryptedKey &
;& '
}( )
set 
{ 
_encryptedKey 
=  !
value" '
;' (
}) *
} 	
public 
override 

XmlElement "
GetXml# )
() *
)* +
{ 	
if   
(   
_encryptedKey   
==    
null  ! %
)  % &
throw!! 
new!! 
System!!  
.!!  !
Security!!! )
.!!) *
Cryptography!!* 6
.!!6 7"
CryptographicException!!7 M
(!!M N
SR!!N P
.!!P Q+
Cryptography_Xml_InvalidElement!!Q p
,!!p q
$str	!!r á
)
!!á à
;
!!à â
return"" 
_encryptedKey""  
.""  !
GetXml""! '
(""' (
)""( )
;"") *
}## 	
internal%% 
override%% 

XmlElement%% $
GetXml%%% +
(%%+ ,
XmlDocument%%, 7
xmlDocument%%8 C
)%%C D
{&& 	
if'' 
('' 
_encryptedKey'' 
==''  
null''! %
)''% &
throw(( 
new(( 
System((  
.((  !
Security((! )
.(() *
Cryptography((* 6
.((6 7"
CryptographicException((7 M
(((M N
SR((N P
.((P Q+
Cryptography_Xml_InvalidElement((Q p
,((p q
$str	((r á
)
((á à
;
((à â
return)) 
_encryptedKey))  
.))  !
GetXml))! '
())' (
xmlDocument))( 3
)))3 4
;))4 5
}** 	
public,, 
override,, 
void,, 
LoadXml,, $
(,,$ %

XmlElement,,% /
value,,0 5
),,5 6
{-- 	
_encryptedKey.. 
=.. 
new.. 
EncryptedKey..  ,
(.., -
)..- .
;... /
_encryptedKey// 
.// 
LoadXml// !
(//! "
value//" '
)//' (
;//( )
}00 	
}11 
}22 ˚
6C:\code\bc-xml-security\refactoring\src\KeyInfoName.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
KeyInfoName 
: 
KeyInfoClause ,
{ 
private 
string 
_keyName 
;  
public 
KeyInfoName 
( 
) 
: 
this #
(# $
null$ (
)( )
{* +
}, -
public 
KeyInfoName 
( 
string !
keyName" )
)) *
{ 	
Value 
= 
keyName 
; 
} 	
public   
string   
Value   
{!! 	
get"" 
{"" 
return"" 
_keyName"" !
;""! "
}""# $
set## 
{## 
_keyName## 
=## 
value## "
;##" #
}##$ %
}$$ 	
public** 
override** 

XmlElement** "
GetXml**# )
(**) *
)*** +
{++ 	
XmlDocument,, 
xmlDocument,, #
=,,$ %
new,,& )
XmlDocument,,* 5
(,,5 6
),,6 7
;,,7 8
xmlDocument-- 
.-- 
PreserveWhitespace-- *
=--+ ,
true--- 1
;--1 2
return.. 
GetXml.. 
(.. 
xmlDocument.. %
)..% &
;..& '
}// 	
internal11 
override11 

XmlElement11 $
GetXml11% +
(11+ ,
XmlDocument11, 7
xmlDocument118 C
)11C D
{22 	

XmlElement33 
nameElement33 "
=33# $
xmlDocument33% 0
.330 1
CreateElement331 >
(33> ?
$str33? H
,33H I
	SignedXml33J S
.33S T
XmlDsigNamespaceUrl33T g
)33g h
;33h i
nameElement44 
.44 
AppendChild44 #
(44# $
xmlDocument44$ /
.44/ 0
CreateTextNode440 >
(44> ?
_keyName44? G
)44G H
)44H I
;44I J
return55 
nameElement55 
;55 
}66 	
public88 
override88 
void88 
LoadXml88 $
(88$ %

XmlElement88% /
value880 5
)885 6
{99 	
if:: 
(:: 
value:: 
==:: 
null:: 
):: 
throw;; 
new;; !
ArgumentNullException;; /
(;;/ 0
nameof;;0 6
(;;6 7
value;;7 <
);;< =
);;= >
;;;> ?

XmlElement<< 
nameElement<< "
=<<# $
value<<% *
;<<* +
_keyName== 
=== 
nameElement== "
.==" #
	InnerText==# ,
.==, -
Trim==- 1
(==1 2
)==2 3
;==3 4
}>> 	
}?? 
}@@ ﬁ
6C:\code\bc-xml-security\refactoring\src\KeyInfoNode.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
KeyInfoNode 
: 
KeyInfoClause ,
{ 
private 

XmlElement 
_node  
;  !
public 
KeyInfoNode 
( 
) 
{ 
}  
public 
KeyInfoNode 
( 

XmlElement %
node& *
)* +
{ 	
_node 
= 
node 
; 
} 	
public!! 

XmlElement!! 
Value!! 
{"" 	
get## 
{## 
return## 
_node## 
;## 
}##  !
set$$ 
{$$ 
_node$$ 
=$$ 
value$$ 
;$$  
}$$! "
}%% 	
public++ 
override++ 

XmlElement++ "
GetXml++# )
(++) *
)++* +
{,, 	
XmlDocument-- 
xmlDocument-- #
=--$ %
new--& )
XmlDocument--* 5
(--5 6
)--6 7
;--7 8
xmlDocument.. 
... 
PreserveWhitespace.. *
=..+ ,
true..- 1
;..1 2
return// 
GetXml// 
(// 
xmlDocument// %
)//% &
;//& '
}00 	
internal22 
override22 

XmlElement22 $
GetXml22% +
(22+ ,
XmlDocument22, 7
xmlDocument228 C
)22C D
{33 	
return44 
xmlDocument44 
.44 

ImportNode44 )
(44) *
_node44* /
,44/ 0
true441 5
)445 6
as447 9

XmlElement44: D
;44D E
}55 	
public77 
override77 
void77 
LoadXml77 $
(77$ %

XmlElement77% /
value770 5
)775 6
{88 	
_node99 
=99 
value99 
;99 
}:: 	
};; 
}<< Ñ%
AC:\code\bc-xml-security\refactoring\src\KeyInfoRetrievalMethod.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class "
KeyInfoRetrievalMethod '
:( )
KeyInfoClause* 7
{ 
private 
string 
_uri 
; 
private 
string 
_type 
; 
public "
KeyInfoRetrievalMethod %
(% &
)& '
{( )
}* +
public "
KeyInfoRetrievalMethod %
(% &
string& ,
strUri- 3
)3 4
{ 	
_uri 
= 
strUri 
; 
} 	
public "
KeyInfoRetrievalMethod %
(% &
string& ,
strUri- 3
,3 4
string5 ;
typeName< D
)D E
{ 	
_uri 
= 
strUri 
; 
_type   
=   
typeName   
;   
}!! 	
public'' 
string'' 
Uri'' 
{(( 	
get)) 
{)) 
return)) 
_uri)) 
;)) 
}))  
set** 
{** 
_uri** 
=** 
value** 
;** 
}**  !
}++ 	
public-- 
string-- 
Type-- 
{.. 	
get// 
{// 
return// 
_type// 
;// 
}//  !
set00 
{00 
_type00 
=00 
value00 
;00  
}00! "
}11 	
public33 
override33 

XmlElement33 "
GetXml33# )
(33) *
)33* +
{44 	
XmlDocument55 
xmlDocument55 #
=55$ %
new55& )
XmlDocument55* 5
(555 6
)556 7
;557 8
xmlDocument66 
.66 
PreserveWhitespace66 *
=66+ ,
true66- 1
;661 2
return77 
GetXml77 
(77 
xmlDocument77 %
)77% &
;77& '
}88 	
internal:: 
override:: 

XmlElement:: $
GetXml::% +
(::+ ,
XmlDocument::, 7
xmlDocument::8 C
)::C D
{;; 	

XmlElement== "
retrievalMethodElement== -
===. /
xmlDocument==0 ;
.==; <
CreateElement==< I
(==I J
$str==J [
,==[ \
	SignedXml==] f
.==f g
XmlDsigNamespaceUrl==g z
)==z {
;=={ |
if?? 
(?? 
!?? 
string?? 
.?? 
IsNullOrEmpty?? %
(??% &
_uri??& *
)??* +
)??+ ,"
retrievalMethodElement@@ &
.@@& '
SetAttribute@@' 3
(@@3 4
$str@@4 9
,@@9 :
_uri@@; ?
)@@? @
;@@@ A
ifAA 
(AA 
!AA 
stringAA 
.AA 
IsNullOrEmptyAA %
(AA% &
_typeAA& +
)AA+ ,
)AA, -"
retrievalMethodElementBB &
.BB& '
SetAttributeBB' 3
(BB3 4
$strBB4 :
,BB: ;
_typeBB< A
)BBA B
;BBB C
returnDD "
retrievalMethodElementDD )
;DD) *
}EE 	
publicGG 
overrideGG 
voidGG 
LoadXmlGG $
(GG$ %

XmlElementGG% /
valueGG0 5
)GG5 6
{HH 	
ifII 
(II 
valueII 
==II 
nullII 
)II 
throwJJ 
newJJ !
ArgumentNullExceptionJJ /
(JJ/ 0
nameofJJ0 6
(JJ6 7
valueJJ7 <
)JJ< =
)JJ= >
;JJ> ?

XmlElementLL "
retrievalMethodElementLL -
=LL. /
valueLL0 5
;LL5 6
_uriMM 
=MM 
UtilsMM 
.MM 
GetAttributeMM %
(MM% &
valueMM& +
,MM+ ,
$strMM- 2
,MM2 3
	SignedXmlMM4 =
.MM= >
XmlDsigNamespaceUrlMM> Q
)MMQ R
;MMR S
_typeNN 
=NN 
UtilsNN 
.NN 
GetAttributeNN &
(NN& '
valueNN' ,
,NN, -
$strNN. 4
,NN4 5
	SignedXmlNN6 ?
.NN? @
XmlDsigNamespaceUrlNN@ S
)NNS T
;NNT U
}OO 	
}PP 
}QQ —‰
:C:\code\bc-xml-security\refactoring\src\KeyInfoX509Data.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
KeyInfoX509Data  
:! "
KeyInfoClause# 0
{ 
private 
	ArrayList 
_certificates '
=( )
null* .
;. /
private 
	ArrayList 
_issuerSerials (
=) *
null+ /
;/ 0
private 
	ArrayList 
_subjectKeyIds (
=) *
null+ /
;/ 0
private 
	ArrayList 
_subjectNames '
=( )
null* .
;. /
private 
byte 
[ 
] 
_CRL 
= 
null "
;" #
public"" 
KeyInfoX509Data"" 
("" 
)""  
{""! "
}""# $
public$$ 
KeyInfoX509Data$$ 
($$ 
byte$$ #
[$$# $
]$$$ %
rgbCert$$& -
)$$- .
{%% 	
if&& 
(&& 
rgbCert&& 
!=&& 
null&& 
)&&  
{&&! "
var'' 
parser'' 
='' 
new''  !
X509CertificateParser''! 6
(''6 7
)''7 8
;''8 9
AddCertificate(( 
((( 
parser(( %
.((% &
ReadCertificate((& 5
(((5 6
rgbCert((6 =
)((= >
)((> ?
;((? @
})) 
}** 	
public,, 
KeyInfoX509Data,, 
(,, 
X509Certificate,, .
cert,,/ 3
),,3 4
{-- 	
AddCertificate.. 
(.. 
Utils..  
...  !
CloneCertificate..! 1
(..1 2
cert..2 6
)..6 7
)..7 8
;..8 9
}// 	
public11 
KeyInfoX509Data11 
(11 
X509Certificate11 .
cert11/ 3
,113 4
IEnumerable115 @
<11@ A
X509Certificate11A P
>11P Q

additional11R \
,11\ ]
X509IncludeOption11^ o
includeOption11p }
)11} ~
{22 	
if33 
(33 
cert33 
==33 
null33 
)33 
throw44 
new44 !
ArgumentNullException44 /
(44/ 0
nameof440 6
(446 7
cert447 ;
)44; <
)44< =
;44= >
X509Certificate66 
certificate66 '
=66( )
Utils66* /
.66/ 0
CloneCertificate660 @
(66@ A
cert66A E
)66E F
;66F G
IList77 
<77 
X509Certificate77 !
>77! "
chain77# (
=77) *
null77+ /
;77/ 0
switch88 
(88 
includeOption88 !
)88! "
{99 
case:: 
X509IncludeOption:: &
.::& '
ExcludeRoot::' 2
:::2 3
chain<< 
=<< 
Utils<< !
.<<! "!
BuildCertificateChain<<" 7
(<<7 8
cert<<8 <
,<<< =

additional<<> H
)<<H I
;<<I J
forEE 
(EE 
intEE 
indexEE "
=EE# $
$numEE% &
;EE& '
indexEE( -
<EE. /
(EE0 1
UtilsEE1 6
.EE6 7
IsSelfSignedEE7 C
(EEC D
chainEED I
)EEI J
?EEK L
$numEEM N
:EEO P
chainEEQ V
.EEV W
CountEEW \
-EE] ^
$numEE_ `
)EE` a
;EEa b
indexEEc h
++EEh j
)EEj k
{FF 
AddCertificateGG &
(GG& '
chainGG' ,
[GG, -
indexGG- 2
]GG2 3
)GG3 4
;GG4 5
}HH 
breakII 
;II 
caseJJ 
X509IncludeOptionJJ &
.JJ& '
EndCertOnlyJJ' 2
:JJ2 3
AddCertificateKK "
(KK" #
certificateKK# .
)KK. /
;KK/ 0
breakLL 
;LL 
caseMM 
X509IncludeOptionMM &
.MM& '

WholeChainMM' 1
:MM1 2
chainOO 
=OO 
UtilsOO !
.OO! "!
BuildCertificateChainOO" 7
(OO7 8
certOO8 <
,OO< =

additionalOO> H
)OOH I
;OOI J
foreachXX 
(XX 
varXX  
elementXX! (
inXX) +
chainXX, 1
)XX1 2
{YY 
AddCertificateZZ &
(ZZ& '
elementZZ' .
)ZZ. /
;ZZ/ 0
}[[ 
break\\ 
;\\ 
}]] 
}^^ 	
publicdd 
	ArrayListdd 
Certificatesdd %
{ee 	
getff 
{ff 
returnff 
_certificatesff &
;ff& '
}ff( )
}gg 	
publicii 
voidii 
AddCertificateii "
(ii" #
X509Certificateii# 2
certificateii3 >
)ii> ?
{jj 	
ifkk 
(kk 
certificatekk 
==kk 
nullkk #
)kk# $
throwll 
newll !
ArgumentNullExceptionll /
(ll/ 0
nameofll0 6
(ll6 7
certificatell7 B
)llB C
)llC D
;llD E
ifnn 
(nn 
_certificatesnn 
==nn  
nullnn! %
)nn% &
_certificatesoo 
=oo 
newoo  #
	ArrayListoo$ -
(oo- .
)oo. /
;oo/ 0
X509Certificateqq 
x509qq  
=qq! "
certificateqq# .
;qq. /
_certificatesrr 
.rr 
Addrr 
(rr 
x509rr "
)rr" #
;rr# $
}ss 	
publicuu 
	ArrayListuu 
SubjectKeyIdsuu &
{vv 	
getww 
{ww 
returnww 
_subjectKeyIdsww '
;ww' (
}ww) *
}xx 	
publiczz 
voidzz 
AddSubjectKeyIdzz #
(zz# $
bytezz$ (
[zz( )
]zz) *
subjectKeyIdzz+ 7
)zz7 8
{{{ 	
if|| 
(|| 
_subjectKeyIds|| 
==|| !
null||" &
)||& '
_subjectKeyIds}} 
=}}  
new}}! $
	ArrayList}}% .
(}}. /
)}}/ 0
;}}0 1
_subjectKeyIds~~ 
.~~ 
Add~~ 
(~~ 
subjectKeyId~~ +
)~~+ ,
;~~, -
} 	
public
ÅÅ 
void
ÅÅ 
AddSubjectKeyId
ÅÅ #
(
ÅÅ# $
string
ÅÅ$ *
subjectKeyId
ÅÅ+ 7
)
ÅÅ7 8
{
ÇÇ 	
if
ÉÉ 
(
ÉÉ 
_subjectKeyIds
ÉÉ 
==
ÉÉ !
null
ÉÉ" &
)
ÉÉ& '
_subjectKeyIds
ÑÑ 
=
ÑÑ  
new
ÑÑ! $
	ArrayList
ÑÑ% .
(
ÑÑ. /
)
ÑÑ/ 0
;
ÑÑ0 1
_subjectKeyIds
ÖÖ 
.
ÖÖ 
Add
ÖÖ 
(
ÖÖ 
Utils
ÖÖ $
.
ÖÖ$ %
DecodeHexString
ÖÖ% 4
(
ÖÖ4 5
subjectKeyId
ÖÖ5 A
)
ÖÖA B
)
ÖÖB C
;
ÖÖC D
}
ÜÜ 	
public
àà 
	ArrayList
àà 
SubjectNames
àà %
{
ââ 	
get
ää 
{
ää 
return
ää 
_subjectNames
ää &
;
ää& '
}
ää( )
}
ãã 	
public
çç 
void
çç 
AddSubjectName
çç "
(
çç" #
string
çç# )
subjectName
çç* 5
)
çç5 6
{
éé 	
if
èè 
(
èè 
_subjectNames
èè 
==
èè  
null
èè! %
)
èè% &
_subjectNames
êê 
=
êê 
new
êê  #
	ArrayList
êê$ -
(
êê- .
)
êê. /
;
êê/ 0
_subjectNames
ëë 
.
ëë 
Add
ëë 
(
ëë 
subjectName
ëë )
)
ëë) *
;
ëë* +
}
íí 	
public
îî 
	ArrayList
îî 
IssuerSerials
îî &
{
ïï 	
get
ññ 
{
ññ 
return
ññ 
_issuerSerials
ññ '
;
ññ' (
}
ññ) *
}
óó 	
public
ôô 
void
ôô 
AddIssuerSerial
ôô #
(
ôô# $
string
ôô$ *

issuerName
ôô+ 5
,
ôô5 6
string
ôô7 =
serialNumber
ôô> J
)
ôôJ K
{
öö 	
if
õõ 
(
õõ 
string
õõ 
.
õõ 
IsNullOrEmpty
õõ $
(
õõ$ %

issuerName
õõ% /
)
õõ/ 0
)
õõ0 1
throw
úú 
new
úú 
ArgumentException
úú +
(
úú+ ,
SR
úú, .
.
úú. /#
Arg_EmptyOrNullString
úú/ D
,
úúD E
nameof
úúF L
(
úúL M

issuerName
úúM W
)
úúW X
)
úúX Y
;
úúY Z
if
ûû 
(
ûû 
string
ûû 
.
ûû 
IsNullOrEmpty
ûû $
(
ûû$ %
serialNumber
ûû% 1
)
ûû1 2
)
ûû2 3
throw
üü 
new
üü 
ArgumentException
üü +
(
üü+ ,
SR
üü, .
.
üü. /#
Arg_EmptyOrNullString
üü/ D
,
üüD E
nameof
üüF L
(
üüL M
serialNumber
üüM Y
)
üüY Z
)
üüZ [
;
üü[ \

BigInteger
°° 
h
°° 
;
°° 
try
¢¢ 
{
££ 
h
§§ 
=
§§ 
new
§§ 

BigInteger
§§ "
(
§§" #
serialNumber
§§# /
)
§§/ 0
;
§§0 1
}
•• 
catch
¶¶ 
(
¶¶ 
	Exception
¶¶ 
)
¶¶ 
{
ßß 
throw
®® 
new
®® 
ArgumentException
®® +
(
®®+ ,
SR
®®, .
.
®®. /<
.Cryptography_Xml_InvalidX509IssuerSerialNumber
®®/ ]
,
®®] ^
nameof
®®_ e
(
®®e f
serialNumber
®®f r
)
®®r s
)
®®s t
;
®®t u
}
©© 
if
´´ 
(
´´ 
_issuerSerials
´´ 
==
´´ !
null
´´" &
)
´´& '
_issuerSerials
¨¨ 
=
¨¨  
new
¨¨! $
	ArrayList
¨¨% .
(
¨¨. /
)
¨¨/ 0
;
¨¨0 1
_issuerSerials
≠≠ 
.
≠≠ 
Add
≠≠ 
(
≠≠ 
Utils
≠≠ $
.
≠≠$ %$
CreateX509IssuerSerial
≠≠% ;
(
≠≠; <

issuerName
≠≠< F
,
≠≠F G
h
≠≠H I
.
≠≠I J
ToString
≠≠J R
(
≠≠R S
)
≠≠S T
)
≠≠T U
)
≠≠U V
;
≠≠V W
}
ÆÆ 	
internal
±± 
void
±± %
InternalAddIssuerSerial
±± -
(
±±- .
string
±±. 4

issuerName
±±5 ?
,
±±? @
string
±±A G
serialNumber
±±H T
)
±±T U
{
≤≤ 	
if
≥≥ 
(
≥≥ 
_issuerSerials
≥≥ 
==
≥≥ !
null
≥≥" &
)
≥≥& '
_issuerSerials
¥¥ 
=
¥¥  
new
¥¥! $
	ArrayList
¥¥% .
(
¥¥. /
)
¥¥/ 0
;
¥¥0 1
_issuerSerials
µµ 
.
µµ 
Add
µµ 
(
µµ 
Utils
µµ $
.
µµ$ %$
CreateX509IssuerSerial
µµ% ;
(
µµ; <

issuerName
µµ< F
,
µµF G
serialNumber
µµH T
)
µµT U
)
µµU V
;
µµV W
}
∂∂ 	
public
∏∏ 
byte
∏∏ 
[
∏∏ 
]
∏∏ 
CRL
∏∏ 
{
ππ 	
get
∫∫ 
{
∫∫ 
return
∫∫ 
_CRL
∫∫ 
;
∫∫ 
}
∫∫  
set
ªª 
{
ªª 
_CRL
ªª 
=
ªª 
value
ªª 
;
ªª 
}
ªª  !
}
ºº 	
private
¬¬ 
void
¬¬ 
Clear
¬¬ 
(
¬¬ 
)
¬¬ 
{
√√ 	
_CRL
ƒƒ 
=
ƒƒ 
null
ƒƒ 
;
ƒƒ 
if
≈≈ 
(
≈≈ 
_subjectKeyIds
≈≈ 
!=
≈≈ !
null
≈≈" &
)
≈≈& '
_subjectKeyIds
≈≈( 6
.
≈≈6 7
Clear
≈≈7 <
(
≈≈< =
)
≈≈= >
;
≈≈> ?
if
∆∆ 
(
∆∆ 
_subjectNames
∆∆ 
!=
∆∆  
null
∆∆! %
)
∆∆% &
_subjectNames
∆∆' 4
.
∆∆4 5
Clear
∆∆5 :
(
∆∆: ;
)
∆∆; <
;
∆∆< =
if
«« 
(
«« 
_issuerSerials
«« 
!=
«« !
null
««" &
)
««& '
_issuerSerials
««( 6
.
««6 7
Clear
««7 <
(
««< =
)
««= >
;
««> ?
if
»» 
(
»» 
_certificates
»» 
!=
»»  
null
»»! %
)
»»% &
_certificates
»»' 4
.
»»4 5
Clear
»»5 :
(
»»: ;
)
»»; <
;
»»< =
}
…… 	
public
œœ 
override
œœ 

XmlElement
œœ "
GetXml
œœ# )
(
œœ) *
)
œœ* +
{
–– 	
XmlDocument
—— 
xmlDocument
—— #
=
——$ %
new
——& )
XmlDocument
——* 5
(
——5 6
)
——6 7
;
——7 8
xmlDocument
““ 
.
““  
PreserveWhitespace
““ *
=
““+ ,
true
““- 1
;
““1 2
return
”” 
GetXml
”” 
(
”” 
xmlDocument
”” %
)
””% &
;
””& '
}
‘‘ 	
internal
÷÷ 
override
÷÷ 

XmlElement
÷÷ $
GetXml
÷÷% +
(
÷÷+ ,
XmlDocument
÷÷, 7
xmlDocument
÷÷8 C
)
÷÷C D
{
◊◊ 	

XmlElement
ÿÿ 
x509DataElement
ÿÿ &
=
ÿÿ' (
xmlDocument
ÿÿ) 4
.
ÿÿ4 5
CreateElement
ÿÿ5 B
(
ÿÿB C
$str
ÿÿC M
,
ÿÿM N
	SignedXml
ÿÿO X
.
ÿÿX Y!
XmlDsigNamespaceUrl
ÿÿY l
)
ÿÿl m
;
ÿÿm n
if
⁄⁄ 
(
⁄⁄ 
_issuerSerials
⁄⁄ 
!=
⁄⁄ !
null
⁄⁄" &
)
⁄⁄& '
{
€€ 
foreach
‹‹ 
(
‹‹ 
X509IssuerSerial
‹‹ )
issuerSerial
‹‹* 6
in
‹‹7 9
_issuerSerials
‹‹: H
)
‹‹H I
{
›› 

XmlElement
ﬁﬁ !
issuerSerialElement
ﬁﬁ 2
=
ﬁﬁ3 4
xmlDocument
ﬁﬁ5 @
.
ﬁﬁ@ A
CreateElement
ﬁﬁA N
(
ﬁﬁN O
$str
ﬁﬁO a
,
ﬁﬁa b
	SignedXml
ﬁﬁc l
.
ﬁﬁl m"
XmlDsigNamespaceUrlﬁﬁm Ä
)ﬁﬁÄ Å
;ﬁﬁÅ Ç

XmlElement
ﬂﬂ 
issuerNameElement
ﬂﬂ 0
=
ﬂﬂ1 2
xmlDocument
ﬂﬂ3 >
.
ﬂﬂ> ?
CreateElement
ﬂﬂ? L
(
ﬂﬂL M
$str
ﬂﬂM ]
,
ﬂﬂ] ^
	SignedXml
ﬂﬂ_ h
.
ﬂﬂh i!
XmlDsigNamespaceUrl
ﬂﬂi |
)
ﬂﬂ| }
;
ﬂﬂ} ~
issuerNameElement
‡‡ %
.
‡‡% &
AppendChild
‡‡& 1
(
‡‡1 2
xmlDocument
‡‡2 =
.
‡‡= >
CreateTextNode
‡‡> L
(
‡‡L M
issuerSerial
‡‡M Y
.
‡‡Y Z

IssuerName
‡‡Z d
)
‡‡d e
)
‡‡e f
;
‡‡f g!
issuerSerialElement
·· '
.
··' (
AppendChild
··( 3
(
··3 4
issuerNameElement
··4 E
)
··E F
;
··F G

XmlElement
‚‚ !
serialNumberElement
‚‚ 2
=
‚‚3 4
xmlDocument
‚‚5 @
.
‚‚@ A
CreateElement
‚‚A N
(
‚‚N O
$str
‚‚O a
,
‚‚a b
	SignedXml
‚‚c l
.
‚‚l m"
XmlDsigNamespaceUrl‚‚m Ä
)‚‚Ä Å
;‚‚Å Ç!
serialNumberElement
„„ '
.
„„' (
AppendChild
„„( 3
(
„„3 4
xmlDocument
„„4 ?
.
„„? @
CreateTextNode
„„@ N
(
„„N O
issuerSerial
„„O [
.
„„[ \
SerialNumber
„„\ h
)
„„h i
)
„„i j
;
„„j k!
issuerSerialElement
‰‰ '
.
‰‰' (
AppendChild
‰‰( 3
(
‰‰3 4!
serialNumberElement
‰‰4 G
)
‰‰G H
;
‰‰H I
x509DataElement
ÂÂ #
.
ÂÂ# $
AppendChild
ÂÂ$ /
(
ÂÂ/ 0!
issuerSerialElement
ÂÂ0 C
)
ÂÂC D
;
ÂÂD E
}
ÊÊ 
}
ÁÁ 
if
ÈÈ 
(
ÈÈ 
_subjectKeyIds
ÈÈ 
!=
ÈÈ !
null
ÈÈ" &
)
ÈÈ& '
{
ÍÍ 
foreach
ÎÎ 
(
ÎÎ 
byte
ÎÎ 
[
ÎÎ 
]
ÎÎ 
subjectKeyId
ÎÎ  ,
in
ÎÎ- /
_subjectKeyIds
ÎÎ0 >
)
ÎÎ> ?
{
ÏÏ 

XmlElement
ÌÌ !
subjectKeyIdElement
ÌÌ 2
=
ÌÌ3 4
xmlDocument
ÌÌ5 @
.
ÌÌ@ A
CreateElement
ÌÌA N
(
ÌÌN O
$str
ÌÌO X
,
ÌÌX Y
	SignedXml
ÌÌZ c
.
ÌÌc d!
XmlDsigNamespaceUrl
ÌÌd w
)
ÌÌw x
;
ÌÌx y!
subjectKeyIdElement
ÓÓ '
.
ÓÓ' (
AppendChild
ÓÓ( 3
(
ÓÓ3 4
xmlDocument
ÓÓ4 ?
.
ÓÓ? @
CreateTextNode
ÓÓ@ N
(
ÓÓN O
Convert
ÓÓO V
.
ÓÓV W
ToBase64String
ÓÓW e
(
ÓÓe f
subjectKeyId
ÓÓf r
)
ÓÓr s
)
ÓÓs t
)
ÓÓt u
;
ÓÓu v
x509DataElement
ÔÔ #
.
ÔÔ# $
AppendChild
ÔÔ$ /
(
ÔÔ/ 0!
subjectKeyIdElement
ÔÔ0 C
)
ÔÔC D
;
ÔÔD E
}
 
}
ÒÒ 
if
ÛÛ 
(
ÛÛ 
_subjectNames
ÛÛ 
!=
ÛÛ  
null
ÛÛ! %
)
ÛÛ% &
{
ÙÙ 
foreach
ıı 
(
ıı 
string
ıı 
subjectName
ıı  +
in
ıı, .
_subjectNames
ıı/ <
)
ıı< =
{
ˆˆ 

XmlElement
˜˜  
subjectNameElement
˜˜ 1
=
˜˜2 3
xmlDocument
˜˜4 ?
.
˜˜? @
CreateElement
˜˜@ M
(
˜˜M N
$str
˜˜N _
,
˜˜_ `
	SignedXml
˜˜a j
.
˜˜j k!
XmlDsigNamespaceUrl
˜˜k ~
)
˜˜~ 
;˜˜ Ä 
subjectNameElement
¯¯ &
.
¯¯& '
AppendChild
¯¯' 2
(
¯¯2 3
xmlDocument
¯¯3 >
.
¯¯> ?
CreateTextNode
¯¯? M
(
¯¯M N
subjectName
¯¯N Y
)
¯¯Y Z
)
¯¯Z [
;
¯¯[ \
x509DataElement
˘˘ #
.
˘˘# $
AppendChild
˘˘$ /
(
˘˘/ 0 
subjectNameElement
˘˘0 B
)
˘˘B C
;
˘˘C D
}
˙˙ 
}
˚˚ 
if
˝˝ 
(
˝˝ 
_certificates
˝˝ 
!=
˝˝  
null
˝˝! %
)
˝˝% &
{
˛˛ 
foreach
ˇˇ 
(
ˇˇ 
X509Certificate
ˇˇ (
certificate
ˇˇ) 4
in
ˇˇ5 7
_certificates
ˇˇ8 E
)
ˇˇE F
{
ÄÄ 

XmlElement
ÅÅ 
x509Element
ÅÅ *
=
ÅÅ+ ,
xmlDocument
ÅÅ- 8
.
ÅÅ8 9
CreateElement
ÅÅ9 F
(
ÅÅF G
$str
ÅÅG X
,
ÅÅX Y
	SignedXml
ÅÅZ c
.
ÅÅc d!
XmlDsigNamespaceUrl
ÅÅd w
)
ÅÅw x
;
ÅÅx y
x509Element
ÇÇ 
.
ÇÇ  
AppendChild
ÇÇ  +
(
ÇÇ+ ,
xmlDocument
ÇÇ, 7
.
ÇÇ7 8
CreateTextNode
ÇÇ8 F
(
ÇÇF G
Convert
ÇÇG N
.
ÇÇN O
ToBase64String
ÇÇO ]
(
ÇÇ] ^
certificate
ÇÇ^ i
.
ÇÇi j

GetEncoded
ÇÇj t
(
ÇÇt u
)
ÇÇu v
)
ÇÇv w
)
ÇÇw x
)
ÇÇx y
;
ÇÇy z
x509DataElement
ÉÉ #
.
ÉÉ# $
AppendChild
ÉÉ$ /
(
ÉÉ/ 0
x509Element
ÉÉ0 ;
)
ÉÉ; <
;
ÉÉ< =
}
ÑÑ 
}
ÖÖ 
if
áá 
(
áá 
_CRL
áá 
!=
áá 
null
áá 
)
áá 
{
àà 

XmlElement
ââ 

crlElement
ââ %
=
ââ& '
xmlDocument
ââ( 3
.
ââ3 4
CreateElement
ââ4 A
(
ââA B
$str
ââB K
,
ââK L
	SignedXml
ââM V
.
ââV W!
XmlDsigNamespaceUrl
ââW j
)
ââj k
;
ââk l

crlElement
ää 
.
ää 
AppendChild
ää &
(
ää& '
xmlDocument
ää' 2
.
ää2 3
CreateTextNode
ää3 A
(
ääA B
Convert
ääB I
.
ääI J
ToBase64String
ääJ X
(
ääX Y
_CRL
ääY ]
)
ää] ^
)
ää^ _
)
ää_ `
;
ää` a
x509DataElement
ãã 
.
ãã  
AppendChild
ãã  +
(
ãã+ ,

crlElement
ãã, 6
)
ãã6 7
;
ãã7 8
}
åå 
return
éé 
x509DataElement
éé "
;
éé" #
}
èè 	
public
ëë 
override
ëë 
void
ëë 
LoadXml
ëë $
(
ëë$ %

XmlElement
ëë% /
element
ëë0 7
)
ëë7 8
{
íí 	
if
ìì 
(
ìì 
element
ìì 
==
ìì 
null
ìì 
)
ìì  
throw
îî 
new
îî #
ArgumentNullException
îî /
(
îî/ 0
nameof
îî0 6
(
îî6 7
element
îî7 >
)
îî> ?
)
îî? @
;
îî@ A!
XmlNamespaceManager
ññ 
nsm
ññ  #
=
ññ$ %
new
ññ& )!
XmlNamespaceManager
ññ* =
(
ññ= >
element
ññ> E
.
ññE F
OwnerDocument
ññF S
.
ññS T
	NameTable
ññT ]
)
ññ] ^
;
ññ^ _
nsm
óó 
.
óó 
AddNamespace
óó 
(
óó 
$str
óó !
,
óó! "
	SignedXml
óó# ,
.
óó, -!
XmlDsigNamespaceUrl
óó- @
)
óó@ A
;
óóA B
XmlNodeList
ôô #
x509IssuerSerialNodes
ôô -
=
ôô. /
element
ôô0 7
.
ôô7 8
SelectNodes
ôô8 C
(
ôôC D
$str
ôôD Y
,
ôôY Z
nsm
ôô[ ^
)
ôô^ _
;
ôô_ `
XmlNodeList
öö 
x509SKINodes
öö $
=
öö% &
element
öö' .
.
öö. /
SelectNodes
öö/ :
(
öö: ;
$str
öö; G
,
ööG H
nsm
ööI L
)
ööL M
;
ööM N
XmlNodeList
õõ "
x509SubjectNameNodes
õõ ,
=
õõ- .
element
õõ/ 6
.
õõ6 7
SelectNodes
õõ7 B
(
õõB C
$str
õõC W
,
õõW X
nsm
õõY \
)
õõ\ ]
;
õõ] ^
XmlNodeList
úú "
x509CertificateNodes
úú ,
=
úú- .
element
úú/ 6
.
úú6 7
SelectNodes
úú7 B
(
úúB C
$str
úúC W
,
úúW X
nsm
úúY \
)
úú\ ]
;
úú] ^
XmlNodeList
ùù 
x509CRLNodes
ùù $
=
ùù% &
element
ùù' .
.
ùù. /
SelectNodes
ùù/ :
(
ùù: ;
$str
ùù; G
,
ùùG H
nsm
ùùI L
)
ùùL M
;
ùùM N
if
üü 
(
üü 
(
üü 
x509CRLNodes
üü 
.
üü 
Count
üü #
==
üü$ &
$num
üü' (
&&
üü) +#
x509IssuerSerialNodes
üü, A
.
üüA B
Count
üüB G
==
üüH J
$num
üüK L
&&
üüM O
x509SKINodes
üüP \
.
üü\ ]
Count
üü] b
==
üüc e
$num
üüf g
&&
†† "
x509SubjectNameNodes
†† +
.
††+ ,
Count
††, 1
==
††2 4
$num
††5 6
&&
††7 9"
x509CertificateNodes
††: N
.
††N O
Count
††O T
==
††U W
$num
††X Y
)
††Y Z
)
††Z [
throw
°° 
new
°° 
System
°°  
.
°°  !
Security
°°! )
.
°°) *
Cryptography
°°* 6
.
°°6 7$
CryptographicException
°°7 M
(
°°M N
SR
°°N P
.
°°P Q-
Cryptography_Xml_InvalidElement
°°Q p
,
°°p q
$str
°°r |
)
°°| }
;
°°} ~
Clear
§§ 
(
§§ 
)
§§ 
;
§§ 
if
¶¶ 
(
¶¶ 
x509CRLNodes
¶¶ 
.
¶¶ 
Count
¶¶ "
!=
¶¶# %
$num
¶¶& '
)
¶¶' (
_CRL
ßß 
=
ßß 
Convert
ßß 
.
ßß 
FromBase64String
ßß /
(
ßß/ 0
Utils
ßß0 5
.
ßß5 6 
DiscardWhiteSpaces
ßß6 H
(
ßßH I
x509CRLNodes
ßßI U
.
ßßU V
Item
ßßV Z
(
ßßZ [
$num
ßß[ \
)
ßß\ ]
.
ßß] ^
	InnerText
ßß^ g
)
ßßg h
)
ßßh i
;
ßßi j
foreach
©© 
(
©© 
XmlNode
©© 
issuerSerialNode
©© -
in
©©. 0#
x509IssuerSerialNodes
©©1 F
)
©©F G
{
™™ 
XmlNode
´´  
x509IssuerNameNode
´´ *
=
´´+ ,
issuerSerialNode
´´- =
.
´´= >
SelectSingleNode
´´> N
(
´´N O
$str
´´O b
,
´´b c
nsm
´´d g
)
´´g h
;
´´h i
XmlNode
¨¨ "
x509SerialNumberNode
¨¨ ,
=
¨¨- .
issuerSerialNode
¨¨/ ?
.
¨¨? @
SelectSingleNode
¨¨@ P
(
¨¨P Q
$str
¨¨Q f
,
¨¨f g
nsm
¨¨h k
)
¨¨k l
;
¨¨l m
if
≠≠ 
(
≠≠  
x509IssuerNameNode
≠≠ &
==
≠≠' )
null
≠≠* .
||
≠≠/ 1"
x509SerialNumberNode
≠≠2 F
==
≠≠G I
null
≠≠J N
)
≠≠N O
throw
ÆÆ 
new
ÆÆ 
System
ÆÆ $
.
ÆÆ$ %
Security
ÆÆ% -
.
ÆÆ- .
Cryptography
ÆÆ. :
.
ÆÆ: ;$
CryptographicException
ÆÆ; Q
(
ÆÆQ R
SR
ÆÆR T
.
ÆÆT U-
Cryptography_Xml_InvalidElement
ÆÆU t
,
ÆÆt u
$strÆÆv Ñ
)ÆÆÑ Ö
;ÆÆÖ Ü%
InternalAddIssuerSerial
ØØ '
(
ØØ' ( 
x509IssuerNameNode
ØØ( :
.
ØØ: ;
	InnerText
ØØ; D
.
ØØD E
Trim
ØØE I
(
ØØI J
)
ØØJ K
,
ØØK L"
x509SerialNumberNode
ØØM a
.
ØØa b
	InnerText
ØØb k
.
ØØk l
Trim
ØØl p
(
ØØp q
)
ØØq r
)
ØØr s
;
ØØs t
}
∞∞ 
foreach
≤≤ 
(
≤≤ 
XmlNode
≤≤ 
node
≤≤ !
in
≤≤" $
x509SKINodes
≤≤% 1
)
≤≤1 2
{
≥≥ 
AddSubjectKeyId
¥¥ 
(
¥¥  
Convert
¥¥  '
.
¥¥' (
FromBase64String
¥¥( 8
(
¥¥8 9
Utils
¥¥9 >
.
¥¥> ? 
DiscardWhiteSpaces
¥¥? Q
(
¥¥Q R
node
¥¥R V
.
¥¥V W
	InnerText
¥¥W `
)
¥¥` a
)
¥¥a b
)
¥¥b c
;
¥¥c d
}
µµ 
foreach
∑∑ 
(
∑∑ 
XmlNode
∑∑ 
node
∑∑ !
in
∑∑" $"
x509SubjectNameNodes
∑∑% 9
)
∑∑9 :
{
∏∏ 
AddSubjectName
ππ 
(
ππ 
node
ππ #
.
ππ# $
	InnerText
ππ$ -
.
ππ- .
Trim
ππ. 2
(
ππ2 3
)
ππ3 4
)
ππ4 5
;
ππ5 6
}
∫∫ 
var
ºº 
parser
ºº 
=
ºº 
new
ºº #
X509CertificateParser
ºº 2
(
ºº2 3
)
ºº3 4
;
ºº4 5
foreach
ΩΩ 
(
ΩΩ 
XmlNode
ΩΩ 
node
ΩΩ !
in
ΩΩ" $"
x509CertificateNodes
ΩΩ% 9
)
ΩΩ9 :
{
ææ 
var
øø 
cert
øø 
=
øø 
Convert
øø "
.
øø" #
FromBase64String
øø# 3
(
øø3 4
Utils
øø4 9
.
øø9 : 
DiscardWhiteSpaces
øø: L
(
øøL M
node
øøM Q
.
øøQ R
	InnerText
øøR [
)
øø[ \
)
øø\ ]
;
øø] ^
AddCertificate
¿¿ 
(
¿¿ 
parser
¿¿ %
.
¿¿% &
ReadCertificate
¿¿& 5
(
¿¿5 6
cert
¿¿6 :
)
¿¿: ;
)
¿¿; <
;
¿¿< =
}
¡¡ 
}
¬¬ 	
}
√√ 
}ƒƒ ¡

7C:\code\bc-xml-security\refactoring\src\KeyReference.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

sealed 
class 
KeyReference $
:% &
EncryptedReference' 9
{ 
public 
KeyReference 
( 
) 
: 
base  $
($ %
)% &
{ 	
ReferenceType 
= 
$str *
;* +
} 	
public 
KeyReference 
( 
string "
uri# &
)& '
:( )
base* .
(. /
uri/ 2
)2 3
{ 	
ReferenceType 
= 
$str *
;* +
} 	
public 
KeyReference 
( 
string "
uri# &
,& '
TransformChain( 6
transformChain7 E
)E F
:G H
baseI M
(M N
uriN Q
,Q R
transformChainS a
)a b
{ 	
ReferenceType 
= 
$str *
;* +
} 	
} 
} ˜
8C:\code\bc-xml-security\refactoring\src\MyXmlDocument.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
MyXmlDocument  
:! "
XmlDocument# .
{ 
	protected 
override 
XmlAttribute '"
CreateDefaultAttribute( >
(> ?
string? E
prefixF L
,L M
stringN T
	localNameU ^
,^ _
string` f
namespaceURIg s
)s t
{ 	
return 
CreateAttribute "
(" #
prefix# )
,) *
	localName+ 4
,4 5
namespaceURI6 B
)B C
;C D
} 	
} 
} ∫
9C:\code\bc-xml-security\refactoring\src\NamespaceFrame.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
NamespaceFrame !
{ 
private 
	Hashtable 
	_rendered #
=$ %
new& )
	Hashtable* 3
(3 4
)4 5
;5 6
private 
	Hashtable 
_unrendered %
=& '
new( +
	Hashtable, 5
(5 6
)6 7
;7 8
internal 
NamespaceFrame 
(  
)  !
{" #
}$ %
internal 
void 
AddRendered !
(! "
XmlAttribute" .
attr/ 3
)3 4
{ 	
	_rendered 
. 
Add 
( 
Utils 
.  
GetNamespacePrefix  2
(2 3
attr3 7
)7 8
,8 9
attr: >
)> ?
;? @
} 	
internal 
XmlAttribute 
GetRendered )
() *
string* 0
nsPrefix1 9
)9 :
{ 	
return 
( 
XmlAttribute  
)  !
	_rendered! *
[* +
nsPrefix+ 3
]3 4
;4 5
} 	
internal!! 
void!! 
AddUnrendered!! #
(!!# $
XmlAttribute!!$ 0
attr!!1 5
)!!5 6
{"" 	
_unrendered## 
.## 
Add## 
(## 
Utils## !
.##! "
GetNamespacePrefix##" 4
(##4 5
attr##5 9
)##9 :
,##: ;
attr##< @
)##@ A
;##A B
}$$ 	
internal&& 
XmlAttribute&& 
GetUnrendered&& +
(&&+ ,
string&&, 2
nsPrefix&&3 ;
)&&; <
{'' 	
return(( 
((( 
XmlAttribute((  
)((  !
_unrendered((! ,
[((, -
nsPrefix((- 5
]((5 6
;((6 7
})) 	
internal++ 
	Hashtable++ 
GetUnrendered++ (
(++( )
)++) *
{,, 	
return-- 
_unrendered-- 
;-- 
}.. 	
}// 
}00 ∞
=C:\code\bc-xml-security\refactoring\src\NamespaceSortOrder.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
NamespaceSortOrder %
:& '
	IComparer( 1
{ 
internal 
NamespaceSortOrder #
(# $
)$ %
{& '
}( )
public 
int 
Compare 
( 
object !
a" #
,# $
object% +
b, -
)- .
{ 	
XmlNode 
nodeA 
= 
a 
as  
XmlNode! (
;( )
XmlNode 
nodeB 
= 
b 
as  
XmlNode! (
;( )
if 
( 
( 
nodeA 
== 
null 
) 
||  "
(# $
nodeB$ )
==* ,
null- 1
)1 2
)2 3
throw 
new 
ArgumentException +
(+ ,
), -
;- .
bool 
nodeAdefault 
= 
Utils  %
.% &"
IsDefaultNamespaceNode& <
(< =
nodeA= B
)B C
;C D
bool 
nodeBdefault 
= 
Utils  %
.% &"
IsDefaultNamespaceNode& <
(< =
nodeB= B
)B C
;C D
if 
( 
nodeAdefault 
&& 
nodeBdefault  ,
), -
return. 4
$num5 6
;6 7
if 
( 
nodeAdefault 
) 
return $
-% &
$num& '
;' (
if 
( 
nodeBdefault 
) 
return $
$num% &
;& '
return 
string 
. 
CompareOrdinal (
(( )
nodeA) .
.. /
	LocalName/ 8
,8 9
nodeB: ?
.? @
	LocalName@ I
)I J
;J K
} 	
} 
} Ì
BC:\code\bc-xml-security\refactoring\src\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str ;
); <
]< =
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 a
)		a b
]		b c
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
$str ,
), -
]- .
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
]$$) *’ç
4C:\code\bc-xml-security\refactoring\src\Reference.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
	Reference 
{ 
internal 
const 
string 
DefaultDigestMethod 1
=2 3
	SignedXml4 =
.= >
XmlDsigSHA256Url> N
;N O
private 
string 
_id 
; 
private 
string 
_uri 
; 
private 
string 
_type 
; 
private 
TransformChain 
_transformChain .
;. /
private 
string 
_digestMethod $
;$ %
private 
byte 
[ 
] 
_digestValue #
;# $
private 
IHash 
_hashAlgorithm $
;$ %
private 
object 

_refTarget !
;! "
private 
ReferenceTargetType #
_refTargetType$ 2
;2 3
private 

XmlElement 

_cachedXml %
;% &
private 
	SignedXml 

_signedXml $
=% &
null' +
;+ ,
internal  
CanonicalXmlNodeList %
_namespaces& 1
=2 3
null4 8
;8 9
private   
byte   
[   
]   
_hashval   
=    !
null  " &
;  & '
public&& 
	Reference&& 
(&& 
)&& 
{'' 	
_transformChain(( 
=(( 
new(( !
TransformChain((" 0
(((0 1
)((1 2
;((2 3

_refTarget)) 
=)) 
null)) 
;)) 
_refTargetType** 
=** 
ReferenceTargetType** 0
.**0 1
UriReference**1 =
;**= >

_cachedXml++ 
=++ 
null++ 
;++ 
_digestMethod,, 
=,, 
DefaultDigestMethod,, /
;,,/ 0
}-- 	
public// 
	Reference// 
(// 
Stream// 
stream//  &
)//& '
{00 	
_transformChain11 
=11 
new11 !
TransformChain11" 0
(110 1
)111 2
;112 3

_refTarget22 
=22 
stream22 
;22  
_refTargetType33 
=33 
ReferenceTargetType33 0
.330 1
Stream331 7
;337 8

_cachedXml44 
=44 
null44 
;44 
_digestMethod55 
=55 
DefaultDigestMethod55 /
;55/ 0
}66 	
public88 
	Reference88 
(88 
string88 
uri88  #
)88# $
{99 	
_transformChain:: 
=:: 
new:: !
TransformChain::" 0
(::0 1
)::1 2
;::2 3

_refTarget;; 
=;; 
uri;; 
;;; 
_uri<< 
=<< 
uri<< 
;<< 
_refTargetType== 
=== 
ReferenceTargetType== 0
.==0 1
UriReference==1 =
;=== >

_cachedXml>> 
=>> 
null>> 
;>> 
_digestMethod?? 
=?? 
DefaultDigestMethod?? /
;??/ 0
}@@ 	
internalBB 
	ReferenceBB 
(BB 

XmlElementBB %
elementBB& -
)BB- .
{CC 	
_transformChainDD 
=DD 
newDD !
TransformChainDD" 0
(DD0 1
)DD1 2
;DD2 3

_refTargetEE 
=EE 
elementEE  
;EE  !
_refTargetTypeFF 
=FF 
ReferenceTargetTypeFF 0
.FF0 1

XmlElementFF1 ;
;FF; <

_cachedXmlGG 
=GG 
nullGG 
;GG 
_digestMethodHH 
=HH 
DefaultDigestMethodHH /
;HH/ 0
}II 	
publicOO 
stringOO 
IdOO 
{PP 	
getQQ 
{QQ 
returnQQ 
_idQQ 
;QQ 
}QQ 
setRR 
{RR 
_idRR 
=RR 
valueRR 
;RR 
}RR  
}SS 	
publicUU 
stringUU 
UriUU 
{VV 	
getWW 
{WW 
returnWW 
_uriWW 
;WW 
}WW  
setXX 
{YY 
_uriZZ 
=ZZ 
valueZZ 
;ZZ 

_cachedXml[[ 
=[[ 
null[[ !
;[[! "
}\\ 
}]] 	
public__ 
string__ 
Type__ 
{`` 	
getaa 
{aa 
returnaa 
_typeaa 
;aa 
}aa  !
setbb 
{cc 
_typedd 
=dd 
valuedd 
;dd 

_cachedXmlee 
=ee 
nullee !
;ee! "
}ff 
}gg 	
publicii 
stringii 
DigestMethodii "
{jj 	
getkk 
{kk 
returnkk 
_digestMethodkk &
;kk& '
}kk( )
setll 
{mm 
_digestMethodnn 
=nn 
valuenn  %
;nn% &

_cachedXmloo 
=oo 
nulloo !
;oo! "
}pp 
}qq 	
publicss 
bytess 
[ss 
]ss 
DigestValuess !
{tt 	
getuu 
{uu 
returnuu 
_digestValueuu %
;uu% &
}uu' (
setvv 
{ww 
_digestValuexx 
=xx 
valuexx $
;xx$ %

_cachedXmlyy 
=yy 
nullyy !
;yy! "
}zz 
}{{ 	
public}} 
TransformChain}} 
TransformChain}} ,
{~~ 	
get 
{
ÄÄ 
if
ÅÅ 
(
ÅÅ 
_transformChain
ÅÅ #
==
ÅÅ$ &
null
ÅÅ' +
)
ÅÅ+ ,
_transformChain
ÇÇ #
=
ÇÇ$ %
new
ÇÇ& )
TransformChain
ÇÇ* 8
(
ÇÇ8 9
)
ÇÇ9 :
;
ÇÇ: ;
return
ÉÉ 
_transformChain
ÉÉ &
;
ÉÉ& '
}
ÑÑ 
set
ÖÖ 
{
ÜÜ 
_transformChain
áá 
=
áá  !
value
áá" '
;
áá' (

_cachedXml
àà 
=
àà 
null
àà !
;
àà! "
}
ââ 
}
ää 	
internal
åå 
bool
åå 

CacheValid
åå  
{
çç 	
get
éé 
{
èè 
return
êê 
(
êê 

_cachedXml
êê "
!=
êê# %
null
êê& *
)
êê* +
;
êê+ ,
}
ëë 
}
íí 	
internal
îî 
	SignedXml
îî 
	SignedXml
îî $
{
ïï 	
get
ññ 
{
ññ 
return
ññ 

_signedXml
ññ #
;
ññ# $
}
ññ% &
set
óó 
{
óó 

_signedXml
óó 
=
óó 
value
óó $
;
óó$ %
}
óó& '
}
òò 	
internal
öö !
ReferenceTargetType
öö $!
ReferenceTargetType
öö% 8
{
õõ 	
get
úú 
{
ùù 
return
ûû 
_refTargetType
ûû %
;
ûû% &
}
üü 
}
†† 	
public
¶¶ 

XmlElement
¶¶ 
GetXml
¶¶  
(
¶¶  !
)
¶¶! "
{
ßß 	
if
®® 
(
®® 

CacheValid
®® 
)
®® 
return
®® "
(
®®# $

_cachedXml
®®$ .
)
®®. /
;
®®/ 0
XmlDocument
™™ 
document
™™  
=
™™! "
new
™™# &
XmlDocument
™™' 2
(
™™2 3
)
™™3 4
;
™™4 5
document
´´ 
.
´´  
PreserveWhitespace
´´ '
=
´´( )
true
´´* .
;
´´. /
return
¨¨ 
GetXml
¨¨ 
(
¨¨ 
document
¨¨ "
)
¨¨" #
;
¨¨# $
}
≠≠ 	
internal
ØØ 

XmlElement
ØØ 
GetXml
ØØ "
(
ØØ" #
XmlDocument
ØØ# .
document
ØØ/ 7
)
ØØ7 8
{
∞∞ 	

XmlElement
≤≤ 
referenceElement
≤≤ '
=
≤≤( )
document
≤≤* 2
.
≤≤2 3
CreateElement
≤≤3 @
(
≤≤@ A
$str
≤≤A L
,
≤≤L M
	SignedXml
≤≤N W
.
≤≤W X!
XmlDsigNamespaceUrl
≤≤X k
)
≤≤k l
;
≤≤l m
if
¥¥ 
(
¥¥ 
!
¥¥ 
string
¥¥ 
.
¥¥ 
IsNullOrEmpty
¥¥ %
(
¥¥% &
_id
¥¥& )
)
¥¥) *
)
¥¥* +
referenceElement
µµ  
.
µµ  !
SetAttribute
µµ! -
(
µµ- .
$str
µµ. 2
,
µµ2 3
_id
µµ4 7
)
µµ7 8
;
µµ8 9
if
∑∑ 
(
∑∑ 
_uri
∑∑ 
!=
∑∑ 
null
∑∑ 
)
∑∑ 
referenceElement
∏∏  
.
∏∏  !
SetAttribute
∏∏! -
(
∏∏- .
$str
∏∏. 3
,
∏∏3 4
_uri
∏∏5 9
)
∏∏9 :
;
∏∏: ;
if
∫∫ 
(
∫∫ 
!
∫∫ 
string
∫∫ 
.
∫∫ 
IsNullOrEmpty
∫∫ %
(
∫∫% &
_type
∫∫& +
)
∫∫+ ,
)
∫∫, -
referenceElement
ªª  
.
ªª  !
SetAttribute
ªª! -
(
ªª- .
$str
ªª. 4
,
ªª4 5
_type
ªª6 ;
)
ªª; <
;
ªª< =
if
ææ 
(
ææ 
TransformChain
ææ 
.
ææ 
Count
ææ $
!=
ææ% '
$num
ææ( )
)
ææ) *
referenceElement
øø  
.
øø  !
AppendChild
øø! ,
(
øø, -
TransformChain
øø- ;
.
øø; <
GetXml
øø< B
(
øøB C
document
øøC K
,
øøK L
	SignedXml
øøM V
.
øøV W!
XmlDsigNamespaceUrl
øøW j
)
øøj k
)
øøk l
;
øøl m
if
¬¬ 
(
¬¬ 
string
¬¬ 
.
¬¬ 
IsNullOrEmpty
¬¬ $
(
¬¬$ %
_digestMethod
¬¬% 2
)
¬¬2 3
)
¬¬3 4
throw
√√ 
new
√√ 
System
√√  
.
√√  !
Security
√√! )
.
√√) *
Cryptography
√√* 6
.
√√6 7$
CryptographicException
√√7 M
(
√√M N
SR
√√N P
.
√√P Q3
%Cryptography_Xml_DigestMethodRequired
√√Q v
)
√√v w
;
√√w x

XmlElement
≈≈ !
digestMethodElement
≈≈ *
=
≈≈+ ,
document
≈≈- 5
.
≈≈5 6
CreateElement
≈≈6 C
(
≈≈C D
$str
≈≈D R
,
≈≈R S
	SignedXml
≈≈T ]
.
≈≈] ^!
XmlDsigNamespaceUrl
≈≈^ q
)
≈≈q r
;
≈≈r s!
digestMethodElement
∆∆ 
.
∆∆  
SetAttribute
∆∆  ,
(
∆∆, -
$str
∆∆- 8
,
∆∆8 9
_digestMethod
∆∆: G
)
∆∆G H
;
∆∆H I
referenceElement
«« 
.
«« 
AppendChild
«« (
(
««( )!
digestMethodElement
««) <
)
««< =
;
««= >
if
…… 
(
…… 
DigestValue
…… 
==
…… 
null
…… #
)
……# $
{
   
if
ÀÀ 
(
ÀÀ 
_hashval
ÀÀ 
==
ÀÀ 
null
ÀÀ  $
)
ÀÀ$ %
throw
ÃÃ 
new
ÃÃ 
System
ÃÃ $
.
ÃÃ$ %
Security
ÃÃ% -
.
ÃÃ- .
Cryptography
ÃÃ. :
.
ÃÃ: ;$
CryptographicException
ÃÃ; Q
(
ÃÃQ R
SR
ÃÃR T
.
ÃÃT U2
$Cryptography_Xml_DigestValueRequired
ÃÃU y
)
ÃÃy z
;
ÃÃz {
DigestValue
ÕÕ 
=
ÕÕ 
_hashval
ÕÕ &
;
ÕÕ& '
}
ŒŒ 

XmlElement
––  
digestValueElement
–– )
=
––* +
document
––, 4
.
––4 5
CreateElement
––5 B
(
––B C
$str
––C P
,
––P Q
	SignedXml
––R [
.
––[ \!
XmlDsigNamespaceUrl
––\ o
)
––o p
;
––p q 
digestValueElement
—— 
.
—— 
AppendChild
—— *
(
——* +
document
——+ 3
.
——3 4
CreateTextNode
——4 B
(
——B C
Convert
——C J
.
——J K
ToBase64String
——K Y
(
——Y Z
_digestValue
——Z f
)
——f g
)
——g h
)
——h i
;
——i j
referenceElement
““ 
.
““ 
AppendChild
““ (
(
““( ) 
digestValueElement
““) ;
)
““; <
;
““< =
return
‘‘ 
referenceElement
‘‘ #
;
‘‘# $
}
’’ 	
public
◊◊ 
void
◊◊ 
LoadXml
◊◊ 
(
◊◊ 

XmlElement
◊◊ &
value
◊◊' ,
)
◊◊, -
{
ÿÿ 	
if
ŸŸ 
(
ŸŸ 
value
ŸŸ 
==
ŸŸ 
null
ŸŸ 
)
ŸŸ 
throw
⁄⁄ 
new
⁄⁄ #
ArgumentNullException
⁄⁄ /
(
⁄⁄/ 0
nameof
⁄⁄0 6
(
⁄⁄6 7
value
⁄⁄7 <
)
⁄⁄< =
)
⁄⁄= >
;
⁄⁄> ?
_id
‹‹ 
=
‹‹ 
Utils
‹‹ 
.
‹‹ 
GetAttribute
‹‹ $
(
‹‹$ %
value
‹‹% *
,
‹‹* +
$str
‹‹, 0
,
‹‹0 1
	SignedXml
‹‹2 ;
.
‹‹; <!
XmlDsigNamespaceUrl
‹‹< O
)
‹‹O P
;
‹‹P Q
_uri
›› 
=
›› 
Utils
›› 
.
›› 
GetAttribute
›› %
(
››% &
value
››& +
,
››+ ,
$str
››- 2
,
››2 3
	SignedXml
››4 =
.
››= >!
XmlDsigNamespaceUrl
››> Q
)
››Q R
;
››R S
_type
ﬁﬁ 
=
ﬁﬁ 
Utils
ﬁﬁ 
.
ﬁﬁ 
GetAttribute
ﬁﬁ &
(
ﬁﬁ& '
value
ﬁﬁ' ,
,
ﬁﬁ, -
$str
ﬁﬁ. 4
,
ﬁﬁ4 5
	SignedXml
ﬁﬁ6 ?
.
ﬁﬁ? @!
XmlDsigNamespaceUrl
ﬁﬁ@ S
)
ﬁﬁS T
;
ﬁﬁT U
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
Utils
ﬂﬂ 
.
ﬂﬂ 
VerifyAttributes
ﬂﬂ '
(
ﬂﬂ' (
value
ﬂﬂ( -
,
ﬂﬂ- .
new
ﬂﬂ/ 2
string
ﬂﬂ3 9
[
ﬂﬂ9 :
]
ﬂﬂ: ;
{
ﬂﬂ< =
$str
ﬂﬂ> B
,
ﬂﬂB C
$str
ﬂﬂD I
,
ﬂﬂI J
$str
ﬂﬂK Q
}
ﬂﬂR S
)
ﬂﬂS T
)
ﬂﬂT U
throw
‡‡ 
new
‡‡ 
System
‡‡  
.
‡‡  !
Security
‡‡! )
.
‡‡) *
Cryptography
‡‡* 6
.
‡‡6 7$
CryptographicException
‡‡7 M
(
‡‡M N
SR
‡‡N P
.
‡‡P Q-
Cryptography_Xml_InvalidElement
‡‡Q p
,
‡‡p q
$str
‡‡r }
)
‡‡} ~
;
‡‡~ !
XmlNamespaceManager
‚‚ 
nsm
‚‚  #
=
‚‚$ %
new
‚‚& )!
XmlNamespaceManager
‚‚* =
(
‚‚= >
value
‚‚> C
.
‚‚C D
OwnerDocument
‚‚D Q
.
‚‚Q R
	NameTable
‚‚R [
)
‚‚[ \
;
‚‚\ ]
nsm
„„ 
.
„„ 
AddNamespace
„„ 
(
„„ 
$str
„„ !
,
„„! "
	SignedXml
„„# ,
.
„„, -!
XmlDsigNamespaceUrl
„„- @
)
„„@ A
;
„„A B
bool
ÊÊ 
hasTransforms
ÊÊ 
=
ÊÊ  
false
ÊÊ! &
;
ÊÊ& '
TransformChain
ÁÁ 
=
ÁÁ 
new
ÁÁ  
TransformChain
ÁÁ! /
(
ÁÁ/ 0
)
ÁÁ0 1
;
ÁÁ1 2
XmlNodeList
ËË 
transformsNodes
ËË '
=
ËË( )
value
ËË* /
.
ËË/ 0
SelectNodes
ËË0 ;
(
ËË; <
$str
ËË< K
,
ËËK L
nsm
ËËM P
)
ËËP Q
;
ËËQ R
if
ÈÈ 
(
ÈÈ 
transformsNodes
ÈÈ 
!=
ÈÈ  "
null
ÈÈ# '
&&
ÈÈ( *
transformsNodes
ÈÈ+ :
.
ÈÈ: ;
Count
ÈÈ; @
!=
ÈÈA C
$num
ÈÈD E
)
ÈÈE F
{
ÍÍ 
if
ÎÎ 
(
ÎÎ 
transformsNodes
ÎÎ #
.
ÎÎ# $
Count
ÎÎ$ )
>
ÎÎ* +
$num
ÎÎ, -
)
ÎÎ- .
{
ÏÏ 
throw
ÌÌ 
new
ÌÌ 
System
ÌÌ $
.
ÌÌ$ %
Security
ÌÌ% -
.
ÌÌ- .
Cryptography
ÌÌ. :
.
ÌÌ: ;$
CryptographicException
ÌÌ; Q
(
ÌÌQ R
SR
ÌÌR T
.
ÌÌT U-
Cryptography_Xml_InvalidElement
ÌÌU t
,
ÌÌt u
$strÌÌv å
)ÌÌå ç
;ÌÌç é
}
ÓÓ 
hasTransforms
ÔÔ 
=
ÔÔ 
true
ÔÔ  $
;
ÔÔ$ %

XmlElement
 
transformsElement
 ,
=
- .
transformsNodes
/ >
[
> ?
$num
? @
]
@ A
as
B D

XmlElement
E O
;
O P
if
ÒÒ 
(
ÒÒ 
!
ÒÒ 
Utils
ÒÒ 
.
ÒÒ 
VerifyAttributes
ÒÒ +
(
ÒÒ+ ,
transformsElement
ÒÒ, =
,
ÒÒ= >
(
ÒÒ? @
string
ÒÒ@ F
[
ÒÒF G
]
ÒÒG H
)
ÒÒH I
null
ÒÒI M
)
ÒÒM N
)
ÒÒN O
{
ÚÚ 
throw
ÛÛ 
new
ÛÛ 
System
ÛÛ $
.
ÛÛ$ %
Security
ÛÛ% -
.
ÛÛ- .
Cryptography
ÛÛ. :
.
ÛÛ: ;$
CryptographicException
ÛÛ; Q
(
ÛÛQ R
SR
ÛÛR T
.
ÛÛT U-
Cryptography_Xml_InvalidElement
ÛÛU t
,
ÛÛt u
$strÛÛv å
)ÛÛå ç
;ÛÛç é
}
ÙÙ 
XmlNodeList
ˆˆ 
transformNodes
ˆˆ *
=
ˆˆ+ ,
transformsElement
ˆˆ- >
.
ˆˆ> ?
SelectNodes
ˆˆ? J
(
ˆˆJ K
$str
ˆˆK Y
,
ˆˆY Z
nsm
ˆˆ[ ^
)
ˆˆ^ _
;
ˆˆ_ `
if
˜˜ 
(
˜˜ 
transformNodes
˜˜ "
!=
˜˜# %
null
˜˜& *
)
˜˜* +
{
¯¯ 
if
˘˘ 
(
˘˘ 
transformNodes
˘˘ &
.
˘˘& '
Count
˘˘' ,
!=
˘˘- /
transformsElement
˘˘0 A
.
˘˘A B
SelectNodes
˘˘B M
(
˘˘M N
$str
˘˘N Q
)
˘˘Q R
.
˘˘R S
Count
˘˘S X
)
˘˘X Y
{
˙˙ 
throw
˚˚ 
new
˚˚ !
System
˚˚" (
.
˚˚( )
Security
˚˚) 1
.
˚˚1 2
Cryptography
˚˚2 >
.
˚˚> ?$
CryptographicException
˚˚? U
(
˚˚U V
SR
˚˚V X
.
˚˚X Y-
Cryptography_Xml_InvalidElement
˚˚Y x
,
˚˚x y
$str˚˚z ê
)˚˚ê ë
;˚˚ë í
}
¸¸ 
if
˝˝ 
(
˝˝ 
transformNodes
˝˝ &
.
˝˝& '
Count
˝˝' ,
>
˝˝- .
Utils
˝˝/ 4
.
˝˝4 5'
MaxTransformsPerReference
˝˝5 N
)
˝˝N O
{
˛˛ 
throw
ˇˇ 
new
ˇˇ !
System
ˇˇ" (
.
ˇˇ( )
Security
ˇˇ) 1
.
ˇˇ1 2
Cryptography
ˇˇ2 >
.
ˇˇ> ?$
CryptographicException
ˇˇ? U
(
ˇˇU V
SR
ˇˇV X
.
ˇˇX Y-
Cryptography_Xml_InvalidElement
ˇˇY x
,
ˇˇx y
$strˇˇz ê
)ˇˇê ë
;ˇˇë í
}
ÄÄ 
foreach
ÅÅ 
(
ÅÅ 
XmlNode
ÅÅ $
transformNode
ÅÅ% 2
in
ÅÅ3 5
transformNodes
ÅÅ6 D
)
ÅÅD E
{
ÇÇ 

XmlElement
ÉÉ "
transformElement
ÉÉ# 3
=
ÉÉ4 5
transformNode
ÉÉ6 C
as
ÉÉD F

XmlElement
ÉÉG Q
;
ÉÉQ R
string
ÑÑ 
	algorithm
ÑÑ (
=
ÑÑ) *
Utils
ÑÑ+ 0
.
ÑÑ0 1
GetAttribute
ÑÑ1 =
(
ÑÑ= >
transformElement
ÑÑ> N
,
ÑÑN O
$str
ÑÑP [
,
ÑÑ[ \
	SignedXml
ÑÑ] f
.
ÑÑf g!
XmlDsigNamespaceUrl
ÑÑg z
)
ÑÑz {
;
ÑÑ{ |
if
ÖÖ 
(
ÖÖ 
	algorithm
ÖÖ %
==
ÖÖ& (
null
ÖÖ) -
||
ÖÖ. 0
!
ÖÖ1 2
Utils
ÖÖ2 7
.
ÖÖ7 8
VerifyAttributes
ÖÖ8 H
(
ÖÖH I
transformElement
ÖÖI Y
,
ÖÖY Z
$str
ÖÖ[ f
)
ÖÖf g
)
ÖÖg h
{
ÜÜ 
throw
áá !
new
áá" %
System
áá& ,
.
áá, -
Security
áá- 5
.
áá5 6
Cryptography
áá6 B
.
ááB C$
CryptographicException
ááC Y
(
ááY Z
SR
ááZ \
.
áá\ ]/
!Cryptography_Xml_UnknownTransform
áá] ~
)
áá~ 
;áá Ä
}
àà 
	Transform
ââ !
	transform
ââ" +
=
ââ, -
CryptoHelpers
ââ. ;
.
ââ; <
CreateFromName
ââ< J
<
ââJ K
	Transform
ââK T
>
ââT U
(
ââU V
	algorithm
ââV _
)
ââ_ `
;
ââ` a
if
ää 
(
ää 
	transform
ää %
==
ää& (
null
ää) -
)
ää- .
{
ãã 
throw
åå !
new
åå" %
System
åå& ,
.
åå, -
Security
åå- 5
.
åå5 6
Cryptography
åå6 B
.
ååB C$
CryptographicException
ååC Y
(
ååY Z
SR
ååZ \
.
åå\ ]/
!Cryptography_Xml_UnknownTransform
åå] ~
)
åå~ 
;åå Ä
}
çç 
AddTransform
éé $
(
éé$ %
	transform
éé% .
)
éé. /
;
éé/ 0
	transform
êê !
.
êê! "
LoadInnerXml
êê" .
(
êê. /
transformElement
êê/ ?
.
êê? @

ChildNodes
êê@ J
)
êêJ K
;
êêK L
if
íí 
(
íí 
	transform
íí %
is
íí& (0
"XmlDsigEnvelopedSignatureTransform
íí) K
)
ííK L
{
ìì 
XmlNode
ññ #
signatureTag
ññ$ 0
=
ññ1 2
transformElement
ññ3 C
.
ññC D
SelectSingleNode
ññD T
(
ññT U
$str
ññU p
,
ññp q
nsm
ññr u
)
ññu v
;
ññv w
XmlNodeList
óó '
signatureList
óó( 5
=
óó6 7
transformElement
óó8 H
.
óóH I
SelectNodes
óóI T
(
óóT U
$str
óóU e
,
óóe f
nsm
óóg j
)
óój k
;
óók l
if
òò 
(
òò  
signatureList
òò  -
!=
òò. 0
null
òò1 5
)
òò5 6
{
ôô 
int
öö  #
position
öö$ ,
=
öö- .
$num
öö/ 0
;
öö0 1
foreach
õõ  '
(
õõ( )
XmlNode
õõ) 0
node
õõ1 5
in
õõ6 8
signatureList
õõ9 F
)
õõF G
{
úú  !
position
ùù$ ,
++
ùù, .
;
ùù. /
if
ûû$ &
(
ûû' (
node
ûû( ,
==
ûû- /
signatureTag
ûû0 <
)
ûû< =
{
üü$ %
(
††( )
(
††) *0
"XmlDsigEnvelopedSignatureTransform
††* L
)
††L M
	transform
††M V
)
††V W
.
††W X
SignaturePosition
††X i
=
††j k
position
††l t
;
††t u
break
°°( -
;
°°- .
}
¢¢$ %
}
££  !
}
§§ 
}
•• 
}
¶¶ 
}
ßß 
}
®® 
XmlNodeList
´´ 
digestMethodNodes
´´ )
=
´´* +
value
´´, 1
.
´´1 2
SelectNodes
´´2 =
(
´´= >
$str
´´> O
,
´´O P
nsm
´´Q T
)
´´T U
;
´´U V
if
¨¨ 
(
¨¨ 
digestMethodNodes
¨¨ !
==
¨¨" $
null
¨¨% )
||
¨¨* ,
digestMethodNodes
¨¨- >
.
¨¨> ?
Count
¨¨? D
==
¨¨E G
$num
¨¨H I
||
¨¨J L
digestMethodNodes
¨¨M ^
.
¨¨^ _
Count
¨¨_ d
>
¨¨e f
$num
¨¨g h
)
¨¨h i
throw
≠≠ 
new
≠≠ 
System
≠≠  
.
≠≠  !
Security
≠≠! )
.
≠≠) *
Cryptography
≠≠* 6
.
≠≠6 7$
CryptographicException
≠≠7 M
(
≠≠M N
SR
≠≠N P
.
≠≠P Q-
Cryptography_Xml_InvalidElement
≠≠Q p
,
≠≠p q
$str≠≠r ä
)≠≠ä ã
;≠≠ã å

XmlElement
ÆÆ !
digestMethodElement
ÆÆ *
=
ÆÆ+ ,
digestMethodNodes
ÆÆ- >
[
ÆÆ> ?
$num
ÆÆ? @
]
ÆÆ@ A
as
ÆÆB D

XmlElement
ÆÆE O
;
ÆÆO P
_digestMethod
ØØ 
=
ØØ 
Utils
ØØ !
.
ØØ! "
GetAttribute
ØØ" .
(
ØØ. /!
digestMethodElement
ØØ/ B
,
ØØB C
$str
ØØD O
,
ØØO P
	SignedXml
ØØQ Z
.
ØØZ [!
XmlDsigNamespaceUrl
ØØ[ n
)
ØØn o
;
ØØo p
if
∞∞ 
(
∞∞ 
_digestMethod
∞∞ 
==
∞∞  
null
∞∞! %
||
∞∞& (
!
∞∞) *
Utils
∞∞* /
.
∞∞/ 0
VerifyAttributes
∞∞0 @
(
∞∞@ A!
digestMethodElement
∞∞A T
,
∞∞T U
$str
∞∞V a
)
∞∞a b
)
∞∞b c
throw
±± 
new
±± 
System
±±  
.
±±  !
Security
±±! )
.
±±) *
Cryptography
±±* 6
.
±±6 7$
CryptographicException
±±7 M
(
±±M N
SR
±±N P
.
±±P Q-
Cryptography_Xml_InvalidElement
±±Q p
,
±±p q
$str±±r ä
)±±ä ã
;±±ã å
XmlNodeList
µµ 
digestValueNodes
µµ (
=
µµ) *
value
µµ+ 0
.
µµ0 1
SelectNodes
µµ1 <
(
µµ< =
$str
µµ= M
,
µµM N
nsm
µµO R
)
µµR S
;
µµS T
if
∂∂ 
(
∂∂ 
digestValueNodes
∂∂  
==
∂∂! #
null
∂∂$ (
||
∂∂) +
digestValueNodes
∂∂, <
.
∂∂< =
Count
∂∂= B
==
∂∂C E
$num
∂∂F G
||
∂∂H J
digestValueNodes
∂∂K [
.
∂∂[ \
Count
∂∂\ a
>
∂∂b c
$num
∂∂d e
)
∂∂e f
throw
∑∑ 
new
∑∑ 
System
∑∑  
.
∑∑  !
Security
∑∑! )
.
∑∑) *
Cryptography
∑∑* 6
.
∑∑6 7$
CryptographicException
∑∑7 M
(
∑∑M N
SR
∑∑N P
.
∑∑P Q-
Cryptography_Xml_InvalidElement
∑∑Q p
,
∑∑p q
$str∑∑r â
)∑∑â ä
;∑∑ä ã

XmlElement
∏∏  
digestValueElement
∏∏ )
=
∏∏* +
digestValueNodes
∏∏, <
[
∏∏< =
$num
∏∏= >
]
∏∏> ?
as
∏∏@ B

XmlElement
∏∏C M
;
∏∏M N
_digestValue
ππ 
=
ππ 
Convert
ππ "
.
ππ" #
FromBase64String
ππ# 3
(
ππ3 4
Utils
ππ4 9
.
ππ9 : 
DiscardWhiteSpaces
ππ: L
(
ππL M 
digestValueElement
ππM _
.
ππ_ `
	InnerText
ππ` i
)
ππi j
)
ππj k
;
ππk l
if
∫∫ 
(
∫∫ 
!
∫∫ 
Utils
∫∫ 
.
∫∫ 
VerifyAttributes
∫∫ '
(
∫∫' ( 
digestValueElement
∫∫( :
,
∫∫: ;
(
∫∫< =
string
∫∫= C
[
∫∫C D
]
∫∫D E
)
∫∫E F
null
∫∫F J
)
∫∫J K
)
∫∫K L
throw
ªª 
new
ªª 
System
ªª  
.
ªª  !
Security
ªª! )
.
ªª) *
Cryptography
ªª* 6
.
ªª6 7$
CryptographicException
ªª7 M
(
ªªM N
SR
ªªN P
.
ªªP Q-
Cryptography_Xml_InvalidElement
ªªQ p
,
ªªp q
$strªªr â
)ªªâ ä
;ªªä ã
int
ΩΩ $
expectedChildNodeCount
ΩΩ &
=
ΩΩ' (
hasTransforms
ΩΩ) 6
?
ΩΩ7 8
$num
ΩΩ9 :
:
ΩΩ; <
$num
ΩΩ= >
;
ΩΩ> ?
if
ææ 
(
ææ 
value
ææ 
.
ææ 
SelectNodes
ææ !
(
ææ! "
$str
ææ" %
)
ææ% &
.
ææ& '
Count
ææ' ,
!=
ææ- /$
expectedChildNodeCount
ææ0 F
)
ææF G
throw
øø 
new
øø 
System
øø  
.
øø  !
Security
øø! )
.
øø) *
Cryptography
øø* 6
.
øø6 7$
CryptographicException
øø7 M
(
øøM N
SR
øøN P
.
øøP Q-
Cryptography_Xml_InvalidElement
øøQ p
,
øøp q
$str
øør }
)
øø} ~
;
øø~ 

_cachedXml
¬¬ 
=
¬¬ 
value
¬¬ 
;
¬¬ 
}
√√ 	
public
≈≈ 
void
≈≈ 
AddTransform
≈≈  
(
≈≈  !
	Transform
≈≈! *
	transform
≈≈+ 4
)
≈≈4 5
{
∆∆ 	
if
«« 
(
«« 
	transform
«« 
==
«« 
null
«« !
)
««! "
throw
»» 
new
»» #
ArgumentNullException
»» /
(
»»/ 0
$str
»»0 ;
)
»»; <
;
»»< =
	transform
   
.
   
	Reference
   
=
    !
this
  " &
;
  & '
TransformChain
ÀÀ 
.
ÀÀ 
Add
ÀÀ 
(
ÀÀ 
	transform
ÀÀ (
)
ÀÀ( )
;
ÀÀ) *
}
ÃÃ 	
internal
ŒŒ 
void
ŒŒ 
UpdateHashValue
ŒŒ %
(
ŒŒ% &
XmlDocument
ŒŒ& 1
document
ŒŒ2 :
,
ŒŒ: ;"
CanonicalXmlNodeList
ŒŒ< P
refList
ŒŒQ X
)
ŒŒX Y
{
œœ 	
DigestValue
–– 
=
––  
CalculateHashValue
–– ,
(
––, -
document
––- 5
,
––5 6
refList
––7 >
)
––> ?
;
––? @
}
—— 	
internal
’’ 
byte
’’ 
[
’’ 
]
’’  
CalculateHashValue
’’ *
(
’’* +
XmlDocument
’’+ 6
document
’’7 ?
,
’’? @"
CanonicalXmlNodeList
’’A U
refList
’’V ]
)
’’] ^
{
÷÷ 	
IDigest
ŸŸ 
digest
ŸŸ 
=
ŸŸ 
CryptoHelpers
ŸŸ *
.
ŸŸ* +
CreateFromName
ŸŸ+ 9
<
ŸŸ9 :
IDigest
ŸŸ: A
>
ŸŸA B
(
ŸŸB C
_digestMethod
ŸŸC P
)
ŸŸP Q
;
ŸŸQ R
if
⁄⁄ 
(
⁄⁄ 
digest
⁄⁄ 
==
⁄⁄ 
null
⁄⁄ 
)
⁄⁄ 
{
€€ 
IMac
‹‹ 
mac
‹‹ 
=
‹‹ 
CryptoHelpers
‹‹ (
.
‹‹( )
CreateFromName
‹‹) 7
<
‹‹7 8
IMac
‹‹8 <
>
‹‹< =
(
‹‹= >
_digestMethod
‹‹> K
)
‹‹K L
;
‹‹L M
if
›› 
(
›› 
mac
›› 
==
›› 
null
›› 
)
››  
throw
ﬁﬁ 
new
ﬁﬁ 
System
ﬁﬁ $
.
ﬁﬁ$ %
Security
ﬁﬁ% -
.
ﬁﬁ- .
Cryptography
ﬁﬁ. :
.
ﬁﬁ: ;$
CryptographicException
ﬁﬁ; Q
(
ﬁﬁQ R
SR
ﬁﬁR T
.
ﬁﬁT U8
*Cryptography_Xml_CreateHashAlgorithmFailed
ﬁﬁU 
)ﬁﬁ Ä
;ﬁﬁÄ Å
byte
·· 
[
·· 
]
·· 
	randomKey
··  
=
··! "
Utils
··# (
.
··( )!
GenerateRandomBlock
··) <
(
··< =
mac
··= @
.
··@ A

GetMacSize
··A K
(
··K L
)
··L M
)
··M N
;
··N O
mac
‚‚ 
.
‚‚ 
Init
‚‚ 
(
‚‚ 
new
‚‚ 
KeyParameter
‚‚ )
(
‚‚) *
	randomKey
‚‚* 3
)
‚‚3 4
)
‚‚4 5
;
‚‚5 6
_hashAlgorithm
‰‰ 
=
‰‰  
new
‰‰! $
MacHashWrapper
‰‰% 3
(
‰‰3 4
mac
‰‰4 7
)
‰‰7 8
;
‰‰8 9
}
ÂÂ 
else
ÊÊ 
{
ÁÁ 
_hashAlgorithm
ËË 
=
ËË  
new
ËË! $
DigestHashWrapper
ËË% 6
(
ËË6 7
digest
ËË7 =
)
ËË= >
;
ËË> ?
}
ÈÈ 
string
ÏÏ 
baseUri
ÏÏ 
=
ÏÏ 
(
ÏÏ 
document
ÏÏ &
==
ÏÏ' )
null
ÏÏ* .
?
ÏÏ/ 0
System
ÏÏ1 7
.
ÏÏ7 8
Environment
ÏÏ8 C
.
ÏÏC D
CurrentDirectory
ÏÏD T
+
ÏÏU V
$str
ÏÏW [
:
ÏÏ\ ]
document
ÏÏ^ f
.
ÏÏf g
BaseURI
ÏÏg n
)
ÏÏn o
;
ÏÏo p
Stream
ÌÌ 
hashInputStream
ÌÌ "
=
ÌÌ# $
null
ÌÌ% )
;
ÌÌ) *
WebResponse
ÓÓ 
response
ÓÓ  
=
ÓÓ! "
null
ÓÓ# '
;
ÓÓ' (
Stream
ÔÔ 
inputStream
ÔÔ 
=
ÔÔ  
null
ÔÔ! %
;
ÔÔ% &
XmlResolver
 
resolver
  
=
! "
null
# '
;
' (
_hashval
ÒÒ 
=
ÒÒ 
null
ÒÒ 
;
ÒÒ 
try
ÛÛ 
{
ÙÙ 
switch
ıı 
(
ıı 
_refTargetType
ıı &
)
ıı& '
{
ˆˆ 
case
˜˜ !
ReferenceTargetType
˜˜ ,
.
˜˜, -
Stream
˜˜- 3
:
˜˜3 4
resolver
˘˘  
=
˘˘! "
(
˘˘# $
	SignedXml
˘˘$ -
.
˘˘- .
ResolverSet
˘˘. 9
?
˘˘: ;
	SignedXml
˘˘< E
.
˘˘E F
_xmlResolver
˘˘F R
:
˘˘S T
new
˘˘U X
XmlSecureResolver
˘˘Y j
(
˘˘j k
new
˘˘k n
XmlUrlResolver
˘˘o }
(
˘˘} ~
)
˘˘~ 
,˘˘ Ä
baseUri˘˘Å à
)˘˘à â
)˘˘â ä
;˘˘ä ã
hashInputStream
˙˙ '
=
˙˙( )
TransformChain
˙˙* 8
.
˙˙8 9$
TransformToOctetStream
˙˙9 O
(
˙˙O P
(
˙˙P Q
Stream
˙˙Q W
)
˙˙W X

_refTarget
˙˙X b
,
˙˙b c
resolver
˙˙d l
,
˙˙l m
baseUri
˙˙n u
)
˙˙u v
;
˙˙v w
break
˚˚ 
;
˚˚ 
case
¸¸ !
ReferenceTargetType
¸¸ ,
.
¸¸, -
UriReference
¸¸- 9
:
¸¸9 :
if
ÄÄ 
(
ÄÄ 
_uri
ÄÄ  
==
ÄÄ! #
null
ÄÄ$ (
)
ÄÄ( )
{
ÅÅ 
resolver
ÉÉ $
=
ÉÉ% &
(
ÉÉ' (
	SignedXml
ÉÉ( 1
.
ÉÉ1 2
ResolverSet
ÉÉ2 =
?
ÉÉ> ?
	SignedXml
ÉÉ@ I
.
ÉÉI J
_xmlResolver
ÉÉJ V
:
ÉÉW X
new
ÉÉY \
XmlSecureResolver
ÉÉ] n
(
ÉÉn o
new
ÉÉo r
XmlUrlResolverÉÉs Å
(ÉÉÅ Ç
)ÉÉÇ É
,ÉÉÉ Ñ
baseUriÉÉÖ å
)ÉÉå ç
)ÉÉç é
;ÉÉé è
hashInputStream
ÜÜ +
=
ÜÜ, -
TransformChain
ÜÜ. <
.
ÜÜ< =$
TransformToOctetStream
ÜÜ= S
(
ÜÜS T
(
ÜÜT U
Stream
ÜÜU [
)
ÜÜ[ \
null
ÜÜ\ `
,
ÜÜ` a
resolver
ÜÜb j
,
ÜÜj k
baseUri
ÜÜl s
)
ÜÜs t
;
ÜÜt u
}
áá 
else
àà 
if
àà 
(
àà  !
_uri
àà! %
.
àà% &
Length
àà& ,
==
àà- /
$num
àà0 1
)
àà1 2
{
ââ 
if
åå 
(
åå  
document
åå  (
==
åå) +
null
åå, 0
)
åå0 1
throw
çç  %
new
çç& )
System
çç* 0
.
çç0 1
Security
çç1 9
.
çç9 :
Cryptography
çç: F
.
ççF G$
CryptographicException
ççG ]
(
çç] ^
string
çç^ d
.
ççd e
Format
ççe k
(
ççk l
CultureInfo
ççl w
.
ççw x
CurrentCultureççx Ü
,ççÜ á
SRççà ä
.ççä ã=
-Cryptography_Xml_SelfReferenceRequiresContextççã ∏
,çç∏ π
_uriçç∫ æ
)ççæ ø
)ççø ¿
;çç¿ ¡
resolver
êê $
=
êê% &
(
êê' (
	SignedXml
êê( 1
.
êê1 2
ResolverSet
êê2 =
?
êê> ?
	SignedXml
êê@ I
.
êêI J
_xmlResolver
êêJ V
:
êêW X
new
êêY \
XmlSecureResolver
êê] n
(
êên o
new
êêo r
XmlUrlResolverêês Å
(êêÅ Ç
)êêÇ É
,êêÉ Ñ
baseUriêêÖ å
)êêå ç
)êêç é
;êêé è
XmlDocument
ëë '
docWithNoComments
ëë( 9
=
ëë: ;
Utils
ëë< A
.
ëëA B
DiscardComments
ëëB Q
(
ëëQ R
Utils
ëëR W
.
ëëW X%
PreProcessDocumentInput
ëëX o
(
ëëo p
document
ëëp x
,
ëëx y
resolverëëz Ç
,ëëÇ É
baseUriëëÑ ã
)ëëã å
)ëëå ç
;ëëç é
hashInputStream
íí +
=
íí, -
TransformChain
íí. <
.
íí< =$
TransformToOctetStream
íí= S
(
ííS T
docWithNoComments
ííT e
,
ííe f
resolver
ííg o
,
íío p
baseUri
ííq x
)
ííx y
;
ííy z
}
ìì 
else
îî 
if
îî 
(
îî  !
_uri
îî! %
[
îî% &
$num
îî& '
]
îî' (
==
îî) +
$char
îî, /
)
îî/ 0
{
ïï 
bool
òò  
discardComments
òò! 0
=
òò1 2
true
òò3 7
;
òò7 8
string
ôô "
idref
ôô# (
=
ôô) *
Utils
ôô+ 0
.
ôô0 1
GetIdFromLocalUri
ôô1 B
(
ôôB C
_uri
ôôC G
,
ôôG H
out
ôôI L
discardComments
ôôM \
)
ôô\ ]
;
ôô] ^
if
öö 
(
öö  
idref
öö  %
==
öö& (
$str
öö) 6
)
öö6 7
{
õõ 
if
ùù  "
(
ùù# $
document
ùù$ ,
==
ùù- /
null
ùù0 4
)
ùù4 5
throw
ûû$ )
new
ûû* -
System
ûû. 4
.
ûû4 5
Security
ûû5 =
.
ûû= >
Cryptography
ûû> J
.
ûûJ K$
CryptographicException
ûûK a
(
ûûa b
string
ûûb h
.
ûûh i
Format
ûûi o
(
ûûo p
CultureInfo
ûûp {
.
ûû{ |
CurrentCultureûû| ä
,ûûä ã
SRûûå é
.ûûé è=
-Cryptography_Xml_SelfReferenceRequiresContextûûè º
,ûûº Ω
_uriûûæ ¬
)ûû¬ √
)ûû√ ƒ
;ûûƒ ≈
resolver
°°  (
=
°°) *
(
°°+ ,
	SignedXml
°°, 5
.
°°5 6
ResolverSet
°°6 A
?
°°B C
	SignedXml
°°D M
.
°°M N
_xmlResolver
°°N Z
:
°°[ \
new
°°] `
XmlSecureResolver
°°a r
(
°°r s
new
°°s v
XmlUrlResolver°°w Ö
(°°Ö Ü
)°°Ü á
,°°á à
baseUri°°â ê
)°°ê ë
)°°ë í
;°°í ì
hashInputStream
¢¢  /
=
¢¢0 1
TransformChain
¢¢2 @
.
¢¢@ A$
TransformToOctetStream
¢¢A W
(
¢¢W X
Utils
¢¢X ]
.
¢¢] ^%
PreProcessDocumentInput
¢¢^ u
(
¢¢u v
document
¢¢v ~
,
¢¢~ 
resolver¢¢Ä à
,¢¢à â
baseUri¢¢ä ë
)¢¢ë í
,¢¢í ì
resolver¢¢î ú
,¢¢ú ù
baseUri¢¢û •
)¢¢• ¶
;¢¢¶ ß
break
££  %
;
££% &
}
§§ 

XmlElement
¶¶ &
elem
¶¶' +
=
¶¶, -
	SignedXml
¶¶. 7
.
¶¶7 8
GetIdElement
¶¶8 D
(
¶¶D E
document
¶¶E M
,
¶¶M N
idref
¶¶O T
)
¶¶T U
;
¶¶U V
if
ßß 
(
ßß  
elem
ßß  $
!=
ßß% '
null
ßß( ,
)
ßß, -
_namespaces
®®  +
=
®®, -
Utils
®®. 3
.
®®3 4%
GetPropagatedAttributes
®®4 K
(
®®K L
elem
®®L P
.
®®P Q

ParentNode
®®Q [
as
®®\ ^

XmlElement
®®_ i
)
®®i j
;
®®j k
if
™™ 
(
™™  
elem
™™  $
==
™™% '
null
™™( ,
)
™™, -
{
´´ 
if
≠≠  "
(
≠≠# $
refList
≠≠$ +
!=
≠≠, .
null
≠≠/ 3
)
≠≠3 4
{
ÆÆ  !
foreach
ØØ$ +
(
ØØ, -
XmlNode
ØØ- 4
node
ØØ5 9
in
ØØ: <
refList
ØØ= D
)
ØØD E
{
∞∞$ %

XmlElement
±±( 2
tempElem
±±3 ;
=
±±< =
node
±±> B
as
±±C E

XmlElement
±±F P
;
±±P Q
if
≤≤( *
(
≤≤+ ,
(
≤≤, -
tempElem
≤≤- 5
!=
≤≤6 8
null
≤≤9 =
)
≤≤= >
&&
≤≤? A
(
≤≤B C
Utils
≤≤C H
.
≤≤H I
HasAttribute
≤≤I U
(
≤≤U V
tempElem
≤≤V ^
,
≤≤^ _
$str
≤≤` d
,
≤≤d e
	SignedXml
≤≤f o
.
≤≤o p"
XmlDsigNamespaceUrl≤≤p É
)≤≤É Ñ
)≤≤Ñ Ö
&&
≥≥, .
(
≥≥/ 0
Utils
≥≥0 5
.
≥≥5 6
GetAttribute
≥≥6 B
(
≥≥B C
tempElem
≥≥C K
,
≥≥K L
$str
≥≥M Q
,
≥≥Q R
	SignedXml
≥≥S \
.
≥≥\ ]!
XmlDsigNamespaceUrl
≥≥] p
)
≥≥p q
.
≥≥q r
Equals
≥≥r x
(
≥≥x y
idref
≥≥y ~
)
≥≥~ 
)≥≥ Ä
)≥≥Ä Å
{
¥¥( )
elem
µµ, 0
=
µµ1 2
tempElem
µµ3 ;
;
µµ; <
if
∂∂, .
(
∂∂/ 0

_signedXml
∂∂0 :
.
∂∂: ;
_context
∂∂; C
!=
∂∂D F
null
∂∂G K
)
∂∂K L
_namespaces
∑∑0 ;
=
∑∑< =
Utils
∑∑> C
.
∑∑C D%
GetPropagatedAttributes
∑∑D [
(
∑∑[ \

_signedXml
∑∑\ f
.
∑∑f g
_context
∑∑g o
)
∑∑o p
;
∑∑p q
break
∏∏, 1
;
∏∏1 2
}
ππ( )
}
∫∫$ %
}
ªª  !
}
ºº 
if
ææ 
(
ææ  
elem
ææ  $
==
ææ% '
null
ææ( ,
)
ææ, -
throw
øø  %
new
øø& )
System
øø* 0
.
øø0 1
Security
øø1 9
.
øø9 :
Cryptography
øø: F
.
øøF G$
CryptographicException
øøG ]
(
øø] ^
SR
øø^ `
.
øø` a0
!Cryptography_Xml_InvalidReferenceøøa Ç
)øøÇ É
;øøÉ Ñ
XmlDocument
¡¡ '
normDocument
¡¡( 4
=
¡¡5 6
Utils
¡¡7 <
.
¡¡< =$
PreProcessElementInput
¡¡= S
(
¡¡S T
elem
¡¡T X
,
¡¡X Y
resolver
¡¡Z b
,
¡¡b c
baseUri
¡¡d k
)
¡¡k l
;
¡¡l m
Utils
√√ !
.
√√! "
AddNamespaces
√√" /
(
√√/ 0
normDocument
√√0 <
.
√√< =
DocumentElement
√√= L
,
√√L M
_namespaces
√√N Y
)
√√Y Z
;
√√Z [
resolver
≈≈ $
=
≈≈% &
(
≈≈' (
	SignedXml
≈≈( 1
.
≈≈1 2
ResolverSet
≈≈2 =
?
≈≈> ?
	SignedXml
≈≈@ I
.
≈≈I J
_xmlResolver
≈≈J V
:
≈≈W X
new
≈≈Y \
XmlSecureResolver
≈≈] n
(
≈≈n o
new
≈≈o r
XmlUrlResolver≈≈s Å
(≈≈Å Ç
)≈≈Ç É
,≈≈É Ñ
baseUri≈≈Ö å
)≈≈å ç
)≈≈ç é
;≈≈é è
if
∆∆ 
(
∆∆  
discardComments
∆∆  /
)
∆∆/ 0
{
«« 
XmlDocument
……  +
docWithNoComments
……, =
=
……> ?
Utils
……@ E
.
……E F
DiscardComments
……F U
(
……U V
normDocument
……V b
)
……b c
;
……c d
hashInputStream
    /
=
  0 1
TransformChain
  2 @
.
  @ A$
TransformToOctetStream
  A W
(
  W X
docWithNoComments
  X i
,
  i j
resolver
  k s
,
  s t
baseUri
  u |
)
  | }
;
  } ~
}
ÀÀ 
else
ÃÃ  
{
ÕÕ 
hashInputStream
œœ  /
=
œœ0 1
TransformChain
œœ2 @
.
œœ@ A$
TransformToOctetStream
œœA W
(
œœW X
normDocument
œœX d
,
œœd e
resolver
œœf n
,
œœn o
baseUri
œœp w
)
œœw x
;
œœx y
}
–– 
}
—— 
else
““ 
{
”” 
throw
‘‘ !
new
‘‘" %
System
‘‘& ,
.
‘‘, -
Security
‘‘- 5
.
‘‘5 6
Cryptography
‘‘6 B
.
‘‘B C$
CryptographicException
‘‘C Y
(
‘‘Y Z
SR
‘‘Z \
.
‘‘\ ]-
Cryptography_Xml_UriNotResolved
‘‘] |
,
‘‘| }
_uri‘‘~ Ç
)‘‘Ç É
;‘‘É Ñ
}
’’ 
break
÷÷ 
;
÷÷ 
case
◊◊ !
ReferenceTargetType
◊◊ ,
.
◊◊, -

XmlElement
◊◊- 7
:
◊◊7 8
resolver
ŸŸ  
=
ŸŸ! "
(
ŸŸ# $
	SignedXml
ŸŸ$ -
.
ŸŸ- .
ResolverSet
ŸŸ. 9
?
ŸŸ: ;
	SignedXml
ŸŸ< E
.
ŸŸE F
_xmlResolver
ŸŸF R
:
ŸŸS T
new
ŸŸU X
XmlSecureResolver
ŸŸY j
(
ŸŸj k
new
ŸŸk n
XmlUrlResolver
ŸŸo }
(
ŸŸ} ~
)
ŸŸ~ 
,ŸŸ Ä
baseUriŸŸÅ à
)ŸŸà â
)ŸŸâ ä
;ŸŸä ã
hashInputStream
⁄⁄ '
=
⁄⁄( )
TransformChain
⁄⁄* 8
.
⁄⁄8 9$
TransformToOctetStream
⁄⁄9 O
(
⁄⁄O P
Utils
⁄⁄P U
.
⁄⁄U V$
PreProcessElementInput
⁄⁄V l
(
⁄⁄l m
(
⁄⁄m n

XmlElement
⁄⁄n x
)
⁄⁄x y

_refTarget⁄⁄y É
,⁄⁄É Ñ
resolver⁄⁄Ö ç
,⁄⁄ç é
baseUri⁄⁄è ñ
)⁄⁄ñ ó
,⁄⁄ó ò
resolver⁄⁄ô °
,⁄⁄° ¢
baseUri⁄⁄£ ™
)⁄⁄™ ´
;⁄⁄´ ¨
break
€€ 
;
€€ 
default
‹‹ 
:
‹‹ 
throw
›› 
new
›› !
System
››" (
.
››( )
Security
››) 1
.
››1 2
Cryptography
››2 >
.
››> ?$
CryptographicException
››? U
(
››U V
SR
››V X
.
››X Y-
Cryptography_Xml_UriNotResolved
››Y x
,
››x y
_uri
››z ~
)
››~ 
;›› Ä
}
ﬁﬁ 
hashInputStream
·· 
=
··  !
SignedXmlDebugLog
··" 3
.
··3 4
LogReferenceData
··4 D
(
··D E
this
··E I
,
··I J
hashInputStream
··K Z
)
··Z [
;
··[ \
byte
„„ 
[
„„ 
]
„„ 
buffer
„„ 
=
„„ 
new
„„  #
byte
„„$ (
[
„„( )
$num
„„) -
]
„„- .
;
„„. /
int
‰‰ 
	bytesRead
‰‰ 
;
‰‰ 
_hashAlgorithm
ÂÂ 
.
ÂÂ 
Reset
ÂÂ $
(
ÂÂ$ %
)
ÂÂ% &
;
ÂÂ& '
while
ÊÊ 
(
ÊÊ 
(
ÊÊ 
	bytesRead
ÊÊ !
=
ÊÊ" #
hashInputStream
ÊÊ$ 3
.
ÊÊ3 4
Read
ÊÊ4 8
(
ÊÊ8 9
buffer
ÊÊ9 ?
,
ÊÊ? @
$num
ÊÊA B
,
ÊÊB C
buffer
ÊÊD J
.
ÊÊJ K
Length
ÊÊK Q
)
ÊÊQ R
)
ÊÊR S
>
ÊÊT U
$num
ÊÊV W
)
ÊÊW X
{
ÊÊY Z
_hashAlgorithm
ÁÁ "
.
ÁÁ" #
BlockUpdate
ÁÁ# .
(
ÁÁ. /
buffer
ÁÁ/ 5
,
ÁÁ5 6
$num
ÁÁ7 8
,
ÁÁ8 9
	bytesRead
ÁÁ: C
)
ÁÁC D
;
ÁÁD E
}
ËË 
_hashval
ÈÈ 
=
ÈÈ 
new
ÈÈ 
byte
ÈÈ #
[
ÈÈ# $
_hashAlgorithm
ÈÈ$ 2
.
ÈÈ2 3
GetHashSize
ÈÈ3 >
(
ÈÈ> ?
)
ÈÈ? @
]
ÈÈ@ A
;
ÈÈA B
_hashAlgorithm
ÍÍ 
.
ÍÍ 
DoFinal
ÍÍ &
(
ÍÍ& '
_hashval
ÍÍ' /
,
ÍÍ/ 0
$num
ÍÍ1 2
)
ÍÍ2 3
;
ÍÍ3 4
}
ÎÎ 
finally
ÏÏ 
{
ÌÌ 
if
ÓÓ 
(
ÓÓ 
hashInputStream
ÓÓ #
!=
ÓÓ$ &
null
ÓÓ' +
)
ÓÓ+ ,
hashInputStream
ÔÔ #
.
ÔÔ# $
Close
ÔÔ$ )
(
ÔÔ) *
)
ÔÔ* +
;
ÔÔ+ ,
if
 
(
 
response
 
!=
 
null
  $
)
$ %
response
ÒÒ 
.
ÒÒ 
Close
ÒÒ "
(
ÒÒ" #
)
ÒÒ# $
;
ÒÒ$ %
if
ÚÚ 
(
ÚÚ 
inputStream
ÚÚ 
!=
ÚÚ  "
null
ÚÚ# '
)
ÚÚ' (
inputStream
ÛÛ 
.
ÛÛ  
Close
ÛÛ  %
(
ÛÛ% &
)
ÛÛ& '
;
ÛÛ' (
}
ÙÙ 
return
ˆˆ 
_hashval
ˆˆ 
;
ˆˆ 
}
˜˜ 	
}
¯¯ 
}˘˘ ∫D
8C:\code\bc-xml-security\refactoring\src\ReferenceList.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

sealed 
class 
ReferenceList %
:& '
IList( -
{ 
private 
	ArrayList 
_references %
;% &
public 
ReferenceList 
( 
) 
{ 	
_references 
= 
new 
	ArrayList '
(' (
)( )
;) *
} 	
public 
IEnumerator 
GetEnumerator (
(( )
)) *
{ 	
return 
_references 
. 
GetEnumerator ,
(, -
)- .
;. /
} 	
public 
int 
Count 
{ 	
get 
{ 
return 
_references $
.$ %
Count% *
;* +
}, -
} 	
public   
int   
Add   
(   
object   
value   #
)  # $
{!! 	
if"" 
("" 
value"" 
=="" 
null"" 
)"" 
throw## 
new## !
ArgumentNullException## /
(##/ 0
nameof##0 6
(##6 7
value##7 <
)##< =
)##= >
;##> ?
if%% 
(%% 
!%% 
(%% 
value%% 
is%% 
DataReference%% (
)%%( )
&&%%* ,
!%%- .
(%%. /
value%%/ 4
is%%5 7
KeyReference%%8 D
)%%D E
)%%E F
throw&& 
new&& 
ArgumentException&& +
(&&+ ,
SR&&, .
.&&. /0
$Cryptography_Xml_IncorrectObjectType&&/ S
,&&S T
nameof&&U [
(&&[ \
value&&\ a
)&&a b
)&&b c
;&&c d
return(( 
_references(( 
.(( 
Add(( "
(((" #
value((# (
)((( )
;(() *
})) 	
public++ 
void++ 
Clear++ 
(++ 
)++ 
{,, 	
_references-- 
.-- 
Clear-- 
(-- 
)-- 
;--  
}.. 	
public00 
bool00 
Contains00 
(00 
object00 #
value00$ )
)00) *
{11 	
return22 
_references22 
.22 
Contains22 '
(22' (
value22( -
)22- .
;22. /
}33 	
public55 
int55 
IndexOf55 
(55 
object55 !
value55" '
)55' (
{66 	
return77 
_references77 
.77 
IndexOf77 &
(77& '
value77' ,
)77, -
;77- .
}88 	
public:: 
void:: 
Insert:: 
(:: 
int:: 
index:: $
,::$ %
object::& ,
value::- 2
)::2 3
{;; 	
if<< 
(<< 
value<< 
==<< 
null<< 
)<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
nameof==0 6
(==6 7
value==7 <
)==< =
)=== >
;==> ?
if?? 
(?? 
!?? 
(?? 
value?? 
is?? 
DataReference?? (
)??( )
&&??* ,
!??- .
(??. /
value??/ 4
is??5 7
KeyReference??8 D
)??D E
)??E F
throw@@ 
new@@ 
ArgumentException@@ +
(@@+ ,
SR@@, .
.@@. /0
$Cryptography_Xml_IncorrectObjectType@@/ S
,@@S T
nameof@@U [
(@@[ \
value@@\ a
)@@a b
)@@b c
;@@c d
_referencesBB 
.BB 
InsertBB 
(BB 
indexBB $
,BB$ %
valueBB& +
)BB+ ,
;BB, -
}CC 	
publicEE 
voidEE 
RemoveEE 
(EE 
objectEE !
valueEE" '
)EE' (
{FF 	
_referencesGG 
.GG 
RemoveGG 
(GG 
valueGG $
)GG$ %
;GG% &
}HH 	
publicJJ 
voidJJ 
RemoveAtJJ 
(JJ 
intJJ  
indexJJ! &
)JJ& '
{KK 	
_referencesLL 
.LL 
RemoveAtLL  
(LL  !
indexLL! &
)LL& '
;LL' (
}MM 	
publicOO 
EncryptedReferenceOO !
ItemOO" &
(OO& '
intOO' *
indexOO+ 0
)OO0 1
{PP 	
returnQQ 
(QQ 
EncryptedReferenceQQ &
)QQ& '
_referencesQQ' 2
[QQ2 3
indexQQ3 8
]QQ8 9
;QQ9 :
}RR 	
[TT 	
SystemTT	 
.TT 
RuntimeTT 
.TT 
CompilerServicesTT (
.TT( )
IndexerNameTT) 4
(TT4 5
$strTT5 =
)TT= >
]TT> ?
publicUU 
EncryptedReferenceUU !
thisUU" &
[UU& '
intUU' *
indexUU+ 0
]UU0 1
{VV 	
getWW 
{XX 
returnYY 
ItemYY 
(YY 
indexYY !
)YY! "
;YY" #
}ZZ 
set[[ 
{\\ 
(]] 
(]] 
IList]] 
)]] 
this]] 
)]] 
[]] 
index]] #
]]]# $
=]]% &
value]]' ,
;]], -
}^^ 
}__ 	
objectbb 
IListbb 
.bb 
thisbb 
[bb 
intbb 
indexbb #
]bb# $
{cc 	
getdd 
{dd 
returndd 
_referencesdd $
[dd$ %
indexdd% *
]dd* +
;dd+ ,
}dd- .
setee 
{ff 
ifgg 
(gg 
valuegg 
==gg 
nullgg !
)gg! "
throwhh 
newhh !
ArgumentNullExceptionhh 3
(hh3 4
nameofhh4 :
(hh: ;
valuehh; @
)hh@ A
)hhA B
;hhB C
ifjj 
(jj 
!jj 
(jj 
valuejj 
isjj 
DataReferencejj ,
)jj, -
&&jj. 0
!jj1 2
(jj2 3
valuejj3 8
isjj9 ;
KeyReferencejj< H
)jjH I
)jjI J
throwkk 
newkk 
ArgumentExceptionkk /
(kk/ 0
SRkk0 2
.kk2 30
$Cryptography_Xml_IncorrectObjectTypekk3 W
,kkW X
nameofkkY _
(kk_ `
valuekk` e
)kke f
)kkf g
;kkg h
_referencesmm 
[mm 
indexmm !
]mm! "
=mm# $
valuemm% *
;mm* +
}nn 
}oo 	
publicqq 
voidqq 
CopyToqq 
(qq 
Arrayqq  
arrayqq! &
,qq& '
intqq( +
indexqq, 1
)qq1 2
{rr 	
_referencesss 
.ss 
CopyToss 
(ss 
arrayss $
,ss$ %
indexss& +
)ss+ ,
;ss, -
}tt 	
boolvv 
IListvv 
.vv 
IsFixedSizevv 
{ww 	
getxx 
{xx 
returnxx 
_referencesxx $
.xx$ %
IsFixedSizexx% 0
;xx0 1
}xx2 3
}yy 	
bool{{ 
IList{{ 
.{{ 

IsReadOnly{{ 
{|| 	
get}} 
{}} 
return}} 
_references}} $
.}}$ %

IsReadOnly}}% /
;}}/ 0
}}}1 2
}~~ 	
public
ÄÄ 
object
ÄÄ 
SyncRoot
ÄÄ 
{
ÅÅ 	
get
ÇÇ 
{
ÇÇ 
return
ÇÇ 
_references
ÇÇ $
.
ÇÇ$ %
SyncRoot
ÇÇ% -
;
ÇÇ- .
}
ÇÇ/ 0
}
ÉÉ 	
public
ÖÖ 
bool
ÖÖ 
IsSynchronized
ÖÖ "
{
ÜÜ 	
get
áá 
{
áá 
return
áá 
_references
áá $
.
áá$ %
IsSynchronized
áá% 3
;
áá3 4
}
áá5 6
}
àà 	
}
ââ 
}ää ∑
>C:\code\bc-xml-security\refactoring\src\ReferenceTargetType.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal		 
enum		 
ReferenceTargetType		 %
{

 
Stream 
, 

XmlElement 
, 
UriReference 
} 
} ﬂQ
6C:\code\bc-xml-security\refactoring\src\RSAKeyValue.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
RSAKeyValue 
: 
KeyInfoClause ,
{ 
private 
RsaKeyParameters  
_key! %
;% &
public 
RSAKeyValue 
( 
) 
{ 	
var 
pair 
= 
Utils 
. 
RSAGenerateKeyPair /
(/ 0
)0 1
;1 2
_key 
= 
( 
RsaKeyParameters $
)$ %
pair% )
.) *
Public* 0
;0 1
} 	
public 
RSAKeyValue 
( 
RsaKeyParameters +
key, /
)/ 0
{ 	
_key 
= 
key 
; 
} 	
public%% 
RsaKeyParameters%% 
Key%%  #
{&& 	
get'' 
{'' 
return'' 
_key'' 
;'' 
}''  
set(( 
{(( 
_key(( 
=(( 
value(( 
;(( 
}((  !
})) 	
public88 
override88 

XmlElement88 "
GetXml88# )
(88) *
)88* +
{99 	
XmlDocument:: 
xmlDocument:: #
=::$ %
new::& )
XmlDocument::* 5
(::5 6
)::6 7
;::7 8
xmlDocument;; 
.;; 
PreserveWhitespace;; *
=;;+ ,
true;;- 1
;;;1 2
return<< 
GetXml<< 
(<< 
xmlDocument<< %
)<<% &
;<<& '
}== 	
private?? 
const?? 
string?? 
KeyValueElementName?? 0
=??1 2
$str??3 =
;??= >
private@@ 
const@@ 
string@@ "
RSAKeyValueElementName@@ 3
=@@4 5
$str@@6 C
;@@C D
privateAA 
constAA 
stringAA 
ModulusElementNameAA /
=AA0 1
$strAA2 ;
;AA; <
privateBB 
constBB 
stringBB 
ExponentElementNameBB 0
=BB1 2
$strBB3 =
;BB= >
internalDD 
overrideDD 

XmlElementDD $
GetXmlDD% +
(DD+ ,
XmlDocumentDD, 7
xmlDocumentDD8 C
)DDC D
{EE 	

XmlElementFF 
keyValueElementFF &
=FF' (
xmlDocumentFF) 4
.FF4 5
CreateElementFF5 B
(FFB C
KeyValueElementNameFFC V
,FFV W
	SignedXmlFFX a
.FFa b
XmlDsigNamespaceUrlFFb u
)FFu v
;FFv w

XmlElementGG 
rsaKeyValueElementGG )
=GG* +
xmlDocumentGG, 7
.GG7 8
CreateElementGG8 E
(GGE F"
RSAKeyValueElementNameGGF \
,GG\ ]
	SignedXmlGG^ g
.GGg h
XmlDsigNamespaceUrlGGh {
)GG{ |
;GG| }

XmlElementII 
modulusElementII %
=II& '
xmlDocumentII( 3
.II3 4
CreateElementII4 A
(IIA B
ModulusElementNameIIB T
,IIT U
	SignedXmlIIV _
.II_ `
XmlDsigNamespaceUrlII` s
)IIs t
;IIt u
modulusElementJJ 
.JJ 
AppendChildJJ &
(JJ& '
xmlDocumentJJ' 2
.JJ2 3
CreateTextNodeJJ3 A
(JJA B
ConvertJJB I
.JJI J
ToBase64StringJJJ X
(JJX Y
_keyJJY ]
.JJ] ^
ModulusJJ^ e
.JJe f
ToByteArrayUnsignedJJf y
(JJy z
)JJz {
)JJ{ |
)JJ| }
)JJ} ~
;JJ~ 
rsaKeyValueElementKK 
.KK 
AppendChildKK *
(KK* +
modulusElementKK+ 9
)KK9 :
;KK: ;

XmlElementMM 
exponentElementMM &
=MM' (
xmlDocumentMM) 4
.MM4 5
CreateElementMM5 B
(MMB C
ExponentElementNameMMC V
,MMV W
	SignedXmlMMX a
.MMa b
XmlDsigNamespaceUrlMMb u
)MMu v
;MMv w
exponentElementNN 
.NN 
AppendChildNN '
(NN' (
xmlDocumentNN( 3
.NN3 4
CreateTextNodeNN4 B
(NNB C
ConvertNNC J
.NNJ K
ToBase64StringNNK Y
(NNY Z
_keyNNZ ^
.NN^ _
ExponentNN_ g
.NNg h
ToByteArrayUnsignedNNh {
(NN{ |
)NN| }
)NN} ~
)NN~ 
)	NN Ä
;
NNÄ Å
rsaKeyValueElementOO 
.OO 
AppendChildOO *
(OO* +
exponentElementOO+ :
)OO: ;
;OO; <
keyValueElementQQ 
.QQ 
AppendChildQQ '
(QQ' (
rsaKeyValueElementQQ( :
)QQ: ;
;QQ; <
returnSS 
keyValueElementSS "
;SS" #
}TT 	
publicee 
overrideee 
voidee 
LoadXmlee $
(ee$ %

XmlElementee% /
valueee0 5
)ee5 6
{ff 	
ifgg 
(gg 
valuegg 
==gg 
nullgg 
)gg 
{hh 
throwii 
newii !
ArgumentNullExceptionii /
(ii/ 0
nameofii0 6
(ii6 7
valueii7 <
)ii< =
)ii= >
;ii> ?
}jj 
ifkk 
(kk 
valuekk 
.kk 
	LocalNamekk 
!=kk  "
KeyValueElementNamekk# 6
||ll 
valuell 
.ll 
NamespaceURIll %
!=ll& (
	SignedXmlll) 2
.ll2 3
XmlDsigNamespaceUrlll3 F
)llF G
{mm 
thrownn 
newnn 
Systemnn  
.nn  !
Securitynn! )
.nn) *
Cryptographynn* 6
.nn6 7"
CryptographicExceptionnn7 M
(nnM N
$"nnN P!
Root element must be nnP e
{nne f
KeyValueElementNamennf y
}nny z#
 element in namespace 	nnz ê
{
nnê ë
	SignedXml
nnë ö
.
nnö õ!
XmlDsigNamespaceUrl
nnõ Æ
}
nnÆ Ø
"
nnØ ∞
)
nn∞ ±
;
nn± ≤
}oo 
constqq 
stringqq "
xmlDsigNamespacePrefixqq /
=qq0 1
$strqq2 8
;qq8 9
XmlNamespaceManagerrr 
xmlNamespaceManagerrr  3
=rr4 5
newrr6 9
XmlNamespaceManagerrr: M
(rrM N
valuerrN S
.rrS T
OwnerDocumentrrT a
.rra b
	NameTablerrb k
)rrk l
;rrl m
xmlNamespaceManagerss 
.ss  
AddNamespacess  ,
(ss, -"
xmlDsigNamespacePrefixss- C
,ssC D
	SignedXmlssE N
.ssN O
XmlDsigNamespaceUrlssO b
)ssb c
;ssc d
XmlNodeuu 
rsaKeyValueElementuu &
=uu' (
valueuu) .
.uu. /
SelectSingleNodeuu/ ?
(uu? @
$"uu@ B
{uuB C"
xmlDsigNamespacePrefixuuC Y
}uuY Z
:uuZ [
{uu[ \"
RSAKeyValueElementNameuu\ r
}uur s
"uus t
,uut u 
xmlNamespaceManager	uuv â
)
uuâ ä
;
uuä ã
ifvv 
(vv 
rsaKeyValueElementvv "
==vv# %
nullvv& *
)vv* +
{ww 
throwxx 
newxx 
Systemxx  
.xx  !
Securityxx! )
.xx) *
Cryptographyxx* 6
.xx6 7"
CryptographicExceptionxx7 M
(xxM N
$"xxN P
{xxP Q
KeyValueElementNamexxQ d
}xxd e)
 must contain child element 	xxe Å
{
xxÅ Ç$
RSAKeyValueElementName
xxÇ ò
}
xxò ô
"
xxô ö
)
xxö õ
;
xxõ ú
}yy 
try{{ 
{|| 
_key}} 
=}} 
new}} 
RsaKeyParameters}} +
(}}+ ,
false}}, 1
,}}1 2
new~~ 
Math~~ 
.~~ 

BigInteger~~ '
(~~' (
$num~~( )
,~~) *
Convert~~+ 2
.~~2 3
FromBase64String~~3 C
(~~C D
rsaKeyValueElement~~D V
.~~V W
SelectSingleNode~~W g
(~~g h
$"~~h j
{~~j k#
xmlDsigNamespacePrefix	~~k Å
}
~~Å Ç
:
~~Ç É
{
~~É Ñ 
ModulusElementName
~~Ñ ñ
}
~~ñ ó
"
~~ó ò
,
~~ò ô!
xmlNamespaceManager
~~ö ≠
)
~~≠ Æ
.
~~Æ Ø
	InnerText
~~Ø ∏
)
~~∏ π
)
~~π ∫
,
~~∫ ª
new 
Math 
. 

BigInteger '
(' (
$num( )
,) *
Convert+ 2
.2 3
FromBase64String3 C
(C D
rsaKeyValueElementD V
.V W
SelectSingleNodeW g
(g h
$"h j
{j k#
xmlDsigNamespacePrefix	k Å
}
Å Ç
:
Ç É
{
É Ñ!
ExponentElementName
Ñ ó
}
ó ò
"
ò ô
,
ô ö!
xmlNamespaceManager
õ Æ
)
Æ Ø
.
Ø ∞
	InnerText
∞ π
)
π ∫
)
∫ ª
)
ª º
;
º Ω
}
ÄÄ 
catch
ÅÅ 
(
ÅÅ 
	Exception
ÅÅ 
ex
ÅÅ 
)
ÅÅ  
{
ÇÇ 
throw
ÉÉ 
new
ÉÉ 
System
ÉÉ  
.
ÉÉ  !
Security
ÉÉ! )
.
ÉÉ) *
Cryptography
ÉÉ* 6
.
ÉÉ6 7$
CryptographicException
ÉÉ7 M
(
ÉÉM N
$"
ÉÉN P,
An error occurred parsing the 
ÉÉP n
{
ÉÉn o!
ModulusElementNameÉÉo Å
}ÉÉÅ Ç
 and ÉÉÇ á
{ÉÉá à#
ExponentElementNameÉÉà õ
}ÉÉõ ú
	 elementsÉÉú •
"ÉÉ• ¶
,ÉÉ¶ ß
exÉÉ® ™
)ÉÉ™ ´
;ÉÉ´ ¨
}
ÑÑ 
}
ÖÖ 	
}
ÜÜ 
}áá ã
HC:\code\bc-xml-security\refactoring\src\RSAOAEPKeyExchangeDeformatter.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class )
RSAOAEPKeyExchangeDeformatter .
{ 
private 
RsaKeyParameters  
_rsaKey! (
;( )
public )
RSAOAEPKeyExchangeDeformatter ,
(, -
)- .
{/ 0
}1 2
public )
RSAOAEPKeyExchangeDeformatter ,
(, -
RsaKeyParameters- =
key> A
)A B
{ 	
if 
( 
key 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
key7 :
): ;
); <
;< =
_rsaKey 
= 
key 
; 
} 	
public 
string 

Parameters  
{ 	
get 
{ 
return 
null 
; 
} 
set 
{ 
} 
} 	
public 
byte 
[ 
] 
DecryptKeyExchange (
(( )
byte) -
[- .
]. /
rgbData0 7
)7 8
{ 	
if   
(   
_rsaKey   
==   
null   
)    
throw!! 
new!! 
System!!  
.!!  !
Security!!! )
.!!) *
Cryptography!!* 6
.!!6 75
)CryptographicUnexpectedOperationException!!7 `
(!!` a
SR!!a c
.!!c d#
Cryptography_MissingKey!!d {
)!!{ |
;!!| }
var## 
rsa## 
=## 
CipherUtilities## %
.##% &
	GetCipher##& /
(##/ 0
$str##0 B
)##B C
;##C D
rsa$$ 
.$$ 
Init$$ 
($$ 
false$$ 
,$$ 
_rsaKey$$ #
)$$# $
;$$$ %
return&& 
rsa&& 
.&& 
DoFinal&& 
(&& 
rgbData&& &
)&&& '
;&&' (
}'' 	
public)) 
void)) 
SetKey)) 
()) 
RsaKeyParameters)) +
key)), /
)))/ 0
{** 	
if++ 
(++ 
key++ 
==++ 
null++ 
)++ 
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
nameof,,0 6
(,,6 7
key,,7 :
),,: ;
),,; <
;,,< =
_rsaKey.. 
=.. 
key.. 
;.. 
}// 	
}00 
}11 û&
FC:\code\bc-xml-security\refactoring\src\RSAOAEPKeyExchangeFormatter.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class '
RSAOAEPKeyExchangeFormatter ,
{ 
private 
byte 
[ 
] 
ParameterValue %
;% &
private 
RsaKeyParameters  
_rsaKey! (
;( )
private 
SecureRandom 
RngValue %
;% &
public '
RSAOAEPKeyExchangeFormatter *
(* +
)+ ,
{- .
}/ 0
public '
RSAOAEPKeyExchangeFormatter *
(* +
RsaKeyParameters+ ;
key< ?
)? @
{ 	
if 
( 
key 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
key7 :
): ;
); <
;< =
_rsaKey 
= 
key 
; 
} 	
public 
byte 
[ 
] 
	Parameter 
{ 	
get 
{ 
if 
( 
ParameterValue "
!=# %
null& *
)* +
{ 
return   
(   
byte    
[    !
]  ! "
)  " #
ParameterValue  # 1
.  1 2
Clone  2 7
(  7 8
)  8 9
;  9 :
}!! 
return## 
null## 
;## 
}$$ 
set%% 
{&& 
if'' 
('' 
value'' 
!='' 
null'' !
)''! "
{(( 
ParameterValue)) "
=))# $
())% &
byte))& *
[))* +
]))+ ,
))), -
value))- 2
.))2 3
Clone))3 8
())8 9
)))9 :
;)): ;
}** 
else++ 
{,, 
ParameterValue-- "
=--# $
null--% )
;--) *
}.. 
}// 
}00 	
public22 
string22 

Parameters22  
{33 	
get44 
{44 
return44 
null44 
;44 
}44 
}55 	
public77 
SecureRandom77 
Rng77 
{77  !
get88 
{88 
return88 
RngValue88 !
;88! "
}88# $
set99 
{99 
RngValue99 
=99 
value99 "
;99" #
}99$ %
}:: 	
public<< 
void<< 
SetKey<< 
(<< 
RsaKeyParameters<< +
key<<, /
)<</ 0
{== 	
if>> 
(>> 
key>> 
==>> 
null>> 
)>> 
throw?? 
new?? !
ArgumentNullException?? /
(??/ 0
nameof??0 6
(??6 7
key??7 :
)??: ;
)??; <
;??< =
_rsaKeyAA 
=AA 
keyAA 
;AA 
}BB 	
publicDD 
byteDD 
[DD 
]DD 
CreateKeyExchangeDD '
(DD' (
byteDD( ,
[DD, -
]DD- .
rgbDataDD/ 6
,DD6 7
TypeDD8 <

symAlgTypeDD= G
)DDG H
{EE 	
returnFF 
CreateKeyExchangeFF $
(FF$ %
rgbDataFF% ,
)FF, -
;FF- .
}GG 	
publicII 
byteII 
[II 
]II 
CreateKeyExchangeII '
(II' (
byteII( ,
[II, -
]II- .
rgbDataII/ 6
)II6 7
{JJ 	
ifKK 
(KK 
_rsaKeyKK 
==KK 
nullKK 
)KK  
throwLL 
newLL 
SystemLL  
.LL  !
SecurityLL! )
.LL) *
CryptographyLL* 6
.LL6 75
)CryptographicUnexpectedOperationExceptionLL7 `
(LL` a
SRLLa c
.LLc d#
Cryptography_MissingKeyLLd {
)LL{ |
;LL| }
varNN 
rsaNN 
=NN 
CipherUtilitiesNN %
.NN% &
	GetCipherNN& /
(NN/ 0
$strNN0 B
)NNB C
;NNC D
rsaOO 
.OO 
InitOO 
(OO 
trueOO 
,OO 
_rsaKeyOO "
)OO" #
;OO# $
returnQQ 
rsaQQ 
.QQ 
DoFinalQQ 
(QQ 
rgbDataQQ &
)QQ& '
;QQ' (
}RR 	
}SS 
}TT ö
IC:\code\bc-xml-security\refactoring\src\RSAPKCS1KeyExchangeDeformatter.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class *
RSAPKCS1KeyExchangeDeformatter /
{ 
private 
RsaKeyParameters  
_rsaKey! (
;( )
private 
SecureRandom 
RngValue %
;% &
public *
RSAPKCS1KeyExchangeDeformatter -
(- .
). /
{0 1
}2 3
public *
RSAPKCS1KeyExchangeDeformatter -
(- .
RsaKeyParameters. >
key? B
)B C
{ 	
if 
( 
key 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
key7 :
): ;
); <
;< =
_rsaKey 
= 
key 
; 
} 	
public 
SecureRandom 
RNG 
{  !
get 
{ 
return 
RngValue !
;! "
}# $
set 
{ 
RngValue 
= 
value "
;" #
}$ %
} 	
public 
string 

Parameters  
{   	
get!! 
{!! 
return!! 
null!! 
;!! 
}!! 
set"" 
{"" 
}"" 
}## 	
public%% 
byte%% 
[%% 
]%% 
DecryptKeyExchange%% (
(%%( )
byte%%) -
[%%- .
]%%. /
rgbIn%%0 5
)%%5 6
{&& 	
if'' 
('' 
_rsaKey'' 
=='' 
null'' 
)''  
throw(( 
new(( 
System((  
.((  !
Security((! )
.(() *
Cryptography((* 6
.((6 75
)CryptographicUnexpectedOperationException((7 `
(((` a
SR((a c
.((c d#
Cryptography_MissingKey((d {
)(({ |
;((| }
var** 
rsa** 
=** 
CipherUtilities** %
.**% &
	GetCipher**& /
(**/ 0
$str**0 C
)**C D
;**D E
rsa++ 
.++ 
Init++ 
(++ 
false++ 
,++ 
_rsaKey++ #
)++# $
;++$ %
return-- 
rsa-- 
.-- 
DoFinal-- 
(-- 
rgbIn-- $
)--$ %
;--% &
}.. 	
public00 
void00 
SetKey00 
(00 
RsaKeyParameters00 +
key00, /
)00/ 0
{11 	
if22 
(22 
key22 
==22 
null22 
)22 
throw33 
new33 !
ArgumentNullException33 /
(33/ 0
nameof330 6
(336 7
key337 :
)33: ;
)33; <
;33< =
_rsaKey55 
=55 
key55 
;55 
}66 	
}77 
}88 ˙
GC:\code\bc-xml-security\refactoring\src\RSAPKCS1KeyExchangeFormatter.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class (
RSAPKCS1KeyExchangeFormatter -
{ 
private 
RsaKeyParameters  
_rsaKey! (
;( )
private 
SecureRandom 
RngValue %
;% &
public (
RSAPKCS1KeyExchangeFormatter +
(+ ,
), -
{. /
}0 1
public (
RSAPKCS1KeyExchangeFormatter +
(+ ,
RsaKeyParameters, <
key= @
)@ A
{ 	
if 
( 
key 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
key7 :
): ;
); <
;< =
_rsaKey 
= 
key 
; 
} 	
public 
string 

Parameters  
{ 	
get 
{ 
return 
$str	 À
;
À Ã
} 
}   	
public"" 
SecureRandom"" 
Rng"" 
{""  !
get## 
{## 
return## 
RngValue## !
;##! "
}### $
set$$ 
{$$ 
RngValue$$ 
=$$ 
value$$ "
;$$" #
}$$$ %
}%% 	
public'' 
void'' 
SetKey'' 
('' 
RsaKeyParameters'' +
key'', /
)''/ 0
{(( 	
if)) 
()) 
key)) 
==)) 
null)) 
))) 
throw** 
new** !
ArgumentNullException** /
(**/ 0
nameof**0 6
(**6 7
key**7 :
)**: ;
)**; <
;**< =
_rsaKey,, 
=,, 
key,, 
;,, 
}-- 	
public// 
byte// 
[// 
]// 
CreateKeyExchange// '
(//' (
byte//( ,
[//, -
]//- .
rgbData/// 6
,//6 7
Type//8 <

symAlgType//= G
)//G H
{00 	
return11 
CreateKeyExchange11 $
(11$ %
rgbData11% ,
)11, -
;11- .
}22 	
public44 
byte44 
[44 
]44 
CreateKeyExchange44 '
(44' (
byte44( ,
[44, -
]44- .
rgbData44/ 6
)446 7
{55 	
if66 
(66 
_rsaKey66 
==66 
null66 
)66  
throw77 
new77 
System77  
.77  !
Security77! )
.77) *
Cryptography77* 6
.776 75
)CryptographicUnexpectedOperationException777 `
(77` a
SR77a c
.77c d#
Cryptography_MissingKey77d {
)77{ |
;77| }
var99 
rsa99 
=99 
CipherUtilities99 %
.99% &
	GetCipher99& /
(99/ 0
$str990 C
)99C D
;99D E
rsa:: 
.:: 
Init:: 
(:: 
true:: 
,:: 
_rsaKey:: "
)::" #
;::# $
return<< 
rsa<< 
.<< 
DoFinal<< 
(<< 
rgbData<< &
)<<& '
;<<' (
}== 	
}>> 
}?? Û§
4C:\code\bc-xml-security\refactoring\src\Signature.cs
	namespace		 	
Org		
 
.		 
BouncyCastle		 
.		 
Crypto		 !
.		! "
Xml		" %
{

 
public 

class 
	Signature 
{ 
private 
string 
_id 
; 
private 

SignedInfo 
_signedInfo &
;& '
private 
byte 
[ 
] 
_signatureValue &
;& '
private 
string 
_signatureValueId (
;( )
private 
KeyInfo 
_keyInfo  
;  !
private 
IList 
_embeddedObjects &
;& '
private  
CanonicalXmlNodeList $
_referencedItems% 5
;5 6
private 
	SignedXml 

_signedXml $
=% &
null' +
;+ ,
internal 
	SignedXml 
	SignedXml $
{ 	
get 
{ 
return 

_signedXml #
;# $
}% &
set 
{ 

_signedXml 
= 
value $
;$ %
}& '
} 	
public   
	Signature   
(   
)   
{!! 	
_embeddedObjects"" 
="" 
new"" "
	ArrayList""# ,
("", -
)""- .
;"". /
_referencedItems## 
=## 
new## " 
CanonicalXmlNodeList### 7
(##7 8
)##8 9
;##9 :
}$$ 	
public** 
string** 
Id** 
{++ 	
get,, 
{,, 
return,, 
_id,, 
;,, 
},, 
set-- 
{-- 
_id-- 
=-- 
value-- 
;-- 
}--  
}.. 	
public00 

SignedInfo00 

SignedInfo00 $
{11 	
get22 
{22 
return22 
_signedInfo22 $
;22$ %
}22& '
set33 
{44 
_signedInfo55 
=55 
value55 #
;55# $
if66 
(66 
	SignedXml66 
!=66  
null66! %
&&66& (
_signedInfo66) 4
!=665 7
null668 <
)66< =
_signedInfo77 
.77  
	SignedXml77  )
=77* +
	SignedXml77, 5
;775 6
}88 
}99 	
public;; 
byte;; 
[;; 
];; 
SignatureValue;; $
{<< 	
get== 
{== 
return== 
_signatureValue== (
;==( )
}==* +
set>> 
{>> 
_signatureValue>> !
=>>" #
value>>$ )
;>>) *
}>>+ ,
}?? 	
publicAA 
KeyInfoAA 
KeyInfoAA 
{BB 	
getCC 
{DD 
ifEE 
(EE 
_keyInfoEE 
==EE 
nullEE  $
)EE$ %
_keyInfoFF 
=FF 
newFF "
KeyInfoFF# *
(FF* +
)FF+ ,
;FF, -
returnGG 
_keyInfoGG 
;GG  
}HH 
setII 
{II 
_keyInfoII 
=II 
valueII "
;II" #
}II$ %
}JJ 	
publicLL 
IListLL 

ObjectListLL 
{MM 	
getNN 
{NN 
returnNN 
_embeddedObjectsNN )
;NN) *
}NN+ ,
setOO 
{OO 
_embeddedObjectsOO "
=OO# $
valueOO% *
;OO* +
}OO, -
}PP 	
internalRR  
CanonicalXmlNodeListRR %
ReferencedItemsRR& 5
{SS 	
getTT 
{TT 
returnTT 
_referencedItemsTT )
;TT) *
}TT+ ,
}UU 	
public[[ 

XmlElement[[ 
GetXml[[  
([[  !
)[[! "
{\\ 	
XmlDocument]] 
document]]  
=]]! "
new]]# &
XmlDocument]]' 2
(]]2 3
)]]3 4
;]]4 5
document^^ 
.^^ 
PreserveWhitespace^^ '
=^^( )
true^^* .
;^^. /
return__ 
GetXml__ 
(__ 
document__ "
)__" #
;__# $
}`` 	
internalbb 

XmlElementbb 
GetXmlbb "
(bb" #
XmlDocumentbb# .
documentbb/ 7
)bb7 8
{cc 	

XmlElementee 
signatureElementee '
=ee( )
(ee* +

XmlElementee+ 5
)ee5 6
documentee6 >
.ee> ?
CreateElementee? L
(eeL M
$streeM X
,eeX Y
	SignedXmleeZ c
.eec d
XmlDsigNamespaceUrleed w
)eew x
;eex y
ifff 
(ff 
!ff 
stringff 
.ff 
IsNullOrEmptyff %
(ff% &
_idff& )
)ff) *
)ff* +
signatureElementgg  
.gg  !
SetAttributegg! -
(gg- .
$strgg. 2
,gg2 3
_idgg4 7
)gg7 8
;gg8 9
ifjj 
(jj 
_signedInfojj 
==jj 
nulljj #
)jj# $
throwkk 
newkk 
Systemkk  
.kk  !
Securitykk! )
.kk) *
Cryptographykk* 6
.kk6 7"
CryptographicExceptionkk7 M
(kkM N
SRkkN P
.kkP Q/
#Cryptography_Xml_SignedInfoRequiredkkQ t
)kkt u
;kku v
signatureElementmm 
.mm 
AppendChildmm (
(mm( )
_signedInfomm) 4
.mm4 5
GetXmlmm5 ;
(mm; <
documentmm< D
)mmD E
)mmE F
;mmF G
ifpp 
(pp 
_signatureValuepp 
==pp  "
nullpp# '
)pp' (
throwqq 
newqq 
Systemqq  
.qq  !
Securityqq! )
.qq) *
Cryptographyqq* 6
.qq6 7"
CryptographicExceptionqq7 M
(qqM N
SRqqN P
.qqP Q3
'Cryptography_Xml_SignatureValueRequiredqqQ x
)qqx y
;qqy z

XmlElementss !
signatureValueElementss ,
=ss- .
documentss/ 7
.ss7 8
CreateElementss8 E
(ssE F
$strssF V
,ssV W
	SignedXmlssX a
.ssa b
XmlDsigNamespaceUrlssb u
)ssu v
;ssv w!
signatureValueElementtt !
.tt! "
AppendChildtt" -
(tt- .
documenttt. 6
.tt6 7
CreateTextNodett7 E
(ttE F
ConvertttF M
.ttM N
ToBase64StringttN \
(tt\ ]
_signatureValuett] l
)ttl m
)ttm n
)ttn o
;tto p
ifuu 
(uu 
!uu 
stringuu 
.uu 
IsNullOrEmptyuu %
(uu% &
_signatureValueIduu& 7
)uu7 8
)uu8 9!
signatureValueElementvv %
.vv% &
SetAttributevv& 2
(vv2 3
$strvv3 7
,vv7 8
_signatureValueIdvv9 J
)vvJ K
;vvK L
signatureElementww 
.ww 
AppendChildww (
(ww( )!
signatureValueElementww) >
)ww> ?
;ww? @
ifzz 
(zz 
KeyInfozz 
.zz 
Countzz 
>zz 
$numzz  !
)zz! "
signatureElement{{  
.{{  !
AppendChild{{! ,
({{, -
KeyInfo{{- 4
.{{4 5
GetXml{{5 ;
({{; <
document{{< D
){{D E
){{E F
;{{F G
foreach~~ 
(~~ 
object~~ 
obj~~ 
in~~  "
_embeddedObjects~~# 3
)~~3 4
{ 

DataObject
ÄÄ 
dataObj
ÄÄ "
=
ÄÄ# $
obj
ÄÄ% (
as
ÄÄ) +

DataObject
ÄÄ, 6
;
ÄÄ6 7
if
ÅÅ 
(
ÅÅ 
dataObj
ÅÅ 
!=
ÅÅ 
null
ÅÅ #
)
ÅÅ# $
{
ÇÇ 
signatureElement
ÉÉ $
.
ÉÉ$ %
AppendChild
ÉÉ% 0
(
ÉÉ0 1
dataObj
ÉÉ1 8
.
ÉÉ8 9
GetXml
ÉÉ9 ?
(
ÉÉ? @
document
ÉÉ@ H
)
ÉÉH I
)
ÉÉI J
;
ÉÉJ K
}
ÑÑ 
}
ÖÖ 
return
áá 
signatureElement
áá #
;
áá# $
}
àà 	
public
ää 
void
ää 
LoadXml
ää 
(
ää 

XmlElement
ää &
value
ää' ,
)
ää, -
{
ãã 	
if
çç 
(
çç 
value
çç 
==
çç 
null
çç 
)
çç 
throw
éé 
new
éé #
ArgumentNullException
éé /
(
éé/ 0
nameof
éé0 6
(
éé6 7
value
éé7 <
)
éé< =
)
éé= >
;
éé> ?

XmlElement
ëë 
signatureElement
ëë '
=
ëë( )
value
ëë* /
;
ëë/ 0
if
íí 
(
íí 
!
íí 
signatureElement
íí !
.
íí! "
	LocalName
íí" +
.
íí+ ,
Equals
íí, 2
(
íí2 3
$str
íí3 >
)
íí> ?
)
íí? @
throw
ìì 
new
ìì 
System
ìì  
.
ìì  !
Security
ìì! )
.
ìì) *
Cryptography
ìì* 6
.
ìì6 7$
CryptographicException
ìì7 M
(
ììM N
SR
ììN P
.
ììP Q-
Cryptography_Xml_InvalidElement
ììQ p
,
ììp q
$str
ììr }
)
ìì} ~
;
ìì~ 
_id
ññ 
=
ññ 
Utils
ññ 
.
ññ 
GetAttribute
ññ $
(
ññ$ %
signatureElement
ññ% 5
,
ññ5 6
$str
ññ7 ;
,
ññ; <
	SignedXml
ññ= F
.
ññF G!
XmlDsigNamespaceUrl
ññG Z
)
ññZ [
;
ññ[ \
if
óó 
(
óó 
!
óó 
Utils
óó 
.
óó 
VerifyAttributes
óó '
(
óó' (
signatureElement
óó( 8
,
óó8 9
$str
óó: >
)
óó> ?
)
óó? @
throw
òò 
new
òò 
System
òò  
.
òò  !
Security
òò! )
.
òò) *
Cryptography
òò* 6
.
òò6 7$
CryptographicException
òò7 M
(
òòM N
SR
òòN P
.
òòP Q-
Cryptography_Xml_InvalidElement
òòQ p
,
òòp q
$str
òòr }
)
òò} ~
;
òò~ !
XmlNamespaceManager
öö 
nsm
öö  #
=
öö$ %
new
öö& )!
XmlNamespaceManager
öö* =
(
öö= >
value
öö> C
.
ööC D
OwnerDocument
ööD Q
.
ööQ R
	NameTable
ööR [
)
öö[ \
;
öö\ ]
nsm
õõ 
.
õõ 
AddNamespace
õõ 
(
õõ 
$str
õõ !
,
õõ! "
	SignedXml
õõ# ,
.
õõ, -!
XmlDsigNamespaceUrl
õõ- @
)
õõ@ A
;
õõA B
int
úú  
expectedChildNodes
úú "
=
úú# $
$num
úú% &
;
úú& '
XmlNodeList
üü 
signedInfoNodes
üü '
=
üü( )
signatureElement
üü* :
.
üü: ;
SelectNodes
üü; F
(
üüF G
$str
üüG V
,
üüV W
nsm
üüX [
)
üü[ \
;
üü\ ]
if
†† 
(
†† 
signedInfoNodes
†† 
==
††  "
null
††# '
||
††( *
signedInfoNodes
††+ :
.
††: ;
Count
††; @
==
††A C
$num
††D E
||
††F H
signedInfoNodes
††I X
.
††X Y
Count
††Y ^
>
††_ `
$num
††a b
)
††b c
throw
°° 
new
°° 
System
°°  
.
°°  !
Security
°°! )
.
°°) *
Cryptography
°°* 6
.
°°6 7$
CryptographicException
°°7 M
(
°°M N
SR
°°N P
.
°°P Q-
Cryptography_Xml_InvalidElement
°°Q p
,
°°p q
$str
°°r ~
)
°°~ 
;°° Ä

XmlElement
¢¢ 
signedInfoElement
¢¢ (
=
¢¢) *
signedInfoNodes
¢¢+ :
[
¢¢: ;
$num
¢¢; <
]
¢¢< =
as
¢¢> @

XmlElement
¢¢A K
;
¢¢K L 
expectedChildNodes
££ 
+=
££ !
signedInfoNodes
££" 1
.
££1 2
Count
££2 7
;
££7 8

SignedInfo
•• 
=
•• 
new
•• 

SignedInfo
•• '
(
••' (
)
••( )
;
••) *

SignedInfo
¶¶ 
.
¶¶ 
LoadXml
¶¶ 
(
¶¶ 
signedInfoElement
¶¶ 0
)
¶¶0 1
;
¶¶1 2
XmlNodeList
©© !
signatureValueNodes
©© +
=
©©, -
signatureElement
©©. >
.
©©> ?
SelectNodes
©©? J
(
©©J K
$str
©©K ^
,
©©^ _
nsm
©©` c
)
©©c d
;
©©d e
if
™™ 
(
™™ !
signatureValueNodes
™™ #
==
™™$ &
null
™™' +
||
™™, .!
signatureValueNodes
™™/ B
.
™™B C
Count
™™C H
==
™™I K
$num
™™L M
||
™™N P!
signatureValueNodes
™™Q d
.
™™d e
Count
™™e j
>
™™k l
$num
™™m n
)
™™n o
throw
´´ 
new
´´ 
System
´´  
.
´´  !
Security
´´! )
.
´´) *
Cryptography
´´* 6
.
´´6 7$
CryptographicException
´´7 M
(
´´M N
SR
´´N P
.
´´P Q-
Cryptography_Xml_InvalidElement
´´Q p
,
´´p q
$str´´r Ç
)´´Ç É
;´´É Ñ

XmlElement
¨¨ #
signatureValueElement
¨¨ ,
=
¨¨- .!
signatureValueNodes
¨¨/ B
[
¨¨B C
$num
¨¨C D
]
¨¨D E
as
¨¨F H

XmlElement
¨¨I S
;
¨¨S T 
expectedChildNodes
≠≠ 
+=
≠≠ !!
signatureValueNodes
≠≠" 5
.
≠≠5 6
Count
≠≠6 ;
;
≠≠; <
_signatureValue
ÆÆ 
=
ÆÆ 
Convert
ÆÆ %
.
ÆÆ% &
FromBase64String
ÆÆ& 6
(
ÆÆ6 7
Utils
ÆÆ7 <
.
ÆÆ< = 
DiscardWhiteSpaces
ÆÆ= O
(
ÆÆO P#
signatureValueElement
ÆÆP e
.
ÆÆe f
	InnerText
ÆÆf o
)
ÆÆo p
)
ÆÆp q
;
ÆÆq r
_signatureValueId
ØØ 
=
ØØ 
Utils
ØØ  %
.
ØØ% &
GetAttribute
ØØ& 2
(
ØØ2 3#
signatureValueElement
ØØ3 H
,
ØØH I
$str
ØØJ N
,
ØØN O
	SignedXml
ØØP Y
.
ØØY Z!
XmlDsigNamespaceUrl
ØØZ m
)
ØØm n
;
ØØn o
if
∞∞ 
(
∞∞ 
!
∞∞ 
Utils
∞∞ 
.
∞∞ 
VerifyAttributes
∞∞ '
(
∞∞' (#
signatureValueElement
∞∞( =
,
∞∞= >
$str
∞∞? C
)
∞∞C D
)
∞∞D E
throw
±± 
new
±± 
System
±±  
.
±±  !
Security
±±! )
.
±±) *
Cryptography
±±* 6
.
±±6 7$
CryptographicException
±±7 M
(
±±M N
SR
±±N P
.
±±P Q-
Cryptography_Xml_InvalidElement
±±Q p
,
±±p q
$str±±r Ç
)±±Ç É
;±±É Ñ
XmlNodeList
¥¥ 
keyInfoNodes
¥¥ $
=
¥¥% &
signatureElement
¥¥' 7
.
¥¥7 8
SelectNodes
¥¥8 C
(
¥¥C D
$str
¥¥D P
,
¥¥P Q
nsm
¥¥R U
)
¥¥U V
;
¥¥V W
_keyInfo
µµ 
=
µµ 
new
µµ 
KeyInfo
µµ "
(
µµ" #
)
µµ# $
;
µµ$ %
if
∂∂ 
(
∂∂ 
keyInfoNodes
∂∂ 
!=
∂∂ 
null
∂∂  $
)
∂∂$ %
{
∑∑ 
if
∏∏ 
(
∏∏ 
keyInfoNodes
∏∏  
.
∏∏  !
Count
∏∏! &
>
∏∏' (
$num
∏∏) *
)
∏∏* +
{
ππ 
throw
∫∫ 
new
∫∫ 
System
∫∫ $
.
∫∫$ %
Security
∫∫% -
.
∫∫- .
Cryptography
∫∫. :
.
∫∫: ;$
CryptographicException
∫∫; Q
(
∫∫Q R
SR
∫∫R T
.
∫∫T U-
Cryptography_Xml_InvalidElement
∫∫U t
,
∫∫t u
$str
∫∫v 
)∫∫ Ä
;∫∫Ä Å
}
ªª 
foreach
ºº 
(
ºº 
XmlNode
ºº  
node
ºº! %
in
ºº& (
keyInfoNodes
ºº) 5
)
ºº5 6
{
ΩΩ 

XmlElement
ææ 
keyInfoElement
ææ -
=
ææ. /
node
ææ0 4
as
ææ5 7

XmlElement
ææ8 B
;
ææB C
if
øø 
(
øø 
keyInfoElement
øø &
!=
øø' )
null
øø* .
)
øø. /
_keyInfo
¿¿  
.
¿¿  !
LoadXml
¿¿! (
(
¿¿( )
keyInfoElement
¿¿) 7
)
¿¿7 8
;
¿¿8 9
}
¡¡  
expectedChildNodes
¬¬ "
+=
¬¬# %
keyInfoNodes
¬¬& 2
.
¬¬2 3
Count
¬¬3 8
;
¬¬8 9
}
√√ 
XmlNodeList
∆∆ 
objectNodes
∆∆ #
=
∆∆$ %
signatureElement
∆∆& 6
.
∆∆6 7
SelectNodes
∆∆7 B
(
∆∆B C
$str
∆∆C N
,
∆∆N O
nsm
∆∆P S
)
∆∆S T
;
∆∆T U
_embeddedObjects
«« 
.
«« 
Clear
«« "
(
««" #
)
««# $
;
««$ %
if
»» 
(
»» 
objectNodes
»» 
!=
»» 
null
»» #
)
»»# $
{
…… 
foreach
   
(
   
XmlNode
    
node
  ! %
in
  & (
objectNodes
  ) 4
)
  4 5
{
ÀÀ 

XmlElement
ÃÃ 
objectElement
ÃÃ ,
=
ÃÃ- .
node
ÃÃ/ 3
as
ÃÃ4 6

XmlElement
ÃÃ7 A
;
ÃÃA B
if
ÕÕ 
(
ÕÕ 
objectElement
ÕÕ %
!=
ÕÕ& (
null
ÕÕ) -
)
ÕÕ- .
{
ŒŒ 

DataObject
œœ "
dataObj
œœ# *
=
œœ+ ,
new
œœ- 0

DataObject
œœ1 ;
(
œœ; <
)
œœ< =
;
œœ= >
dataObj
–– 
.
––  
LoadXml
––  '
(
––' (
objectElement
––( 5
)
––5 6
;
––6 7
_embeddedObjects
—— (
.
——( )
Add
——) ,
(
——, -
dataObj
——- 4
)
——4 5
;
——5 6
}
““ 
}
””  
expectedChildNodes
‘‘ "
+=
‘‘# %
objectNodes
‘‘& 1
.
‘‘1 2
Count
‘‘2 7
;
‘‘7 8
}
’’ 
XmlNodeList
ÿÿ 
nodeList
ÿÿ  
=
ÿÿ! "
signatureElement
ÿÿ# 3
.
ÿÿ3 4
SelectNodes
ÿÿ4 ?
(
ÿÿ? @
$str
ÿÿ@ J
,
ÿÿJ K
nsm
ÿÿL O
)
ÿÿO P
;
ÿÿP Q
if
ŸŸ 
(
ŸŸ 
nodeList
ŸŸ 
!=
ŸŸ 
null
ŸŸ  
)
ŸŸ  !
{
⁄⁄ 
foreach
€€ 
(
€€ 
XmlNode
€€  
node
€€! %
in
€€& (
nodeList
€€) 1
)
€€1 2
{
‹‹ 
_referencedItems
›› $
.
››$ %
Add
››% (
(
››( )
node
››) -
)
››- .
;
››. /
}
ﬁﬁ 
}
ﬂﬂ 
if
·· 
(
·· 
signatureElement
··  
.
··  !
SelectNodes
··! ,
(
··, -
$str
··- 0
)
··0 1
.
··1 2
Count
··2 7
!=
··8 : 
expectedChildNodes
··; M
)
··M N
{
‚‚ 
throw
„„ 
new
„„ 
System
„„  
.
„„  !
Security
„„! )
.
„„) *
Cryptography
„„* 6
.
„„6 7$
CryptographicException
„„7 M
(
„„M N
SR
„„N P
.
„„P Q-
Cryptography_Xml_InvalidElement
„„Q p
,
„„p q
$str
„„r }
)
„„} ~
;
„„~ 
}
‰‰ 
}
ÂÂ 	
public
ÁÁ 
void
ÁÁ 
	AddObject
ÁÁ 
(
ÁÁ 

DataObject
ÁÁ (

dataObject
ÁÁ) 3
)
ÁÁ3 4
{
ËË 	
_embeddedObjects
ÈÈ 
.
ÈÈ 
Add
ÈÈ  
(
ÈÈ  !

dataObject
ÈÈ! +
)
ÈÈ+ ,
;
ÈÈ, -
}
ÍÍ 	
}
ÎÎ 
}ÏÏ êÀ
5C:\code\bc-xml-security\refactoring\src\SignedInfo.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 

SignedInfo 
: 
ICollection )
{ 
private 
string 
_id 
; 
private 
string #
_canonicalizationMethod .
;. /
private 
string 
_signatureMethod '
;' (
private 
string 
_signatureLength '
;' (
private 
	ArrayList 
_references %
;% &
private 

XmlElement 

_cachedXml %
=& '
null( ,
;, -
private 
	SignedXml 

_signedXml $
=% &
null' +
;+ ,
private 
	Transform ,
 _canonicalizationMethodTransform :
=; <
null= A
;A B
internal 
	SignedXml 
	SignedXml $
{ 	
get 
{ 
return 

_signedXml #
;# $
}% &
set 
{ 

_signedXml 
= 
value $
;$ %
}& '
} 	
public 

SignedInfo 
( 
) 
{ 	
_references   
=   
new   
	ArrayList   '
(  ' (
)  ( )
;  ) *
}!! 	
public## 
IEnumerator## 
GetEnumerator## (
(##( )
)##) *
{$$ 	
throw%% 
new%% !
NotSupportedException%% +
(%%+ ,
)%%, -
;%%- .
}&& 	
public(( 
void(( 
CopyTo(( 
((( 
Array((  
array((! &
,((& '
int((( +
index((, 1
)((1 2
{)) 	
throw** 
new** !
NotSupportedException** +
(**+ ,
)**, -
;**- .
}++ 	
public-- 
int-- 
Count-- 
{.. 	
get// 
{// 
throw// 
new// !
NotSupportedException// 1
(//1 2
)//2 3
;//3 4
}//5 6
}00 	
public22 
bool22 

IsReadOnly22 
{33 	
get44 
{44 
throw44 
new44 !
NotSupportedException44 1
(441 2
)442 3
;443 4
}445 6
}55 	
public77 
bool77 
IsSynchronized77 "
{88 	
get99 
{99 
throw99 
new99 !
NotSupportedException99 1
(991 2
)992 3
;993 4
}995 6
}:: 	
public<< 
object<< 
SyncRoot<< 
{== 	
get>> 
{>> 
throw>> 
new>> !
NotSupportedException>> 1
(>>1 2
)>>2 3
;>>3 4
}>>5 6
}?? 	
publicEE 
stringEE 
IdEE 
{FF 	
getGG 
{GG 
returnGG 
_idGG 
;GG 
}GG 
setHH 
{II 
_idJJ 
=JJ 
valueJJ 
;JJ 

_cachedXmlKK 
=KK 
nullKK !
;KK! "
}LL 
}MM 	
publicOO 
stringOO "
CanonicalizationMethodOO ,
{PP 	
getQQ 
{RR 
ifTT 
(TT #
_canonicalizationMethodTT +
==TT, .
nullTT/ 3
)TT3 4
returnUU 
	SignedXmlUU $
.UU$ %#
XmlDsigC14NTransformUrlUU% <
;UU< =
returnVV #
_canonicalizationMethodVV .
;VV. /
}WW 
setXX 
{YY #
_canonicalizationMethodZZ '
=ZZ( )
valueZZ* /
;ZZ/ 0

_cachedXml[[ 
=[[ 
null[[ !
;[[! "
}\\ 
}]] 	
public__ 
	Transform__ (
CanonicalizationMethodObject__ 5
{`` 	
getaa 
{bb 
ifcc 
(cc ,
 _canonicalizationMethodTransformcc 4
==cc5 7
nullcc8 <
)cc< =
{dd ,
 _canonicalizationMethodTransformee 4
=ee5 6
CryptoHelpersee7 D
.eeD E
CreateFromNameeeE S
<eeS T
	TransformeeT ]
>ee] ^
(ee^ _"
CanonicalizationMethodee_ u
)eeu v
;eev w
ifff 
(ff ,
 _canonicalizationMethodTransformff 8
==ff9 ;
nullff< @
)ff@ A
throwgg 
newgg !
Systemgg" (
.gg( )
Securitygg) 1
.gg1 2
Cryptographygg2 >
.gg> ?"
CryptographicExceptiongg? U
(ggU V
stringggV \
.gg\ ]
Formatgg] c
(ggc d
CultureInfoggd o
.ggo p
CurrentCultureggp ~
,gg~ 
SR
ggÄ Ç
.
ggÇ É4
&Cryptography_Xml_CreateTransformFailed
ggÉ ©
,
gg© ™$
CanonicalizationMethod
gg´ ¡
)
gg¡ ¬
)
gg¬ √
;
gg√ ƒ,
 _canonicalizationMethodTransformhh 4
.hh4 5
	SignedXmlhh5 >
=hh? @
	SignedXmlhhA J
;hhJ K,
 _canonicalizationMethodTransformii 4
.ii4 5
	Referenceii5 >
=ii? @
nulliiA E
;iiE F
}jj 
returnkk ,
 _canonicalizationMethodTransformkk 7
;kk7 8
}ll 
}mm 	
publicoo 
stringoo 
SignatureMethodoo %
{pp 	
getqq 
{qq 
returnqq 
_signatureMethodqq )
;qq) *
}qq+ ,
setrr 
{ss 
_signatureMethodtt  
=tt! "
valuett# (
;tt( )

_cachedXmluu 
=uu 
nulluu !
;uu! "
}vv 
}ww 	
publicyy 
stringyy 
SignatureLengthyy %
{zz 	
get{{ 
{{{ 
return{{ 
_signatureLength{{ )
;{{) *
}{{+ ,
set|| 
{}} 
_signatureLength~~  
=~~! "
value~~# (
;~~( )

_cachedXml 
= 
null !
;! "
}
ÄÄ 
}
ÅÅ 	
public
ÉÉ 
	ArrayList
ÉÉ 

References
ÉÉ #
{
ÑÑ 	
get
ÖÖ 
{
ÖÖ 
return
ÖÖ 
_references
ÖÖ $
;
ÖÖ$ %
}
ÖÖ& '
}
ÜÜ 	
internal
àà 
bool
àà 

CacheValid
àà  
{
ââ 	
get
ää 
{
ãã 
if
åå 
(
åå 

_cachedXml
åå 
==
åå !
null
åå" &
)
åå& '
return
åå( .
false
åå/ 4
;
åå4 5
foreach
éé 
(
éé 
	Reference
éé "
	reference
éé# ,
in
éé- /

References
éé0 :
)
éé: ;
{
èè 
if
êê 
(
êê 
!
êê 
	reference
êê "
.
êê" #

CacheValid
êê# -
)
êê- .
return
êê/ 5
false
êê6 ;
;
êê; <
}
ëë 
return
íí 
true
íí 
;
íí 
}
ìì 
}
îî 	
public
öö 

XmlElement
öö 
GetXml
öö  
(
öö  !
)
öö! "
{
õõ 	
if
úú 
(
úú 

CacheValid
úú 
)
úú 
return
úú "

_cachedXml
úú# -
;
úú- .
XmlDocument
ûû 
document
ûû  
=
ûû! "
new
ûû# &
XmlDocument
ûû' 2
(
ûû2 3
)
ûû3 4
;
ûû4 5
document
üü 
.
üü  
PreserveWhitespace
üü '
=
üü( )
true
üü* .
;
üü. /
return
†† 
GetXml
†† 
(
†† 
document
†† "
)
††" #
;
††# $
}
°° 	
internal
££ 

XmlElement
££ 
GetXml
££ "
(
££" #
XmlDocument
££# .
document
££/ 7
)
££7 8
{
§§ 	

XmlElement
¶¶ 
signedInfoElement
¶¶ (
=
¶¶) *
document
¶¶+ 3
.
¶¶3 4
CreateElement
¶¶4 A
(
¶¶A B
$str
¶¶B N
,
¶¶N O
	SignedXml
¶¶P Y
.
¶¶Y Z!
XmlDsigNamespaceUrl
¶¶Z m
)
¶¶m n
;
¶¶n o
if
ßß 
(
ßß 
!
ßß 
string
ßß 
.
ßß 
IsNullOrEmpty
ßß %
(
ßß% &
_id
ßß& )
)
ßß) *
)
ßß* +
signedInfoElement
®® !
.
®®! "
SetAttribute
®®" .
(
®®. /
$str
®®/ 3
,
®®3 4
_id
®®5 8
)
®®8 9
;
®®9 :

XmlElement
´´ +
canonicalizationMethodElement
´´ 4
=
´´5 6*
CanonicalizationMethodObject
´´7 S
.
´´S T
GetXml
´´T Z
(
´´Z [
document
´´[ c
,
´´c d
$str
´´e }
)
´´} ~
;
´´~ 
signedInfoElement
¨¨ 
.
¨¨ 
AppendChild
¨¨ )
(
¨¨) *+
canonicalizationMethodElement
¨¨* G
)
¨¨G H
;
¨¨H I
if
ØØ 
(
ØØ 
string
ØØ 
.
ØØ 
IsNullOrEmpty
ØØ $
(
ØØ$ %
_signatureMethod
ØØ% 5
)
ØØ5 6
)
ØØ6 7
throw
∞∞ 
new
∞∞ 
System
∞∞  
.
∞∞  !
Security
∞∞! )
.
∞∞) *
Cryptography
∞∞* 6
.
∞∞6 7$
CryptographicException
∞∞7 M
(
∞∞M N
SR
∞∞N P
.
∞∞P Q6
(Cryptography_Xml_SignatureMethodRequired
∞∞Q y
)
∞∞y z
;
∞∞z {

XmlElement
≤≤ $
signatureMethodElement
≤≤ -
=
≤≤. /
document
≤≤0 8
.
≤≤8 9
CreateElement
≤≤9 F
(
≤≤F G
$str
≤≤G X
,
≤≤X Y
	SignedXml
≤≤Z c
.
≤≤c d!
XmlDsigNamespaceUrl
≤≤d w
)
≤≤w x
;
≤≤x y$
signatureMethodElement
≥≥ "
.
≥≥" #
SetAttribute
≥≥# /
(
≥≥/ 0
$str
≥≥0 ;
,
≥≥; <
_signatureMethod
≥≥= M
)
≥≥M N
;
≥≥N O
if
µµ 
(
µµ 
_signatureLength
µµ  
!=
µµ! #
null
µµ$ (
)
µµ( )
{
∂∂ 

XmlElement
∑∑ 
hmacLengthElement
∑∑ ,
=
∑∑- .
document
∑∑/ 7
.
∑∑7 8
CreateElement
∑∑8 E
(
∑∑E F
null
∑∑F J
,
∑∑J K
$str
∑∑L ^
,
∑∑^ _
	SignedXml
∑∑` i
.
∑∑i j!
XmlDsigNamespaceUrl
∑∑j }
)
∑∑} ~
;
∑∑~ 
XmlText
∏∏ 
outputLength
∏∏ $
=
∏∏% &
document
∏∏' /
.
∏∏/ 0
CreateTextNode
∏∏0 >
(
∏∏> ?
_signatureLength
∏∏? O
)
∏∏O P
;
∏∏P Q
hmacLengthElement
ππ !
.
ππ! "
AppendChild
ππ" -
(
ππ- .
outputLength
ππ. :
)
ππ: ;
;
ππ; <$
signatureMethodElement
∫∫ &
.
∫∫& '
AppendChild
∫∫' 2
(
∫∫2 3
hmacLengthElement
∫∫3 D
)
∫∫D E
;
∫∫E F
}
ªª 
signedInfoElement
ΩΩ 
.
ΩΩ 
AppendChild
ΩΩ )
(
ΩΩ) *$
signatureMethodElement
ΩΩ* @
)
ΩΩ@ A
;
ΩΩA B
if
¿¿ 
(
¿¿ 
_references
¿¿ 
.
¿¿ 
Count
¿¿ !
==
¿¿" $
$num
¿¿% &
)
¿¿& '
throw
¡¡ 
new
¡¡ 
System
¡¡  
.
¡¡  !
Security
¡¡! )
.
¡¡) *
Cryptography
¡¡* 6
.
¡¡6 7$
CryptographicException
¡¡7 M
(
¡¡M N
SR
¡¡N P
.
¡¡P Q7
)Cryptography_Xml_ReferenceElementRequired
¡¡Q z
)
¡¡z {
;
¡¡{ |
for
√√ 
(
√√ 
int
√√ 
i
√√ 
=
√√ 
$num
√√ 
;
√√ 
i
√√ 
<
√√ 
_references
√√  +
.
√√+ ,
Count
√√, 1
;
√√1 2
++
√√3 5
i
√√5 6
)
√√6 7
{
ƒƒ 
	Reference
≈≈ 
	reference
≈≈ #
=
≈≈$ %
(
≈≈& '
	Reference
≈≈' 0
)
≈≈0 1
_references
≈≈1 <
[
≈≈< =
i
≈≈= >
]
≈≈> ?
;
≈≈? @
signedInfoElement
∆∆ !
.
∆∆! "
AppendChild
∆∆" -
(
∆∆- .
	reference
∆∆. 7
.
∆∆7 8
GetXml
∆∆8 >
(
∆∆> ?
document
∆∆? G
)
∆∆G H
)
∆∆H I
;
∆∆I J
}
«« 
return
…… 
signedInfoElement
…… $
;
……$ %
}
   	
public
ÃÃ 
void
ÃÃ 
LoadXml
ÃÃ 
(
ÃÃ 

XmlElement
ÃÃ &
value
ÃÃ' ,
)
ÃÃ, -
{
ÕÕ 	
if
ŒŒ 
(
ŒŒ 
value
ŒŒ 
==
ŒŒ 
null
ŒŒ 
)
ŒŒ 
throw
œœ 
new
œœ #
ArgumentNullException
œœ /
(
œœ/ 0
nameof
œœ0 6
(
œœ6 7
value
œœ7 <
)
œœ< =
)
œœ= >
;
œœ> ?

XmlElement
““ 
signedInfoElement
““ (
=
““) *
value
““+ 0
;
““0 1
if
”” 
(
”” 
!
”” 
signedInfoElement
”” "
.
””" #
	LocalName
””# ,
.
””, -
Equals
””- 3
(
””3 4
$str
””4 @
)
””@ A
)
””A B
throw
‘‘ 
new
‘‘ 
System
‘‘  
.
‘‘  !
Security
‘‘! )
.
‘‘) *
Cryptography
‘‘* 6
.
‘‘6 7$
CryptographicException
‘‘7 M
(
‘‘M N
SR
‘‘N P
.
‘‘P Q-
Cryptography_Xml_InvalidElement
‘‘Q p
,
‘‘p q
$str
‘‘r ~
)
‘‘~ 
;‘‘ Ä!
XmlNamespaceManager
÷÷ 
nsm
÷÷  #
=
÷÷$ %
new
÷÷& )!
XmlNamespaceManager
÷÷* =
(
÷÷= >
value
÷÷> C
.
÷÷C D
OwnerDocument
÷÷D Q
.
÷÷Q R
	NameTable
÷÷R [
)
÷÷[ \
;
÷÷\ ]
nsm
◊◊ 
.
◊◊ 
AddNamespace
◊◊ 
(
◊◊ 
$str
◊◊ !
,
◊◊! "
	SignedXml
◊◊# ,
.
◊◊, -!
XmlDsigNamespaceUrl
◊◊- @
)
◊◊@ A
;
◊◊A B
int
ÿÿ  
expectedChildNodes
ÿÿ "
=
ÿÿ# $
$num
ÿÿ% &
;
ÿÿ& '
_id
€€ 
=
€€ 
Utils
€€ 
.
€€ 
GetAttribute
€€ $
(
€€$ %
signedInfoElement
€€% 6
,
€€6 7
$str
€€8 <
,
€€< =
	SignedXml
€€> G
.
€€G H!
XmlDsigNamespaceUrl
€€H [
)
€€[ \
;
€€\ ]
if
‹‹ 
(
‹‹ 
!
‹‹ 
Utils
‹‹ 
.
‹‹ 
VerifyAttributes
‹‹ '
(
‹‹' (
signedInfoElement
‹‹( 9
,
‹‹9 :
$str
‹‹; ?
)
‹‹? @
)
‹‹@ A
throw
›› 
new
›› 
System
››  
.
››  !
Security
››! )
.
››) *
Cryptography
››* 6
.
››6 7$
CryptographicException
››7 M
(
››M N
SR
››N P
.
››P Q-
Cryptography_Xml_InvalidElement
››Q p
,
››p q
$str
››r ~
)
››~ 
;›› Ä
XmlNodeList
‡‡ )
canonicalizationMethodNodes
‡‡ 3
=
‡‡4 5
signedInfoElement
‡‡6 G
.
‡‡G H
SelectNodes
‡‡H S
(
‡‡S T
$str
‡‡T o
,
‡‡o p
nsm
‡‡q t
)
‡‡t u
;
‡‡u v
if
·· 
(
·· )
canonicalizationMethodNodes
·· +
==
··, .
null
··/ 3
||
··4 6)
canonicalizationMethodNodes
··7 R
.
··R S
Count
··S X
==
··Y [
$num
··\ ]
||
··^ `)
canonicalizationMethodNodes
··a |
.
··| }
Count··} Ç
>··É Ñ
$num··Ö Ü
)··Ü á
throw
‚‚ 
new
‚‚ 
System
‚‚  
.
‚‚  !
Security
‚‚! )
.
‚‚) *
Cryptography
‚‚* 6
.
‚‚6 7$
CryptographicException
‚‚7 M
(
‚‚M N
SR
‚‚N P
.
‚‚P Q-
Cryptography_Xml_InvalidElement
‚‚Q p
,
‚‚p q
$str‚‚r ï
)‚‚ï ñ
;‚‚ñ ó

XmlElement
„„ +
canonicalizationMethodElement
„„ 4
=
„„5 6)
canonicalizationMethodNodes
„„7 R
.
„„R S
Item
„„S W
(
„„W X
$num
„„X Y
)
„„Y Z
as
„„[ ]

XmlElement
„„^ h
;
„„h i 
expectedChildNodes
‰‰ 
+=
‰‰ !)
canonicalizationMethodNodes
‰‰" =
.
‰‰= >
Count
‰‰> C
;
‰‰C D%
_canonicalizationMethod
ÂÂ #
=
ÂÂ$ %
Utils
ÂÂ& +
.
ÂÂ+ ,
GetAttribute
ÂÂ, 8
(
ÂÂ8 9+
canonicalizationMethodElement
ÂÂ9 V
,
ÂÂV W
$str
ÂÂX c
,
ÂÂc d
	SignedXml
ÂÂe n
.
ÂÂn o"
XmlDsigNamespaceUrlÂÂo Ç
)ÂÂÇ É
;ÂÂÉ Ñ
if
ÊÊ 
(
ÊÊ %
_canonicalizationMethod
ÊÊ '
==
ÊÊ( *
null
ÊÊ+ /
||
ÊÊ0 2
!
ÊÊ3 4
Utils
ÊÊ4 9
.
ÊÊ9 :
VerifyAttributes
ÊÊ: J
(
ÊÊJ K+
canonicalizationMethodElement
ÊÊK h
,
ÊÊh i
$str
ÊÊj u
)
ÊÊu v
)
ÊÊv w
throw
ÁÁ 
new
ÁÁ 
System
ÁÁ  
.
ÁÁ  !
Security
ÁÁ! )
.
ÁÁ) *
Cryptography
ÁÁ* 6
.
ÁÁ6 7$
CryptographicException
ÁÁ7 M
(
ÁÁM N
SR
ÁÁN P
.
ÁÁP Q-
Cryptography_Xml_InvalidElement
ÁÁQ p
,
ÁÁp q
$strÁÁr ï
)ÁÁï ñ
;ÁÁñ ó.
 _canonicalizationMethodTransform
ËË ,
=
ËË- .
null
ËË/ 3
;
ËË3 4
if
ÈÈ 
(
ÈÈ +
canonicalizationMethodElement
ÈÈ -
.
ÈÈ- .

ChildNodes
ÈÈ. 8
.
ÈÈ8 9
Count
ÈÈ9 >
>
ÈÈ? @
$num
ÈÈA B
)
ÈÈB C*
CanonicalizationMethodObject
ÍÍ ,
.
ÍÍ, -
LoadInnerXml
ÍÍ- 9
(
ÍÍ9 :+
canonicalizationMethodElement
ÍÍ: W
.
ÍÍW X

ChildNodes
ÍÍX b
)
ÍÍb c
;
ÍÍc d
XmlNodeList
ÌÌ "
signatureMethodNodes
ÌÌ ,
=
ÌÌ- .
signedInfoElement
ÌÌ/ @
.
ÌÌ@ A
SelectNodes
ÌÌA L
(
ÌÌL M
$str
ÌÌM a
,
ÌÌa b
nsm
ÌÌc f
)
ÌÌf g
;
ÌÌg h
if
ÓÓ 
(
ÓÓ "
signatureMethodNodes
ÓÓ $
==
ÓÓ% '
null
ÓÓ( ,
||
ÓÓ- /"
signatureMethodNodes
ÓÓ0 D
.
ÓÓD E
Count
ÓÓE J
==
ÓÓK M
$num
ÓÓN O
||
ÓÓP R"
signatureMethodNodes
ÓÓS g
.
ÓÓg h
Count
ÓÓh m
>
ÓÓn o
$num
ÓÓp q
)
ÓÓq r
throw
ÔÔ 
new
ÔÔ 
System
ÔÔ  
.
ÔÔ  !
Security
ÔÔ! )
.
ÔÔ) *
Cryptography
ÔÔ* 6
.
ÔÔ6 7$
CryptographicException
ÔÔ7 M
(
ÔÔM N
SR
ÔÔN P
.
ÔÔP Q-
Cryptography_Xml_InvalidElement
ÔÔQ p
,
ÔÔp q
$strÔÔr é
)ÔÔé è
;ÔÔè ê

XmlElement
 $
signatureMethodElement
 -
=
. /"
signatureMethodNodes
0 D
.
D E
Item
E I
(
I J
$num
J K
)
K L
as
M O

XmlElement
P Z
;
Z [ 
expectedChildNodes
ÒÒ 
+=
ÒÒ !"
signatureMethodNodes
ÒÒ" 6
.
ÒÒ6 7
Count
ÒÒ7 <
;
ÒÒ< =
_signatureMethod
ÚÚ 
=
ÚÚ 
Utils
ÚÚ $
.
ÚÚ$ %
GetAttribute
ÚÚ% 1
(
ÚÚ1 2$
signatureMethodElement
ÚÚ2 H
,
ÚÚH I
$str
ÚÚJ U
,
ÚÚU V
	SignedXml
ÚÚW `
.
ÚÚ` a!
XmlDsigNamespaceUrl
ÚÚa t
)
ÚÚt u
;
ÚÚu v
if
ÛÛ 
(
ÛÛ 
_signatureMethod
ÛÛ  
==
ÛÛ! #
null
ÛÛ$ (
||
ÛÛ) +
!
ÛÛ, -
Utils
ÛÛ- 2
.
ÛÛ2 3
VerifyAttributes
ÛÛ3 C
(
ÛÛC D$
signatureMethodElement
ÛÛD Z
,
ÛÛZ [
$str
ÛÛ\ g
)
ÛÛg h
)
ÛÛh i
throw
ÙÙ 
new
ÙÙ 
System
ÙÙ  
.
ÙÙ  !
Security
ÙÙ! )
.
ÙÙ) *
Cryptography
ÙÙ* 6
.
ÙÙ6 7$
CryptographicException
ÙÙ7 M
(
ÙÙM N
SR
ÙÙN P
.
ÙÙP Q-
Cryptography_Xml_InvalidElement
ÙÙQ p
,
ÙÙp q
$strÙÙr é
)ÙÙé è
;ÙÙè ê

XmlElement
˜˜ $
signatureLengthElement
˜˜ -
=
˜˜. /$
signatureMethodElement
˜˜0 F
.
˜˜F G
SelectSingleNode
˜˜G W
(
˜˜W X
$str
˜˜X m
,
˜˜m n
nsm
˜˜o r
)
˜˜r s
as
˜˜t v

XmlElement˜˜w Å
;˜˜Å Ç
if
¯¯ 
(
¯¯ $
signatureLengthElement
¯¯ &
!=
¯¯' )
null
¯¯* .
)
¯¯. /
_signatureLength
˘˘  
=
˘˘! "$
signatureLengthElement
˘˘# 9
.
˘˘9 :
InnerXml
˘˘: B
;
˘˘B C
_references
¸¸ 
.
¸¸ 
Clear
¸¸ 
(
¸¸ 
)
¸¸ 
;
¸¸  
XmlNodeList
ˇˇ 
referenceNodes
ˇˇ &
=
ˇˇ' (
signedInfoElement
ˇˇ) :
.
ˇˇ: ;
SelectNodes
ˇˇ; F
(
ˇˇF G
$str
ˇˇG U
,
ˇˇU V
nsm
ˇˇW Z
)
ˇˇZ [
;
ˇˇ[ \
if
ÄÄ 
(
ÄÄ 
referenceNodes
ÄÄ 
!=
ÄÄ !
null
ÄÄ" &
)
ÄÄ& '
{
ÅÅ 
if
ÇÇ 
(
ÇÇ 
referenceNodes
ÇÇ "
.
ÇÇ" #
Count
ÇÇ# (
>
ÇÇ) *
Utils
ÇÇ+ 0
.
ÇÇ0 1(
MaxReferencesPerSignedInfo
ÇÇ1 K
)
ÇÇK L
{
ÉÉ 
throw
ÑÑ 
new
ÑÑ 
System
ÑÑ $
.
ÑÑ$ %
Security
ÑÑ% -
.
ÑÑ- .
Cryptography
ÑÑ. :
.
ÑÑ: ;$
CryptographicException
ÑÑ; Q
(
ÑÑQ R
SR
ÑÑR T
.
ÑÑT U-
Cryptography_Xml_InvalidElement
ÑÑU t
,
ÑÑt u
$strÑÑv å
)ÑÑå ç
;ÑÑç é
}
ÖÖ 
foreach
ÜÜ 
(
ÜÜ 
XmlNode
ÜÜ  
node
ÜÜ! %
in
ÜÜ& (
referenceNodes
ÜÜ) 7
)
ÜÜ7 8
{
áá 

XmlElement
àà 
referenceElement
àà /
=
àà0 1
node
àà2 6
as
àà7 9

XmlElement
àà: D
;
ààD E
	Reference
ââ 
	reference
ââ '
=
ââ( )
new
ââ* -
	Reference
ââ. 7
(
ââ7 8
)
ââ8 9
;
ââ9 :
AddReference
ää  
(
ää  !
	reference
ää! *
)
ää* +
;
ää+ ,
	reference
ãã 
.
ãã 
LoadXml
ãã %
(
ãã% &
referenceElement
ãã& 6
)
ãã6 7
;
ãã7 8
}
åå  
expectedChildNodes
çç "
+=
çç# %
referenceNodes
çç& 4
.
çç4 5
Count
çç5 :
;
çç: ;
if
èè 
(
èè 
signedInfoElement
èè %
.
èè% &
SelectNodes
èè& 1
(
èè1 2
$str
èè2 5
)
èè5 6
.
èè6 7
Count
èè7 <
!=
èè= ? 
expectedChildNodes
èè@ R
)
èèR S
{
êê 
throw
ëë 
new
ëë 
System
ëë $
.
ëë$ %
Security
ëë% -
.
ëë- .
Cryptography
ëë. :
.
ëë: ;$
CryptographicException
ëë; Q
(
ëëQ R
SR
ëëR T
.
ëëT U-
Cryptography_Xml_InvalidElement
ëëU t
,
ëët u
$strëëv Ç
)ëëÇ É
;ëëÉ Ñ
}
íí 
}
ìì 

_cachedXml
ññ 
=
ññ 
signedInfoElement
ññ *
;
ññ* +
}
óó 	
public
ôô 
void
ôô 
AddReference
ôô  
(
ôô  !
	Reference
ôô! *
	reference
ôô+ 4
)
ôô4 5
{
öö 	
if
õõ 
(
õõ 
	reference
õõ 
==
õõ 
null
õõ !
)
õõ! "
throw
úú 
new
úú #
ArgumentNullException
úú /
(
úú/ 0
nameof
úú0 6
(
úú6 7
	reference
úú7 @
)
úú@ A
)
úúA B
;
úúB C
	reference
ûû 
.
ûû 
	SignedXml
ûû 
=
ûû  !
	SignedXml
ûû" +
;
ûû+ ,
_references
üü 
.
üü 
Add
üü 
(
üü 
	reference
üü %
)
üü% &
;
üü& '
}
†† 	
}
°° 
}¢¢ å√
4C:\code\bc-xml-security\refactoring\src\SignedXml.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
	SignedXml 
{ 
	protected 
	Signature 
m_signature '
;' (
	protected 
string 
m_strSigningKeyName ,
;, -
private "
AsymmetricKeyParameter &
_signingKey' 2
;2 3
private 
XmlDocument 
_containingDocument /
=0 1
null2 6
;6 7
private   
IEnumerator   
_keyInfoEnum   (
=  ) *
null  + /
;  / 0
private!! 
IList!! 
<!! 
X509Certificate!! %
>!!% &
_x509Collection!!' 6
=!!7 8
null!!9 =
;!!= >
private"" 
IEnumerator"" 
	_x509Enum"" %
=""& '
null""( ,
;"", -
private$$ 
bool$$ 
[$$ 
]$$ 
_refProcessed$$ $
=$$% &
null$$' +
;$$+ ,
private%% 
int%% 
[%% 
]%% 
_refLevelCache%% $
=%%% &
null%%' +
;%%+ ,
internal'' 
XmlResolver'' 
_xmlResolver'' )
=''* +
null'', 0
;''0 1
internal(( 

XmlElement(( 
_context(( $
=((% &
null((' +
;((+ ,
private)) 
bool)) 
_bResolverSet)) "
=))# $
false))% *
;))* +
private++ 
Func++ 
<++ 
	SignedXml++ 
,++ 
bool++  $
>++$ %%
_signatureFormatValidator++& ?
=++@ A+
DefaultSignatureFormatValidator++B a
;++a b
private,, 

Collection,, 
<,, 
string,, !
>,,! "(
_safeCanonicalizationMethods,,# ?
;,,? @
private// 
static// 
IList// 
<// 
string// #
>//# $*
s_knownCanonicalizationMethods//% C
=//D E
null//F J
;//J K
private11 
static11 
IList11 
<11 
string11 #
>11# $)
s_defaultSafeTransformMethods11% B
=11C D
null11E I
;11I J
private44 
const44 
string44 !
XmlDsigMoreHMACMD5Url44 2
=443 4
$str445 f
;44f g
private55 
const55 
string55 $
XmlDsigMoreHMACSHA256Url55 5
=556 7
$str558 l
;55l m
private66 
const66 
string66 $
XmlDsigMoreHMACSHA384Url66 5
=666 7
$str668 l
;66l m
private77 
const77 
string77 $
XmlDsigMoreHMACSHA512Url77 5
=776 7
$str778 l
;77l m
private88 
const88 
string88 '
XmlDsigMoreHMACRIPEMD160Url88 8
=889 :
$str88; r
;88r s
private;; 
EncryptedXml;; 
_exml;; "
=;;# $
null;;% )
;;;) *
publicAA 
constAA 
stringAA 
XmlDsigNamespaceUrlAA /
=AA0 1
$strAA2 V
;AAV W
publicBB 
constBB 
stringBB -
!XmlDsigMinimalCanonicalizationUrlBB =
=BB> ?
$strBB@ k
;BBk l
publicCC 
constCC 
stringCC &
XmlDsigCanonicalizationUrlCC 6
=CC7 8#
XmlDsigC14NTransformUrlCC9 P
;CCP Q
publicDD 
constDD 
stringDD 2
&XmlDsigCanonicalizationWithCommentsUrlDD B
=DDC D/
#XmlDsigC14NWithCommentsTransformUrlDDE h
;DDh i
publicFF 
constFF 
stringFF 
XmlDsigSHA1UrlFF *
=FF+ ,
$strFF- U
;FFU V
publicGG 
constGG 
stringGG 
XmlDsigDSAUrlGG )
=GG* +
$strGG, X
;GGX Y
publicHH 
constHH 
stringHH 
XmlDsigRSASHA1UrlHH -
=HH. /
$strHH0 \
;HH\ ]
publicII 
constII 
stringII 
XmlDsigHMACSHA1UrlII .
=II/ 0
$strII1 ^
;II^ _
publicKK 
constKK 
stringKK 
XmlDsigSHA256UrlKK ,
=KK- .
$strKK/ X
;KKX Y
publicLL 
constLL 
stringLL 
XmlDsigRSASHA256UrlLL /
=LL0 1
$strLL2 e
;LLe f
publicOO 
constOO 
stringOO 
XmlDsigSHA384UrlOO ,
=OO- .
$strOO/ ^
;OO^ _
publicPP 
constPP 
stringPP 
XmlDsigRSASHA384UrlPP /
=PP0 1
$strPP2 e
;PPe f
publicRR 
constRR 
stringRR 
XmlDsigSHA512UrlRR ,
=RR- .
$strRR/ X
;RRX Y
publicSS 
constSS 
stringSS 
XmlDsigRSASHA512UrlSS /
=SS0 1
$strSS2 e
;SSe f
publicUU 
constUU 
stringUU #
XmlDsigC14NTransformUrlUU 3
=UU4 5
$strUU6 g
;UUg h
publicVV 
constVV 
stringVV /
#XmlDsigC14NWithCommentsTransformUrlVV ?
=VV@ A
$str	VVB Ä
;
VVÄ Å
publicWW 
constWW 
stringWW &
XmlDsigExcC14NTransformUrlWW 6
=WW7 8
$strWW9 b
;WWb c
publicXX 
constXX 
stringXX 2
&XmlDsigExcC14NWithCommentsTransformUrlXX B
=XXC D
$strXXE z
;XXz {
publicYY 
constYY 
stringYY %
XmlDsigBase64TransformUrlYY 5
=YY6 7
$strYY8 b
;YYb c
publicZZ 
constZZ 
stringZZ $
XmlDsigXPathTransformUrlZZ 4
=ZZ5 6
$strZZ7 e
;ZZe f
public[[ 
const[[ 
string[[ #
XmlDsigXsltTransformUrl[[ 3
=[[4 5
$str[[6 c
;[[c d
public\\ 
const\\ 
string\\ 1
%XmlDsigEnvelopedSignatureTransformUrl\\ A
=\\B C
$str\\D {
;\\{ |
public]] 
const]] 
string]] %
XmlDecryptionTransformUrl]] 5
=]]6 7
$str]]8 _
;]]_ `
public^^ 
const^^ 
string^^ "
XmlLicenseTransformUrl^^ 2
=^^3 4
$str^^5 h
;^^h i
publicaa 
constaa 
stringaa 
XmlDsigGost3410Urlaa .
=aa/ 0
$straa1 u
;aau v
publicbb 
constbb 
stringbb &
XmlDsigGost3410ObsoleteUrlbb 6
=bb7 8
$strbb9 y
;bby z
publiccc 
constcc 
stringcc 
XmlDsigGost3411Urlcc .
=cc/ 0
$strcc1 g
;ccg h
publicdd 
constdd 
stringdd &
XmlDsigGost3411ObsoleteUrldd 6
=dd7 8
$strdd9 k
;ddk l
publicee 
constee 
stringee "
XmlDsigGost3411HmacUrlee 2
=ee3 4
$stree5 p
;eep q
publichh 
consthh 
stringhh (
XmlDsigGost3410_2012_256_Urlhh 8
=hh9 :
$str	hh; Ü
;
hhÜ á
publicii 
constii 
stringii (
XmlDsigGost3411_2012_256_Urlii 8
=ii9 :
$strii; y
;iiy z
publicjj 
constjj 
stringjj ,
 XmlDsigGost3411_2012_256_HmacUrljj <
=jj= >
$str	jj? Ç
;
jjÇ É
publicll 
constll 
stringll (
XmlDsigGost3410_2012_512_Urlll 8
=ll9 :
$str	ll; Ü
;
llÜ á
publicmm 
constmm 
stringmm (
XmlDsigGost3411_2012_512_Urlmm 8
=mm9 :
$strmm; y
;mmy z
publicnn 
constnn 
stringnn ,
 XmlDsigGost3411_2012_512_HmacUrlnn <
=nn= >
$str	nn? Ç
;
nnÇ É
publictt 
	SignedXmltt 
(tt 
)tt 
{uu 	

Initializevv 
(vv 
nullvv 
)vv 
;vv 
}ww 	
publicyy 
	SignedXmlyy 
(yy 
XmlDocumentyy $
documentyy% -
)yy- .
{zz 	
if{{ 
({{ 
document{{ 
=={{ 
null{{  
){{  !
throw|| 
new|| !
ArgumentNullException|| /
(||/ 0
nameof||0 6
(||6 7
document||7 ?
)||? @
)||@ A
;||A B

Initialize}} 
(}} 
document}} 
.}}  
DocumentElement}}  /
)}}/ 0
;}}0 1
}~~ 	
public
ÄÄ 
	SignedXml
ÄÄ 
(
ÄÄ 

XmlElement
ÄÄ #
elem
ÄÄ$ (
)
ÄÄ( )
{
ÅÅ 	
if
ÇÇ 
(
ÇÇ 
elem
ÇÇ 
==
ÇÇ 
null
ÇÇ 
)
ÇÇ 
throw
ÉÉ 
new
ÉÉ #
ArgumentNullException
ÉÉ /
(
ÉÉ/ 0
nameof
ÉÉ0 6
(
ÉÉ6 7
elem
ÉÉ7 ;
)
ÉÉ; <
)
ÉÉ< =
;
ÉÉ= >

Initialize
ÑÑ 
(
ÑÑ 
elem
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
private
áá 
void
áá 

Initialize
áá 
(
áá  

XmlElement
áá  *
element
áá+ 2
)
áá2 3
{
àà 	!
_containingDocument
ââ 
=
ââ  !
(
ââ" #
element
ââ# *
==
ââ+ -
null
ââ. 2
?
ââ3 4
null
ââ5 9
:
ââ: ;
element
ââ< C
.
ââC D
OwnerDocument
ââD Q
)
ââQ R
;
ââR S
_context
ää 
=
ää 
element
ää 
;
ää 
m_signature
ãã 
=
ãã 
new
ãã 
	Signature
ãã '
(
ãã' (
)
ãã( )
;
ãã) *
m_signature
åå 
.
åå 
	SignedXml
åå !
=
åå" #
this
åå$ (
;
åå( )
m_signature
çç 
.
çç 

SignedInfo
çç "
=
çç# $
new
çç% (

SignedInfo
çç) 3
(
çç3 4
)
çç4 5
;
çç5 6
_signingKey
éé 
=
éé 
null
éé 
;
éé *
_safeCanonicalizationMethods
êê (
=
êê) *
new
êê+ .

Collection
êê/ 9
<
êê9 :
string
êê: @
>
êê@ A
(
êêA B*
KnownCanonicalizationMethods
êêB ^
)
êê^ _
;
êê_ `
}
ëë 	
public
òò 
string
òò 
SigningKeyName
òò $
{
ôô 	
get
öö 
{
öö 
return
öö !
m_strSigningKeyName
öö ,
;
öö, -
}
öö. /
set
õõ 
{
õõ !
m_strSigningKeyName
õõ %
=
õõ& '
value
õõ( -
;
õõ- .
}
õõ/ 0
}
úú 	
public
ûû 
XmlResolver
ûû 
Resolver
ûû #
{
üü 	
set
¢¢ 
{
££ 
_xmlResolver
§§ 
=
§§ 
value
§§ $
;
§§$ %
_bResolverSet
•• 
=
•• 
true
••  $
;
••$ %
}
¶¶ 
}
ßß 	
internal
©© 
bool
©© 
ResolverSet
©© !
{
™™ 	
get
´´ 
{
´´ 
return
´´ 
_bResolverSet
´´ &
;
´´& '
}
´´( )
}
¨¨ 	
public
ÆÆ 
Func
ÆÆ 
<
ÆÆ 
	SignedXml
ÆÆ 
,
ÆÆ 
bool
ÆÆ #
>
ÆÆ# $&
SignatureFormatValidator
ÆÆ% =
{
ØØ 	
get
∞∞ 
{
∞∞ 
return
∞∞ '
_signatureFormatValidator
∞∞ 2
;
∞∞2 3
}
∞∞4 5
set
±± 
{
±± '
_signatureFormatValidator
±± +
=
±±, -
value
±±. 3
;
±±3 4
}
±±5 6
}
≤≤ 	
public
¥¥ 

Collection
¥¥ 
<
¥¥ 
string
¥¥  
>
¥¥  !)
SafeCanonicalizationMethods
¥¥" =
{
µµ 	
get
∂∂ 
{
∂∂ 
return
∂∂ *
_safeCanonicalizationMethods
∂∂ 5
;
∂∂5 6
}
∂∂7 8
}
∑∑ 	
public
ππ $
AsymmetricKeyParameter
ππ %

SigningKey
ππ& 0
{
∫∫ 	
get
ªª 
{
ªª 
return
ªª 
_signingKey
ªª $
;
ªª$ %
}
ªª& '
set
ºº 
{
ºº 
_signingKey
ºº 
=
ºº 
value
ºº  %
;
ºº% &
}
ºº' (
}
ΩΩ 	
public
øø 
EncryptedXml
øø 
EncryptedXml
øø (
{
¿¿ 	
get
¡¡ 
{
¬¬ 
if
√√ 
(
√√ 
_exml
√√ 
==
√√ 
null
√√ !
)
√√! "
_exml
ƒƒ 
=
ƒƒ 
new
ƒƒ 
EncryptedXml
ƒƒ  ,
(
ƒƒ, -!
_containingDocument
ƒƒ- @
)
ƒƒ@ A
;
ƒƒA B
return
≈≈ 
_exml
≈≈ 
;
≈≈ 
}
∆∆ 
set
«« 
{
«« 
_exml
«« 
=
«« 
value
«« 
;
««  
}
««! "
}
»» 	
public
   
	Signature
   
	Signature
   "
{
ÀÀ 	
get
ÃÃ 
{
ÃÃ 
return
ÃÃ 
m_signature
ÃÃ $
;
ÃÃ$ %
}
ÃÃ& '
}
ÕÕ 	
public
œœ 

SignedInfo
œœ 

SignedInfo
œœ $
{
–– 	
get
—— 
{
—— 
return
—— 
m_signature
—— $
.
——$ %

SignedInfo
——% /
;
——/ 0
}
——1 2
}
““ 	
public
‘‘ 
string
‘‘ 
SignatureMethod
‘‘ %
{
’’ 	
get
÷÷ 
{
÷÷ 
return
÷÷ 
m_signature
÷÷ $
.
÷÷$ %

SignedInfo
÷÷% /
.
÷÷/ 0
SignatureMethod
÷÷0 ?
;
÷÷? @
}
÷÷A B
}
◊◊ 	
public
ŸŸ 
string
ŸŸ 
SignatureLength
ŸŸ %
{
⁄⁄ 	
get
€€ 
{
€€ 
return
€€ 
m_signature
€€ $
.
€€$ %

SignedInfo
€€% /
.
€€/ 0
SignatureLength
€€0 ?
;
€€? @
}
€€A B
}
‹‹ 	
public
ﬁﬁ 
byte
ﬁﬁ 
[
ﬁﬁ 
]
ﬁﬁ 
SignatureValue
ﬁﬁ $
{
ﬂﬂ 	
get
‡‡ 
{
‡‡ 
return
‡‡ 
m_signature
‡‡ $
.
‡‡$ %
SignatureValue
‡‡% 3
;
‡‡3 4
}
‡‡5 6
}
·· 	
public
„„ 
KeyInfo
„„ 
KeyInfo
„„ 
{
‰‰ 	
get
ÂÂ 
{
ÂÂ 
return
ÂÂ 
m_signature
ÂÂ $
.
ÂÂ$ %
KeyInfo
ÂÂ% ,
;
ÂÂ, -
}
ÂÂ. /
set
ÊÊ 
{
ÊÊ 
m_signature
ÊÊ 
.
ÊÊ 
KeyInfo
ÊÊ %
=
ÊÊ& '
value
ÊÊ( -
;
ÊÊ- .
}
ÊÊ/ 0
}
ÁÁ 	
public
ÈÈ 

XmlElement
ÈÈ 
GetXml
ÈÈ  
(
ÈÈ  !
)
ÈÈ! "
{
ÍÍ 	
if
ÏÏ 
(
ÏÏ !
_containingDocument
ÏÏ #
!=
ÏÏ$ &
null
ÏÏ' +
)
ÏÏ+ ,
return
ÌÌ 
m_signature
ÌÌ "
.
ÌÌ" #
GetXml
ÌÌ# )
(
ÌÌ) *!
_containingDocument
ÌÌ* =
)
ÌÌ= >
;
ÌÌ> ?
else
ÓÓ 
return
ÔÔ 
m_signature
ÔÔ "
.
ÔÔ" #
GetXml
ÔÔ# )
(
ÔÔ) *
)
ÔÔ* +
;
ÔÔ+ ,
}
 	
public
ÚÚ 
void
ÚÚ 
LoadXml
ÚÚ 
(
ÚÚ 

XmlElement
ÚÚ &
value
ÚÚ' ,
)
ÚÚ, -
{
ÛÛ 	
if
ÙÙ 
(
ÙÙ 
value
ÙÙ 
==
ÙÙ 
null
ÙÙ 
)
ÙÙ 
throw
ıı 
new
ıı #
ArgumentNullException
ıı /
(
ıı/ 0
nameof
ıı0 6
(
ıı6 7
value
ıı7 <
)
ıı< =
)
ıı= >
;
ıı> ?
m_signature
˜˜ 
.
˜˜ 
LoadXml
˜˜ 
(
˜˜  
value
˜˜  %
)
˜˜% &
;
˜˜& '
if
˘˘ 
(
˘˘ 
_context
˘˘ 
==
˘˘ 
null
˘˘  
)
˘˘  !
{
˙˙ 
_context
˚˚ 
=
˚˚ 
value
˚˚  
;
˚˚  !
}
¸¸ 
_bCacheValid
˛˛ 
=
˛˛ 
false
˛˛  
;
˛˛  !
}
ˇˇ 	
public
ÖÖ 
void
ÖÖ 
AddReference
ÖÖ  
(
ÖÖ  !
	Reference
ÖÖ! *
	reference
ÖÖ+ 4
)
ÖÖ4 5
{
ÜÜ 	
m_signature
áá 
.
áá 

SignedInfo
áá "
.
áá" #
AddReference
áá# /
(
áá/ 0
	reference
áá0 9
)
áá9 :
;
áá: ;
}
àà 	
public
ää 
void
ää 
	AddObject
ää 
(
ää 

DataObject
ää (

dataObject
ää) 3
)
ää3 4
{
ãã 	
m_signature
åå 
.
åå 
	AddObject
åå !
(
åå! "

dataObject
åå" ,
)
åå, -
;
åå- .
}
çç 	
public
èè 
bool
èè 
CheckSignature
èè "
(
èè" #
)
èè# $
{
êê 	$
AsymmetricKeyParameter
ëë "

signingKey
ëë# -
;
ëë- .
return
íí (
CheckSignatureReturningKey
íí -
(
íí- .
out
íí. 1

signingKey
íí2 <
)
íí< =
;
íí= >
}
ìì 	
public
ïï 
bool
ïï (
CheckSignatureReturningKey
ïï .
(
ïï. /
out
ïï/ 2$
AsymmetricKeyParameter
ïï3 I

signingKey
ïïJ T
)
ïïT U
{
ññ 	
SignedXmlDebugLog
óó 
.
óó +
LogBeginSignatureVerification
óó ;
(
óó; <
this
óó< @
,
óó@ A
_context
óóB J
)
óóJ K
;
óóK L
int
ôô 
count
ôô 
=
ôô 
$num
ôô 
;
ôô 

signingKey
öö 
=
öö 
null
öö 
;
öö 
bool
õõ 
bRet
õõ 
=
õõ 
false
õõ 
;
õõ $
AsymmetricKeyParameter
úú "
key
úú# &
=
úú' (
null
úú) -
;
úú- .
if
ûû 
(
ûû 
!
ûû "
CheckSignatureFormat
ûû %
(
ûû% &
)
ûû& '
)
ûû' (
{
üü 
return
†† 
false
†† 
;
†† 
}
°° 
do
££ 
{
§§ 
key
•• 
=
•• 
GetPublicKey
•• "
(
••" #
)
••# $
;
••$ %
if
¶¶ 
(
¶¶ 
key
¶¶ 
!=
¶¶ 
null
¶¶ 
)
¶¶  
{
ßß 
if
®® 
(
®® 
count
®® 
++
®® 
>
®®  !
$num
®®" #
)
®®# $
_bCacheValid
©© $
=
©©% &
false
©©' ,
;
©©, -
bRet
™™ 
=
™™ 
CheckSignature
™™ )
(
™™) *
key
™™* -
)
™™- .
;
™™. /
SignedXmlDebugLog
´´ %
.
´´% &#
LogVerificationResult
´´& ;
(
´´; <
this
´´< @
,
´´@ A
key
´´B E
,
´´E F
bRet
´´G K
)
´´K L
;
´´L M
}
¨¨ 
}
≠≠ 
while
≠≠ 
(
≠≠ 
key
≠≠ 
!=
≠≠ 
null
≠≠  
&&
≠≠! #
bRet
≠≠$ (
==
≠≠) +
false
≠≠, 1
)
≠≠1 2
;
≠≠2 3

signingKey
ØØ 
=
ØØ 
key
ØØ 
;
ØØ 
return
∞∞ 
bRet
∞∞ 
;
∞∞ 
}
±± 	
public
≥≥ 
bool
≥≥ 
CheckSignature
≥≥ "
(
≥≥" #$
AsymmetricKeyParameter
≥≥# 9
key
≥≥: =
)
≥≥= >
{
¥¥ 	
if
µµ 
(
µµ 
!
µµ "
CheckSignatureFormat
µµ %
(
µµ% &
)
µµ& '
)
µµ' (
{
∂∂ 
return
∑∑ 
false
∑∑ 
;
∑∑ 
}
∏∏ 
if
∫∫ 
(
∫∫ 
!
∫∫ 
CheckSignedInfo
∫∫  
(
∫∫  !
key
∫∫! $
)
∫∫$ %
)
∫∫% &
{
ªª 
SignedXmlDebugLog
ºº !
.
ºº! "$
LogVerificationFailure
ºº" 8
(
ºº8 9
this
ºº9 =
,
ºº= >
SR
ºº? A
.
ººA B/
!Log_VerificationFailed_SignedInfo
ººB c
)
ººc d
;
ººd e
return
ΩΩ 
false
ΩΩ 
;
ΩΩ 
}
ææ 
if
¡¡ 
(
¡¡ 
!
¡¡ %
CheckDigestedReferences
¡¡ (
(
¡¡( )
)
¡¡) *
)
¡¡* +
{
¬¬ 
SignedXmlDebugLog
√√ !
.
√√! "$
LogVerificationFailure
√√" 8
(
√√8 9
this
√√9 =
,
√√= >
SR
√√? A
.
√√A B/
!Log_VerificationFailed_References
√√B c
)
√√c d
;
√√d e
return
ƒƒ 
false
ƒƒ 
;
ƒƒ 
}
≈≈ 
SignedXmlDebugLog
«« 
.
«« #
LogVerificationResult
«« 3
(
««3 4
this
««4 8
,
««8 9
key
««: =
,
««= >
true
««? C
)
««C D
;
««D E
return
»» 
true
»» 
;
»» 
}
…… 	
public
ÀÀ 
bool
ÀÀ 
CheckSignature
ÀÀ "
(
ÀÀ" #
IMac
ÀÀ# '
macAlg
ÀÀ( .
)
ÀÀ. /
{
ÃÃ 	
if
ÕÕ 
(
ÕÕ 
!
ÕÕ "
CheckSignatureFormat
ÕÕ %
(
ÕÕ% &
)
ÕÕ& '
)
ÕÕ' (
{
ŒŒ 
return
œœ 
false
œœ 
;
œœ 
}
–– 
if
““ 
(
““ 
!
““ 
CheckSignedInfo
““  
(
““  !
macAlg
““! '
)
““' (
)
““( )
{
”” 
SignedXmlDebugLog
‘‘ !
.
‘‘! "$
LogVerificationFailure
‘‘" 8
(
‘‘8 9
this
‘‘9 =
,
‘‘= >
SR
‘‘? A
.
‘‘A B/
!Log_VerificationFailed_SignedInfo
‘‘B c
)
‘‘c d
;
‘‘d e
return
’’ 
false
’’ 
;
’’ 
}
÷÷ 
if
ÿÿ 
(
ÿÿ 
!
ÿÿ %
CheckDigestedReferences
ÿÿ (
(
ÿÿ( )
)
ÿÿ) *
)
ÿÿ* +
{
ŸŸ 
SignedXmlDebugLog
⁄⁄ !
.
⁄⁄! "$
LogVerificationFailure
⁄⁄" 8
(
⁄⁄8 9
this
⁄⁄9 =
,
⁄⁄= >
SR
⁄⁄? A
.
⁄⁄A B/
!Log_VerificationFailed_References
⁄⁄B c
)
⁄⁄c d
;
⁄⁄d e
return
€€ 
false
€€ 
;
€€ 
}
‹‹ 
SignedXmlDebugLog
ﬁﬁ 
.
ﬁﬁ #
LogVerificationResult
ﬁﬁ 3
(
ﬁﬁ3 4
this
ﬁﬁ4 8
,
ﬁﬁ8 9
macAlg
ﬁﬁ: @
,
ﬁﬁ@ A
true
ﬁﬁB F
)
ﬁﬁF G
;
ﬁﬁG H
return
ﬂﬂ 
true
ﬂﬂ 
;
ﬂﬂ 
}
‡‡ 	
public
‚‚ 
bool
‚‚ 
CheckSignature
‚‚ "
(
‚‚" #
X509Certificate
‚‚# 2
certificate
‚‚3 >
,
‚‚> ?
bool
‚‚@ D!
verifySignatureOnly
‚‚E X
)
‚‚X Y
{
„„ 	
if
‰‰ 
(
‰‰ 
!
‰‰ !
verifySignatureOnly
‰‰ $
)
‰‰$ %
{
ÂÂ 
var
ÁÁ 
exts
ÁÁ 
=
ÁÁ 
certificate
ÁÁ &
.
ÁÁ& '"
CertificateStructure
ÁÁ' ;
.
ÁÁ; <
TbsCertificate
ÁÁ< J
.
ÁÁJ K

Extensions
ÁÁK U
;
ÁÁU V
foreach
ËË 
(
ËË !
DerObjectIdentifier
ËË ,
	extension
ËË- 6
in
ËË7 9
exts
ËË: >
.
ËË> ?
ExtensionOids
ËË? L
)
ËËL M
{
ÈÈ 
if
ÍÍ 
(
ÍÍ 
	extension
ÍÍ !
.
ÍÍ! "
Equals
ÍÍ" (
(
ÍÍ( )
X509Extensions
ÍÍ) 7
.
ÍÍ7 8
KeyUsage
ÍÍ8 @
)
ÍÍ@ A
)
ÍÍA B
{
ÎÎ 
var
ÏÏ 
keyUsage
ÏÏ $
=
ÏÏ% &
certificate
ÏÏ' 2
.
ÏÏ2 3
GetKeyUsage
ÏÏ3 >
(
ÏÏ> ?
)
ÏÏ? @
;
ÏÏ@ A
bool
ÌÌ 
validKeyUsage
ÌÌ *
=
ÌÌ+ ,
(
ÌÌ- .
keyUsage
ÌÌ. 6
[
ÌÌ6 7
$num
ÌÌ7 8
]
ÌÌO P
||
ÌÌQ S
keyUsage
ÌÌT \
[
ÌÌ\ ]
$num
ÌÌ] ^
]
ÌÌs t
)
ÌÌt u
;
ÌÌu v
if
ÔÔ 
(
ÔÔ 
!
ÔÔ 
validKeyUsage
ÔÔ *
)
ÔÔ* +
{
 
SignedXmlDebugLog
ÒÒ -
.
ÒÒ- .$
LogVerificationFailure
ÒÒ. D
(
ÒÒD E
this
ÒÒE I
,
ÒÒI J
SR
ÒÒK M
.
ÒÒM N1
#Log_VerificationFailed_X509KeyUsage
ÒÒN q
)
ÒÒq r
;
ÒÒr s
return
ÚÚ "
false
ÚÚ# (
;
ÚÚ( )
}
ÛÛ 
break
ÙÙ 
;
ÙÙ 
}
ıı 
}
ˆˆ 
}
ÉÉ $
AsymmetricKeyParameter
ÖÖ "
	publicKey
ÖÖ# ,
=
ÖÖ- .
certificate
ÖÖ/ :
.
ÖÖ: ;
GetPublicKey
ÖÖ; G
(
ÖÖG H
)
ÖÖH I
;
ÖÖI J
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
CheckSignature
ÜÜ 
(
ÜÜ  
	publicKey
ÜÜ  )
)
ÜÜ) *
)
ÜÜ* +
{
áá 
return
àà 
false
àà 
;
àà 
}
ââ 
SignedXmlDebugLog
ãã 
.
ãã #
LogVerificationResult
ãã 3
(
ãã3 4
this
ãã4 8
,
ãã8 9
certificate
ãã: E
,
ããE F
true
ããG K
)
ããK L
;
ããL M
return
åå 
true
åå 
;
åå 
}
çç 	
public
èè 
void
èè 
ComputeSignature
èè $
(
èè$ %
)
èè% &
{
êê 	
SignedXmlDebugLog
ëë 
.
ëë *
LogBeginSignatureComputation
ëë :
(
ëë: ;
this
ëë; ?
,
ëë? @
_context
ëëA I
)
ëëI J
;
ëëJ K%
BuildDigestedReferences
ìì #
(
ìì# $
)
ìì$ %
;
ìì% &$
AsymmetricKeyParameter
ññ "
key
ññ# &
=
ññ' (

SigningKey
ññ) 3
;
ññ3 4
if
òò 
(
òò 
key
òò 
==
òò 
null
òò 
)
òò 
throw
ôô 
new
ôô 
System
ôô  
.
ôô  !
Security
ôô! )
.
ôô) *
Cryptography
ôô* 6
.
ôô6 7$
CryptographicException
ôô7 M
(
ôôM N
SR
ôôN P
.
ôôP Q,
Cryptography_Xml_LoadKeyFailed
ôôQ o
)
ôôo p
;
ôôp q
if
úú 
(
úú 

SignedInfo
úú 
.
úú 
SignatureMethod
úú *
==
úú+ -
null
úú. 2
)
úú2 3
{
ùù 
if
ûû 
(
ûû 
key
ûû 
is
ûû 
DsaKeyParameters
ûû +
)
ûû+ ,
{
üü 

SignedInfo
†† 
.
†† 
SignatureMethod
†† .
=
††/ 0
XmlDsigDSAUrl
††1 >
;
††> ?
}
°° 
else
¢¢ 
if
¢¢ 
(
¢¢ 
key
¢¢ 
is
¢¢ 
RsaKeyParameters
¢¢  0
)
¢¢0 1
{
££ 

SignedInfo
§§ 
.
§§ 
SignatureMethod
§§ .
=
§§/ 0!
XmlDsigRSASHA256Url
§§1 D
;
§§D E
}
•• 
else
¶¶ 
{
ßß 
throw
®® 
new
®® 
System
®® $
.
®®$ %
Security
®®% -
.
®®- .
Cryptography
®®. :
.
®®: ;$
CryptographicException
®®; Q
(
®®Q R
SR
®®R T
.
®®T U/
!Cryptography_Xml_CreatedKeyFailed
®®U v
)
®®v w
;
®®w x
}
©© 
}
™™ 
ISigner
≠≠ "
signatureDescription
≠≠ (
=
≠≠) *
CryptoHelpers
≠≠+ 8
.
≠≠8 9
CreateFromName
≠≠9 G
<
≠≠G H
ISigner
≠≠H O
>
≠≠O P
(
≠≠P Q

SignedInfo
≠≠Q [
.
≠≠[ \
SignatureMethod
≠≠\ k
)
≠≠k l
;
≠≠l m
if
ÆÆ 
(
ÆÆ "
signatureDescription
ÆÆ $
==
ÆÆ% '
null
ÆÆ( ,
)
ÆÆ, -
throw
ØØ 
new
ØØ 
System
ØØ  
.
ØØ  !
Security
ØØ! )
.
ØØ) *
Cryptography
ØØ* 6
.
ØØ6 7$
CryptographicException
ØØ7 M
(
ØØM N
SR
ØØN P
.
ØØP Q>
/Cryptography_Xml_SignatureDescriptionNotCreatedØØQ Ä
)ØØÄ Å
;ØØÅ Ç"
signatureDescription
±±  
.
±±  !
Init
±±! %
(
±±% &
true
±±& *
,
±±* +
key
±±, /
)
±±/ 0
;
±±0 1
GetC14NDigest
≤≤ 
(
≤≤ 
new
≤≤ 
SignerHashWrapper
≤≤ /
(
≤≤/ 0"
signatureDescription
≤≤0 D
)
≤≤D E
)
≤≤E F
;
≤≤F G
SignedXmlDebugLog
¥¥ 
.
¥¥ 

LogSigning
¥¥ (
(
¥¥( )
this
¥¥) -
,
¥¥- .
key
¥¥/ 2
,
¥¥2 3"
signatureDescription
¥¥4 H
)
¥¥H I
;
¥¥I J
m_signature
µµ 
.
µµ 
SignatureValue
µµ &
=
µµ' ("
signatureDescription
µµ) =
.
µµ= >
GenerateSignature
µµ> O
(
µµO P
)
µµP Q
;
µµQ R
}
∂∂ 	
public
∏∏ 
void
∏∏ 
ComputeSignature
∏∏ $
(
∏∏$ %
IMac
∏∏% )
macAlg
∏∏* 0
)
∏∏0 1
{
ππ 	
if
∫∫ 
(
∫∫ 
macAlg
∫∫ 
==
∫∫ 
null
∫∫ 
)
∫∫ 
throw
ªª 
new
ªª #
ArgumentNullException
ªª /
(
ªª/ 0
nameof
ªª0 6
(
ªª6 7
macAlg
ªª7 =
)
ªª= >
)
ªª> ?
;
ªª? @
if
ΩΩ 
(
ΩΩ 
!
ΩΩ 
(
ΩΩ 
macAlg
ΩΩ 
is
ΩΩ 
HMac
ΩΩ  
)
ΩΩ  !
)
ΩΩ! "
throw
ææ 
new
ææ 
System
ææ  
.
ææ  !
Security
ææ! )
.
ææ) *
Cryptography
ææ* 6
.
ææ6 7$
CryptographicException
ææ7 M
(
ææM N
SR
ææN P
.
ææP Q9
+Cryptography_Xml_SignatureMethodKeyMismatch
ææQ |
)
ææ| }
;
ææ} ~
int
¿¿ 
signatureLength
¿¿ 
;
¿¿  
if
¡¡ 
(
¡¡ 
m_signature
¡¡ 
.
¡¡ 

SignedInfo
¡¡ &
.
¡¡& '
SignatureLength
¡¡' 6
==
¡¡7 9
null
¡¡: >
)
¡¡> ?
signatureLength
¬¬ 
=
¬¬  !
macAlg
¬¬" (
.
¬¬( )

GetMacSize
¬¬) 3
(
¬¬3 4
)
¬¬4 5
*
¬¬6 7
$num
¬¬8 9
;
¬¬9 :
else
√√ 
signatureLength
ƒƒ 
=
ƒƒ  !
Convert
ƒƒ" )
.
ƒƒ) *
ToInt32
ƒƒ* 1
(
ƒƒ1 2
m_signature
ƒƒ2 =
.
ƒƒ= >

SignedInfo
ƒƒ> H
.
ƒƒH I
SignatureLength
ƒƒI X
,
ƒƒX Y
null
ƒƒZ ^
)
ƒƒ^ _
;
ƒƒ_ `
if
∆∆ 
(
∆∆ 
signatureLength
∆∆ 
<
∆∆  !
$num
∆∆" #
||
∆∆$ &
signatureLength
∆∆' 6
>
∆∆7 8
macAlg
∆∆9 ?
.
∆∆? @

GetMacSize
∆∆@ J
(
∆∆J K
)
∆∆K L
*
∆∆M N
$num
∆∆O P
)
∆∆P Q
throw
«« 
new
«« 
System
««  
.
««  !
Security
««! )
.
««) *
Cryptography
««* 6
.
««6 7$
CryptographicException
««7 M
(
««M N
SR
««N P
.
««P Q5
'Cryptography_Xml_InvalidSignatureLength
««Q x
)
««x y
;
««y z
if
»» 
(
»» 
signatureLength
»» 
%
»»  !
$num
»»" #
!=
»»$ &
$num
»»' (
)
»»( )
throw
…… 
new
…… 
System
……  
.
……  !
Security
……! )
.
……) *
Cryptography
……* 6
.
……6 7$
CryptographicException
……7 M
(
……M N
SR
……N P
.
……P Q6
(Cryptography_Xml_InvalidSignatureLength2
……Q y
)
……y z
;
……z {%
BuildDigestedReferences
ÀÀ #
(
ÀÀ# $
)
ÀÀ$ %
;
ÀÀ% &
switch
ÃÃ 
(
ÃÃ 
macAlg
ÃÃ 
.
ÃÃ 
AlgorithmName
ÃÃ (
.
ÃÃ( )
	Substring
ÃÃ) 2
(
ÃÃ2 3
$num
ÃÃ3 4
,
ÃÃ4 5
macAlg
ÃÃ6 <
.
ÃÃ< =
AlgorithmName
ÃÃ= J
.
ÃÃJ K
IndexOf
ÃÃK R
(
ÃÃR S
$char
ÃÃS V
)
ÃÃV W
)
ÃÃW X
.
ÃÃX Y
ToUpperInvariant
ÃÃY i
(
ÃÃi j
)
ÃÃj k
)
ÃÃk l
{
ÃÃm n
case
ÕÕ 
$str
ÕÕ 
:
ÕÕ 

SignedInfo
ŒŒ 
.
ŒŒ 
SignatureMethod
ŒŒ .
=
ŒŒ/ 0
	SignedXml
ŒŒ1 :
.
ŒŒ: ; 
XmlDsigHMACSHA1Url
ŒŒ; M
;
ŒŒM N
break
œœ 
;
œœ 
case
–– 
$str
–– 
:
–– 

SignedInfo
—— 
.
—— 
SignatureMethod
—— .
=
——/ 0
	SignedXml
——1 :
.
——: ;&
XmlDsigMoreHMACSHA256Url
——; S
;
——S T
break
““ 
;
““ 
case
”” 
$str
”” 
:
”” 

SignedInfo
‘‘ 
.
‘‘ 
SignatureMethod
‘‘ .
=
‘‘/ 0
	SignedXml
‘‘1 :
.
‘‘: ;&
XmlDsigMoreHMACSHA384Url
‘‘; S
;
‘‘S T
break
’’ 
;
’’ 
case
÷÷ 
$str
÷÷ 
:
÷÷ 

SignedInfo
◊◊ 
.
◊◊ 
SignatureMethod
◊◊ .
=
◊◊/ 0
	SignedXml
◊◊1 :
.
◊◊: ;&
XmlDsigMoreHMACSHA512Url
◊◊; S
;
◊◊S T
break
ÿÿ 
;
ÿÿ 
case
ŸŸ 
$str
ŸŸ 
:
ŸŸ 

SignedInfo
⁄⁄ 
.
⁄⁄ 
SignatureMethod
⁄⁄ .
=
⁄⁄/ 0
	SignedXml
⁄⁄1 :
.
⁄⁄: ;#
XmlDsigMoreHMACMD5Url
⁄⁄; P
;
⁄⁄P Q
break
€€ 
;
€€ 
case
‹‹ 
$str
‹‹  
:
‹‹  !

SignedInfo
›› 
.
›› 
SignatureMethod
›› .
=
››/ 0
	SignedXml
››1 :
.
››: ;)
XmlDsigMoreHMACRIPEMD160Url
››; V
;
››V W
break
ﬁﬁ 
;
ﬁﬁ 
default
ﬂﬂ 
:
ﬂﬂ 
throw
‡‡ 
new
‡‡ 
System
‡‡ $
.
‡‡$ %
Security
‡‡% -
.
‡‡- .
Cryptography
‡‡. :
.
‡‡: ;$
CryptographicException
‡‡; Q
(
‡‡Q R
SR
‡‡R T
.
‡‡T U:
+Cryptography_Xml_SignatureMethodKeyMismatch‡‡U Ä
)‡‡Ä Å
;‡‡Å Ç
}
·· 
GetC14NDigest
„„ 
(
„„ 
new
„„ 
MacHashWrapper
„„ ,
(
„„, -
macAlg
„„- 3
)
„„3 4
)
„„4 5
;
„„5 6
byte
‰‰ 
[
‰‰ 
]
‰‰ 
	hashValue
‰‰ 
=
‰‰ 
new
‰‰ "
byte
‰‰# '
[
‰‰' (
macAlg
‰‰( .
.
‰‰. /

GetMacSize
‰‰/ 9
(
‰‰9 :
)
‰‰: ;
]
‰‰; <
;
‰‰< =
macAlg
ÂÂ 
.
ÂÂ 
DoFinal
ÂÂ 
(
ÂÂ 
	hashValue
ÂÂ $
,
ÂÂ$ %
$num
ÂÂ& '
)
ÂÂ' (
;
ÂÂ( )
SignedXmlDebugLog
ÁÁ 
.
ÁÁ 

LogSigning
ÁÁ (
(
ÁÁ( )
this
ÁÁ) -
,
ÁÁ- .
macAlg
ÁÁ/ 5
)
ÁÁ5 6
;
ÁÁ6 7
m_signature
ËË 
.
ËË 
SignatureValue
ËË &
=
ËË' (
new
ËË) ,
byte
ËË- 1
[
ËË1 2
signatureLength
ËË2 A
/
ËËB C
$num
ËËD E
]
ËËE F
;
ËËF G
Buffer
ÈÈ 
.
ÈÈ 
	BlockCopy
ÈÈ 
(
ÈÈ 
	hashValue
ÈÈ &
,
ÈÈ& '
$num
ÈÈ( )
,
ÈÈ) *
m_signature
ÈÈ+ 6
.
ÈÈ6 7
SignatureValue
ÈÈ7 E
,
ÈÈE F
$num
ÈÈG H
,
ÈÈH I
signatureLength
ÈÈJ Y
/
ÈÈZ [
$num
ÈÈ\ ]
)
ÈÈ] ^
;
ÈÈ^ _
}
ÍÍ 	
	protected
 
virtual
 $
AsymmetricKeyParameter
 0
GetPublicKey
1 =
(
= >
)
> ?
{
ÒÒ 	
if
ÚÚ 
(
ÚÚ 
KeyInfo
ÚÚ 
==
ÚÚ 
null
ÚÚ 
)
ÚÚ  
throw
ÛÛ 
new
ÛÛ 
System
ÛÛ  
.
ÛÛ  !
Security
ÛÛ! )
.
ÛÛ) *
Cryptography
ÛÛ* 6
.
ÛÛ6 7$
CryptographicException
ÛÛ7 M
(
ÛÛM N
SR
ÛÛN P
.
ÛÛP Q.
 Cryptography_Xml_KeyInfoRequired
ÛÛQ q
)
ÛÛq r
;
ÛÛr s
if
ıı 
(
ıı 
	_x509Enum
ıı 
!=
ıı 
null
ıı !
)
ıı! "
{
ˆˆ $
AsymmetricKeyParameter
˜˜ &
key
˜˜' *
=
˜˜+ ,)
GetNextCertificatePublicKey
˜˜- H
(
˜˜H I
)
˜˜I J
;
˜˜J K
if
¯¯ 
(
¯¯ 
key
¯¯ 
!=
¯¯ 
null
¯¯ 
)
¯¯  
return
˘˘ 
key
˘˘ 
;
˘˘ 
}
˙˙ 
if
¸¸ 
(
¸¸ 
_keyInfoEnum
¸¸ 
==
¸¸ 
null
¸¸  $
)
¸¸$ %
_keyInfoEnum
˝˝ 
=
˝˝ 
KeyInfo
˝˝ &
.
˝˝& '
GetEnumerator
˝˝' 4
(
˝˝4 5
)
˝˝5 6
;
˝˝6 7
while
ÄÄ 
(
ÄÄ 
_keyInfoEnum
ÄÄ 
.
ÄÄ  
MoveNext
ÄÄ  (
(
ÄÄ( )
)
ÄÄ) *
)
ÄÄ* +
{
ÅÅ 
RSAKeyValue
ÇÇ 
rsaKeyValue
ÇÇ '
=
ÇÇ( )
_keyInfoEnum
ÇÇ* 6
.
ÇÇ6 7
Current
ÇÇ7 >
as
ÇÇ? A
RSAKeyValue
ÇÇB M
;
ÇÇM N
if
ÉÉ 
(
ÉÉ 
rsaKeyValue
ÉÉ 
!=
ÉÉ  "
null
ÉÉ# '
)
ÉÉ' (
return
ÑÑ 
rsaKeyValue
ÑÑ &
.
ÑÑ& '
Key
ÑÑ' *
;
ÑÑ* +
DSAKeyValue
ÜÜ 
dsaKeyValue
ÜÜ '
=
ÜÜ( )
_keyInfoEnum
ÜÜ* 6
.
ÜÜ6 7
Current
ÜÜ7 >
as
ÜÜ? A
DSAKeyValue
ÜÜB M
;
ÜÜM N
if
áá 
(
áá 
dsaKeyValue
áá 
!=
áá  "
null
áá# '
)
áá' (
return
àà 
dsaKeyValue
àà &
.
àà& '
Key
àà' *
;
àà* +
KeyInfoX509Data
ää 
x509Data
ää  (
=
ää) *
_keyInfoEnum
ää+ 7
.
ää7 8
Current
ää8 ?
as
ää@ B
KeyInfoX509Data
ääC R
;
ääR S
if
ãã 
(
ãã 
x509Data
ãã 
!=
ãã 
null
ãã  $
)
ãã$ %
{
åå 
_x509Collection
çç #
=
çç$ %
Utils
çç& +
.
çç+ ,
BuildBagOfCerts
çç, ;
(
çç; <
x509Data
çç< D
,
ççD E
CertUsageType
ççF S
.
ççS T
Verification
ççT `
)
çç` a
;
çça b
if
éé 
(
éé 
_x509Collection
éé '
.
éé' (
Count
éé( -
>
éé. /
$num
éé0 1
)
éé1 2
{
èè 
	_x509Enum
êê !
=
êê" #
_x509Collection
êê$ 3
.
êê3 4
GetEnumerator
êê4 A
(
êêA B
)
êêB C
;
êêC D$
AsymmetricKeyParameter
ëë .
key
ëë/ 2
=
ëë3 4)
GetNextCertificatePublicKey
ëë5 P
(
ëëP Q
)
ëëQ R
;
ëëR S
if
íí 
(
íí 
key
íí 
!=
íí  "
null
íí# '
)
íí' (
return
ìì "
key
ìì# &
;
ìì& '
}
îî 
}
ïï 
}
ññ 
return
òò 
null
òò 
;
òò 
}
ôô 	
private
õõ 
IList
õõ 
<
õõ 
X509Certificate
õõ %
>
õõ% &
BuildBagOfCerts
õõ' 6
(
õõ6 7
)
õõ7 8
{
úú 	
var
ùù 

collection
ùù 
=
ùù 
new
ùù  
List
ùù! %
<
ùù% &
X509Certificate
ùù& 5
>
ùù5 6
(
ùù6 7
)
ùù7 8
;
ùù8 9
if
ûû 
(
ûû 
KeyInfo
ûû 
!=
ûû 
null
ûû 
)
ûû  
{
üü 
foreach
†† 
(
†† 
KeyInfoClause
†† &
clause
††' -
in
††. 0
KeyInfo
††1 8
)
††8 9
{
°° 
KeyInfoX509Data
¢¢ #
x509Data
¢¢$ ,
=
¢¢- .
clause
¢¢/ 5
as
¢¢6 8
KeyInfoX509Data
¢¢9 H
;
¢¢H I
if
££ 
(
££ 
x509Data
££  
!=
££! #
null
££$ (
)
££( )

collection
§§ "
.
§§" #
AddRange
§§# +
(
§§+ ,
Utils
§§, 1
.
§§1 2
BuildBagOfCerts
§§2 A
(
§§A B
x509Data
§§B J
,
§§J K
CertUsageType
§§L Y
.
§§Y Z
Verification
§§Z f
)
§§f g
)
§§g h
;
§§h i
}
•• 
}
¶¶ 
return
®® 

collection
®® 
;
®® 
}
©© 	
private
´´ $
AsymmetricKeyParameter
´´ &)
GetNextCertificatePublicKey
´´' B
(
´´B C
)
´´C D
{
¨¨ 	
while
≠≠ 
(
≠≠ 
	_x509Enum
≠≠ 
.
≠≠ 
MoveNext
≠≠ %
(
≠≠% &
)
≠≠& '
)
≠≠' (
{
ÆÆ 
X509Certificate
ØØ 
certificate
ØØ  +
=
ØØ, -
(
ØØ. /
X509Certificate
ØØ/ >
)
ØØ> ?
	_x509Enum
ØØ? H
.
ØØH I
Current
ØØI P
;
ØØP Q
if
∞∞ 
(
∞∞ 
certificate
∞∞ 
!=
∞∞  "
null
∞∞# '
)
∞∞' (
return
±± 
certificate
±± &
.
±±& '
GetPublicKey
±±' 3
(
±±3 4
)
±±4 5
;
±±5 6
}
≤≤ 
return
¥¥ 
null
¥¥ 
;
¥¥ 
}
µµ 	
public
∑∑ 
virtual
∑∑ 

XmlElement
∑∑ !
GetIdElement
∑∑" .
(
∑∑. /
XmlDocument
∑∑/ :
document
∑∑; C
,
∑∑C D
string
∑∑E K
idValue
∑∑L S
)
∑∑S T
{
∏∏ 	
return
ππ !
DefaultGetIdElement
ππ &
(
ππ& '
document
ππ' /
,
ππ/ 0
idValue
ππ1 8
)
ππ8 9
;
ππ9 :
}
∫∫ 	
internal
ºº 
static
ºº 

XmlElement
ºº "!
DefaultGetIdElement
ºº# 6
(
ºº6 7
XmlDocument
ºº7 B
document
ººC K
,
ººK L
string
ººM S
idValue
ººT [
)
ºº[ \
{
ΩΩ 	
if
ææ 
(
ææ 
document
ææ 
==
ææ 
null
ææ  
)
ææ  !
return
øø 
null
øø 
;
øø 
try
¡¡ 
{
¬¬ 

XmlConvert
√√ 
.
√√ 
VerifyNCName
√√ '
(
√√' (
idValue
√√( /
)
√√/ 0
;
√√0 1
}
ƒƒ 
catch
≈≈ 
(
≈≈ 
XmlException
≈≈ 
)
≈≈  
{
∆∆ 
return
ÀÀ 
null
ÀÀ 
;
ÀÀ 
}
ÃÃ 

XmlElement
œœ 
elem
œœ 
=
œœ 
document
œœ &
.
œœ& '
GetElementById
œœ' 5
(
œœ5 6
idValue
œœ6 =
)
œœ= >
;
œœ> ?
if
—— 
(
—— 
elem
—— 
!=
—— 
null
—— 
)
—— 
{
““ 
XmlDocument
’’ 
docClone
’’ $
=
’’% &
(
’’' (
XmlDocument
’’( 3
)
’’3 4
document
’’4 <
.
’’< =
	CloneNode
’’= F
(
’’F G
true
’’G K
)
’’K L
;
’’L M

XmlElement
÷÷ 
	cloneElem
÷÷ $
=
÷÷% &
docClone
÷÷' /
.
÷÷/ 0
GetElementById
÷÷0 >
(
÷÷> ?
idValue
÷÷? F
)
÷÷F G
;
÷÷G H
System
€€ 
.
€€ 
Diagnostics
€€ "
.
€€" #
Debug
€€# (
.
€€( )
Assert
€€) /
(
€€/ 0
	cloneElem
€€0 9
!=
€€: <
null
€€= A
)
€€A B
;
€€B C
if
ﬁﬁ 
(
ﬁﬁ 
	cloneElem
ﬁﬁ 
!=
ﬁﬁ  
null
ﬁﬁ! %
)
ﬁﬁ% &
{
ﬂﬂ 
	cloneElem
‡‡ 
.
‡‡ 

Attributes
‡‡ (
.
‡‡( )
	RemoveAll
‡‡) 2
(
‡‡2 3
)
‡‡3 4
;
‡‡4 5

XmlElement
‚‚ 

cloneElem2
‚‚ )
=
‚‚* +
docClone
‚‚, 4
.
‚‚4 5
GetElementById
‚‚5 C
(
‚‚C D
idValue
‚‚D K
)
‚‚K L
;
‚‚L M
if
‰‰ 
(
‰‰ 

cloneElem2
‰‰ "
!=
‰‰# %
null
‰‰& *
)
‰‰* +
{
ÂÂ 
throw
ÊÊ 
new
ÊÊ !
System
ÊÊ" (
.
ÊÊ( )
Security
ÊÊ) 1
.
ÊÊ1 2
Cryptography
ÊÊ2 >
.
ÊÊ> ?$
CryptographicException
ÊÊ? U
(
ÊÊU V
SR
ÁÁ 
.
ÁÁ /
!Cryptography_Xml_InvalidReference
ÁÁ @
)
ÁÁ@ A
;
ÁÁA B
}
ËË 
}
ÈÈ 
return
ÎÎ 
elem
ÎÎ 
;
ÎÎ 
}
ÏÏ 
elem
ÓÓ 
=
ÓÓ &
GetSingleReferenceTarget
ÓÓ +
(
ÓÓ+ ,
document
ÓÓ, 4
,
ÓÓ4 5
$str
ÓÓ6 :
,
ÓÓ: ;
idValue
ÓÓ< C
)
ÓÓC D
;
ÓÓD E
if
ÔÔ 
(
ÔÔ 
elem
ÔÔ 
!=
ÔÔ 
null
ÔÔ 
)
ÔÔ 
return
 
elem
 
;
 
elem
ÒÒ 
=
ÒÒ &
GetSingleReferenceTarget
ÒÒ +
(
ÒÒ+ ,
document
ÒÒ, 4
,
ÒÒ4 5
$str
ÒÒ6 :
,
ÒÒ: ;
idValue
ÒÒ< C
)
ÒÒC D
;
ÒÒD E
if
ÚÚ 
(
ÚÚ 
elem
ÚÚ 
!=
ÚÚ 
null
ÚÚ 
)
ÚÚ 
return
ÛÛ 
elem
ÛÛ 
;
ÛÛ 
elem
ÙÙ 
=
ÙÙ &
GetSingleReferenceTarget
ÙÙ +
(
ÙÙ+ ,
document
ÙÙ, 4
,
ÙÙ4 5
$str
ÙÙ6 :
,
ÙÙ: ;
idValue
ÙÙ< C
)
ÙÙC D
;
ÙÙD E
return
ˆˆ 
elem
ˆˆ 
;
ˆˆ 
}
˜˜ 	
private
˝˝ 
bool
˝˝ 
_bCacheValid
˝˝ !
=
˝˝" #
false
˝˝$ )
;
˝˝) *
private
ÄÄ 
static
ÄÄ 
bool
ÄÄ -
DefaultSignatureFormatValidator
ÄÄ ;
(
ÄÄ; <
	SignedXml
ÄÄ< E
	signedXml
ÄÄF O
)
ÄÄO P
{
ÅÅ 	
if
ÉÉ 
(
ÉÉ 
	signedXml
ÉÉ 
.
ÉÉ +
DoesSignatureUseTruncatedHmac
ÉÉ 7
(
ÉÉ7 8
)
ÉÉ8 9
)
ÉÉ9 :
{
ÑÑ 
return
ÖÖ 
false
ÖÖ 
;
ÖÖ 
}
ÜÜ 
if
ää 
(
ää 
!
ää 
	signedXml
ää 
.
ää 8
*DoesSignatureUseSafeCanonicalizationMethod
ää E
(
ääE F
)
ääF G
)
ääG H
{
ãã 
return
åå 
false
åå 
;
åå 
}
çç 
return
êê 
true
êê 
;
êê 
}
ëë 	
private
ïï 
bool
ïï +
DoesSignatureUseTruncatedHmac
ïï 2
(
ïï2 3
)
ïï3 4
{
ññ 	
if
òò 
(
òò 

SignedInfo
òò 
.
òò 
SignatureLength
òò *
==
òò+ -
null
òò. 2
)
òò2 3
{
ôô 
return
öö 
false
öö 
;
öö 
}
õõ 
IMac
ûû 
hmac
ûû 
=
ûû 
CryptoHelpers
ûû %
.
ûû% &
CreateFromName
ûû& 4
<
ûû4 5
IMac
ûû5 9
>
ûû9 :
(
ûû: ;
SignatureMethod
ûû; J
)
ûûJ K
;
ûûK L
if
üü 
(
üü 
hmac
üü 
==
üü 
null
üü 
)
üü 
{
†† 
return
¢¢ 
false
¢¢ 
;
¢¢ 
}
££ 
int
¶¶ !
actualSignatureSize
¶¶ #
=
¶¶$ %
$num
¶¶& '
;
¶¶' (
if
ßß 
(
ßß 
!
ßß 
int
ßß 
.
ßß 
TryParse
ßß 
(
ßß 

SignedInfo
ßß (
.
ßß( )
SignatureLength
ßß) 8
,
ßß8 9
out
ßß: =!
actualSignatureSize
ßß> Q
)
ßßQ R
)
ßßR S
{
®® 
return
™™ 
true
™™ 
;
™™ 
}
´´ 
return
∞∞ !
actualSignatureSize
∞∞ &
!=
∞∞' )
hmac
∞∞* .
.
∞∞. /

GetMacSize
∞∞/ 9
(
∞∞9 :
)
∞∞: ;
;
∞∞; <
}
±± 	
private
µµ 
bool
µµ 8
*DoesSignatureUseSafeCanonicalizationMethod
µµ ?
(
µµ? @
)
µµ@ A
{
∂∂ 	
foreach
∑∑ 
(
∑∑ 
string
∑∑ 
safeAlgorithm
∑∑ )
in
∑∑* ,)
SafeCanonicalizationMethods
∑∑- H
)
∑∑H I
{
∏∏ 
if
ππ 
(
ππ 
string
ππ 
.
ππ 
Equals
ππ !
(
ππ! "
safeAlgorithm
ππ" /
,
ππ/ 0

SignedInfo
ππ1 ;
.
ππ; <$
CanonicalizationMethod
ππ< R
,
ππR S
StringComparison
ππT d
.
ππd e
OrdinalIgnoreCase
ππe v
)
ππv w
)
ππw x
{
∫∫ 
return
ªª 
true
ªª 
;
ªª  
}
ºº 
}
ΩΩ 
SignedXmlDebugLog
øø 
.
øø -
LogUnsafeCanonicalizationMethod
øø =
(
øø= >
this
øø> B
,
øøB C

SignedInfo
øøD N
.
øøN O$
CanonicalizationMethod
øøO e
,
øøe f*
SafeCanonicalizationMethodsøøg Ç
)øøÇ É
;øøÉ Ñ
return
¿¿ 
false
¿¿ 
;
¿¿ 
}
¡¡ 	
private
√√ 
bool
√√ /
!ReferenceUsesSafeTransformMethods
√√ 6
(
√√6 7
	Reference
√√7 @
	reference
√√A J
)
√√J K
{
ƒƒ 	
TransformChain
≈≈ 
transformChain
≈≈ )
=
≈≈* +
	reference
≈≈, 5
.
≈≈5 6
TransformChain
≈≈6 D
;
≈≈D E
int
∆∆ 
transformCount
∆∆ 
=
∆∆  
transformChain
∆∆! /
.
∆∆/ 0
Count
∆∆0 5
;
∆∆5 6
for
»» 
(
»» 
int
»» 
i
»» 
=
»» 
$num
»» 
;
»» 
i
»» 
<
»» 
transformCount
»»  .
;
»». /
i
»»0 1
++
»»1 3
)
»»3 4
{
…… 
	Transform
   
	transform
   #
=
  $ %
transformChain
  & 4
[
  4 5
i
  5 6
]
  6 7
;
  7 8
if
ÃÃ 
(
ÃÃ 
!
ÃÃ 
IsSafeTransform
ÃÃ $
(
ÃÃ$ %
	transform
ÃÃ% .
.
ÃÃ. /
	Algorithm
ÃÃ/ 8
)
ÃÃ8 9
)
ÃÃ9 :
{
ÕÕ 
return
ŒŒ 
false
ŒŒ  
;
ŒŒ  !
}
œœ 
}
–– 
return
““ 
true
““ 
;
““ 
}
”” 	
private
’’ 
bool
’’ 
IsSafeTransform
’’ $
(
’’$ %
string
’’% + 
transformAlgorithm
’’, >
)
’’> ?
{
÷÷ 	
foreach
ÿÿ 
(
ÿÿ 
string
ÿÿ 
safeAlgorithm
ÿÿ )
in
ÿÿ* ,)
SafeCanonicalizationMethods
ÿÿ- H
)
ÿÿH I
{
ŸŸ 
if
⁄⁄ 
(
⁄⁄ 
string
⁄⁄ 
.
⁄⁄ 
Equals
⁄⁄ !
(
⁄⁄! "
safeAlgorithm
⁄⁄" /
,
⁄⁄/ 0 
transformAlgorithm
⁄⁄1 C
,
⁄⁄C D
StringComparison
⁄⁄E U
.
⁄⁄U V
OrdinalIgnoreCase
⁄⁄V g
)
⁄⁄g h
)
⁄⁄h i
{
€€ 
return
‹‹ 
true
‹‹ 
;
‹‹  
}
›› 
}
ﬁﬁ 
foreach
‡‡ 
(
‡‡ 
string
‡‡ 
safeAlgorithm
‡‡ )
in
‡‡* ,)
DefaultSafeTransformMethods
‡‡- H
)
‡‡H I
{
·· 
if
‚‚ 
(
‚‚ 
string
‚‚ 
.
‚‚ 
Equals
‚‚ !
(
‚‚! "
safeAlgorithm
‚‚" /
,
‚‚/ 0 
transformAlgorithm
‚‚1 C
,
‚‚C D
StringComparison
‚‚E U
.
‚‚U V
OrdinalIgnoreCase
‚‚V g
)
‚‚g h
)
‚‚h i
{
„„ 
return
‰‰ 
true
‰‰ 
;
‰‰  
}
ÂÂ 
}
ÊÊ 
SignedXmlDebugLog
ËË 
.
ËË &
LogUnsafeTransformMethod
ËË 6
(
ËË6 7
this
ÈÈ 
,
ÈÈ  
transformAlgorithm
ÍÍ "
,
ÍÍ" #)
SafeCanonicalizationMethods
ÎÎ +
,
ÎÎ+ ,)
DefaultSafeTransformMethods
ÏÏ +
)
ÏÏ+ ,
;
ÏÏ, -
return
ÓÓ 
false
ÓÓ 
;
ÓÓ 
}
ÔÔ 	
private
ÛÛ 
static
ÛÛ 
IList
ÛÛ 
<
ÛÛ 
string
ÛÛ #
>
ÛÛ# $*
KnownCanonicalizationMethods
ÛÛ% A
{
ÙÙ 	
get
ıı 
{
ˆˆ 
if
˜˜ 
(
˜˜ ,
s_knownCanonicalizationMethods
˜˜ 2
==
˜˜3 5
null
˜˜6 :
)
˜˜: ;
{
¯¯ 
List
˙˙ 
<
˙˙ 
string
˙˙ 
>
˙˙  
safeAlgorithms
˙˙! /
=
˙˙0 1
new
˙˙2 5
List
˙˙6 :
<
˙˙: ;
string
˙˙; A
>
˙˙A B
(
˙˙B C
)
˙˙C D
;
˙˙D E
safeAlgorithms
˝˝ "
.
˝˝" #
Add
˝˝# &
(
˝˝& '%
XmlDsigC14NTransformUrl
˝˝' >
)
˝˝> ?
;
˝˝? @
safeAlgorithms
˛˛ "
.
˛˛" #
Add
˛˛# &
(
˛˛& '1
#XmlDsigC14NWithCommentsTransformUrl
˛˛' J
)
˛˛J K
;
˛˛K L
safeAlgorithms
ˇˇ "
.
ˇˇ" #
Add
ˇˇ# &
(
ˇˇ& '(
XmlDsigExcC14NTransformUrl
ˇˇ' A
)
ˇˇA B
;
ˇˇB C
safeAlgorithms
ÄÄ "
.
ÄÄ" #
Add
ÄÄ# &
(
ÄÄ& '4
&XmlDsigExcC14NWithCommentsTransformUrl
ÄÄ' M
)
ÄÄM N
;
ÄÄN O,
s_knownCanonicalizationMethods
ÇÇ 2
=
ÇÇ3 4
safeAlgorithms
ÇÇ5 C
;
ÇÇC D
}
ÉÉ 
return
ÖÖ ,
s_knownCanonicalizationMethods
ÖÖ 5
;
ÖÖ5 6
}
ÜÜ 
}
áá 	
private
ââ 
static
ââ 
IList
ââ 
<
ââ 
string
ââ #
>
ââ# $)
DefaultSafeTransformMethods
ââ% @
{
ää 	
get
ãã 
{
åå 
if
çç 
(
çç +
s_defaultSafeTransformMethods
çç 1
==
çç2 4
null
çç5 9
)
çç9 :
{
éé 
List
èè 
<
èè 
string
èè 
>
èè  
safeAlgorithms
èè! /
=
èè0 1
new
èè2 5
List
èè6 :
<
èè: ;
string
èè; A
>
èèA B
(
èèB C
)
èèC D
;
èèD E
safeAlgorithms
ôô "
.
ôô" #
Add
ôô# &
(
ôô& '3
%XmlDsigEnvelopedSignatureTransformUrl
ôô' L
)
ôôL M
;
ôôM N
safeAlgorithms
öö "
.
öö" #
Add
öö# &
(
öö& ''
XmlDsigBase64TransformUrl
öö' @
)
öö@ A
;
ööA B
safeAlgorithms
õõ "
.
õõ" #
Add
õõ# &
(
õõ& '$
XmlLicenseTransformUrl
õõ' =
)
õõ= >
;
õõ> ?
safeAlgorithms
úú "
.
úú" #
Add
úú# &
(
úú& ''
XmlDecryptionTransformUrl
úú' @
)
úú@ A
;
úúA B+
s_defaultSafeTransformMethods
ûû 1
=
ûû2 3
safeAlgorithms
ûû4 B
;
ûûB C
}
üü 
return
°° +
s_defaultSafeTransformMethods
°° 4
;
°°4 5
}
¢¢ 
}
££ 	
private
•• 
void
•• 
GetC14NDigest
•• "
(
••" #
IHash
••# (
hash
••) -
)
••- .
{
¶¶ 	
bool
ßß "
isKeyedHashAlgorithm
ßß %
=
ßß& '
hash
ßß( ,
is
ßß- /
MacHashWrapper
ßß0 >
;
ßß> ?
if
®® 
(
®® "
isKeyedHashAlgorithm
®® $
||
®®% '
!
®®( )
_bCacheValid
®®) 5
||
®®6 8
!
®®9 :

SignedInfo
®®: D
.
®®D E

CacheValid
®®E O
)
®®O P
{
©© 
string
™™ 
baseUri
™™ 
=
™™  
(
™™! "!
_containingDocument
™™" 5
==
™™6 8
null
™™9 =
?
™™> ?
null
™™@ D
:
™™E F!
_containingDocument
™™G Z
.
™™Z [
BaseURI
™™[ b
)
™™b c
;
™™c d
XmlResolver
´´ 
resolver
´´ $
=
´´% &
(
´´' (
_bResolverSet
´´( 5
?
´´6 7
_xmlResolver
´´8 D
:
´´E F
new
´´G J
XmlSecureResolver
´´K \
(
´´\ ]
new
´´] `
XmlUrlResolver
´´a o
(
´´o p
)
´´p q
,
´´q r
baseUri
´´s z
)
´´z {
)
´´{ |
;
´´| }
XmlDocument
¨¨ 
doc
¨¨ 
=
¨¨  !
Utils
¨¨" '
.
¨¨' ($
PreProcessElementInput
¨¨( >
(
¨¨> ?

SignedInfo
¨¨? I
.
¨¨I J
GetXml
¨¨J P
(
¨¨P Q
)
¨¨Q R
,
¨¨R S
resolver
¨¨T \
,
¨¨\ ]
baseUri
¨¨^ e
)
¨¨e f
;
¨¨f g"
CanonicalXmlNodeList
ØØ $

namespaces
ØØ% /
=
ØØ0 1
(
ØØ2 3
_context
ØØ3 ;
==
ØØ< >
null
ØØ? C
?
ØØD E
null
ØØF J
:
ØØK L
Utils
ØØM R
.
ØØR S%
GetPropagatedAttributes
ØØS j
(
ØØj k
_context
ØØk s
)
ØØs t
)
ØØt u
;
ØØu v
SignedXmlDebugLog
∞∞ !
.
∞∞! "%
LogNamespacePropagation
∞∞" 9
(
∞∞9 :
this
∞∞: >
,
∞∞> ?

namespaces
∞∞@ J
)
∞∞J K
;
∞∞K L
Utils
±± 
.
±± 
AddNamespaces
±± #
(
±±# $
doc
±±$ '
.
±±' (
DocumentElement
±±( 7
,
±±7 8

namespaces
±±9 C
)
±±C D
;
±±D E
	Transform
≥≥ !
c14nMethodTransform
≥≥ -
=
≥≥. /

SignedInfo
≥≥0 :
.
≥≥: ;*
CanonicalizationMethodObject
≥≥; W
;
≥≥W X!
c14nMethodTransform
¥¥ #
.
¥¥# $
Resolver
¥¥$ ,
=
¥¥- .
resolver
¥¥/ 7
;
¥¥7 8!
c14nMethodTransform
µµ #
.
µµ# $
BaseURI
µµ$ +
=
µµ, -
baseUri
µµ. 5
;
µµ5 6
SignedXmlDebugLog
∑∑ !
.
∑∑! "&
LogBeginCanonicalization
∑∑" :
(
∑∑: ;
this
∑∑; ?
,
∑∑? @!
c14nMethodTransform
∑∑A T
)
∑∑T U
;
∑∑U V!
c14nMethodTransform
∏∏ #
.
∏∏# $
	LoadInput
∏∏$ -
(
∏∏- .
doc
∏∏. 1
)
∏∏1 2
;
∏∏2 3
SignedXmlDebugLog
ππ !
.
ππ! "$
LogCanonicalizedOutput
ππ" 8
(
ππ8 9
this
ππ9 =
,
ππ= >!
c14nMethodTransform
ππ? R
)
ππR S
;
ππS T!
c14nMethodTransform
∫∫ #
.
∫∫# $
GetDigestedOutput
∫∫$ 5
(
∫∫5 6
hash
∫∫6 :
)
∫∫: ;
;
∫∫; <
_bCacheValid
ºº 
=
ºº 
!
ºº  "
isKeyedHashAlgorithm
ºº  4
;
ºº4 5
}
ΩΩ 
}
ææ 	
private
¿¿ 
int
¿¿ 
GetReferenceLevel
¿¿ %
(
¿¿% &
int
¿¿& )
index
¿¿* /
,
¿¿/ 0
	ArrayList
¿¿1 :

references
¿¿; E
)
¿¿E F
{
¡¡ 	
if
¬¬ 
(
¬¬ 
_refProcessed
¬¬ 
[
¬¬ 
index
¬¬ #
]
¬¬# $
)
¬¬$ %
return
¬¬& ,
_refLevelCache
¬¬- ;
[
¬¬; <
index
¬¬< A
]
¬¬A B
;
¬¬B C
_refProcessed
√√ 
[
√√ 
index
√√ 
]
√√  
=
√√! "
true
√√# '
;
√√' (
	Reference
ƒƒ 
	reference
ƒƒ 
=
ƒƒ  !
(
ƒƒ" #
	Reference
ƒƒ# ,
)
ƒƒ, -

references
ƒƒ- 7
[
ƒƒ7 8
index
ƒƒ8 =
]
ƒƒ= >
;
ƒƒ> ?
if
≈≈ 
(
≈≈ 
	reference
≈≈ 
.
≈≈ 
Uri
≈≈ 
==
≈≈  
null
≈≈! %
||
≈≈& (
	reference
≈≈) 2
.
≈≈2 3
Uri
≈≈3 6
.
≈≈6 7
Length
≈≈7 =
==
≈≈> @
$num
≈≈A B
||
≈≈C E
(
≈≈F G
	reference
≈≈G P
.
≈≈P Q
Uri
≈≈Q T
.
≈≈T U
Length
≈≈U [
>
≈≈\ ]
$num
≈≈^ _
&&
≈≈` b
	reference
≈≈c l
.
≈≈l m
Uri
≈≈m p
[
≈≈p q
$num
≈≈q r
]
≈≈r s
!=
≈≈t v
$char
≈≈w z
)
≈≈z {
)
≈≈{ |
{
∆∆ 
_refLevelCache
«« 
[
«« 
index
«« $
]
««$ %
=
««& '
$num
««( )
;
««) *
return
»» 
$num
»» 
;
»» 
}
…… 
if
   
(
   
	reference
   
.
   
Uri
   
.
   
Length
   $
>
  % &
$num
  ' (
&&
  ) +
	reference
  , 5
.
  5 6
Uri
  6 9
[
  9 :
$num
  : ;
]
  ; <
==
  = ?
$char
  @ C
)
  C D
{
ÀÀ 
string
ÃÃ 
idref
ÃÃ 
=
ÃÃ 
Utils
ÃÃ $
.
ÃÃ$ %#
ExtractIdFromLocalUri
ÃÃ% :
(
ÃÃ: ;
	reference
ÃÃ; D
.
ÃÃD E
Uri
ÃÃE H
)
ÃÃH I
;
ÃÃI J
if
ÕÕ 
(
ÕÕ 
idref
ÕÕ 
==
ÕÕ 
$str
ÕÕ *
)
ÕÕ* +
{
ŒŒ 
_refLevelCache
œœ "
[
œœ" #
index
œœ# (
]
œœ( )
=
œœ* +
$num
œœ, -
;
œœ- .
return
–– 
$num
–– 
;
–– 
}
—— 
for
”” 
(
”” 
int
”” 
j
”” 
=
”” 
$num
”” 
;
”” 
j
””  !
<
””" #

references
””$ .
.
””. /
Count
””/ 4
;
””4 5
++
””6 8
j
””8 9
)
””9 :
{
‘‘ 
if
’’ 
(
’’ 
(
’’ 
(
’’ 
	Reference
’’ #
)
’’# $

references
’’$ .
[
’’. /
j
’’/ 0
]
’’0 1
)
’’1 2
.
’’2 3
Id
’’3 5
==
’’6 8
idref
’’9 >
)
’’> ?
{
÷÷ 
_refLevelCache
◊◊ &
[
◊◊& '
index
◊◊' ,
]
◊◊, -
=
◊◊. /
GetReferenceLevel
◊◊0 A
(
◊◊A B
j
◊◊B C
,
◊◊C D

references
◊◊E O
)
◊◊O P
+
◊◊Q R
$num
◊◊S T
;
◊◊T U
return
ÿÿ 
(
ÿÿ  
_refLevelCache
ÿÿ  .
[
ÿÿ. /
index
ÿÿ/ 4
]
ÿÿ4 5
)
ÿÿ5 6
;
ÿÿ6 7
}
ŸŸ 
}
⁄⁄ 
_refLevelCache
‹‹ 
[
‹‹ 
index
‹‹ $
]
‹‹$ %
=
‹‹& '
$num
‹‹( )
;
‹‹) *
return
›› 
$num
›› 
;
›› 
}
ﬁﬁ 
throw
‡‡ 
new
‡‡ 
System
‡‡ 
.
‡‡ 
Security
‡‡ %
.
‡‡% &
Cryptography
‡‡& 2
.
‡‡2 3$
CryptographicException
‡‡3 I
(
‡‡I J
SR
‡‡J L
.
‡‡L M/
!Cryptography_Xml_InvalidReference
‡‡M n
)
‡‡n o
;
‡‡o p
}
·· 	
private
„„ 
class
„„ %
ReferenceLevelSortOrder
„„ -
:
„„. /
	IComparer
„„0 9
{
‰‰ 	
private
ÂÂ 
	ArrayList
ÂÂ 
_references
ÂÂ )
=
ÂÂ* +
null
ÂÂ, 0
;
ÂÂ0 1
public
ÊÊ %
ReferenceLevelSortOrder
ÊÊ *
(
ÊÊ* +
)
ÊÊ+ ,
{
ÊÊ- .
}
ÊÊ/ 0
public
ËË 
	ArrayList
ËË 

References
ËË '
{
ÈÈ 
get
ÍÍ 
{
ÍÍ 
return
ÍÍ 
_references
ÍÍ (
;
ÍÍ( )
}
ÍÍ* +
set
ÎÎ 
{
ÎÎ 
_references
ÎÎ !
=
ÎÎ" #
value
ÎÎ$ )
;
ÎÎ) *
}
ÎÎ+ ,
}
ÏÏ 
public
ÓÓ 
int
ÓÓ 
Compare
ÓÓ 
(
ÓÓ 
object
ÓÓ %
a
ÓÓ& '
,
ÓÓ' (
object
ÓÓ) /
b
ÓÓ0 1
)
ÓÓ1 2
{
ÔÔ 
	Reference
 

referenceA
 $
=
% &
a
' (
as
) +
	Reference
, 5
;
5 6
	Reference
ÒÒ 

referenceB
ÒÒ $
=
ÒÒ% &
b
ÒÒ' (
as
ÒÒ) +
	Reference
ÒÒ, 5
;
ÒÒ5 6
int
ÙÙ 
iIndexA
ÙÙ 
=
ÙÙ 
$num
ÙÙ 
;
ÙÙ  
int
ıı 
iIndexB
ıı 
=
ıı 
$num
ıı 
;
ıı  
int
ˆˆ 
i
ˆˆ 
=
ˆˆ 
$num
ˆˆ 
;
ˆˆ 
foreach
˜˜ 
(
˜˜ 
	Reference
˜˜ "
	reference
˜˜# ,
in
˜˜- /

References
˜˜0 :
)
˜˜: ;
{
¯¯ 
if
˘˘ 
(
˘˘ 
	reference
˘˘ !
==
˘˘" $

referenceA
˘˘% /
)
˘˘/ 0
iIndexA
˘˘1 8
=
˘˘9 :
i
˘˘; <
;
˘˘< =
if
˙˙ 
(
˙˙ 
	reference
˙˙ !
==
˙˙" $

referenceB
˙˙% /
)
˙˙/ 0
iIndexB
˙˙1 8
=
˙˙9 :
i
˙˙; <
;
˙˙< =
i
˚˚ 
++
˚˚ 
;
˚˚ 
}
¸¸ 
int
˛˛ 
iLevelA
˛˛ 
=
˛˛ 

referenceA
˛˛ (
.
˛˛( )
	SignedXml
˛˛) 2
.
˛˛2 3
GetReferenceLevel
˛˛3 D
(
˛˛D E
iIndexA
˛˛E L
,
˛˛L M

References
˛˛N X
)
˛˛X Y
;
˛˛Y Z
int
ˇˇ 
iLevelB
ˇˇ 
=
ˇˇ 

referenceB
ˇˇ (
.
ˇˇ( )
	SignedXml
ˇˇ) 2
.
ˇˇ2 3
GetReferenceLevel
ˇˇ3 D
(
ˇˇD E
iIndexB
ˇˇE L
,
ˇˇL M

References
ˇˇN X
)
ˇˇX Y
;
ˇˇY Z
return
ÄÄ 
iLevelA
ÄÄ 
.
ÄÄ 
	CompareTo
ÄÄ (
(
ÄÄ( )
iLevelB
ÄÄ) 0
)
ÄÄ0 1
;
ÄÄ1 2
}
ÅÅ 
}
ÇÇ 	
private
ÑÑ 
void
ÑÑ %
BuildDigestedReferences
ÑÑ ,
(
ÑÑ, -
)
ÑÑ- .
{
ÖÖ 	
	ArrayList
áá 

references
áá  
=
áá! "

SignedInfo
áá# -
.
áá- .

References
áá. 8
;
áá8 9
_refProcessed
ââ 
=
ââ 
new
ââ 
bool
ââ  $
[
ââ$ %

references
ââ% /
.
ââ/ 0
Count
ââ0 5
]
ââ5 6
;
ââ6 7
_refLevelCache
ää 
=
ää 
new
ää  
int
ää! $
[
ää$ %

references
ää% /
.
ää/ 0
Count
ää0 5
]
ää5 6
;
ää6 7%
ReferenceLevelSortOrder
åå #
	sortOrder
åå$ -
=
åå. /
new
åå0 3%
ReferenceLevelSortOrder
åå4 K
(
ååK L
)
ååL M
;
ååM N
	sortOrder
çç 
.
çç 

References
çç  
=
çç! "

references
çç# -
;
çç- .
	ArrayList
èè 
sortedReferences
èè &
=
èè' (
new
èè) ,
	ArrayList
èè- 6
(
èè6 7
)
èè7 8
;
èè8 9
foreach
êê 
(
êê 
	Reference
êê 
	reference
êê (
in
êê) +

references
êê, 6
)
êê6 7
{
ëë 
sortedReferences
íí  
.
íí  !
Add
íí! $
(
íí$ %
	reference
íí% .
)
íí. /
;
íí/ 0
}
ìì 
sortedReferences
îî 
.
îî 
Sort
îî !
(
îî! "
	sortOrder
îî" +
)
îî+ ,
;
îî, -"
CanonicalXmlNodeList
ññ  
nodeList
ññ! )
=
ññ* +
new
ññ, /"
CanonicalXmlNodeList
ññ0 D
(
ññD E
)
ññE F
;
ññF G
foreach
óó 
(
óó 

DataObject
óó 
obj
óó  #
in
óó$ &
m_signature
óó' 2
.
óó2 3

ObjectList
óó3 =
)
óó= >
{
òò 
nodeList
ôô 
.
ôô 
Add
ôô 
(
ôô 
obj
ôô  
.
ôô  !
GetXml
ôô! '
(
ôô' (
)
ôô( )
)
ôô) *
;
ôô* +
}
öö 
foreach
õõ 
(
õõ 
	Reference
õõ 
	reference
õõ (
in
õõ) +
sortedReferences
õõ, <
)
õõ< =
{
úú 
if
ûû 
(
ûû 
	reference
ûû 
.
ûû 
DigestMethod
ûû *
==
ûû+ -
null
ûû. 2
)
ûû2 3
	reference
üü 
.
üü 
DigestMethod
üü *
=
üü+ ,
	Reference
üü- 6
.
üü6 7!
DefaultDigestMethod
üü7 J
;
üüJ K
SignedXmlDebugLog
°° !
.
°°! "!
LogSigningReference
°°" 5
(
°°5 6
this
°°6 :
,
°°: ;
	reference
°°< E
)
°°E F
;
°°F G
	reference
££ 
.
££ 
UpdateHashValue
££ )
(
££) *!
_containingDocument
££* =
,
££= >
nodeList
££? G
)
££G H
;
££H I
if
•• 
(
•• 
	reference
•• 
.
•• 
Id
••  
!=
••! #
null
••$ (
)
••( )
nodeList
¶¶ 
.
¶¶ 
Add
¶¶  
(
¶¶  !
	reference
¶¶! *
.
¶¶* +
GetXml
¶¶+ 1
(
¶¶1 2
)
¶¶2 3
)
¶¶3 4
;
¶¶4 5
}
ßß 
}
®® 	
private
™™ 
bool
™™ %
CheckDigestedReferences
™™ ,
(
™™, -
)
™™- .
{
´´ 	
	ArrayList
¨¨ 

references
¨¨  
=
¨¨! "
m_signature
¨¨# .
.
¨¨. /

SignedInfo
¨¨/ 9
.
¨¨9 :

References
¨¨: D
;
¨¨D E
for
≠≠ 
(
≠≠ 
int
≠≠ 
i
≠≠ 
=
≠≠ 
$num
≠≠ 
;
≠≠ 
i
≠≠ 
<
≠≠ 

references
≠≠  *
.
≠≠* +
Count
≠≠+ 0
;
≠≠0 1
++
≠≠2 4
i
≠≠4 5
)
≠≠5 6
{
ÆÆ 
	Reference
ØØ 
digestedReference
ØØ +
=
ØØ, -
(
ØØ. /
	Reference
ØØ/ 8
)
ØØ8 9

references
ØØ9 C
[
ØØC D
i
ØØD E
]
ØØE F
;
ØØF G
if
±± 
(
±± 
!
±± /
!ReferenceUsesSafeTransformMethods
±± 6
(
±±6 7
digestedReference
±±7 H
)
±±H I
)
±±I J
{
≤≤ 
return
≥≥ 
false
≥≥  
;
≥≥  !
}
¥¥ 
SignedXmlDebugLog
∂∂ !
.
∂∂! " 
LogVerifyReference
∂∂" 4
(
∂∂4 5
this
∂∂5 9
,
∂∂9 :
digestedReference
∂∂; L
)
∂∂L M
;
∂∂M N
byte
∑∑ 
[
∑∑ 
]
∑∑ 
calculatedHash
∑∑ %
=
∑∑& '
null
∑∑( ,
;
∑∑, -
try
∏∏ 
{
ππ 
calculatedHash
∫∫ "
=
∫∫# $
digestedReference
∫∫% 6
.
∫∫6 7 
CalculateHashValue
∫∫7 I
(
∫∫I J!
_containingDocument
∫∫J ]
,
∫∫] ^
m_signature
∫∫_ j
.
∫∫j k
ReferencedItems
∫∫k z
)
∫∫z {
;
∫∫{ |
}
ªª 
catch
ºº 
(
ºº /
!CryptoSignedXmlRecursionException
ºº 8
)
ºº8 9
{
ΩΩ 
SignedXmlDebugLog
ææ %
.
ææ% &(
LogSignedXmlRecursionLimit
ææ& @
(
ææ@ A
this
ææA E
,
ææE F
digestedReference
ææG X
)
ææX Y
;
ææY Z
return
øø 
false
øø  
;
øø  !
}
¿¿ 
SignedXmlDebugLog
¬¬ !
.
¬¬! "$
LogVerifyReferenceHash
¬¬" 8
(
¬¬8 9
this
¬¬9 =
,
¬¬= >
digestedReference
¬¬? P
,
¬¬P Q
calculatedHash
¬¬R `
,
¬¬` a
digestedReference
¬¬b s
.
¬¬s t
DigestValue
¬¬t 
)¬¬ Ä
;¬¬Ä Å
if
ƒƒ 
(
ƒƒ 
!
ƒƒ !
CryptographicEquals
ƒƒ (
(
ƒƒ( )
calculatedHash
ƒƒ) 7
,
ƒƒ7 8
digestedReference
ƒƒ9 J
.
ƒƒJ K
DigestValue
ƒƒK V
)
ƒƒV W
)
ƒƒW X
{
≈≈ 
return
∆∆ 
false
∆∆  
;
∆∆  !
}
«« 
}
»» 
return
   
true
   
;
   
}
ÀÀ 	
[
““ 	

MethodImpl
““	 
(
““ 
MethodImplOptions
““ %
.
““% &

NoInlining
““& 0
|
““1 2
MethodImplOptions
““3 D
.
““D E
NoOptimization
““E S
)
““S T
]
““T U
private
”” 
static
”” 
bool
”” !
CryptographicEquals
”” /
(
””/ 0
byte
””0 4
[
””4 5
]
””5 6
a
””7 8
,
””8 9
byte
””: >
[
””> ?
]
””? @
b
””A B
)
””B C
{
‘‘ 	
System
’’ 
.
’’ 
Diagnostics
’’ 
.
’’ 
Debug
’’ $
.
’’$ %
Assert
’’% +
(
’’+ ,
a
’’, -
!=
’’. 0
null
’’1 5
)
’’5 6
;
’’6 7
System
÷÷ 
.
÷÷ 
Diagnostics
÷÷ 
.
÷÷ 
Debug
÷÷ $
.
÷÷$ %
Assert
÷÷% +
(
÷÷+ ,
b
÷÷, -
!=
÷÷. 0
null
÷÷1 5
)
÷÷5 6
;
÷÷6 7
int
ÿÿ 
result
ÿÿ 
=
ÿÿ 
$num
ÿÿ 
;
ÿÿ 
if
€€ 
(
€€ 
a
€€ 
.
€€ 
Length
€€ 
!=
€€ 
b
€€ 
.
€€ 
Length
€€ $
)
€€$ %
return
‹‹ 
false
‹‹ 
;
‹‹ 
	unchecked
ﬁﬁ 
{
ﬂﬂ 
int
·· 
aLength
·· 
=
·· 
a
·· 
.
··  
Length
··  &
;
··& '
for
„„ 
(
„„ 
int
„„ 
i
„„ 
=
„„ 
$num
„„ 
;
„„ 
i
„„  !
<
„„" #
aLength
„„$ +
;
„„+ ,
i
„„- .
++
„„. 0
)
„„0 1
result
ÈÈ 
=
ÈÈ 
result
ÈÈ #
|
ÈÈ$ %
(
ÈÈ& '
a
ÈÈ' (
[
ÈÈ( )
i
ÈÈ) *
]
ÈÈ* +
-
ÈÈ, -
b
ÈÈ. /
[
ÈÈ/ 0
i
ÈÈ0 1
]
ÈÈ1 2
)
ÈÈ2 3
;
ÈÈ3 4
}
ÍÍ 
return
ÏÏ 
(
ÏÏ 
$num
ÏÏ 
==
ÏÏ 
result
ÏÏ 
)
ÏÏ  
;
ÏÏ  !
}
ÌÌ 	
private
ÚÚ 
bool
ÚÚ "
CheckSignatureFormat
ÚÚ )
(
ÚÚ) *
)
ÚÚ* +
{
ÛÛ 	
if
ÙÙ 
(
ÙÙ '
_signatureFormatValidator
ÙÙ )
==
ÙÙ* ,
null
ÙÙ- 1
)
ÙÙ1 2
{
ıı 
return
¯¯ 
true
¯¯ 
;
¯¯ 
}
˘˘ 
SignedXmlDebugLog
˚˚ 
.
˚˚ *
LogBeginCheckSignatureFormat
˚˚ :
(
˚˚: ;
this
˚˚; ?
,
˚˚? @'
_signatureFormatValidator
˚˚A Z
)
˚˚Z [
;
˚˚[ \
bool
˝˝ 
formatValid
˝˝ 
=
˝˝ '
_signatureFormatValidator
˝˝ 8
(
˝˝8 9
this
˝˝9 =
)
˝˝= >
;
˝˝> ?
SignedXmlDebugLog
˛˛ 
.
˛˛ '
LogFormatValidationResult
˛˛ 7
(
˛˛7 8
this
˛˛8 <
,
˛˛< =
formatValid
˛˛> I
)
˛˛I J
;
˛˛J K
return
ˇˇ 
formatValid
ˇˇ 
;
ˇˇ 
}
ÄÄ 	
private
ÇÇ 
bool
ÇÇ 
CheckSignedInfo
ÇÇ $
(
ÇÇ$ %$
AsymmetricKeyParameter
ÇÇ% ;
key
ÇÇ< ?
)
ÇÇ? @
{
ÉÉ 	
if
ÑÑ 
(
ÑÑ 
key
ÑÑ 
==
ÑÑ 
null
ÑÑ 
)
ÑÑ 
throw
ÖÖ 
new
ÖÖ #
ArgumentNullException
ÖÖ /
(
ÖÖ/ 0
nameof
ÖÖ0 6
(
ÖÖ6 7
key
ÖÖ7 :
)
ÖÖ: ;
)
ÖÖ; <
;
ÖÖ< =
SignedXmlDebugLog
áá 
.
áá %
LogBeginCheckSignedInfo
áá 5
(
áá5 6
this
áá6 :
,
áá: ;
m_signature
áá< G
.
ááG H

SignedInfo
ááH R
)
ááR S
;
ááS T
ISigner
ââ "
signatureDescription
ââ (
=
ââ) *
CryptoHelpers
ââ+ 8
.
ââ8 9
CreateFromName
ââ9 G
<
ââG H
ISigner
ââH O
>
ââO P
(
ââP Q
SignatureMethod
ââQ `
)
ââ` a
;
ââa b
if
ää 
(
ää "
signatureDescription
ää $
==
ää% '
null
ää( ,
)
ää, -
throw
ãã 
new
ãã 
System
ãã  
.
ãã  !
Security
ãã! )
.
ãã) *
Cryptography
ãã* 6
.
ãã6 7$
CryptographicException
ãã7 M
(
ããM N
SR
ããN P
.
ããP Q>
/Cryptography_Xml_SignatureDescriptionNotCreatedããQ Ä
)ããÄ Å
;ããÅ Ç
try
íí 
{
íí "
signatureDescription
ìì $
.
ìì$ %
Init
ìì% )
(
ìì) *
false
ìì* /
,
ìì/ 0
key
ìì1 4
)
ìì4 5
;
ìì5 6
}
îî 
catch
îî 
(
îî 
	Exception
îî 
)
îî 
{
îî  !
return
ïï 
false
ïï 
;
ïï 
}
ññ 
GetC14NDigest
òò 
(
òò 
new
òò 
SignerHashWrapper
òò /
(
òò/ 0"
signatureDescription
òò0 D
)
òòD E
)
òòE F
;
òòF G
return
¢¢ "
signatureDescription
¢¢ '
.
¢¢' (
VerifySignature
¢¢( 7
(
¢¢7 8
m_signature
¢¢8 C
.
¢¢C D
SignatureValue
¢¢D R
)
¢¢R S
;
¢¢S T
}
££ 	
private
•• 
bool
•• 
CheckSignedInfo
•• $
(
••$ %
IMac
••% )
macAlg
••* 0
)
••0 1
{
¶¶ 	
if
ßß 
(
ßß 
macAlg
ßß 
==
ßß 
null
ßß 
)
ßß 
throw
®® 
new
®® #
ArgumentNullException
®® /
(
®®/ 0
nameof
®®0 6
(
®®6 7
macAlg
®®7 =
)
®®= >
)
®®> ?
;
®®? @
SignedXmlDebugLog
™™ 
.
™™ %
LogBeginCheckSignedInfo
™™ 5
(
™™5 6
this
™™6 :
,
™™: ;
m_signature
™™< G
.
™™G H

SignedInfo
™™H R
)
™™R S
;
™™S T
int
¨¨ 
signatureLength
¨¨ 
;
¨¨  
if
≠≠ 
(
≠≠ 
m_signature
≠≠ 
.
≠≠ 

SignedInfo
≠≠ &
.
≠≠& '
SignatureLength
≠≠' 6
==
≠≠7 9
null
≠≠: >
)
≠≠> ?
signatureLength
ÆÆ 
=
ÆÆ  !
macAlg
ÆÆ" (
.
ÆÆ( )

GetMacSize
ÆÆ) 3
(
ÆÆ3 4
)
ÆÆ4 5
*
ÆÆ6 7
$num
ÆÆ8 9
;
ÆÆ9 :
else
ØØ 
signatureLength
∞∞ 
=
∞∞  !
Convert
∞∞" )
.
∞∞) *
ToInt32
∞∞* 1
(
∞∞1 2
m_signature
∞∞2 =
.
∞∞= >

SignedInfo
∞∞> H
.
∞∞H I
SignatureLength
∞∞I X
,
∞∞X Y
null
∞∞Z ^
)
∞∞^ _
;
∞∞_ `
if
≥≥ 
(
≥≥ 
signatureLength
≥≥ 
<
≥≥  !
$num
≥≥" #
||
≥≥$ &
signatureLength
≥≥' 6
>
≥≥7 8
macAlg
≥≥9 ?
.
≥≥? @

GetMacSize
≥≥@ J
(
≥≥J K
)
≥≥K L
*
≥≥M N
$num
≥≥O P
)
≥≥P Q
throw
¥¥ 
new
¥¥ 
System
¥¥  
.
¥¥  !
Security
¥¥! )
.
¥¥) *
Cryptography
¥¥* 6
.
¥¥6 7$
CryptographicException
¥¥7 M
(
¥¥M N
SR
¥¥N P
.
¥¥P Q5
'Cryptography_Xml_InvalidSignatureLength
¥¥Q x
)
¥¥x y
;
¥¥y z
if
µµ 
(
µµ 
signatureLength
µµ 
%
µµ  !
$num
µµ" #
!=
µµ$ &
$num
µµ' (
)
µµ( )
throw
∂∂ 
new
∂∂ 
System
∂∂  
.
∂∂  !
Security
∂∂! )
.
∂∂) *
Cryptography
∂∂* 6
.
∂∂6 7$
CryptographicException
∂∂7 M
(
∂∂M N
SR
∂∂N P
.
∂∂P Q6
(Cryptography_Xml_InvalidSignatureLength2
∂∂Q y
)
∂∂y z
;
∂∂z {
if
∑∑ 
(
∑∑ 
m_signature
∑∑ 
.
∑∑ 
SignatureValue
∑∑ *
==
∑∑+ -
null
∑∑. 2
)
∑∑2 3
throw
∏∏ 
new
∏∏ 
System
∏∏  
.
∏∏  !
Security
∏∏! )
.
∏∏) *
Cryptography
∏∏* 6
.
∏∏6 7$
CryptographicException
∏∏7 M
(
∏∏M N
SR
∏∏N P
.
∏∏P Q5
'Cryptography_Xml_SignatureValueRequired
∏∏Q x
)
∏∏x y
;
∏∏y z
if
ππ 
(
ππ 
m_signature
ππ 
.
ππ 
SignatureValue
ππ *
.
ππ* +
Length
ππ+ 1
!=
ππ2 4
signatureLength
ππ5 D
/
ππE F
$num
ππG H
)
ππH I
throw
∫∫ 
new
∫∫ 
System
∫∫  
.
∫∫  !
Security
∫∫! )
.
∫∫) *
Cryptography
∫∫* 6
.
∫∫6 7$
CryptographicException
∫∫7 M
(
∫∫M N
SR
∫∫N P
.
∫∫P Q5
'Cryptography_Xml_InvalidSignatureLength
∫∫Q x
)
∫∫x y
;
∫∫y z
GetC14NDigest
ΩΩ 
(
ΩΩ 
new
ΩΩ 
MacHashWrapper
ΩΩ ,
(
ΩΩ, -
macAlg
ΩΩ- 3
)
ΩΩ3 4
)
ΩΩ4 5
;
ΩΩ5 6
byte
ææ 
[
ææ 
]
ææ 
	hashValue
ææ 
=
ææ 
new
ææ "
byte
ææ# '
[
ææ' (
macAlg
ææ( .
.
ææ. /

GetMacSize
ææ/ 9
(
ææ9 :
)
ææ: ;
]
ææ; <
;
ææ< =
macAlg
øø 
.
øø 
DoFinal
øø 
(
øø 
	hashValue
øø $
,
øø$ %
$num
øø& '
)
øø' (
;
øø( )
SignedXmlDebugLog
¿¿ 
.
¿¿ !
LogVerifySignedInfo
¿¿ 1
(
¿¿1 2
this
¿¿2 6
,
¿¿6 7
macAlg
¿¿8 >
,
¿¿> ?
	hashValue
¿¿@ I
,
¿¿I J
m_signature
¿¿K V
.
¿¿V W
SignatureValue
¿¿W e
)
¿¿e f
;
¿¿f g
for
¡¡ 
(
¡¡ 
int
¡¡ 
i
¡¡ 
=
¡¡ 
$num
¡¡ 
;
¡¡ 
i
¡¡ 
<
¡¡ 
m_signature
¡¡  +
.
¡¡+ ,
SignatureValue
¡¡, :
.
¡¡: ;
Length
¡¡; A
;
¡¡A B
i
¡¡C D
++
¡¡D F
)
¡¡F G
{
¡¡H I
if
¬¬ 
(
¬¬ 
m_signature
¬¬ 
.
¬¬  
SignatureValue
¬¬  .
[
¬¬. /
i
¬¬/ 0
]
¬¬0 1
!=
¬¬2 4
	hashValue
¬¬5 >
[
¬¬> ?
i
¬¬? @
]
¬¬@ A
)
¬¬A B
return
¬¬C I
false
¬¬J O
;
¬¬O P
}
√√ 
return
ƒƒ 
true
ƒƒ 
;
ƒƒ 
}
≈≈ 	
private
«« 
static
«« 

XmlElement
«« !&
GetSingleReferenceTarget
««" :
(
««: ;
XmlDocument
««; F
document
««G O
,
««O P
string
««Q W
idAttributeName
««X g
,
««g h
string
««i o
idValue
««p w
)
««w x
{
»» 	
string
ÀÀ 
xPath
ÀÀ 
=
ÀÀ 
$str
ÀÀ "
+
ÀÀ# $
idAttributeName
ÀÀ% 4
+
ÀÀ5 6
$str
ÀÀ7 <
+
ÀÀ= >
idValue
ÀÀ? F
+
ÀÀG H
$str
ÀÀI N
;
ÀÀN O
XmlNodeList
÷÷ 
nodeList
÷÷  
=
÷÷! "
document
÷÷# +
.
÷÷+ ,
SelectNodes
÷÷, 7
(
÷÷7 8
xPath
÷÷8 =
)
÷÷= >
;
÷÷> ?
if
ÿÿ 
(
ÿÿ 
nodeList
ÿÿ 
==
ÿÿ 
null
ÿÿ  
||
ÿÿ! #
nodeList
ÿÿ$ ,
.
ÿÿ, -
Count
ÿÿ- 2
==
ÿÿ3 5
$num
ÿÿ6 7
)
ÿÿ7 8
{
ŸŸ 
return
⁄⁄ 
null
⁄⁄ 
;
⁄⁄ 
}
€€ 
if
›› 
(
›› 
nodeList
›› 
.
›› 
Count
›› 
==
›› !
$num
››" #
)
››# $
{
ﬁﬁ 
return
ﬂﬂ 
nodeList
ﬂﬂ 
[
ﬂﬂ  
$num
ﬂﬂ  !
]
ﬂﬂ! "
as
ﬂﬂ# %

XmlElement
ﬂﬂ& 0
;
ﬂﬂ0 1
}
‡‡ 
throw
‚‚ 
new
‚‚ 
System
‚‚ 
.
‚‚ 
Security
‚‚ %
.
‚‚% &
Cryptography
‚‚& 2
.
‚‚2 3$
CryptographicException
‚‚3 I
(
‚‚I J
SR
‚‚J L
.
‚‚L M/
!Cryptography_Xml_InvalidReference
‚‚M n
)
‚‚n o
;
‚‚o p
}
„„ 	
private
ÂÂ 
static
ÂÂ 
bool
ÂÂ &
IsKeyTheCorrectAlgorithm
ÂÂ 4
(
ÂÂ4 5$
AsymmetricKeyParameter
ÂÂ5 K
key
ÂÂL O
,
ÂÂO P
ISigner
ÂÂQ X
expectedType
ÂÂY e
)
ÂÂe f
{
ÊÊ 	
try
ÁÁ 
{
ÁÁ 
expectedType
ËË 
.
ËË 
Init
ËË !
(
ËË! "
false
ËË" '
,
ËË' (
key
ËË) ,
)
ËË, -
;
ËË- .
}
ÈÈ 
catch
ÈÈ 
(
ÈÈ 
	Exception
ÈÈ 
)
ÈÈ 
{
ÈÈ  !
return
ÍÍ 
false
ÍÍ 
;
ÍÍ 
}
ÎÎ 
return
ÌÌ 
true
ÌÌ 
;
ÌÌ 
}
ÓÓ 	
}
ÔÔ 
} ıﬂ
<C:\code\bc-xml-security\refactoring\src\SignedXmlDebugLog.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
static 
class 
SignedXmlDebugLog +
{ 
private55 
const55 
string55 

NullString55 '
=55( )
$str55* 2
;552 3
private77 
static77 
TraceSource77 "
s_traceSource77# 0
=771 2
new773 6
TraceSource777 B
(77B C
$str77C j
)77j k
;77k l
private88 
static88 
volatile88 
bool88  $ 
s_haveVerboseLogging88% 9
;889 :
private99 
static99 
volatile99 
bool99  $
s_verboseLogging99% 5
;995 6
private:: 
static:: 
volatile:: 
bool::  $$
s_haveInformationLogging::% =
;::= >
private;; 
static;; 
volatile;; 
bool;;  $ 
s_informationLogging;;% 9
;;;9 :
internal@@ 
enum@@ 
SignedXmlDebugEvent@@ )
{AA 	!
BeginCanonicalizationEE !
,EE! "%
BeginCheckSignatureFormatJJ %
,JJ% & 
BeginCheckSignedInfoOO  
,OO  !%
BeginSignatureComputationTT %
,TT% &&
BeginSignatureVerificationYY &
,YY& '
CanonicalizedData^^ 
,^^ "
FormatValidationResultcc "
,cc" # 
NamespacePropagationhh  
,hh  !
ReferenceDatamm 
,mm '
SignatureVerificationResultrr '
,rr' (
Signingww 
,ww 
SigningReference|| 
,|| !
VerificationFailure
ÅÅ 
,
ÅÅ  
VerifyReference
ÜÜ 
,
ÜÜ 
VerifySignedInfo
ãã 
,
ãã 
X509Verification
êê 
,
êê *
UnsafeCanonicalizationMethod
ññ (
,
ññ( )#
UnsafeTransformMethod
úú !
,
úú! "
}
ùù 	
private
¢¢ 
static
¢¢ 
bool
¢¢ '
InformationLoggingEnabled
¢¢ 5
{
££ 	
get
§§ 
{
•• 
if
¶¶ 
(
¶¶ 
!
¶¶ &
s_haveInformationLogging
¶¶ -
)
¶¶- .
{
ßß "
s_informationLogging
®® (
=
®®) *
s_traceSource
®®+ 8
.
®®8 9
Switch
®®9 ?
.
®®? @
ShouldTrace
®®@ K
(
®®K L
TraceEventType
®®L Z
.
®®Z [
Information
®®[ f
)
®®f g
;
®®g h&
s_haveInformationLogging
©© ,
=
©©- .
true
©©/ 3
;
©©3 4
}
™™ 
return
¨¨ "
s_informationLogging
¨¨ +
;
¨¨+ ,
}
≠≠ 
}
ÆÆ 	
private
≥≥ 
static
≥≥ 
bool
≥≥ #
VerboseLoggingEnabled
≥≥ 1
{
¥¥ 	
get
µµ 
{
∂∂ 
if
∑∑ 
(
∑∑ 
!
∑∑ "
s_haveVerboseLogging
∑∑ )
)
∑∑) *
{
∏∏ 
s_verboseLogging
ππ $
=
ππ% &
s_traceSource
ππ' 4
.
ππ4 5
Switch
ππ5 ;
.
ππ; <
ShouldTrace
ππ< G
(
ππG H
TraceEventType
ππH V
.
ππV W
Verbose
ππW ^
)
ππ^ _
;
ππ_ `"
s_haveVerboseLogging
∫∫ (
=
∫∫) *
true
∫∫+ /
;
∫∫/ 0
}
ªª 
return
ΩΩ 
s_verboseLogging
ΩΩ '
;
ΩΩ' (
}
ææ 
}
øø 	
private
ƒƒ 
static
ƒƒ 
string
ƒƒ 
FormatBytes
ƒƒ )
(
ƒƒ) *
byte
ƒƒ* .
[
ƒƒ. /
]
ƒƒ/ 0
bytes
ƒƒ1 6
)
ƒƒ6 7
{
≈≈ 	
if
∆∆ 
(
∆∆ 
bytes
∆∆ 
==
∆∆ 
null
∆∆ 
)
∆∆ 
return
«« 

NullString
«« !
;
««! "
StringBuilder
…… 
builder
…… !
=
……" #
new
……$ '
StringBuilder
……( 5
(
……5 6
bytes
……6 ;
.
……; <
Length
……< B
*
……C D
$num
……E F
)
……F G
;
……G H
foreach
   
(
   
byte
   
b
   
in
   
bytes
   $
)
  $ %
{
ÀÀ 
builder
ÃÃ 
.
ÃÃ 
Append
ÃÃ 
(
ÃÃ 
b
ÃÃ  
.
ÃÃ  !
ToString
ÃÃ! )
(
ÃÃ) *
$str
ÃÃ* .
,
ÃÃ. /
CultureInfo
ÃÃ0 ;
.
ÃÃ; <
InvariantCulture
ÃÃ< L
)
ÃÃL M
)
ÃÃM N
;
ÃÃN O
}
ÕÕ 
return
œœ 
builder
œœ 
.
œœ 
ToString
œœ #
(
œœ# $
)
œœ$ %
;
œœ% &
}
–– 	
private
’’ 
static
’’ 
string
’’ 

GetKeyName
’’ (
(
’’( )
object
’’) /
key
’’0 3
)
’’3 4
{
÷÷ 	
Debug
◊◊ 
.
◊◊ 
Assert
◊◊ 
(
◊◊ 
key
◊◊ 
!=
◊◊ 
null
◊◊  $
,
◊◊$ %
$str
◊◊& 3
)
◊◊3 4
;
◊◊4 5$
AsymmetricKeyParameter
ŸŸ "
cspKey
ŸŸ# )
=
ŸŸ* +
key
ŸŸ, /
as
ŸŸ0 2$
AsymmetricKeyParameter
ŸŸ3 I
;
ŸŸI J
X509Certificate
⁄⁄ 
certificate
⁄⁄ '
=
⁄⁄( )
key
⁄⁄* -
as
⁄⁄. 0
X509Certificate
⁄⁄1 @
;
⁄⁄@ A
string
‹‹ 
keyName
‹‹ 
=
‹‹ 
null
‹‹ !
;
‹‹! "
if
›› 
(
›› 
cspKey
›› 
!=
›› 
null
›› 
)
›› 
{
ﬁﬁ 
keyName
ﬂﬂ 
=
ﬂﬂ 
string
ﬂﬂ  
.
ﬂﬂ  !
Format
ﬂﬂ! '
(
ﬂﬂ' (
CultureInfo
ﬂﬂ( 3
.
ﬂﬂ3 4
InvariantCulture
ﬂﬂ4 D
,
ﬂﬂD E
$str
‡‡( 1
,
‡‡1 2
cspKey
··( .
.
··. /
GetType
··/ 6
(
··6 7
)
··7 8
.
··8 9
Name
··9 =
)
··= >
;
··> ?
}
‚‚ 
else
„„ 
if
„„ 
(
„„ 
certificate
„„  
!=
„„! #
null
„„$ (
)
„„( )
{
‰‰ 
keyName
ÂÂ 
=
ÂÂ 
string
ÂÂ  
.
ÂÂ  !
Format
ÂÂ! '
(
ÂÂ' (
CultureInfo
ÂÂ( 3
.
ÂÂ3 4
InvariantCulture
ÂÂ4 D
,
ÂÂD E
$str
ÊÊ( 1
,
ÊÊ1 2
certificate
ÁÁ( 3
.
ÁÁ3 4
	SubjectDN
ÁÁ4 =
)
ÁÁ= >
;
ÁÁ> ?
}
ËË 
else
ÈÈ 
{
ÍÍ 
keyName
ÎÎ 
=
ÎÎ 
key
ÎÎ 
.
ÎÎ 
GetHashCode
ÎÎ )
(
ÎÎ) *
)
ÎÎ* +
.
ÎÎ+ ,
ToString
ÎÎ, 4
(
ÎÎ4 5
$str
ÎÎ5 9
,
ÎÎ9 :
CultureInfo
ÎÎ; F
.
ÎÎF G
InvariantCulture
ÎÎG W
)
ÎÎW X
;
ÎÎX Y
}
ÏÏ 
return
ÓÓ 
string
ÓÓ 
.
ÓÓ 
Format
ÓÓ  
(
ÓÓ  !
CultureInfo
ÓÓ! ,
.
ÓÓ, -
InvariantCulture
ÓÓ- =
,
ÓÓ= >
$str
ÓÓ? H
,
ÓÓH I
key
ÓÓJ M
.
ÓÓM N
GetType
ÓÓN U
(
ÓÓU V
)
ÓÓV W
.
ÓÓW X
Name
ÓÓX \
,
ÓÓ\ ]
keyName
ÓÓ^ e
)
ÓÓe f
;
ÓÓf g
}
ÔÔ 	
private
ÙÙ 
static
ÙÙ 
string
ÙÙ 
GetObjectId
ÙÙ )
(
ÙÙ) *
object
ÙÙ* 0
o
ÙÙ1 2
)
ÙÙ2 3
{
ıı 	
Debug
ˆˆ 
.
ˆˆ 
Assert
ˆˆ 
(
ˆˆ 
o
ˆˆ 
!=
ˆˆ 
null
ˆˆ "
,
ˆˆ" #
$str
ˆˆ$ /
)
ˆˆ/ 0
;
ˆˆ0 1
return
¯¯ 
string
¯¯ 
.
¯¯ 
Format
¯¯  
(
¯¯  !
CultureInfo
¯¯! ,
.
¯¯, -
InvariantCulture
¯¯- =
,
¯¯= >
$str
˘˘! *
,
˘˘* +
o
˘˘, -
.
˘˘- .
GetType
˘˘. 5
(
˘˘5 6
)
˘˘6 7
.
˘˘7 8
Name
˘˘8 <
,
˘˘< =
o
˙˙! "
.
˙˙" #
GetHashCode
˙˙# .
(
˙˙. /
)
˙˙/ 0
.
˙˙0 1
ToString
˙˙1 9
(
˙˙9 :
$str
˙˙: >
,
˙˙> ?
CultureInfo
˙˙@ K
.
˙˙K L
InvariantCulture
˙˙L \
)
˙˙\ ]
)
˙˙] ^
;
˙˙^ _
}
˚˚ 	
internal
ÇÇ 
static
ÇÇ 
void
ÇÇ &
LogBeginCanonicalization
ÇÇ 5
(
ÇÇ5 6
	SignedXml
ÇÇ6 ?
	signedXml
ÇÇ@ I
,
ÇÇI J
	Transform
ÇÇK T'
canonicalizationTransform
ÇÇU n
)
ÇÇn o
{
ÉÉ 	
Debug
ÑÑ 
.
ÑÑ 
Assert
ÑÑ 
(
ÑÑ 
	signedXml
ÑÑ "
!=
ÑÑ# %
null
ÑÑ& *
,
ÑÑ* +
$str
ÑÑ, ?
)
ÑÑ? @
;
ÑÑ@ A
Debug
ÖÖ 
.
ÖÖ 
Assert
ÖÖ 
(
ÖÖ '
canonicalizationTransform
ÖÖ 2
!=
ÖÖ3 5
null
ÖÖ6 :
,
ÖÖ: ;
$str
ÖÖ< _
)
ÖÖ_ `
;
ÖÖ` a
if
áá 
(
áá '
InformationLoggingEnabled
áá )
)
áá) *
{
àà 
string
ââ 

logMessage
ââ !
=
ââ" #
string
ââ$ *
.
ââ* +
Format
ââ+ 1
(
ââ1 2
CultureInfo
ââ2 =
.
ââ= >
InvariantCulture
ââ> N
,
ââN O
SR
ää2 4
.
ää4 5'
Log_BeginCanonicalization
ää5 N
,
ääN O'
canonicalizationTransform
ãã2 K
.
ããK L
	Algorithm
ããL U
,
ããU V'
canonicalizationTransform
åå2 K
.
ååK L
GetType
ååL S
(
ååS T
)
ååT U
.
ååU V
Name
ååV Z
)
ååZ [
;
åå[ \
	WriteLine
çç 
(
çç 
	signedXml
çç #
,
çç# $
TraceEventType
éé (
.
éé( )
Information
éé) 4
,
éé4 5!
SignedXmlDebugEvent
èè -
.
èè- .#
BeginCanonicalization
èè. C
,
èèC D

logMessage
êê $
)
êê$ %
;
êê% &
}
ëë 
if
ìì 
(
ìì #
VerboseLoggingEnabled
ìì %
)
ìì% &
{
îî 
string
ïï &
canonicalizationSettings
ïï /
=
ïï0 1
string
ïï2 8
.
ïï8 9
Format
ïï9 ?
(
ïï? @
CultureInfo
ïï@ K
.
ïïK L
InvariantCulture
ïïL \
,
ïï\ ]
SR
ññ@ B
.
ññB C*
Log_CanonicalizationSettings
ññC _
,
ññ_ `'
canonicalizationTransform
óó@ Y
.
óóY Z
Resolver
óóZ b
.
óób c
GetType
óóc j
(
óój k
)
óók l
,
óól m'
canonicalizationTransform
òò@ Y
.
òòY Z
BaseURI
òòZ a
)
òòa b
;
òòb c
	WriteLine
ôô 
(
ôô 
	signedXml
ôô #
,
ôô# $
TraceEventType
öö (
.
öö( )
Verbose
öö) 0
,
öö0 1!
SignedXmlDebugEvent
õõ -
.
õõ- .#
BeginCanonicalization
õõ. C
,
õõC D&
canonicalizationSettings
úú 2
)
úú2 3
;
úú3 4
}
ùù 
}
ûû 	
internal
•• 
static
•• 
void
•• *
LogBeginCheckSignatureFormat
•• 9
(
••9 :
	SignedXml
••: C
	signedXml
••D M
,
••M N
Func
••O S
<
••S T
	SignedXml
••T ]
,
••] ^
bool
••_ c
>
••c d
formatValidator
••e t
)
••t u
{
¶¶ 	
Debug
ßß 
.
ßß 
Assert
ßß 
(
ßß 
	signedXml
ßß "
!=
ßß# %
null
ßß& *
,
ßß* +
$str
ßß, ?
)
ßß? @
;
ßß@ A
Debug
®® 
.
®® 
Assert
®® 
(
®® 
formatValidator
®® (
!=
®®) +
null
®®, 0
,
®®0 1
$str
®®2 K
)
®®K L
;
®®L M
if
™™ 
(
™™ '
InformationLoggingEnabled
™™ )
)
™™) *
{
´´ 

MethodInfo
¨¨ 
validationMethod
¨¨ +
=
¨¨, -
formatValidator
¨¨. =
.
¨¨= >
Method
¨¨> D
;
¨¨D E
string
ÆÆ 

logMessage
ÆÆ !
=
ÆÆ" #
string
ÆÆ$ *
.
ÆÆ* +
Format
ÆÆ+ 1
(
ÆÆ1 2
CultureInfo
ÆÆ2 =
.
ÆÆ= >
InvariantCulture
ÆÆ> N
,
ÆÆN O
SR
ØØ2 4
.
ØØ4 5&
Log_CheckSignatureFormat
ØØ5 M
,
ØØM N
validationMethod
∞∞2 B
.
∞∞B C
Module
∞∞C I
.
∞∞I J
Assembly
∞∞J R
.
∞∞R S
FullName
∞∞S [
,
∞∞[ \
validationMethod
±±2 B
.
±±B C
DeclaringType
±±C P
.
±±P Q
FullName
±±Q Y
,
±±Y Z
validationMethod
≤≤2 B
.
≤≤B C
Name
≤≤C G
)
≤≤G H
;
≤≤H I
	WriteLine
≥≥ 
(
≥≥ 
	signedXml
≥≥ #
,
≥≥# $
TraceEventType
≥≥% 3
.
≥≥3 4
Information
≥≥4 ?
,
≥≥? @!
SignedXmlDebugEvent
≥≥A T
.
≥≥T U'
BeginCheckSignatureFormat
≥≥U n
,
≥≥n o

logMessage
≥≥p z
)
≥≥z {
;
≥≥{ |
}
¥¥ 
}
µµ 	
internal
ºº 
static
ºº 
void
ºº %
LogBeginCheckSignedInfo
ºº 4
(
ºº4 5
	SignedXml
ºº5 >
	signedXml
ºº? H
,
ººH I

SignedInfo
ººJ T

signedInfo
ººU _
)
ºº_ `
{
ΩΩ 	
Debug
ææ 
.
ææ 
Assert
ææ 
(
ææ 
	signedXml
ææ "
!=
ææ# %
null
ææ& *
,
ææ* +
$str
ææ, ?
)
ææ? @
;
ææ@ A
Debug
øø 
.
øø 
Assert
øø 
(
øø 

signedInfo
øø #
!=
øø$ &
null
øø' +
,
øø+ ,
$str
øø- B
)
øøB C
;
øøC D
if
¡¡ 
(
¡¡ '
InformationLoggingEnabled
¡¡ )
)
¡¡) *
{
¬¬ 
string
√√ 

logMessage
√√ !
=
√√" #
string
√√$ *
.
√√* +
Format
√√+ 1
(
√√1 2
CultureInfo
√√2 =
.
√√= >
InvariantCulture
√√> N
,
√√N O
SR
ƒƒ2 4
.
ƒƒ4 5!
Log_CheckSignedInfo
ƒƒ5 H
,
ƒƒH I

signedInfo
≈≈2 <
.
≈≈< =
Id
≈≈= ?
!=
≈≈@ B
null
≈≈C G
?
≈≈H I

signedInfo
≈≈J T
.
≈≈T U
Id
≈≈U W
:
≈≈X Y

NullString
≈≈Z d
)
≈≈d e
;
≈≈e f
	WriteLine
∆∆ 
(
∆∆ 
	signedXml
∆∆ #
,
∆∆# $
TraceEventType
∆∆% 3
.
∆∆3 4
Information
∆∆4 ?
,
∆∆? @!
SignedXmlDebugEvent
∆∆A T
.
∆∆T U"
BeginCheckSignedInfo
∆∆U i
,
∆∆i j

logMessage
∆∆k u
)
∆∆u v
;
∆∆v w
}
«« 
}
»» 	
internal
œœ 
static
œœ 
void
œœ *
LogBeginSignatureComputation
œœ 9
(
œœ9 :
	SignedXml
œœ: C
	signedXml
œœD M
,
œœM N

XmlElement
œœO Y
context
œœZ a
)
œœa b
{
–– 	
Debug
—— 
.
—— 
Assert
—— 
(
—— 
	signedXml
—— "
!=
——# %
null
——& *
,
——* +
$str
——, ?
)
——? @
;
——@ A
if
”” 
(
”” '
InformationLoggingEnabled
”” )
)
””) *
{
‘‘ 
	WriteLine
’’ 
(
’’ 
	signedXml
’’ #
,
’’# $
TraceEventType
÷÷ (
.
÷÷( )
Information
÷÷) 4
,
÷÷4 5!
SignedXmlDebugEvent
◊◊ -
.
◊◊- .'
BeginSignatureComputation
◊◊. G
,
◊◊G H
SR
ÿÿ 
.
ÿÿ +
Log_BeginSignatureComputation
ÿÿ :
)
ÿÿ: ;
;
ÿÿ; <
}
ŸŸ 
if
€€ 
(
€€ #
VerboseLoggingEnabled
€€ %
)
€€% &
{
‹‹ 
string
›› 
contextData
›› "
=
››# $
string
››% +
.
››+ ,
Format
››, 2
(
››2 3
CultureInfo
››3 >
.
››> ?
InvariantCulture
››? O
,
››O P
SR
ﬁﬁ3 5
.
ﬁﬁ5 6
Log_XmlContext
ﬁﬁ6 D
,
ﬁﬁD E
context
ﬂﬂ3 :
!=
ﬂﬂ; =
null
ﬂﬂ> B
?
ﬂﬂC D
context
ﬂﬂE L
.
ﬂﬂL M
OuterXml
ﬂﬂM U
:
ﬂﬂV W

NullString
ﬂﬂX b
)
ﬂﬂb c
;
ﬂﬂc d
	WriteLine
·· 
(
·· 
	signedXml
·· #
,
··# $
TraceEventType
‚‚ (
.
‚‚( )
Verbose
‚‚) 0
,
‚‚0 1!
SignedXmlDebugEvent
„„ -
.
„„- .'
BeginSignatureComputation
„„. G
,
„„G H
contextData
‰‰ %
)
‰‰% &
;
‰‰& '
}
ÂÂ 
}
ÊÊ 	
internal
ÌÌ 
static
ÌÌ 
void
ÌÌ +
LogBeginSignatureVerification
ÌÌ :
(
ÌÌ: ;
	SignedXml
ÌÌ; D
	signedXml
ÌÌE N
,
ÌÌN O

XmlElement
ÌÌP Z
context
ÌÌ[ b
)
ÌÌb c
{
ÓÓ 	
Debug
ÔÔ 
.
ÔÔ 
Assert
ÔÔ 
(
ÔÔ 
	signedXml
ÔÔ "
!=
ÔÔ# %
null
ÔÔ& *
,
ÔÔ* +
$str
ÔÔ, ?
)
ÔÔ? @
;
ÔÔ@ A
if
ÒÒ 
(
ÒÒ '
InformationLoggingEnabled
ÒÒ )
)
ÒÒ) *
{
ÚÚ 
	WriteLine
ÛÛ 
(
ÛÛ 
	signedXml
ÛÛ #
,
ÛÛ# $
TraceEventType
ÙÙ (
.
ÙÙ( )
Information
ÙÙ) 4
,
ÙÙ4 5!
SignedXmlDebugEvent
ıı -
.
ıı- .(
BeginSignatureVerification
ıı. H
,
ııH I
SR
ˆˆ 
.
ˆˆ ,
Log_BeginSignatureVerification
ˆˆ ;
)
ˆˆ; <
;
ˆˆ< =
}
˜˜ 
if
˘˘ 
(
˘˘ #
VerboseLoggingEnabled
˘˘ %
)
˘˘% &
{
˙˙ 
string
˚˚ 
contextData
˚˚ "
=
˚˚# $
string
˚˚% +
.
˚˚+ ,
Format
˚˚, 2
(
˚˚2 3
CultureInfo
˚˚3 >
.
˚˚> ?
InvariantCulture
˚˚? O
,
˚˚O P
SR
¸¸3 5
.
¸¸5 6
Log_XmlContext
¸¸6 D
,
¸¸D E
context
˝˝3 :
!=
˝˝; =
null
˝˝> B
?
˝˝C D
context
˝˝E L
.
˝˝L M
OuterXml
˝˝M U
:
˝˝V W

NullString
˝˝X b
)
˝˝b c
;
˝˝c d
	WriteLine
ˇˇ 
(
ˇˇ 
	signedXml
ˇˇ #
,
ˇˇ# $
TraceEventType
ÄÄ (
.
ÄÄ( )
Verbose
ÄÄ) 0
,
ÄÄ0 1!
SignedXmlDebugEvent
ÅÅ -
.
ÅÅ- .(
BeginSignatureVerification
ÅÅ. H
,
ÅÅH I
contextData
ÇÇ %
)
ÇÇ% &
;
ÇÇ& '
}
ÉÉ 
}
ÑÑ 	
internal
ãã 
static
ãã 
void
ãã $
LogCanonicalizedOutput
ãã 3
(
ãã3 4
	SignedXml
ãã4 =
	signedXml
ãã> G
,
ããG H
	Transform
ããI R'
canonicalizationTransform
ããS l
)
ããl m
{
åå 	
Debug
çç 
.
çç 
Assert
çç 
(
çç 
	signedXml
çç "
!=
çç# %
null
çç& *
,
çç* +
$str
çç, ?
)
çç? @
;
çç@ A
Debug
éé 
.
éé 
Assert
éé 
(
éé '
canonicalizationTransform
éé 2
!=
éé3 5
null
éé6 :
,
éé: ;
$str
éé< _
)
éé_ `
;
éé` a
if
êê 
(
êê #
VerboseLoggingEnabled
êê %
)
êê% &
{
ëë 
using
íí 
(
íí 
StreamReader
íí #
reader
íí$ *
=
íí+ ,
new
íí- 0
StreamReader
íí1 =
(
íí= >'
canonicalizationTransform
íí> W
.
ííW X
	GetOutput
ííX a
(
íía b
typeof
ííb h
(
ííh i
Stream
ííi o
)
íío p
)
ííp q
as
íír t
Stream
ííu {
)
íí{ |
)
íí| }
{
ìì 
string
îî 

logMessage
îî %
=
îî& '
string
îî( .
.
îî. /
Format
îî/ 5
(
îî5 6
CultureInfo
îî6 A
.
îîA B
InvariantCulture
îîB R
,
îîR S
SR
ïï6 8
.
ïï8 9%
Log_CanonicalizedOutput
ïï9 P
,
ïïP Q
reader
ññ6 <
.
ññ< =
	ReadToEnd
ññ= F
(
ññF G
)
ññG H
)
ññH I
;
ññI J
	WriteLine
óó 
(
óó 
	signedXml
óó '
,
óó' (
TraceEventType
òò ,
.
òò, -
Verbose
òò- 4
,
òò4 5!
SignedXmlDebugEvent
ôô 1
.
ôô1 2
CanonicalizedData
ôô2 C
,
ôôC D

logMessage
öö (
)
öö( )
;
öö) *
}
õõ 
}
úú 
}
ùù 	
internal
§§ 
static
§§ 
void
§§ '
LogFormatValidationResult
§§ 6
(
§§6 7
	SignedXml
§§7 @
	signedXml
§§A J
,
§§J K
bool
§§L P
result
§§Q W
)
§§W X
{
•• 	
Debug
¶¶ 
.
¶¶ 
Assert
¶¶ 
(
¶¶ 
	signedXml
¶¶ "
!=
¶¶# %
null
¶¶& *
,
¶¶* +
$str
¶¶, ?
)
¶¶? @
;
¶¶@ A
if
®® 
(
®® '
InformationLoggingEnabled
®® )
)
®®) *
{
©© 
string
™™ 

logMessage
™™ !
=
™™" #
result
™™$ *
?
™™+ ,
SR
™™- /
.
™™/ 0,
Log_FormatValidationSuccessful
™™0 N
:
™™O P
SR
´´- /
.
´´/ 0/
!Log_FormatValidationNotSuccessful
´´0 Q
;
´´Q R
	WriteLine
¨¨ 
(
¨¨ 
	signedXml
¨¨ #
,
¨¨# $
TraceEventType
¨¨% 3
.
¨¨3 4
Information
¨¨4 ?
,
¨¨? @!
SignedXmlDebugEvent
¨¨A T
.
¨¨T U$
FormatValidationResult
¨¨U k
,
¨¨k l

logMessage
¨¨m w
)
¨¨w x
;
¨¨x y
}
≠≠ 
}
ÆÆ 	
internal
∂∂ 
static
∂∂ 
void
∂∂ -
LogUnsafeCanonicalizationMethod
∂∂ <
(
∂∂< =
	SignedXml
∂∂= F
	signedXml
∂∂G P
,
∂∂P Q
string
∂∂R X
	algorithm
∂∂Y b
,
∂∂b c
IEnumerable
∂∂d o
<
∂∂o p
string
∂∂p v
>
∂∂v w
validAlgorithms∂∂x á
)∂∂á à
{
∑∑ 	
Debug
∏∏ 
.
∏∏ 
Assert
∏∏ 
(
∏∏ 
	signedXml
∏∏ "
!=
∏∏# %
null
∏∏& *
,
∏∏* +
$str
∏∏, ?
)
∏∏? @
;
∏∏@ A
Debug
ππ 
.
ππ 
Assert
ππ 
(
ππ 
validAlgorithms
ππ (
!=
ππ) +
null
ππ, 0
,
ππ0 1
$str
ππ2 K
)
ππK L
;
ππL M
if
ªª 
(
ªª '
InformationLoggingEnabled
ªª )
)
ªª) *
{
ºº 
StringBuilder
ΩΩ #
validAlgorithmBuilder
ΩΩ 3
=
ΩΩ4 5
new
ΩΩ6 9
StringBuilder
ΩΩ: G
(
ΩΩG H
)
ΩΩH I
;
ΩΩI J
foreach
ææ 
(
ææ 
string
ææ 
validAlgorithm
ææ  .
in
ææ/ 1
validAlgorithms
ææ2 A
)
ææA B
{
øø 
if
¿¿ 
(
¿¿ #
validAlgorithmBuilder
¿¿ -
.
¿¿- .
Length
¿¿. 4
!=
¿¿5 7
$num
¿¿8 9
)
¿¿9 :
{
¡¡ #
validAlgorithmBuilder
¬¬ -
.
¬¬- .
Append
¬¬. 4
(
¬¬4 5
$str
¬¬5 9
)
¬¬9 :
;
¬¬: ;
}
√√ #
validAlgorithmBuilder
≈≈ )
.
≈≈) *
AppendFormat
≈≈* 6
(
≈≈6 7
$str
≈≈7 @
,
≈≈@ A
validAlgorithm
≈≈B P
)
≈≈P Q
;
≈≈Q R
}
∆∆ 
string
»» 

logMessage
»» !
=
»»" #
string
»»$ *
.
»»* +
Format
»»+ 1
(
»»1 2
CultureInfo
»»2 =
.
»»= >
InvariantCulture
»»> N
,
»»N O
SR
……2 4
.
……4 5.
 Log_UnsafeCanonicalizationMethod
……5 U
,
……U V
	algorithm
  2 ;
,
  ; <#
validAlgorithmBuilder
ÀÀ2 G
.
ÀÀG H
ToString
ÀÀH P
(
ÀÀP Q
)
ÀÀQ R
)
ÀÀR S
;
ÀÀS T
	WriteLine
ÕÕ 
(
ÕÕ 
	signedXml
ÕÕ #
,
ÕÕ# $
TraceEventType
ÕÕ% 3
.
ÕÕ3 4
Information
ÕÕ4 ?
,
ÕÕ? @!
SignedXmlDebugEvent
ÕÕA T
.
ÕÕT U*
UnsafeCanonicalizationMethod
ÕÕU q
,
ÕÕq r

logMessage
ÕÕs }
)
ÕÕ} ~
;
ÕÕ~ 
}
ŒŒ 
}
œœ 	
internal
ŸŸ 
static
ŸŸ 
void
ŸŸ &
LogUnsafeTransformMethod
ŸŸ 5
(
ŸŸ5 6
	SignedXml
⁄⁄ 
	signedXml
⁄⁄ 
,
⁄⁄  
string
€€ 
	algorithm
€€ 
,
€€ 
IEnumerable
‹‹ 
<
‹‹ 
string
‹‹ 
>
‹‹ !
validC14nAlgorithms
‹‹  3
,
‹‹3 4
IEnumerable
›› 
<
›› 
string
›› 
>
›› &
validTransformAlgorithms
››  8
)
››8 9
{
ﬁﬁ 	
Debug
ﬂﬂ 
.
ﬂﬂ 
Assert
ﬂﬂ 
(
ﬂﬂ 
	signedXml
ﬂﬂ "
!=
ﬂﬂ# %
null
ﬂﬂ& *
,
ﬂﬂ* +
$str
ﬂﬂ, ?
)
ﬂﬂ? @
;
ﬂﬂ@ A
Debug
‡‡ 
.
‡‡ 
Assert
‡‡ 
(
‡‡ !
validC14nAlgorithms
‡‡ ,
!=
‡‡- /
null
‡‡0 4
,
‡‡4 5
$str
‡‡6 S
)
‡‡S T
;
‡‡T U
Debug
·· 
.
·· 
Assert
·· 
(
·· &
validTransformAlgorithms
·· 1
!=
··2 4
null
··5 9
,
··9 :
$str
··; ]
)
··] ^
;
··^ _
if
„„ 
(
„„ '
InformationLoggingEnabled
„„ )
)
„„) *
{
‰‰ 
StringBuilder
ÂÂ #
validAlgorithmBuilder
ÂÂ 3
=
ÂÂ4 5
new
ÂÂ6 9
StringBuilder
ÂÂ: G
(
ÂÂG H
)
ÂÂH I
;
ÂÂI J
foreach
ÊÊ 
(
ÊÊ 
string
ÊÊ 
validAlgorithm
ÊÊ  .
in
ÊÊ/ 1!
validC14nAlgorithms
ÊÊ2 E
)
ÊÊE F
{
ÁÁ 
if
ËË 
(
ËË #
validAlgorithmBuilder
ËË -
.
ËË- .
Length
ËË. 4
!=
ËË5 7
$num
ËË8 9
)
ËË9 :
{
ÈÈ #
validAlgorithmBuilder
ÍÍ -
.
ÍÍ- .
Append
ÍÍ. 4
(
ÍÍ4 5
$str
ÍÍ5 9
)
ÍÍ9 :
;
ÍÍ: ;
}
ÎÎ #
validAlgorithmBuilder
ÌÌ )
.
ÌÌ) *
AppendFormat
ÌÌ* 6
(
ÌÌ6 7
$str
ÌÌ7 @
,
ÌÌ@ A
validAlgorithm
ÌÌB P
)
ÌÌP Q
;
ÌÌQ R
}
ÓÓ 
foreach
 
(
 
string
 
validAlgorithm
  .
in
/ 1&
validTransformAlgorithms
2 J
)
J K
{
ÒÒ 
if
ÚÚ 
(
ÚÚ #
validAlgorithmBuilder
ÚÚ -
.
ÚÚ- .
Length
ÚÚ. 4
!=
ÚÚ5 7
$num
ÚÚ8 9
)
ÚÚ9 :
{
ÛÛ #
validAlgorithmBuilder
ÙÙ -
.
ÙÙ- .
Append
ÙÙ. 4
(
ÙÙ4 5
$str
ÙÙ5 9
)
ÙÙ9 :
;
ÙÙ: ;
}
ıı #
validAlgorithmBuilder
˜˜ )
.
˜˜) *
AppendFormat
˜˜* 6
(
˜˜6 7
$str
˜˜7 @
,
˜˜@ A
validAlgorithm
˜˜B P
)
˜˜P Q
;
˜˜Q R
}
¯¯ 
string
˙˙ 

logMessage
˙˙ !
=
˙˙" #
string
˙˙$ *
.
˙˙* +
Format
˙˙+ 1
(
˙˙1 2
CultureInfo
˙˙2 =
.
˙˙= >
InvariantCulture
˙˙> N
,
˙˙N O
SR
˚˚2 4
.
˚˚4 5'
Log_UnsafeTransformMethod
˚˚5 N
,
˚˚N O
	algorithm
¸¸2 ;
,
¸¸; <#
validAlgorithmBuilder
˝˝2 G
.
˝˝G H
ToString
˝˝H P
(
˝˝P Q
)
˝˝Q R
)
˝˝R S
;
˝˝S T
	WriteLine
ˇˇ 
(
ˇˇ 
	signedXml
ˇˇ #
,
ˇˇ# $
TraceEventType
ˇˇ% 3
.
ˇˇ3 4
Information
ˇˇ4 ?
,
ˇˇ? @!
SignedXmlDebugEvent
ˇˇA T
.
ˇˇT U#
UnsafeTransformMethod
ˇˇU j
,
ˇˇj k

logMessage
ˇˇl v
)
ˇˇv w
;
ˇˇw x
}
ÄÄ 
}
ÅÅ 	
internal
àà 
static
àà 
void
àà %
LogNamespacePropagation
àà 4
(
àà4 5
	SignedXml
àà5 >
	signedXml
àà? H
,
ààH I
XmlNodeList
ààJ U

namespaces
ààV `
)
àà` a
{
ââ 	
Debug
ää 
.
ää 
Assert
ää 
(
ää 
	signedXml
ää "
!=
ää# %
null
ää& *
,
ää* +
$str
ää, ?
)
ää? @
;
ää@ A
if
åå 
(
åå '
InformationLoggingEnabled
åå )
)
åå) *
{
çç 
if
éé 
(
éé 

namespaces
éé 
!=
éé !
null
éé" &
)
éé& '
{
èè 
foreach
êê 
(
êê 
XmlAttribute
êê )!
propagatedNamespace
êê* =
in
êê> @

namespaces
êêA K
)
êêK L
{
ëë 
string
íí  
propagationMessage
íí 1
=
íí2 3
string
íí4 :
.
íí: ;
Format
íí; A
(
ííA B
CultureInfo
ííB M
.
ííM N
InvariantCulture
ííN ^
,
íí^ _
SR
ììB D
.
ììD E&
Log_PropagatingNamespace
ììE ]
,
ìì] ^!
propagatedNamespace
îîB U
.
îîU V
Name
îîV Z
,
îîZ [!
propagatedNamespace
ïïB U
.
ïïU V
Value
ïïV [
)
ïï[ \
;
ïï\ ]
	WriteLine
óó !
(
óó! "
	signedXml
óó" +
,
óó+ ,
TraceEventType
òò" 0
.
òò0 1
Information
òò1 <
,
òò< =!
SignedXmlDebugEvent
ôô" 5
.
ôô5 6"
NamespacePropagation
ôô6 J
,
ôôJ K 
propagationMessage
öö" 4
)
öö4 5
;
öö5 6
}
õõ 
}
úú 
else
ùù 
{
ûû 
	WriteLine
üü 
(
üü 
	signedXml
üü '
,
üü' (
TraceEventType
†† ,
.
††, -
Information
††- 8
,
††8 9!
SignedXmlDebugEvent
°° 1
.
°°1 2"
NamespacePropagation
°°2 F
,
°°F G
SR
¢¢  
.
¢¢  !(
Log_NoNamespacesPropagated
¢¢! ;
)
¢¢; <
;
¢¢< =
}
££ 
}
§§ 
}
•• 	
internal
≠≠ 
static
≠≠ 
Stream
≠≠ 
LogReferenceData
≠≠ /
(
≠≠/ 0
	Reference
≠≠0 9
	reference
≠≠: C
,
≠≠C D
Stream
≠≠E K
data
≠≠L P
)
≠≠P Q
{
ÆÆ 	
if
ØØ 
(
ØØ #
VerboseLoggingEnabled
ØØ %
)
ØØ% &
{
∞∞ 
MemoryStream
∏∏ 
ms
∏∏ 
=
∏∏  !
new
∏∏" %
MemoryStream
∏∏& 2
(
∏∏2 3
)
∏∏3 4
;
∏∏4 5
byte
ªª 
[
ªª 
]
ªª 
buffer
ªª 
=
ªª 
new
ªª  #
byte
ªª$ (
[
ªª( )
$num
ªª) -
]
ªª- .
;
ªª. /
int
ºº 
	readBytes
ºº 
=
ºº 
$num
ºº  !
;
ºº! "
do
ΩΩ 
{
ææ 
	readBytes
øø 
=
øø 
data
øø  $
.
øø$ %
Read
øø% )
(
øø) *
buffer
øø* 0
,
øø0 1
$num
øø2 3
,
øø3 4
buffer
øø5 ;
.
øø; <
Length
øø< B
)
øøB C
;
øøC D
ms
¿¿ 
.
¿¿ 
Write
¿¿ 
(
¿¿ 
buffer
¿¿ #
,
¿¿# $
$num
¿¿% &
,
¿¿& '
	readBytes
¿¿( 1
)
¿¿1 2
;
¿¿2 3
}
¡¡ 
while
¡¡ 
(
¡¡ 
	readBytes
¡¡ "
==
¡¡# %
buffer
¡¡& ,
.
¡¡, -
Length
¡¡- 3
)
¡¡3 4
;
¡¡4 5
string
ƒƒ 

logMessage
ƒƒ !
=
ƒƒ" #
string
ƒƒ$ *
.
ƒƒ* +
Format
ƒƒ+ 1
(
ƒƒ1 2
CultureInfo
ƒƒ2 =
.
ƒƒ= >
InvariantCulture
ƒƒ> N
,
ƒƒN O
SR
≈≈2 4
.
≈≈4 5.
 Log_TransformedReferenceContents
≈≈5 U
,
≈≈U V
Encoding
∆∆2 :
.
∆∆: ;
UTF8
∆∆; ?
.
∆∆? @
	GetString
∆∆@ I
(
∆∆I J
ms
∆∆J L
.
∆∆L M
ToArray
∆∆M T
(
∆∆T U
)
∆∆U V
)
∆∆V W
)
∆∆W X
;
∆∆X Y
	WriteLine
«« 
(
«« 
	reference
«« #
,
««# $
TraceEventType
»» (
.
»»( )
Verbose
»») 0
,
»»0 1!
SignedXmlDebugEvent
…… -
.
……- .
ReferenceData
……. ;
,
……; <

logMessage
   $
)
  $ %
;
  % &
ms
ÕÕ 
.
ÕÕ 
Seek
ÕÕ 
(
ÕÕ 
$num
ÕÕ 
,
ÕÕ 

SeekOrigin
ÕÕ %
.
ÕÕ% &
Begin
ÕÕ& +
)
ÕÕ+ ,
;
ÕÕ, -
return
ŒŒ 
ms
ŒŒ 
;
ŒŒ 
}
œœ 
else
–– 
{
—— 
return
““ 
data
““ 
;
““ 
}
”” 
}
‘‘ 	
internal
‹‹ 
static
‹‹ 
void
‹‹ 

LogSigning
‹‹ '
(
‹‹' (
	SignedXml
‹‹( 1
	signedXml
‹‹2 ;
,
‹‹; <
object
››( .
key
››/ 2
,
››2 3
ISigner
ﬁﬁ( /"
signatureDescription
ﬁﬁ0 D
)
ﬁﬁD E
{
ﬂﬂ 	
Debug
‡‡ 
.
‡‡ 
Assert
‡‡ 
(
‡‡ 
	signedXml
‡‡ "
!=
‡‡# %
null
‡‡& *
,
‡‡* +
$str
‡‡, ?
)
‡‡? @
;
‡‡@ A
Debug
·· 
.
·· 
Assert
·· 
(
·· "
signatureDescription
·· -
!=
··. 0
null
··1 5
,
··5 6
$str
··7 U
)
··U V
;
··V W
if
„„ 
(
„„ '
InformationLoggingEnabled
„„ )
)
„„) *
{
‰‰ 
string
ÂÂ 

logMessage
ÂÂ !
=
ÂÂ" #
string
ÂÂ$ *
.
ÂÂ* +
Format
ÂÂ+ 1
(
ÂÂ1 2
CultureInfo
ÂÂ2 =
.
ÂÂ= >
InvariantCulture
ÂÂ> N
,
ÂÂN O
SR
ÊÊ2 4
.
ÊÊ4 5#
Log_SigningAsymmetric
ÊÊ5 J
,
ÊÊJ K

GetKeyName
ÁÁ2 <
(
ÁÁ< =
key
ÁÁ= @
)
ÁÁ@ A
,
ÁÁA B"
signatureDescription
ËË2 F
.
ËËF G
GetType
ËËG N
(
ËËN O
)
ËËO P
.
ËËP Q
Name
ËËQ U
,
ËËU V"
signatureDescription
ÈÈ2 F
.
ÈÈF G
AlgorithmName
ÈÈG T
,
ÈÈT U
$str
ÍÍ2 4
)
ÍÍ4 5
;
ÍÍ5 6
	WriteLine
ÏÏ 
(
ÏÏ 
	signedXml
ÏÏ #
,
ÏÏ# $
TraceEventType
ÌÌ (
.
ÌÌ( )
Information
ÌÌ) 4
,
ÌÌ4 5!
SignedXmlDebugEvent
ÓÓ -
.
ÓÓ- .
Signing
ÓÓ. 5
,
ÓÓ5 6

logMessage
ÔÔ $
)
ÔÔ$ %
;
ÔÔ% &
}
 
}
ÒÒ 	
internal
˘˘ 
static
˘˘ 
void
˘˘ 

LogSigning
˘˘ '
(
˘˘' (
	SignedXml
˘˘( 1
	signedXml
˘˘2 ;
,
˘˘; <
IMac
˘˘= A
key
˘˘B E
)
˘˘E F
{
˙˙ 	
Debug
˚˚ 
.
˚˚ 
Assert
˚˚ 
(
˚˚ 
	signedXml
˚˚ "
!=
˚˚# %
null
˚˚& *
,
˚˚* +
$str
˚˚, ?
)
˚˚? @
;
˚˚@ A
Debug
¸¸ 
.
¸¸ 
Assert
¸¸ 
(
¸¸ 
key
¸¸ 
!=
¸¸ 
null
¸¸  $
,
¸¸$ %
$str
¸¸& 3
)
¸¸3 4
;
¸¸4 5
if
˛˛ 
(
˛˛ '
InformationLoggingEnabled
˛˛ )
)
˛˛) *
{
ˇˇ 
string
ÄÄ 

logMessage
ÄÄ !
=
ÄÄ" #
string
ÄÄ$ *
.
ÄÄ* +
Format
ÄÄ+ 1
(
ÄÄ1 2
CultureInfo
ÄÄ2 =
.
ÄÄ= >
InvariantCulture
ÄÄ> N
,
ÄÄN O
SR
ÅÅ2 4
.
ÅÅ4 5
Log_SigningHmac
ÅÅ5 D
,
ÅÅD E
key
ÇÇ2 5
.
ÇÇ5 6
GetType
ÇÇ6 =
(
ÇÇ= >
)
ÇÇ> ?
.
ÇÇ? @
Name
ÇÇ@ D
)
ÇÇD E
;
ÇÇE F
	WriteLine
ÑÑ 
(
ÑÑ 
	signedXml
ÑÑ #
,
ÑÑ# $
TraceEventType
ÖÖ (
.
ÖÖ( )
Information
ÖÖ) 4
,
ÖÖ4 5!
SignedXmlDebugEvent
ÜÜ -
.
ÜÜ- .
Signing
ÜÜ. 5
,
ÜÜ5 6

logMessage
áá $
)
áá$ %
;
áá% &
}
àà 
}
ââ 	
internal
êê 
static
êê 
void
êê !
LogSigningReference
êê 0
(
êê0 1
	SignedXml
êê1 :
	signedXml
êê; D
,
êêD E
	Reference
êêF O
	reference
êêP Y
)
êêY Z
{
ëë 	
Debug
íí 
.
íí 
Assert
íí 
(
íí 
	signedXml
íí "
!=
íí# %
null
íí& *
,
íí* +
$str
íí, ?
)
íí? @
;
íí@ A
Debug
ìì 
.
ìì 
Assert
ìì 
(
ìì 
	reference
ìì "
!=
ìì# %
null
ìì& *
,
ìì* +
$str
ìì, ?
)
ìì? @
;
ìì@ A
if
ïï 
(
ïï #
VerboseLoggingEnabled
ïï %
)
ïï% &
{
ññ 
string
óó 

logMessage
óó !
=
óó" #
string
óó$ *
.
óó* +
Format
óó+ 1
(
óó1 2
CultureInfo
óó2 =
.
óó= >
InvariantCulture
óó> N
,
óóN O
SR
òò2 4
.
òò4 5"
Log_SigningReference
òò5 I
,
òòI J
GetObjectId
ôô2 =
(
ôô= >
	reference
ôô> G
)
ôôG H
,
ôôH I
	reference
öö2 ;
.
öö; <
Uri
öö< ?
,
öö? @
	reference
õõ2 ;
.
õõ; <
Id
õõ< >
,
õõ> ?
	reference
úú2 ;
.
úú; <
Type
úú< @
,
úú@ A
	reference
ùù2 ;
.
ùù; <
DigestMethod
ùù< H
,
ùùH I
CryptoHelpers
ûû2 ?
.
ûû? @!
CreateFromKnownName
ûû@ S
(
ûûS T
	reference
ûûT ]
.
ûû] ^
DigestMethod
ûû^ j
)
ûûj k
.
ûûk l
GetType
ûûl s
(
ûûs t
)
ûût u
.
ûûu v
Name
ûûv z
)
ûûz {
;
ûû{ |
	WriteLine
†† 
(
†† 
	signedXml
†† #
,
††# $
TraceEventType
°° (
.
°°( )
Verbose
°°) 0
,
°°0 1!
SignedXmlDebugEvent
¢¢ -
.
¢¢- .
SigningReference
¢¢. >
,
¢¢> ?

logMessage
££ $
)
££$ %
;
££% &
}
§§ 
}
•• 	
internal
¨¨ 
static
¨¨ 
void
¨¨ $
LogVerificationFailure
¨¨ 3
(
¨¨3 4
	SignedXml
¨¨4 =
	signedXml
¨¨> G
,
¨¨G H
string
¨¨I O
failureLocation
¨¨P _
)
¨¨_ `
{
≠≠ 	
if
ÆÆ 
(
ÆÆ '
InformationLoggingEnabled
ÆÆ )
)
ÆÆ) *
{
ØØ 
string
∞∞ 

logMessage
∞∞ !
=
∞∞" #
string
∞∞$ *
.
∞∞* +
Format
∞∞+ 1
(
∞∞1 2
CultureInfo
∞∞2 =
.
∞∞= >
InvariantCulture
∞∞> N
,
∞∞N O
SR
±±2 4
.
±±4 5$
Log_VerificationFailed
±±5 K
,
±±K L
failureLocation
≤≤2 A
)
≤≤A B
;
≤≤B C
	WriteLine
¥¥ 
(
¥¥ 
	signedXml
¥¥ #
,
¥¥# $
TraceEventType
µµ (
.
µµ( )
Information
µµ) 4
,
µµ4 5!
SignedXmlDebugEvent
∂∂ -
.
∂∂- .!
VerificationFailure
∂∂. A
,
∂∂A B

logMessage
∑∑ $
)
∑∑$ %
;
∑∑% &
}
∏∏ 
}
ππ 	
internal
¡¡ 
static
¡¡ 
void
¡¡ #
LogVerificationResult
¡¡ 2
(
¡¡2 3
	SignedXml
¡¡3 <
	signedXml
¡¡= F
,
¡¡F G
object
¡¡H N
key
¡¡O R
,
¡¡R S
bool
¡¡T X
verified
¡¡Y a
)
¡¡a b
{
¬¬ 	
Debug
√√ 
.
√√ 
Assert
√√ 
(
√√ 
	signedXml
√√ "
!=
√√# %
null
√√& *
,
√√* +
$str
√√, ?
)
√√? @
;
√√@ A
Debug
ƒƒ 
.
ƒƒ 
Assert
ƒƒ 
(
ƒƒ 
key
ƒƒ 
!=
ƒƒ 
null
ƒƒ  $
,
ƒƒ$ %
$str
ƒƒ& 3
)
ƒƒ3 4
;
ƒƒ4 5
if
∆∆ 
(
∆∆ '
InformationLoggingEnabled
∆∆ )
)
∆∆) *
{
«« 
string
»» 
resource
»» 
=
»»  !
verified
»»" *
?
»»+ ,
SR
»»- /
.
»»/ 0/
!Log_VerificationWithKeySuccessful
»»0 Q
:
»»R S
SR
……- /
.
……/ 02
$Log_VerificationWithKeyNotSuccessful
……0 T
;
……T U
string
   

logMessage
   !
=
  " #
string
  $ *
.
  * +
Format
  + 1
(
  1 2
CultureInfo
  2 =
.
  = >
InvariantCulture
  > N
,
  N O
resource
ÀÀ2 :
,
ÀÀ: ;

GetKeyName
ÃÃ2 <
(
ÃÃ< =
key
ÃÃ= @
)
ÃÃ@ A
)
ÃÃA B
;
ÃÃB C
	WriteLine
ŒŒ 
(
ŒŒ 
	signedXml
ŒŒ #
,
ŒŒ# $
TraceEventType
œœ (
.
œœ( )
Information
œœ) 4
,
œœ4 5!
SignedXmlDebugEvent
–– -
.
––- .)
SignatureVerificationResult
––. I
,
––I J

logMessage
—— $
)
——$ %
;
——% &
}
““ 
}
”” 	
internal
€€ 
static
€€ 
void
€€ 
LogVerifyKeyUsage
€€ .
(
€€. /
	SignedXml
€€/ 8
	signedXml
€€9 B
,
€€B C
X509Certificate
€€D S
certificate
€€T _
)€€Ñ Ö
{
‹‹ 	
Debug
›› 
.
›› 
Assert
›› 
(
›› 
	signedXml
›› "
!=
››# %
null
››& *
,
››* +
$str
››, ?
)
››? @
;
››@ A
Debug
ﬁﬁ 
.
ﬁﬁ 
Assert
ﬁﬁ 
(
ﬁﬁ 
certificate
ﬁﬁ $
!=
ﬁﬁ% '
null
ﬁﬁ( ,
,
ﬁﬁ, -
$str
ﬁﬁ. C
)
ﬁﬁC D
;
ﬁﬁD E
if
‡‡ 
(
‡‡ '
InformationLoggingEnabled
‡‡ )
)
‡‡) *
{
·· 
string
‚‚ 

logMessage
‚‚ !
=
‚‚" #
string
‚‚$ *
.
‚‚* +
Format
‚‚+ 1
(
‚‚1 2
CultureInfo
‚‚2 =
.
‚‚= >
InvariantCulture
‚‚> N
,
‚‚N O
SR
„„2 4
.
„„4 5
Log_KeyUsages
„„5 B
,
„„B C
$str
‰‰J L
,
‰‰L M
$str
ÂÂP R
,
ÂÂR S

GetKeyName
ÊÊ2 <
(
ÊÊ< =
certificate
ÊÊ= H
)
ÊÊH I
)
ÊÊI J
;
ÊÊJ K
	WriteLine
ËË 
(
ËË 
	signedXml
ËË #
,
ËË# $
TraceEventType
ÈÈ (
.
ÈÈ( )
Verbose
ÈÈ) 0
,
ÈÈ0 1!
SignedXmlDebugEvent
ÍÍ -
.
ÍÍ- .
X509Verification
ÍÍ. >
,
ÍÍ> ?

logMessage
ÎÎ $
)
ÎÎ$ %
;
ÎÎ% &
}
ÏÏ 
}
ÌÌ 	
internal
ÙÙ 
static
ÙÙ 
void
ÙÙ  
LogVerifyReference
ÙÙ /
(
ÙÙ/ 0
	SignedXml
ÙÙ0 9
	signedXml
ÙÙ: C
,
ÙÙC D
	Reference
ÙÙE N
	reference
ÙÙO X
)
ÙÙX Y
{
ıı 	
Debug
ˆˆ 
.
ˆˆ 
Assert
ˆˆ 
(
ˆˆ 
	signedXml
ˆˆ "
!=
ˆˆ# %
null
ˆˆ& *
,
ˆˆ* +
$str
ˆˆ, ?
)
ˆˆ? @
;
ˆˆ@ A
Debug
˜˜ 
.
˜˜ 
Assert
˜˜ 
(
˜˜ 
	reference
˜˜ "
!=
˜˜# %
null
˜˜& *
,
˜˜* +
$str
˜˜, ?
)
˜˜? @
;
˜˜@ A
if
˘˘ 
(
˘˘ '
InformationLoggingEnabled
˘˘ )
)
˘˘) *
{
˙˙ 
string
˚˚ 

logMessage
˚˚ !
=
˚˚" #
string
˚˚$ *
.
˚˚* +
Format
˚˚+ 1
(
˚˚1 2
CultureInfo
˚˚2 =
.
˚˚= >
InvariantCulture
˚˚> N
,
˚˚N O
SR
¸¸2 4
.
¸¸4 5!
Log_VerifyReference
¸¸5 H
,
¸¸H I
GetObjectId
˝˝2 =
(
˝˝= >
	reference
˝˝> G
)
˝˝G H
,
˝˝H I
	reference
˛˛2 ;
.
˛˛; <
Uri
˛˛< ?
,
˛˛? @
	reference
ˇˇ2 ;
.
ˇˇ; <
Id
ˇˇ< >
,
ˇˇ> ?
	reference
ÄÄ2 ;
.
ÄÄ; <
Type
ÄÄ< @
)
ÄÄ@ A
;
ÄÄA B
	WriteLine
ÇÇ 
(
ÇÇ 
	signedXml
ÇÇ #
,
ÇÇ# $
TraceEventType
ÉÉ (
.
ÉÉ( )
Verbose
ÉÉ) 0
,
ÉÉ0 1!
SignedXmlDebugEvent
ÑÑ -
.
ÑÑ- .
VerifyReference
ÑÑ. =
,
ÑÑ= >

logMessage
ÖÖ $
)
ÖÖ$ %
;
ÖÖ% &
}
ÜÜ 
}
áá 	
internal
êê 
static
êê 
void
êê $
LogVerifyReferenceHash
êê 3
(
êê3 4
	SignedXml
êê4 =
	signedXml
êê> G
,
êêG H
	Reference
ëë4 =
	reference
ëë> G
,
ëëG H
byte
íí4 8
[
íí8 9
]
íí9 :

actualHash
íí; E
,
ííE F
byte
ìì4 8
[
ìì8 9
]
ìì9 :
expectedHash
ìì; G
)
ììG H
{
îî 	
Debug
ïï 
.
ïï 
Assert
ïï 
(
ïï 
	signedXml
ïï "
!=
ïï# %
null
ïï& *
,
ïï* +
$str
ïï, ?
)
ïï? @
;
ïï@ A
Debug
ññ 
.
ññ 
Assert
ññ 
(
ññ 
	reference
ññ "
!=
ññ# %
null
ññ& *
,
ññ* +
$str
ññ, ?
)
ññ? @
;
ññ@ A
Debug
óó 
.
óó 
Assert
óó 
(
óó 

actualHash
óó #
!=
óó$ &
null
óó' +
,
óó+ ,
$str
óó- A
)
óóA B
;
óóB C
Debug
òò 
.
òò 
Assert
òò 
(
òò 
expectedHash
òò %
!=
òò& (
null
òò) -
,
òò- .
$str
òò/ E
)
òòE F
;
òòF G
if
öö 
(
öö #
VerboseLoggingEnabled
öö %
)
öö% &
{
õõ 
string
úú 

logMessage
úú !
=
úú" #
string
úú$ *
.
úú* +
Format
úú+ 1
(
úú1 2
CultureInfo
úú2 =
.
úú= >
InvariantCulture
úú> N
,
úúN O
SR
ùù2 4
.
ùù4 5
Log_ReferenceHash
ùù5 F
,
ùùF G
GetObjectId
ûû2 =
(
ûû= >
	reference
ûû> G
)
ûûG H
,
ûûH I
	reference
üü2 ;
.
üü; <
DigestMethod
üü< H
,
üüH I
CryptoHelpers
††2 ?
.
††? @!
CreateFromKnownName
††@ S
(
††S T
	reference
††T ]
.
††] ^
DigestMethod
††^ j
)
††j k
.
††k l
GetType
††l s
(
††s t
)
††t u
.
††u v
Name
††v z
,
††z {
FormatBytes
°°2 =
(
°°= >

actualHash
°°> H
)
°°H I
,
°°I J
FormatBytes
¢¢2 =
(
¢¢= >
expectedHash
¢¢> J
)
¢¢J K
)
¢¢K L
;
¢¢L M
	WriteLine
§§ 
(
§§ 
	signedXml
§§ #
,
§§# $
TraceEventType
•• (
.
••( )
Verbose
••) 0
,
••0 1!
SignedXmlDebugEvent
¶¶ -
.
¶¶- .
VerifyReference
¶¶. =
,
¶¶= >

logMessage
ßß $
)
ßß$ %
;
ßß% &
}
®® 
}
©© 	
internal
¥¥ 
static
¥¥ 
void
¥¥ !
LogVerifySignedInfo
¥¥ 0
(
¥¥0 1
	SignedXml
¥¥1 :
	signedXml
¥¥; D
,
¥¥D E$
AsymmetricKeyParameter
µµ1 G
key
µµH K
,
µµK L
ISigner
∂∂1 8"
signatureDescription
∂∂9 M
,
∂∂M N
byte
∑∑1 5
[
∑∑5 6
]
∑∑6 7
actualHashValue
∑∑8 G
,
∑∑G H
byte
∏∏1 5
[
∏∏5 6
]
∏∏6 7
signatureValue
∏∏8 F
)
∏∏F G
{
ππ 	
Debug
∫∫ 
.
∫∫ 
Assert
∫∫ 
(
∫∫ 
	signedXml
∫∫ "
!=
∫∫# %
null
∫∫& *
,
∫∫* +
$str
∫∫, ?
)
∫∫? @
;
∫∫@ A
Debug
ªª 
.
ªª 
Assert
ªª 
(
ªª "
signatureDescription
ªª -
!=
ªª. 0
null
ªª1 5
,
ªª5 6
$str
ªª7 U
)
ªªU V
;
ªªV W
if
ΩΩ 
(
ΩΩ '
InformationLoggingEnabled
ΩΩ )
)
ΩΩ) *
{
ææ 
string
øø 

logMessage
øø !
=
øø" #
string
øø$ *
.
øø* +
Format
øø+ 1
(
øø1 2
CultureInfo
øø2 =
.
øø= >
InvariantCulture
øø> N
,
øøN O
SR
¿¿2 4
.
¿¿4 5,
Log_VerifySignedInfoAsymmetric
¿¿5 S
,
¿¿S T

GetKeyName
¡¡2 <
(
¡¡< =
key
¡¡= @
)
¡¡@ A
,
¡¡A B"
signatureDescription
¬¬2 F
.
¬¬F G
GetType
¬¬G N
(
¬¬N O
)
¬¬O P
.
¬¬P Q
Name
¬¬Q U
,
¬¬U V"
signatureDescription
√√2 F
.
√√F G
AlgorithmName
√√G T
,
√√T U
$str
ƒƒ2 4
)
ƒƒ4 5
;
ƒƒ5 6
	WriteLine
≈≈ 
(
≈≈ 
	signedXml
≈≈ #
,
≈≈# $
TraceEventType
∆∆ (
.
∆∆( )
Information
∆∆) 4
,
∆∆4 5!
SignedXmlDebugEvent
«« -
.
««- .
VerifySignedInfo
««. >
,
««> ?

logMessage
»» $
)
»»$ %
;
»»% &
}
…… 
if
ÀÀ 
(
ÀÀ #
VerboseLoggingEnabled
ÀÀ %
)
ÀÀ% &
{
ÃÃ 
string
ÕÕ 
hashLog
ÕÕ 
=
ÕÕ  
string
ÕÕ! '
.
ÕÕ' (
Format
ÕÕ( .
(
ÕÕ. /
CultureInfo
ÕÕ/ :
.
ÕÕ: ;
InvariantCulture
ÕÕ; K
,
ÕÕK L
SR
ŒŒ/ 1
.
ŒŒ1 2!
Log_ActualHashValue
ŒŒ2 E
,
ŒŒE F
FormatBytes
œœ/ :
(
œœ: ;
actualHashValue
œœ; J
)
œœJ K
)
œœK L
;
œœL M
	WriteLine
–– 
(
–– 
	signedXml
–– #
,
––# $
TraceEventType
––% 3
.
––3 4
Verbose
––4 ;
,
––; <!
SignedXmlDebugEvent
––= P
.
––P Q
VerifySignedInfo
––Q a
,
––a b
hashLog
––c j
)
––j k
;
––k l
string
““ 
signatureLog
““ #
=
““$ %
string
““& ,
.
““, -
Format
““- 3
(
““3 4
CultureInfo
““4 ?
.
““? @
InvariantCulture
““@ P
,
““P Q
SR
””4 6
.
””6 7#
Log_RawSignatureValue
””7 L
,
””L M
FormatBytes
‘‘4 ?
(
‘‘? @
signatureValue
‘‘@ N
)
‘‘N O
)
‘‘O P
;
‘‘P Q
	WriteLine
’’ 
(
’’ 
	signedXml
’’ #
,
’’# $
TraceEventType
’’% 3
.
’’3 4
Verbose
’’4 ;
,
’’; <!
SignedXmlDebugEvent
’’= P
.
’’P Q
VerifySignedInfo
’’Q a
,
’’a b
signatureLog
’’c o
)
’’o p
;
’’p q
}
÷÷ 
}
◊◊ 	
internal
·· 
static
·· 
void
·· !
LogVerifySignedInfo
·· 0
(
··0 1
	SignedXml
··1 :
	signedXml
··; D
,
··D E
IMac
‚‚1 5
mac
‚‚6 9
,
‚‚9 :
byte
„„1 5
[
„„5 6
]
„„6 7
actualHashValue
„„8 G
,
„„G H
byte
‰‰1 5
[
‰‰5 6
]
‰‰6 7
signatureValue
‰‰8 F
)
‰‰F G
{
ÂÂ 	
Debug
ÊÊ 
.
ÊÊ 
Assert
ÊÊ 
(
ÊÊ 
	signedXml
ÊÊ "
!=
ÊÊ# %
null
ÊÊ& *
,
ÊÊ* +
$str
ÊÊ, ?
)
ÊÊ? @
;
ÊÊ@ A
Debug
ÁÁ 
.
ÁÁ 
Assert
ÁÁ 
(
ÁÁ 
mac
ÁÁ 
!=
ÁÁ 
null
ÁÁ  $
,
ÁÁ$ %
$str
ÁÁ& 3
)
ÁÁ3 4
;
ÁÁ4 5
if
ÈÈ 
(
ÈÈ '
InformationLoggingEnabled
ÈÈ )
)
ÈÈ) *
{
ÍÍ 
string
ÎÎ 

logMessage
ÎÎ !
=
ÎÎ" #
string
ÎÎ$ *
.
ÎÎ* +
Format
ÎÎ+ 1
(
ÎÎ1 2
CultureInfo
ÎÎ2 =
.
ÎÎ= >
InvariantCulture
ÎÎ> N
,
ÎÎN O
SR
ÏÏ2 4
.
ÏÏ4 5&
Log_VerifySignedInfoHmac
ÏÏ5 M
,
ÏÏM N
mac
ÌÌ2 5
.
ÌÌ5 6
GetType
ÌÌ6 =
(
ÌÌ= >
)
ÌÌ> ?
.
ÌÌ? @
Name
ÌÌ@ D
)
ÌÌD E
;
ÌÌE F
	WriteLine
ÓÓ 
(
ÓÓ 
	signedXml
ÓÓ #
,
ÓÓ# $
TraceEventType
ÔÔ (
.
ÔÔ( )
Information
ÔÔ) 4
,
ÔÔ4 5!
SignedXmlDebugEvent
 -
.
- .
VerifySignedInfo
. >
,
> ?

logMessage
ÒÒ $
)
ÒÒ$ %
;
ÒÒ% &
}
ÚÚ 
if
ÙÙ 
(
ÙÙ #
VerboseLoggingEnabled
ÙÙ %
)
ÙÙ% &
{
ıı 
string
ˆˆ 
hashLog
ˆˆ 
=
ˆˆ  
string
ˆˆ! '
.
ˆˆ' (
Format
ˆˆ( .
(
ˆˆ. /
CultureInfo
ˆˆ/ :
.
ˆˆ: ;
InvariantCulture
ˆˆ; K
,
ˆˆK L
SR
˜˜/ 1
.
˜˜1 2!
Log_ActualHashValue
˜˜2 E
,
˜˜E F
FormatBytes
¯¯/ :
(
¯¯: ;
actualHashValue
¯¯; J
)
¯¯J K
)
¯¯K L
;
¯¯L M
	WriteLine
˘˘ 
(
˘˘ 
	signedXml
˘˘ #
,
˘˘# $
TraceEventType
˘˘% 3
.
˘˘3 4
Verbose
˘˘4 ;
,
˘˘; <!
SignedXmlDebugEvent
˘˘= P
.
˘˘P Q
VerifySignedInfo
˘˘Q a
,
˘˘a b
hashLog
˘˘c j
)
˘˘j k
;
˘˘k l
string
˚˚ 
signatureLog
˚˚ #
=
˚˚$ %
string
˚˚& ,
.
˚˚, -
Format
˚˚- 3
(
˚˚3 4
CultureInfo
˚˚4 ?
.
˚˚? @
InvariantCulture
˚˚@ P
,
˚˚P Q
SR
¸¸4 6
.
¸¸6 7#
Log_RawSignatureValue
¸¸7 L
,
¸¸L M
FormatBytes
˝˝4 ?
(
˝˝? @
signatureValue
˝˝@ N
)
˝˝N O
)
˝˝O P
;
˝˝P Q
	WriteLine
˛˛ 
(
˛˛ 
	signedXml
˛˛ #
,
˛˛# $
TraceEventType
˛˛% 3
.
˛˛3 4
Verbose
˛˛4 ;
,
˛˛; <!
SignedXmlDebugEvent
˛˛= P
.
˛˛P Q
VerifySignedInfo
˛˛Q a
,
˛˛a b
signatureLog
˛˛c o
)
˛˛o p
;
˛˛p q
}
ˇˇ 
}
ÄÄ 	
internal
‚‚ 
static
‚‚ 
void
‚‚ (
LogSignedXmlRecursionLimit
‚‚ 7
(
‚‚7 8
	SignedXml
‚‚8 A
	signedXml
‚‚B K
,
‚‚K L
	Reference
„„8 A
	reference
„„B K
)
„„K L
{
‰‰ 	
Debug
ÂÂ 
.
ÂÂ 
Assert
ÂÂ 
(
ÂÂ 
	signedXml
ÂÂ "
!=
ÂÂ# %
null
ÂÂ& *
,
ÂÂ* +
$str
ÂÂ, ?
)
ÂÂ? @
;
ÂÂ@ A
Debug
ÊÊ 
.
ÊÊ 
Assert
ÊÊ 
(
ÊÊ 
	reference
ÊÊ "
!=
ÊÊ# %
null
ÊÊ& *
,
ÊÊ* +
$str
ÊÊ, ?
)
ÊÊ? @
;
ÊÊ@ A
if
ËË 
(
ËË '
InformationLoggingEnabled
ËË )
)
ËË) *
{
ÈÈ 
string
ÍÍ 

logMessage
ÍÍ !
=
ÍÍ" #
string
ÍÍ$ *
.
ÍÍ* +
Format
ÍÍ+ 1
(
ÍÍ1 2
CultureInfo
ÍÍ2 =
.
ÍÍ= >
InvariantCulture
ÍÍ> N
,
ÍÍN O
SR
ÎÎ4 6
.
ÎÎ6 7)
Log_SignedXmlRecursionLimit
ÎÎ7 R
,
ÎÎR S
GetObjectId
ÏÏ4 ?
(
ÏÏ? @
	reference
ÏÏ@ I
)
ÏÏI J
,
ÏÏJ K
	reference
ÌÌ4 =
.
ÌÌ= >
DigestMethod
ÌÌ> J
,
ÌÌJ K
CryptoHelpers
ÓÓ4 A
.
ÓÓA B!
CreateFromKnownName
ÓÓB U
(
ÓÓU V
	reference
ÓÓV _
.
ÓÓ_ `
DigestMethod
ÓÓ` l
)
ÓÓl m
.
ÓÓm n
GetType
ÓÓn u
(
ÓÓu v
)
ÓÓv w
.
ÓÓw x
Name
ÓÓx |
)
ÓÓ| }
;
ÓÓ} ~
	WriteLine
 
(
 
	signedXml
 #
,
# $
TraceEventType
ÒÒ *
.
ÒÒ* +
Information
ÒÒ+ 6
,
ÒÒ6 7!
SignedXmlDebugEvent
ÚÚ /
.
ÚÚ/ 0
VerifySignedInfo
ÚÚ0 @
,
ÚÚ@ A

logMessage
ÛÛ &
)
ÛÛ& '
;
ÛÛ' (
}
ÙÙ 
}
ıı 	
private
˛˛ 
static
˛˛ 
void
˛˛ 
	WriteLine
˛˛ %
(
˛˛% &
object
˛˛& ,
source
˛˛- 3
,
˛˛3 4
TraceEventType
˛˛5 C
	eventType
˛˛D M
,
˛˛M N!
SignedXmlDebugEvent
˛˛O b
eventId
˛˛c j
,
˛˛j k
string
˛˛l r
data
˛˛s w
)
˛˛w x
{
ˇˇ 	
Debug
ÄÄ 
.
ÄÄ 
Assert
ÄÄ 
(
ÄÄ 
source
ÄÄ 
!=
ÄÄ  "
null
ÄÄ# '
,
ÄÄ' (
$str
ÄÄ) 9
)
ÄÄ9 :
;
ÄÄ: ;
Debug
ÅÅ 
.
ÅÅ 
Assert
ÅÅ 
(
ÅÅ 
!
ÅÅ 
string
ÅÅ  
.
ÅÅ  !
IsNullOrEmpty
ÅÅ! .
(
ÅÅ. /
data
ÅÅ/ 3
)
ÅÅ3 4
,
ÅÅ4 5
$str
ÅÅ6 S
)
ÅÅS T
;
ÅÅT U
Debug
ÇÇ 
.
ÇÇ 
Assert
ÇÇ 
(
ÇÇ '
InformationLoggingEnabled
ÇÇ 2
,
ÇÇ2 3
$str
ÇÇ4 O
)
ÇÇO P
;
ÇÇP Q
s_traceSource
ÑÑ 
.
ÑÑ 

TraceEvent
ÑÑ $
(
ÑÑ$ %
	eventType
ÑÑ% .
,
ÑÑ. /
(
ÖÖ$ %
int
ÖÖ% (
)
ÖÖ( )
eventId
ÖÖ) 0
,
ÖÖ0 1
$str
ÜÜ$ 4
,
ÜÜ4 5
GetObjectId
áá$ /
(
áá/ 0
source
áá0 6
)
áá6 7
,
áá7 8
eventId
àà$ +
,
àà+ ,
data
ââ$ (
)
ââ( )
;
ââ) *
}
ää 	
}
ãã 
}åå ˘È
;C:\code\bc-xml-security\refactoring\src\SymmetricKeyWrap.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
static 
class 
SymmetricKeyWrap *
{ 
private 
readonly 
static 
byte  $
[$ %
]% & 
s_rgbTripleDES_KW_IV' ;
=< =
{> ?
$num@ D
,D E
$numF J
,J K
$numL P
,P Q
$numR V
,V W
$numX \
,\ ]
$num^ b
,b c
$numd h
,h i
$numj n
}o p
;p q
private 
readonly 
static 
byte  $
[$ %
]% &
s_rgbAES_KW_IV' 5
=6 7
{8 9
$num: >
,> ?
$num@ D
,D E
$numF J
,J K
$numL P
,P Q
$numR V
,V W
$numX \
,\ ]
$num^ b
,b c
$numd h
}i j
;j k
[ 	
SuppressMessage	 
( 
$str 1
,1 2
$str3 ;
,; <
Justification= J
=K L
$strM {
){ |
]| }
internal 
static 
byte 
[ 
] #
TripleDESKeyWrapEncrypt 6
(6 7
byte7 ;
[; <
]< =
rgbKey> D
,D E
byteF J
[J K
]K L
rgbWrappedKeyDataM ^
)^ _
{ 	
byte 
[ 
] 
rgbCKS 
; 
var 
sha 
= 
DigestUtilities %
.% &
	GetDigest& /
(/ 0
$str0 7
)7 8
;8 9
rgbCKS 
= 
new 
byte 
[ 
sha !
.! "
GetDigestSize" /
(/ 0
)0 1
]1 2
;2 3
sha   
.   
BlockUpdate   
(   
rgbWrappedKeyData   -
,  - .
$num  / 0
,  0 1
rgbWrappedKeyData  2 C
.  C D
Length  D J
)  J K
;  K L
sha!! 
.!! 
DoFinal!! 
(!! 
rgbCKS!! 
,!! 
$num!!  !
)!!! "
;!!" #
byte$$ 
[$$ 
]$$ 
rgbIV$$ 
=$$ 
new$$ 
byte$$ #
[$$# $
$num$$$ %
]$$% &
;$$& '
SecureRandom%% 
rng%% 
=%% 
new%% "
SecureRandom%%# /
(%%/ 0
)%%0 1
;%%1 2
rng&& 
.&& 
	NextBytes&& 
(&& 
rgbIV&& 
)&&  
;&&  !
byte)) 
[)) 
])) 
rgbWKCKS)) 
=)) 
new)) !
byte))" &
[))& '
rgbWrappedKeyData))' 8
.))8 9
Length))9 ?
+))@ A
$num))B C
]))C D
;))D E
IBufferedCipher** 
enc1**  
=**! "
null**# '
;**' (
IBufferedCipher++ 
enc2++  
=++! "
null++# '
;++' (
try-- 
{.. 
enc100 
=00 
CipherUtilities00 &
.00& '
	GetCipher00' 0
(000 1
$str001 G
)00G H
;00H I
enc211 
=11 
CipherUtilities11 &
.11& '
	GetCipher11' 0
(110 1
$str111 G
)11G H
;11H I
enc122 
.22 
Init22 
(22 
true22 
,22 
new22  #
ParametersWithIV22$ 4
(224 5
new225 8
DesEdeParameters229 I
(22I J
rgbKey22J P
)22P Q
,22Q R
rgbIV22S X
)22X Y
)22Y Z
;22Z [
enc233 
.33 
Init33 
(33 
true33 
,33 
new33  #
ParametersWithIV33$ 4
(334 5
new335 8
DesEdeParameters339 I
(33I J
rgbKey33J P
)33P Q
,33Q R 
s_rgbTripleDES_KW_IV33S g
)33g h
)33h i
;33i j
Buffer55 
.55 
	BlockCopy55  
(55  !
rgbWrappedKeyData55! 2
,552 3
$num554 5
,555 6
rgbWKCKS557 ?
,55? @
$num55A B
,55B C
rgbWrappedKeyData55D U
.55U V
Length55V \
)55\ ]
;55] ^
Buffer66 
.66 
	BlockCopy66  
(66  !
rgbCKS66! '
,66' (
$num66) *
,66* +
rgbWKCKS66, 4
,664 5
rgbWrappedKeyData666 G
.66G H
Length66H N
,66N O
$num66P Q
)66Q R
;66R S
byte77 
[77 
]77 
temp177 
=77 
enc177 #
.77# $
DoFinal77$ +
(77+ ,
rgbWKCKS77, 4
)774 5
;775 6
byte88 
[88 
]88 
temp288 
=88 
new88 "
byte88# '
[88' (
rgbIV88( -
.88- .
Length88. 4
+885 6
temp1887 <
.88< =
Length88= C
]88C D
;88D E
Buffer99 
.99 
	BlockCopy99  
(99  !
rgbIV99! &
,99& '
$num99( )
,99) *
temp299+ 0
,990 1
$num992 3
,993 4
rgbIV995 :
.99: ;
Length99; A
)99A B
;99B C
Buffer:: 
.:: 
	BlockCopy::  
(::  !
temp1::! &
,::& '
$num::( )
,::) *
temp2::+ 0
,::0 1
rgbIV::2 7
.::7 8
Length::8 >
,::> ?
temp1::@ E
.::E F
Length::F L
)::L M
;::M N
Array<< 
.<< 
Reverse<< 
(<< 
temp2<< #
)<<# $
;<<$ %
return>> 
enc2>> 
.>> 
DoFinal>> #
(>># $
temp2>>$ )
)>>) *
;>>* +
}?? 
finally@@ 
{AA 
}CC 
}DD 	
[FF 	
SuppressMessageFF	 
(FF 
$strFF 1
,FF1 2
$strFF3 ;
,FF; <
JustificationFF= J
=FFK L
$strFFM {
)FF{ |
]FF| }
internalGG 
staticGG 
byteGG 
[GG 
]GG #
TripleDESKeyWrapDecryptGG 6
(GG6 7
byteGG7 ;
[GG; <
]GG< =
rgbKeyGG> D
,GGD E
byteGGF J
[GGJ K
]GGK L&
rgbEncryptedWrappedKeyDataGGM g
)GGg h
{HH 	
ifJJ 
(JJ &
rgbEncryptedWrappedKeyDataJJ *
.JJ* +
LengthJJ+ 1
!=JJ2 4
$numJJ5 7
&&JJ8 :&
rgbEncryptedWrappedKeyDataJJ; U
.JJU V
LengthJJV \
!=JJ] _
$numJJ` b
&&KK &
rgbEncryptedWrappedKeyDataKK -
.KK- .
LengthKK. 4
!=KK5 7
$numKK8 :
)KK: ;
throwLL 
newLL 
SystemLL  
.LL  !
SecurityLL! )
.LL) *
CryptographyLL* 6
.LL6 7"
CryptographicExceptionLL7 M
(LLM N
SRLLN P
.LLP Q*
Cryptography_Xml_KW_BadKeySizeLLQ o
)LLo p
;LLp q
IBufferedCipherNN 
dec1NN  
=NN! "
nullNN# '
;NN' (
IBufferedCipherOO 
dec2OO  
=OO! "
nullOO# '
;OO' (
tryQQ 
{RR 
dec1TT 
=TT 
CipherUtilitiesTT &
.TT& '
	GetCipherTT' 0
(TT0 1
$strTT1 G
)TTG H
;TTH I
dec2UU 
=UU 
CipherUtilitiesUU &
.UU& '
	GetCipherUU' 0
(UU0 1
$strUU1 G
)UUG H
;UUH I
dec1WW 
.WW 
InitWW 
(WW 
falseWW 
,WW  
newWW! $
ParametersWithIVWW% 5
(WW5 6
newWW6 9
DesEdeParametersWW: J
(WWJ K
rgbKeyWWK Q
)WWQ R
,WWR S 
s_rgbTripleDES_KW_IVWWT h
)WWh i
)WWi j
;WWj k
byteYY 
[YY 
]YY 
temp2YY 
=YY 
dec1YY #
.YY# $
DoFinalYY$ +
(YY+ ,&
rgbEncryptedWrappedKeyDataYY, F
)YYF G
;YYG H
ArrayZZ 
.ZZ 
ReverseZZ 
(ZZ 
temp2ZZ #
)ZZ# $
;ZZ$ %
byte\\ 
[\\ 
]\\ 
rgbIV\\ 
=\\ 
new\\ "
byte\\# '
[\\' (
$num\\( )
]\\) *
;\\* +
Buffer]] 
.]] 
	BlockCopy]]  
(]]  !
temp2]]! &
,]]& '
$num]]( )
,]]) *
rgbIV]]+ 0
,]]0 1
$num]]2 3
,]]3 4
$num]]5 6
)]]6 7
;]]7 8
byte^^ 
[^^ 
]^^ 
temp1^^ 
=^^ 
new^^ "
byte^^# '
[^^' (
temp2^^( -
.^^- .
Length^^. 4
-^^5 6
rgbIV^^7 <
.^^< =
Length^^= C
]^^C D
;^^D E
Buffer__ 
.__ 
	BlockCopy__  
(__  !
temp2__! &
,__& '
$num__( )
,__) *
temp1__+ 0
,__0 1
$num__2 3
,__3 4
temp1__5 :
.__: ;
Length__; A
)__A B
;__B C
dec2aa 
.aa 
Initaa 
(aa 
falseaa 
,aa  
newaa! $
ParametersWithIVaa% 5
(aa5 6
newaa6 9
DesEdeParametersaa: J
(aaJ K
rgbKeyaaK Q
)aaQ R
,aaR S
rgbIVaaT Y
)aaY Z
)aaZ [
;aa[ \
bytebb 
[bb 
]bb 
rgbWKCKSbb 
=bb  !
dec2bb" &
.bb& '
DoFinalbb' .
(bb. /
temp1bb/ 4
)bb4 5
;bb5 6
byteee 
[ee 
]ee 
rgbWrappedKeyDataee (
=ee) *
newee+ .
byteee/ 3
[ee3 4
rgbWKCKSee4 <
.ee< =
Lengthee= C
-eeD E
$numeeF G
]eeG H
;eeH I
Bufferff 
.ff 
	BlockCopyff  
(ff  !
rgbWKCKSff! )
,ff) *
$numff+ ,
,ff, -
rgbWrappedKeyDataff. ?
,ff? @
$numffA B
,ffB C
rgbWrappedKeyDataffD U
.ffU V
LengthffV \
)ff\ ]
;ff] ^
vargg 
shagg 
=gg 
DigestUtilitiesgg )
.gg) *
	GetDigestgg* 3
(gg3 4
$strgg4 ;
)gg; <
;gg< =
bytehh 
[hh 
]hh 
rgbCKShh 
=hh 
newhh  #
bytehh$ (
[hh( )
shahh) ,
.hh, -
GetDigestSizehh- :
(hh: ;
)hh; <
]hh< =
;hh= >
shaii 
.ii 
BlockUpdateii 
(ii  
rgbWrappedKeyDataii  1
,ii1 2
$numii3 4
,ii4 5
rgbWrappedKeyDataii6 G
.iiG H
LengthiiH N
)iiN O
;iiO P
shajj 
.jj 
DoFinaljj 
(jj 
rgbCKSjj "
,jj" #
$numjj$ %
)jj% &
;jj& '
forkk 
(kk 
intkk 
indexkk 
=kk  
rgbWrappedKeyDatakk! 2
.kk2 3
Lengthkk3 9
,kk9 :
index1kk; A
=kkB C
$numkkD E
;kkE F
indexkkG L
<kkM N
rgbWKCKSkkO W
.kkW X
LengthkkX ^
;kk^ _
indexkk` e
++kke g
,kkg h
index1kki o
++kko q
)kkq r
ifll 
(ll 
rgbWKCKSll  
[ll  !
indexll! &
]ll& '
!=ll( *
rgbCKSll+ 1
[ll1 2
index1ll2 8
]ll8 9
)ll9 :
throwmm 
newmm !
Systemmm" (
.mm( )
Securitymm) 1
.mm1 2
Cryptographymm2 >
.mm> ?"
CryptographicExceptionmm? U
(mmU V
SRmmV X
.mmX Y.
"Cryptography_Xml_BadWrappedKeySizemmY {
)mm{ |
;mm| }
returnnn 
rgbWrappedKeyDatann (
;nn( )
}oo 
finallypp 
{qq 
}ss 
}tt 	
internalww 
staticww 
byteww 
[ww 
]ww 
AESKeyWrapEncryptww 0
(ww0 1
byteww1 5
[ww5 6
]ww6 7
rgbKeyww8 >
,ww> ?
byteww@ D
[wwD E
]wwE F
rgbWrappedKeyDatawwG X
)wwX Y
{xx 	
intyy 
Nyy 
=yy 
rgbWrappedKeyDatayy %
.yy% &
Lengthyy& ,
>>yy- /
$numyy0 1
;yy1 2
if{{ 
({{ 
({{ 
rgbWrappedKeyData{{ "
.{{" #
Length{{# )
%{{* +
$num{{, -
!={{. 0
$num{{1 2
){{2 3
||{{4 6
N{{7 8
<={{9 ;
$num{{< =
){{= >
throw|| 
new|| 
System||  
.||  !
Security||! )
.||) *
Cryptography||* 6
.||6 7"
CryptographicException||7 M
(||M N
SR||N P
.||P Q*
Cryptography_Xml_KW_BadKeySize||Q o
)||o p
;||p q
IBufferedCipher~~ 
enc~~ 
=~~  !
null~~" &
;~~& '
try
ÄÄ 
{
ÅÅ 
enc
ÉÉ 
=
ÉÉ 
CipherUtilities
ÉÉ %
.
ÉÉ% &
	GetCipher
ÉÉ& /
(
ÉÉ/ 0
$str
ÉÉ0 C
)
ÉÉC D
;
ÉÉD E
enc
ÑÑ 
.
ÑÑ 
Init
ÑÑ 
(
ÑÑ 
true
ÑÑ 
,
ÑÑ 
new
ÑÑ "
KeyParameter
ÑÑ# /
(
ÑÑ/ 0
rgbKey
ÑÑ0 6
)
ÑÑ6 7
)
ÑÑ7 8
;
ÑÑ8 9
if
ÜÜ 
(
ÜÜ 
N
ÜÜ 
==
ÜÜ 
$num
ÜÜ 
)
ÜÜ 
{
áá 
byte
ââ 
[
ââ 
]
ââ 
temp
ââ 
=
ââ  !
new
ââ" %
byte
ââ& *
[
ââ* +
s_rgbAES_KW_IV
ââ+ 9
.
ââ9 :
Length
ââ: @
+
ââA B
rgbWrappedKeyData
ââC T
.
ââT U
Length
ââU [
]
ââ[ \
;
ââ\ ]
Buffer
ää 
.
ää 
	BlockCopy
ää $
(
ää$ %
s_rgbAES_KW_IV
ää% 3
,
ää3 4
$num
ää5 6
,
ää6 7
temp
ää8 <
,
ää< =
$num
ää> ?
,
ää? @
s_rgbAES_KW_IV
ääA O
.
ääO P
Length
ääP V
)
ääV W
;
ääW X
Buffer
ãã 
.
ãã 
	BlockCopy
ãã $
(
ãã$ %
rgbWrappedKeyData
ãã% 6
,
ãã6 7
$num
ãã8 9
,
ãã9 :
temp
ãã; ?
,
ãã? @
s_rgbAES_KW_IV
ããA O
.
ããO P
Length
ããP V
,
ããV W
rgbWrappedKeyData
ããX i
.
ããi j
Length
ããj p
)
ããp q
;
ããq r
return
åå 
enc
åå 
.
åå 
DoFinal
åå &
(
åå& '
temp
åå' +
)
åå+ ,
;
åå, -
}
çç 
long
èè 
t
èè 
=
èè 
$num
èè 
;
èè 
byte
êê 
[
êê 
]
êê 
	rgbOutput
êê  
=
êê! "
new
êê# &
byte
êê' +
[
êê+ ,
(
êê, -
N
êê- .
+
êê/ 0
$num
êê1 2
)
êê2 3
<<
êê4 6
$num
êê7 8
]
êê8 9
;
êê9 :
Buffer
íí 
.
íí 
	BlockCopy
íí  
(
íí  !
rgbWrappedKeyData
íí! 2
,
íí2 3
$num
íí4 5
,
íí5 6
	rgbOutput
íí7 @
,
íí@ A
$num
ííB C
,
ííC D
rgbWrappedKeyData
ííE V
.
ííV W
Length
ííW ]
)
íí] ^
;
íí^ _
byte
ìì 
[
ìì 
]
ìì 
rgbA
ìì 
=
ìì 
new
ìì !
byte
ìì" &
[
ìì& '
$num
ìì' (
]
ìì( )
;
ìì) *
byte
îî 
[
îî 
]
îî 
rgbBlock
îî 
=
îî  !
new
îî" %
byte
îî& *
[
îî* +
$num
îî+ -
]
îî- .
;
îî. /
Buffer
ïï 
.
ïï 
	BlockCopy
ïï  
(
ïï  !
s_rgbAES_KW_IV
ïï! /
,
ïï/ 0
$num
ïï1 2
,
ïï2 3
rgbA
ïï4 8
,
ïï8 9
$num
ïï: ;
,
ïï; <
$num
ïï= >
)
ïï> ?
;
ïï? @
for
ññ 
(
ññ 
int
ññ 
j
ññ 
=
ññ 
$num
ññ 
;
ññ 
j
ññ  !
<=
ññ" $
$num
ññ% &
;
ññ& '
j
ññ( )
++
ññ) +
)
ññ+ ,
{
óó 
for
òò 
(
òò 
int
òò 
i
òò 
=
òò  
$num
òò! "
;
òò" #
i
òò$ %
<=
òò& (
N
òò) *
;
òò* +
i
òò, -
++
òò- /
)
òò/ 0
{
ôô 
t
öö 
=
öö 
i
öö 
+
öö 
j
öö  !
*
öö" #
N
öö$ %
;
öö% &
Buffer
õõ 
.
õõ 
	BlockCopy
õõ (
(
õõ( )
rgbA
õõ) -
,
õõ- .
$num
õõ/ 0
,
õõ0 1
rgbBlock
õõ2 :
,
õõ: ;
$num
õõ< =
,
õõ= >
$num
õõ? @
)
õõ@ A
;
õõA B
Buffer
úú 
.
úú 
	BlockCopy
úú (
(
úú( )
	rgbOutput
úú) 2
,
úú2 3
$num
úú4 5
*
úú6 7
i
úú8 9
,
úú9 :
rgbBlock
úú; C
,
úúC D
$num
úúE F
,
úúF G
$num
úúH I
)
úúI J
;
úúJ K
byte
ùù 
[
ùù 
]
ùù 
rgbB
ùù #
=
ùù$ %
enc
ùù& )
.
ùù) *
DoFinal
ùù* 1
(
ùù1 2
rgbBlock
ùù2 :
)
ùù: ;
;
ùù; <
for
ûû 
(
ûû 
int
ûû  
k
ûû! "
=
ûû# $
$num
ûû% &
;
ûû& '
k
ûû( )
<
ûû* +
$num
ûû, -
;
ûû- .
k
ûû/ 0
++
ûû0 2
)
ûû2 3
{
üü 
byte
††  
tmp
††! $
=
††% &
(
††' (
byte
††( ,
)
††, -
(
††- .
(
††. /
t
††/ 0
>>
††1 3
(
††4 5
$num
††5 6
*
††7 8
(
††9 :
$num
††: ;
-
††< =
k
††> ?
)
††? @
)
††@ A
)
††A B
&
††C D
$num
††E I
)
††I J
;
††J K
rgbA
°°  
[
°°  !
k
°°! "
]
°°" #
=
°°$ %
(
°°& '
byte
°°' +
)
°°+ ,
(
°°, -
tmp
°°- 0
^
°°1 2
rgbB
°°3 7
[
°°7 8
k
°°8 9
]
°°9 :
)
°°: ;
;
°°; <
}
¢¢ 
Buffer
££ 
.
££ 
	BlockCopy
££ (
(
££( )
rgbB
££) -
,
££- .
$num
££/ 0
,
££0 1
	rgbOutput
££2 ;
,
££; <
$num
££= >
*
££? @
i
££A B
,
££B C
$num
££D E
)
££E F
;
££F G
}
§§ 
}
•• 
Buffer
ßß 
.
ßß 
	BlockCopy
ßß  
(
ßß  !
rgbA
ßß! %
,
ßß% &
$num
ßß' (
,
ßß( )
	rgbOutput
ßß* 3
,
ßß3 4
$num
ßß5 6
,
ßß6 7
$num
ßß8 9
)
ßß9 :
;
ßß: ;
return
®® 
	rgbOutput
®®  
;
®®  !
}
©© 
finally
™™ 
{
´´ 
}
≠≠ 
}
ÆÆ 	
internal
∞∞ 
static
∞∞ 
byte
∞∞ 
[
∞∞ 
]
∞∞ 
AESKeyWrapDecrypt
∞∞ 0
(
∞∞0 1
byte
∞∞1 5
[
∞∞5 6
]
∞∞6 7
rgbKey
∞∞8 >
,
∞∞> ?
byte
∞∞@ D
[
∞∞D E
]
∞∞E F(
rgbEncryptedWrappedKeyData
∞∞G a
)
∞∞a b
{
±± 	
int
≤≤ 
N
≤≤ 
=
≤≤ 
(
≤≤ (
rgbEncryptedWrappedKeyData
≤≤ /
.
≤≤/ 0
Length
≤≤0 6
>>
≤≤7 9
$num
≤≤: ;
)
≤≤; <
-
≤≤= >
$num
≤≤? @
;
≤≤@ A
if
¥¥ 
(
¥¥ 
(
¥¥ (
rgbEncryptedWrappedKeyData
¥¥ +
.
¥¥+ ,
Length
¥¥, 2
%
¥¥3 4
$num
¥¥5 6
!=
¥¥7 9
$num
¥¥: ;
)
¥¥; <
||
¥¥= ?
N
¥¥@ A
<=
¥¥B D
$num
¥¥E F
)
¥¥F G
throw
µµ 
new
µµ 
System
µµ  
.
µµ  !
Security
µµ! )
.
µµ) *
Cryptography
µµ* 6
.
µµ6 7$
CryptographicException
µµ7 M
(
µµM N
SR
µµN P
.
µµP Q,
Cryptography_Xml_KW_BadKeySize
µµQ o
)
µµo p
;
µµp q
byte
∑∑ 
[
∑∑ 
]
∑∑ 
	rgbOutput
∑∑ 
=
∑∑ 
new
∑∑ "
byte
∑∑# '
[
∑∑' (
N
∑∑( )
<<
∑∑* ,
$num
∑∑- .
]
∑∑. /
;
∑∑/ 0
IBufferedCipher
∏∏ 
dec
∏∏ 
=
∏∏  !
null
∏∏" &
;
∏∏& '
try
∫∫ 
{
ªª 
dec
ΩΩ 
=
ΩΩ 
CipherUtilities
ΩΩ %
.
ΩΩ% &
	GetCipher
ΩΩ& /
(
ΩΩ/ 0
$str
ΩΩ0 C
)
ΩΩC D
;
ΩΩD E
dec
ææ 
.
ææ 
Init
ææ 
(
ææ 
false
ææ 
,
ææ 
new
ææ  #
KeyParameter
ææ$ 0
(
ææ0 1
rgbKey
ææ1 7
)
ææ7 8
)
ææ8 9
;
ææ9 :
if
¡¡ 
(
¡¡ 
N
¡¡ 
==
¡¡ 
$num
¡¡ 
)
¡¡ 
{
¬¬ 
byte
√√ 
[
√√ 
]
√√ 
temp
√√ 
=
√√  !
dec
√√" %
.
√√% &
DoFinal
√√& -
(
√√- .(
rgbEncryptedWrappedKeyData
√√. H
)
√√H I
;
√√I J
for
≈≈ 
(
≈≈ 
int
≈≈ 
index
≈≈ "
=
≈≈# $
$num
≈≈% &
;
≈≈& '
index
≈≈( -
<
≈≈. /
$num
≈≈0 1
;
≈≈1 2
index
≈≈3 8
++
≈≈8 :
)
≈≈: ;
if
∆∆ 
(
∆∆ 
temp
∆∆  
[
∆∆  !
index
∆∆! &
]
∆∆& '
!=
∆∆( *
s_rgbAES_KW_IV
∆∆+ 9
[
∆∆9 :
index
∆∆: ?
]
∆∆? @
)
∆∆@ A
throw
«« !
new
««" %
System
««& ,
.
««, -
Security
««- 5
.
««5 6
Cryptography
««6 B
.
««B C$
CryptographicException
««C Y
(
««Y Z
SR
««Z \
.
««\ ]0
"Cryptography_Xml_BadWrappedKeySize
««] 
)«« Ä
;««Ä Å
Buffer
…… 
.
…… 
	BlockCopy
…… $
(
……$ %
temp
……% )
,
……) *
$num
……+ ,
,
……, -
	rgbOutput
……. 7
,
……7 8
$num
……9 :
,
……: ;
$num
……< =
)
……= >
;
……> ?
return
   
	rgbOutput
   $
;
  $ %
}
ÀÀ 
long
ÕÕ 
t
ÕÕ 
=
ÕÕ 
$num
ÕÕ 
;
ÕÕ 
Buffer
œœ 
.
œœ 
	BlockCopy
œœ  
(
œœ  !(
rgbEncryptedWrappedKeyData
œœ! ;
,
œœ; <
$num
œœ= >
,
œœ> ?
	rgbOutput
œœ@ I
,
œœI J
$num
œœK L
,
œœL M
	rgbOutput
œœN W
.
œœW X
Length
œœX ^
)
œœ^ _
;
œœ_ `
byte
–– 
[
–– 
]
–– 
rgbA
–– 
=
–– 
new
–– !
byte
––" &
[
––& '
$num
––' (
]
––( )
;
––) *
byte
—— 
[
—— 
]
—— 
rgbBlock
—— 
=
——  !
new
——" %
byte
——& *
[
——* +
$num
——+ -
]
——- .
;
——. /
Buffer
““ 
.
““ 
	BlockCopy
““  
(
““  !(
rgbEncryptedWrappedKeyData
““! ;
,
““; <
$num
““= >
,
““> ?
rgbA
““@ D
,
““D E
$num
““F G
,
““G H
$num
““I J
)
““J K
;
““K L
for
”” 
(
”” 
int
”” 
j
”” 
=
”” 
$num
”” 
;
”” 
j
””  !
>=
””" $
$num
””% &
;
””& '
j
””( )
--
””) +
)
””+ ,
{
‘‘ 
for
’’ 
(
’’ 
int
’’ 
i
’’ 
=
’’  
N
’’! "
;
’’" #
i
’’$ %
>=
’’& (
$num
’’) *
;
’’* +
i
’’, -
--
’’- /
)
’’/ 0
{
÷÷ 
t
◊◊ 
=
◊◊ 
i
◊◊ 
+
◊◊ 
j
◊◊  !
*
◊◊" #
N
◊◊$ %
;
◊◊% &
for
ÿÿ 
(
ÿÿ 
int
ÿÿ  
k
ÿÿ! "
=
ÿÿ# $
$num
ÿÿ% &
;
ÿÿ& '
k
ÿÿ( )
<
ÿÿ* +
$num
ÿÿ, -
;
ÿÿ- .
k
ÿÿ/ 0
++
ÿÿ0 2
)
ÿÿ2 3
{
ŸŸ 
byte
⁄⁄  
tmp
⁄⁄! $
=
⁄⁄% &
(
⁄⁄' (
byte
⁄⁄( ,
)
⁄⁄, -
(
⁄⁄- .
(
⁄⁄. /
t
⁄⁄/ 0
>>
⁄⁄1 3
(
⁄⁄4 5
$num
⁄⁄5 6
*
⁄⁄7 8
(
⁄⁄9 :
$num
⁄⁄: ;
-
⁄⁄< =
k
⁄⁄> ?
)
⁄⁄? @
)
⁄⁄@ A
)
⁄⁄A B
&
⁄⁄C D
$num
⁄⁄E I
)
⁄⁄I J
;
⁄⁄J K
rgbA
€€  
[
€€  !
k
€€! "
]
€€" #
^=
€€$ &
tmp
€€' *
;
€€* +
}
‹‹ 
Buffer
›› 
.
›› 
	BlockCopy
›› (
(
››( )
rgbA
››) -
,
››- .
$num
››/ 0
,
››0 1
rgbBlock
››2 :
,
››: ;
$num
››< =
,
››= >
$num
››? @
)
››@ A
;
››A B
Buffer
ﬁﬁ 
.
ﬁﬁ 
	BlockCopy
ﬁﬁ (
(
ﬁﬁ( )
	rgbOutput
ﬁﬁ) 2
,
ﬁﬁ2 3
$num
ﬁﬁ4 5
*
ﬁﬁ6 7
(
ﬁﬁ8 9
i
ﬁﬁ9 :
-
ﬁﬁ; <
$num
ﬁﬁ= >
)
ﬁﬁ> ?
,
ﬁﬁ? @
rgbBlock
ﬁﬁA I
,
ﬁﬁI J
$num
ﬁﬁK L
,
ﬁﬁL M
$num
ﬁﬁN O
)
ﬁﬁO P
;
ﬁﬁP Q
byte
ﬂﬂ 
[
ﬂﬂ 
]
ﬂﬂ 
rgbB
ﬂﬂ #
=
ﬂﬂ$ %
dec
ﬂﬂ& )
.
ﬂﬂ) *
DoFinal
ﬂﬂ* 1
(
ﬂﬂ1 2
rgbBlock
ﬂﬂ2 :
)
ﬂﬂ: ;
;
ﬂﬂ; <
Buffer
‡‡ 
.
‡‡ 
	BlockCopy
‡‡ (
(
‡‡( )
rgbB
‡‡) -
,
‡‡- .
$num
‡‡/ 0
,
‡‡0 1
	rgbOutput
‡‡2 ;
,
‡‡; <
$num
‡‡= >
*
‡‡? @
(
‡‡A B
i
‡‡B C
-
‡‡D E
$num
‡‡F G
)
‡‡G H
,
‡‡H I
$num
‡‡J K
)
‡‡K L
;
‡‡L M
Buffer
·· 
.
·· 
	BlockCopy
·· (
(
··( )
rgbB
··) -
,
··- .
$num
··/ 0
,
··0 1
rgbA
··2 6
,
··6 7
$num
··8 9
,
··9 :
$num
··; <
)
··< =
;
··= >
}
‚‚ 
}
„„ 
for
ÂÂ 
(
ÂÂ 
int
ÂÂ 
index
ÂÂ 
=
ÂÂ  
$num
ÂÂ! "
;
ÂÂ" #
index
ÂÂ$ )
<
ÂÂ* +
$num
ÂÂ, -
;
ÂÂ- .
index
ÂÂ/ 4
++
ÂÂ4 6
)
ÂÂ6 7
if
ÊÊ 
(
ÊÊ 
rgbA
ÊÊ 
[
ÊÊ 
index
ÊÊ "
]
ÊÊ" #
!=
ÊÊ$ &
s_rgbAES_KW_IV
ÊÊ' 5
[
ÊÊ5 6
index
ÊÊ6 ;
]
ÊÊ; <
)
ÊÊ< =
throw
ÁÁ 
new
ÁÁ !
System
ÁÁ" (
.
ÁÁ( )
Security
ÁÁ) 1
.
ÁÁ1 2
Cryptography
ÁÁ2 >
.
ÁÁ> ?$
CryptographicException
ÁÁ? U
(
ÁÁU V
SR
ÁÁV X
.
ÁÁX Y0
"Cryptography_Xml_BadWrappedKeySize
ÁÁY {
)
ÁÁ{ |
;
ÁÁ| }
return
ËË 
	rgbOutput
ËË  
;
ËË  !
}
ÈÈ 
finally
ÍÍ 
{
ÎÎ 
}
ÌÌ 
}
ÓÓ 	
}
ÔÔ 
} ïw
4C:\code\bc-xml-security\refactoring\src\Transform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

abstract 
class 
	Transform #
{ 
private 
string 

_algorithm !
;! "
private   
string   
_baseUri   
=    !
null  " &
;  & '
internal!! 
XmlResolver!! 
_xmlResolver!! )
=!!* +
null!!, 0
;!!0 1
private"" 
bool"" 
_bResolverSet"" "
=""# $
false""% *
;""* +
private## 
	SignedXml## 

_signedXml## $
=##% &
null##' +
;##+ ,
private$$ 
	Reference$$ 

_reference$$ $
=$$% &
null$$' +
;$$+ ,
private%% 
	Hashtable%% !
_propagatedNamespaces%% /
=%%0 1
null%%2 6
;%%6 7
private&& 

XmlElement&& 
_context&& #
=&&$ %
null&&& *
;&&* +
internal(( 
string(( 
BaseURI(( 
{)) 	
get** 
{** 
return** 
_baseUri** !
;**! "
}**# $
set++ 
{++ 
_baseUri++ 
=++ 
value++ "
;++" #
}++$ %
},, 	
internal.. 
	SignedXml.. 
	SignedXml.. $
{// 	
get00 
{00 
return00 

_signedXml00 #
;00# $
}00% &
set11 
{11 

_signedXml11 
=11 
value11 $
;11$ %
}11& '
}22 	
internal44 
	Reference44 
	Reference44 $
{55 	
get66 
{66 
return66 

_reference66 #
;66# $
}66% &
set77 
{77 

_reference77 
=77 
value77 $
;77$ %
}77& '
}88 	
	protected>> 
	Transform>> 
(>> 
)>> 
{>> 
}>>  !
publicDD 
stringDD 
	AlgorithmDD 
{EE 	
getFF 
{FF 
returnFF 

_algorithmFF #
;FF# $
}FF% &
setGG 
{GG 

_algorithmGG 
=GG 
valueGG $
;GG$ %
}GG& '
}HH 	
publicJJ 
XmlResolverJJ 
ResolverJJ #
{KK 	
setNN 
{OO 
_xmlResolverPP 
=PP 
valuePP $
;PP$ %
_bResolverSetQQ 
=QQ 
trueQQ  $
;QQ$ %
}RR 
internalTT 
getTT 
{UU 
returnVV 
_xmlResolverVV #
;VV# $
}WW 
}XX 	
internalZZ 
boolZZ 
ResolverSetZZ !
{[[ 	
get\\ 
{\\ 
return\\ 
_bResolverSet\\ &
;\\& '
}\\( )
}]] 	
public__ 
abstract__ 
Type__ 
[__ 
]__ 

InputTypes__ )
{`` 	
getaa 
;aa 
}bb 	
publicdd 
abstractdd 
Typedd 
[dd 
]dd 
OutputTypesdd *
{ee 	
getff 
;ff 
}gg 	
internalii 
boolii 
AcceptsTypeii !
(ii! "
Typeii" &
	inputTypeii' 0
)ii0 1
{jj 	
ifkk 
(kk 

InputTypeskk 
!=kk 
nullkk "
)kk" #
{ll 
formm 
(mm 
intmm 
imm 
=mm 
$nummm 
;mm 
imm  !
<mm" #

InputTypesmm$ .
.mm. /
Lengthmm/ 5
;mm5 6
imm7 8
++mm8 :
)mm: ;
{nn 
ifoo 
(oo 
	inputTypeoo !
==oo" $

InputTypesoo% /
[oo/ 0
ioo0 1
]oo1 2
||oo3 5
	inputTypeoo6 ?
.oo? @
IsSubclassOfoo@ L
(ooL M

InputTypesooM W
[ooW X
iooX Y
]ooY Z
)ooZ [
)oo[ \
returnpp 
truepp #
;pp# $
}qq 
}rr 
returnss 
falsess 
;ss 
}tt 	
publiczz 

XmlElementzz 
GetXmlzz  
(zz  !
)zz! "
{{{ 	
XmlDocument|| 
document||  
=||! "
new||# &
XmlDocument||' 2
(||2 3
)||3 4
;||4 5
document}} 
.}} 
PreserveWhitespace}} '
=}}( )
true}}* .
;}}. /
return~~ 
GetXml~~ 
(~~ 
document~~ "
)~~" #
;~~# $
} 	
internal
ÅÅ 

XmlElement
ÅÅ 
GetXml
ÅÅ "
(
ÅÅ" #
XmlDocument
ÅÅ# .
document
ÅÅ/ 7
)
ÅÅ7 8
{
ÇÇ 	
return
ÉÉ 
GetXml
ÉÉ 
(
ÉÉ 
document
ÉÉ "
,
ÉÉ" #
$str
ÉÉ$ /
)
ÉÉ/ 0
;
ÉÉ0 1
}
ÑÑ 	
internal
ÜÜ 

XmlElement
ÜÜ 
GetXml
ÜÜ "
(
ÜÜ" #
XmlDocument
ÜÜ# .
document
ÜÜ/ 7
,
ÜÜ7 8
string
ÜÜ9 ?
name
ÜÜ@ D
)
ÜÜD E
{
áá 	

XmlElement
àà 
transformElement
àà '
=
àà( )
document
àà* 2
.
àà2 3
CreateElement
àà3 @
(
àà@ A
name
ààA E
,
ààE F
	SignedXml
ààG P
.
ààP Q!
XmlDsigNamespaceUrl
ààQ d
)
ààd e
;
ààe f
if
ââ 
(
ââ 
!
ââ 
string
ââ 
.
ââ 
IsNullOrEmpty
ââ %
(
ââ% &
	Algorithm
ââ& /
)
ââ/ 0
)
ââ0 1
transformElement
ää  
.
ää  !
SetAttribute
ää! -
(
ää- .
$str
ää. 9
,
ää9 :
	Algorithm
ää; D
)
ääD E
;
ääE F
XmlNodeList
ãã 
children
ãã  
=
ãã! "
GetInnerXml
ãã# .
(
ãã. /
)
ãã/ 0
;
ãã0 1
if
åå 
(
åå 
children
åå 
!=
åå 
null
åå  
)
åå  !
{
çç 
foreach
éé 
(
éé 
XmlNode
éé  
node
éé! %
in
éé& (
children
éé) 1
)
éé1 2
{
èè 
transformElement
êê $
.
êê$ %
AppendChild
êê% 0
(
êê0 1
document
êê1 9
.
êê9 :

ImportNode
êê: D
(
êêD E
node
êêE I
,
êêI J
true
êêK O
)
êêO P
)
êêP Q
;
êêQ R
}
ëë 
}
íí 
return
ìì 
transformElement
ìì #
;
ìì# $
}
îî 	
public
ññ 
abstract
ññ 
void
ññ 
LoadInnerXml
ññ )
(
ññ) *
XmlNodeList
ññ* 5
nodeList
ññ6 >
)
ññ> ?
;
ññ? @
	protected
òò 
abstract
òò 
XmlNodeList
òò &
GetInnerXml
òò' 2
(
òò2 3
)
òò3 4
;
òò4 5
public
öö 
abstract
öö 
void
öö 
	LoadInput
öö &
(
öö& '
object
öö' -
obj
öö. 1
)
öö1 2
;
öö2 3
public
úú 
abstract
úú 
object
úú 
	GetOutput
úú (
(
úú( )
)
úú) *
;
úú* +
public
ûû 
abstract
ûû 
object
ûû 
	GetOutput
ûû (
(
ûû( )
Type
ûû) -
type
ûû. 2
)
ûû2 3
;
ûû3 4
public
†† 
virtual
†† 
void
†† 
GetDigestedOutput
†† -
(
††- .
IHash
††. 3
hash
††4 8
)
††8 9
{
°° 	
byte
££ 
[
££ 
]
££ 
buffer
££ 
=
££ 
new
££ 
byte
££  $
[
££$ %
$num
££% )
]
££) *
;
££* +
int
§§ 
	bytesRead
§§ 
;
§§ 
var
•• 
inputStream
•• 
=
•• 
(
•• 
Stream
•• %
)
••% &
	GetOutput
••& /
(
••/ 0
typeof
••0 6
(
••6 7
Stream
••7 =
)
••= >
)
••> ?
;
••? @
hash
¶¶ 
.
¶¶ 
Reset
¶¶ 
(
¶¶ 
)
¶¶ 
;
¶¶ 
while
ßß 
(
ßß 
(
ßß 
	bytesRead
ßß 
=
ßß 
inputStream
ßß  +
.
ßß+ ,
Read
ßß, 0
(
ßß0 1
buffer
ßß1 7
,
ßß7 8
$num
ßß9 :
,
ßß: ;
buffer
ßß< B
.
ßßB C
Length
ßßC I
)
ßßI J
)
ßßJ K
>
ßßL M
$num
ßßN O
)
ßßO P
{
ßßQ R
hash
®® 
.
®® 
BlockUpdate
®®  
(
®®  !
buffer
®®! '
,
®®' (
$num
®®) *
,
®®* +
	bytesRead
®®, 5
)
®®5 6
;
®®6 7
}
©© 
}
™™ 	
public
¨¨ 

XmlElement
¨¨ 
Context
¨¨ !
{
≠≠ 	
get
ÆÆ 
{
ØØ 
if
∞∞ 
(
∞∞ 
_context
∞∞ 
!=
∞∞ 
null
∞∞  $
)
∞∞$ %
return
±± 
_context
±± #
;
±±# $
	Reference
≥≥ 
	reference
≥≥ #
=
≥≥$ %
	Reference
≥≥& /
;
≥≥/ 0
	SignedXml
¥¥ 
	signedXml
¥¥ #
=
¥¥$ %
(
¥¥& '
	reference
¥¥' 0
==
¥¥1 3
null
¥¥4 8
?
¥¥9 :
	SignedXml
¥¥; D
:
¥¥E F
	reference
¥¥G P
.
¥¥P Q
	SignedXml
¥¥Q Z
)
¥¥Z [
;
¥¥[ \
if
µµ 
(
µµ 
	signedXml
µµ 
==
µµ  
null
µµ! %
)
µµ% &
return
∂∂ 
null
∂∂ 
;
∂∂  
return
∏∏ 
	signedXml
∏∏  
.
∏∏  !
_context
∏∏! )
;
∏∏) *
}
ππ 
set
∫∫ 
{
ªª 
_context
ºº 
=
ºº 
value
ºº  
;
ºº  !
}
ΩΩ 
}
ææ 	
public
¿¿ 
	Hashtable
¿¿ "
PropagatedNamespaces
¿¿ -
{
¡¡ 	
get
¬¬ 
{
√√ 
if
ƒƒ 
(
ƒƒ #
_propagatedNamespaces
ƒƒ )
!=
ƒƒ* ,
null
ƒƒ- 1
)
ƒƒ1 2
return
≈≈ #
_propagatedNamespaces
≈≈ 0
;
≈≈0 1
	Reference
«« 
	reference
«« #
=
««$ %
	Reference
««& /
;
««/ 0
	SignedXml
»» 
	signedXml
»» #
=
»»$ %
(
»»& '
	reference
»»' 0
==
»»1 3
null
»»4 8
?
»»9 :
	SignedXml
»»; D
:
»»E F
	reference
»»G P
.
»»P Q
	SignedXml
»»Q Z
)
»»Z [
;
»»[ \
if
ÀÀ 
(
ÀÀ 
	reference
ÀÀ 
!=
ÀÀ  
null
ÀÀ! %
&&
ÀÀ& (
(
ÃÃ 
(
ÃÃ 
	reference
ÃÃ 
.
ÃÃ  !
ReferenceTargetType
ÃÃ  3
!=
ÃÃ4 6!
ReferenceTargetType
ÃÃ7 J
.
ÃÃJ K
UriReference
ÃÃK W
)
ÃÃW X
||
ÃÃY [
(
ÕÕ 
string
ÕÕ 
.
ÕÕ 
IsNullOrEmpty
ÕÕ *
(
ÕÕ* +
	reference
ÕÕ+ 4
.
ÕÕ4 5
Uri
ÕÕ5 8
)
ÕÕ8 9
||
ÕÕ: <
	reference
ÕÕ= F
.
ÕÕF G
Uri
ÕÕG J
[
ÕÕJ K
$num
ÕÕK L
]
ÕÕL M
!=
ÕÕN P
$char
ÕÕQ T
)
ÕÕT U
)
ÕÕU V
)
ÕÕV W
{
ŒŒ #
_propagatedNamespaces
œœ )
=
œœ* +
new
œœ, /
	Hashtable
œœ0 9
(
œœ9 :
$num
œœ: ;
)
œœ; <
;
œœ< =
return
–– #
_propagatedNamespaces
–– 0
;
––0 1
}
—— "
CanonicalXmlNodeList
”” $

namespaces
””% /
=
””0 1
null
””2 6
;
””6 7
if
‘‘ 
(
‘‘ 
	reference
‘‘ 
!=
‘‘  
null
‘‘! %
)
‘‘% &

namespaces
’’ 
=
’’  
	reference
’’! *
.
’’* +
_namespaces
’’+ 6
;
’’6 7
else
÷÷ 
if
÷÷ 
(
÷÷ 
	signedXml
÷÷ "
?
÷÷" #
.
÷÷# $
_context
÷÷$ ,
!=
÷÷- /
null
÷÷0 4
)
÷÷4 5

namespaces
◊◊ 
=
◊◊  
Utils
◊◊! &
.
◊◊& '%
GetPropagatedAttributes
◊◊' >
(
◊◊> ?
	signedXml
◊◊? H
.
◊◊H I
_context
◊◊I Q
)
◊◊Q R
;
◊◊R S
if
⁄⁄ 
(
⁄⁄ 

namespaces
⁄⁄ 
==
⁄⁄ !
null
⁄⁄" &
)
⁄⁄& '
{
€€ #
_propagatedNamespaces
‹‹ )
=
‹‹* +
new
‹‹, /
	Hashtable
‹‹0 9
(
‹‹9 :
$num
‹‹: ;
)
‹‹; <
;
‹‹< =
return
›› #
_propagatedNamespaces
›› 0
;
››0 1
}
ﬁﬁ #
_propagatedNamespaces
‡‡ %
=
‡‡& '
new
‡‡( +
	Hashtable
‡‡, 5
(
‡‡5 6

namespaces
‡‡6 @
.
‡‡@ A
Count
‡‡A F
)
‡‡F G
;
‡‡G H
foreach
·· 
(
·· 
XmlNode
··  
attrib
··! '
in
··( *

namespaces
··+ 5
)
··5 6
{
‚‚ 
string
„„ 
key
„„ 
=
„„  
(
„„! "
(
„„" #
attrib
„„# )
.
„„) *
Prefix
„„* 0
.
„„0 1
Length
„„1 7
>
„„8 9
$num
„„: ;
)
„„; <
?
„„= >
attrib
„„? E
.
„„E F
Prefix
„„F L
+
„„M N
$str
„„O R
+
„„S T
attrib
„„U [
.
„„[ \
	LocalName
„„\ e
:
„„f g
attrib
„„h n
.
„„n o
	LocalName
„„o x
)
„„x y
;
„„y z
if
‰‰ 
(
‰‰ 
!
‰‰ #
_propagatedNamespaces
‰‰ .
.
‰‰. /
Contains
‰‰/ 7
(
‰‰7 8
key
‰‰8 ;
)
‰‰; <
)
‰‰< =#
_propagatedNamespaces
ÂÂ -
.
ÂÂ- .
Add
ÂÂ. 1
(
ÂÂ1 2
key
ÂÂ2 5
,
ÂÂ5 6
attrib
ÂÂ7 =
.
ÂÂ= >
Value
ÂÂ> C
)
ÂÂC D
;
ÂÂD E
}
ÊÊ 
return
ÁÁ #
_propagatedNamespaces
ÁÁ ,
;
ÁÁ, -
}
ËË 
}
ÈÈ 	
}
ÍÍ 
}ÎÎ àè
9C:\code\bc-xml-security\refactoring\src\TransformChain.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
TransformChain 
{   
private!! 
	ArrayList!! 
_transforms!! %
;!!% &
public## 
TransformChain## 
(## 
)## 
{$$ 	
_transforms%% 
=%% 
new%% 
	ArrayList%% '
(%%' (
)%%( )
;%%) *
}&& 	
public(( 
void(( 
Add(( 
((( 
	Transform(( !
	transform((" +
)((+ ,
{)) 	
if** 
(** 
	transform** 
!=** 
null** !
)**! "
_transforms++ 
.++ 
Add++ 
(++  
	transform++  )
)++) *
;++* +
},, 	
public.. 
IEnumerator.. 
GetEnumerator.. (
(..( )
)..) *
{// 	
return00 
_transforms00 
.00 
GetEnumerator00 ,
(00, -
)00- .
;00. /
}11 	
public33 
int33 
Count33 
{44 	
get55 
{55 
return55 
_transforms55 $
.55$ %
Count55% *
;55* +
}55, -
}66 	
public88 
	Transform88 
this88 
[88 
int88 !
index88" '
]88' (
{99 	
get:: 
{;; 
if<< 
(<< 
index<< 
>=<< 
_transforms<< (
.<<( )
Count<<) .
)<<. /
throw== 
new== 
ArgumentException== /
(==/ 0
SR==0 2
.==2 3$
ArgumentOutOfRange_Index==3 K
,==K L
nameof==M S
(==S T
index==T Y
)==Y Z
)==Z [
;==[ \
return>> 
(>> 
	Transform>> !
)>>! "
_transforms>>" -
[>>- .
index>>. 3
]>>3 4
;>>4 5
}?? 
}@@ 	
internalDD 
StreamDD "
TransformToOctetStreamDD .
(DD. /
objectDD/ 5
inputObjectDD6 A
,DDA B
TypeDDC G
	inputTypeDDH Q
,DDQ R
XmlResolverDDS ^
resolverDD_ g
,DDg h
stringDDi o
baseUriDDp w
)DDw x
{EE 	
objectFF 
currentInputFF 
=FF  !
inputObjectFF" -
;FF- .
foreachGG 
(GG 
	TransformGG 
	transformGG (
inGG) +
_transformsGG, 7
)GG7 8
{HH 
ifII 
(II 
currentInputII  
==II! #
nullII$ (
||II) +
	transformII, 5
.II5 6
AcceptsTypeII6 A
(IIA B
currentInputIIB N
.IIN O
GetTypeIIO V
(IIV W
)IIW X
)IIX Y
)IIY Z
{JJ 
	transformLL 
.LL 
ResolverLL &
=LL' (
resolverLL) 1
;LL1 2
	transformMM 
.MM 
BaseURIMM %
=MM& '
baseUriMM( /
;MM/ 0
	transformNN 
.NN 
	LoadInputNN '
(NN' (
currentInputNN( 4
)NN4 5
;NN5 6
currentInputOO  
=OO! "
	transformOO# ,
.OO, -
	GetOutputOO- 6
(OO6 7
)OO7 8
;OO8 9
}PP 
elseQQ 
{RR 
ifUU 
(UU 
currentInputUU $
isUU% '
StreamUU( .
)UU. /
{VV 
ifWW 
(WW 
	transformWW %
.WW% &
AcceptsTypeWW& 1
(WW1 2
typeofWW2 8
(WW8 9
XmlDocumentWW9 D
)WWD E
)WWE F
)WWF G
{XX 
StreamYY "
currentInputStreamYY# 5
=YY6 7
currentInputYY8 D
asYYE G
StreamYYH N
;YYN O
XmlDocumentZZ '
docZZ( +
=ZZ, -
newZZ. 1
XmlDocumentZZ2 =
(ZZ= >
)ZZ> ?
;ZZ? @
doc[[ 
.[[  
PreserveWhitespace[[  2
=[[3 4
true[[5 9
;[[9 :
	XmlReader\\ %
	valReader\\& /
=\\0 1
Utils\\2 7
.\\7 8!
PreProcessStreamInput\\8 M
(\\M N
currentInputStream\\N `
,\\` a
resolver\\b j
,\\j k
baseUri\\l s
)\\s t
;\\t u
doc]] 
.]]  
Load]]  $
(]]$ %
	valReader]]% .
)]]. /
;]]/ 0
	transform^^ %
.^^% &
	LoadInput^^& /
(^^/ 0
doc^^0 3
)^^3 4
;^^4 5
currentInputStream__ .
.__. /
Close__/ 4
(__4 5
)__5 6
;__6 7
currentInput`` (
=``) *
	transform``+ 4
.``4 5
	GetOutput``5 >
(``> ?
)``? @
;``@ A
continueaa $
;aa$ %
}bb 
elsecc 
{dd 
throwee !
newee" %
Systemee& ,
.ee, -
Securityee- 5
.ee5 6
Cryptographyee6 B
.eeB C"
CryptographicExceptioneeC Y
(eeY Z
SReeZ \
.ee\ ]9
,Cryptography_Xml_TransformIncorrectInputType	ee] â
)
eeâ ä
;
eeä ã
}ff 
}gg 
ifhh 
(hh 
currentInputhh $
ishh% '
XmlNodeListhh( 3
)hh3 4
{ii 
ifjj 
(jj 
	transformjj %
.jj% &
AcceptsTypejj& 1
(jj1 2
typeofjj2 8
(jj8 9
Streamjj9 ?
)jj? @
)jj@ A
)jjA B
{kk 
CanonicalXmlll (
c14nll) -
=ll. /
newll0 3
CanonicalXmlll4 @
(ll@ A
(llA B
XmlNodeListllB M
)llM N
currentInputllN Z
,llZ [
resolverll\ d
,lld e
falsellf k
)llk l
;lll m
MemoryStreammm (
msmm) +
=mm, -
newmm. 1
MemoryStreammm2 >
(mm> ?
c14nmm? C
.mmC D
GetBytesmmD L
(mmL M
)mmM N
)mmN O
;mmO P
	transformnn %
.nn% &
	LoadInputnn& /
(nn/ 0
msnn0 2
)nn2 3
;nn3 4
currentInputoo (
=oo) *
	transformoo+ 4
.oo4 5
	GetOutputoo5 >
(oo> ?
)oo? @
;oo@ A
mspp 
.pp 
Closepp $
(pp$ %
)pp% &
;pp& '
continueqq $
;qq$ %
}rr 
elsess 
{tt 
throwuu !
newuu" %
Systemuu& ,
.uu, -
Securityuu- 5
.uu5 6
Cryptographyuu6 B
.uuB C"
CryptographicExceptionuuC Y
(uuY Z
SRuuZ \
.uu\ ]9
,Cryptography_Xml_TransformIncorrectInputType	uu] â
)
uuâ ä
;
uuä ã
}vv 
}ww 
ifxx 
(xx 
currentInputxx $
isxx% '
XmlDocumentxx( 3
)xx3 4
{yy 
ifzz 
(zz 
	transformzz %
.zz% &
AcceptsTypezz& 1
(zz1 2
typeofzz2 8
(zz8 9
Streamzz9 ?
)zz? @
)zz@ A
)zzA B
{{{ 
CanonicalXml|| (
c14n||) -
=||. /
new||0 3
CanonicalXml||4 @
(||@ A
(||A B
XmlDocument||B M
)||M N
currentInput||N Z
,||Z [
resolver||\ d
)||d e
;||e f
MemoryStream}} (
ms}}) +
=}}, -
new}}. 1
MemoryStream}}2 >
(}}> ?
c14n}}? C
.}}C D
GetBytes}}D L
(}}L M
)}}M N
)}}N O
;}}O P
	transform~~ %
.~~% &
	LoadInput~~& /
(~~/ 0
ms~~0 2
)~~2 3
;~~3 4
currentInput (
=) *
	transform+ 4
.4 5
	GetOutput5 >
(> ?
)? @
;@ A
ms
ÄÄ 
.
ÄÄ 
Close
ÄÄ $
(
ÄÄ$ %
)
ÄÄ% &
;
ÄÄ& '
continue
ÅÅ $
;
ÅÅ$ %
}
ÇÇ 
else
ÉÉ 
{
ÑÑ 
throw
ÖÖ !
new
ÖÖ" %
System
ÖÖ& ,
.
ÖÖ, -
Security
ÖÖ- 5
.
ÖÖ5 6
Cryptography
ÖÖ6 B
.
ÖÖB C$
CryptographicException
ÖÖC Y
(
ÖÖY Z
SR
ÖÖZ \
.
ÖÖ\ ];
,Cryptography_Xml_TransformIncorrectInputTypeÖÖ] â
)ÖÖâ ä
;ÖÖä ã
}
ÜÜ 
}
áá 
throw
àà 
new
àà 
System
àà $
.
àà$ %
Security
àà% -
.
àà- .
Cryptography
àà. :
.
àà: ;$
CryptographicException
àà; Q
(
ààQ R
SR
ààR T
.
ààT U;
,Cryptography_Xml_TransformIncorrectInputTypeààU Å
)ààÅ Ç
;ààÇ É
}
ââ 
}
ää 
if
çç 
(
çç 
currentInput
çç 
is
çç 
Stream
çç  &
)
çç& '
{
éé 
return
èè 
currentInput
èè #
as
èè$ &
Stream
èè' -
;
èè- .
}
êê 
if
ëë 
(
ëë 
currentInput
ëë 
is
ëë 
XmlNodeList
ëë  +
)
ëë+ ,
{
íí 
CanonicalXml
ìì 
c14n
ìì !
=
ìì" #
new
ìì$ '
CanonicalXml
ìì( 4
(
ìì4 5
(
ìì5 6
XmlNodeList
ìì6 A
)
ììA B
currentInput
ììB N
,
ììN O
resolver
ììP X
,
ììX Y
false
ììZ _
)
ìì_ `
;
ìì` a
MemoryStream
îî 
ms
îî 
=
îî  !
new
îî" %
MemoryStream
îî& 2
(
îî2 3
c14n
îî3 7
.
îî7 8
GetBytes
îî8 @
(
îî@ A
)
îîA B
)
îîB C
;
îîC D
return
ïï 
ms
ïï 
;
ïï 
}
ññ 
if
óó 
(
óó 
currentInput
óó 
is
óó 
XmlDocument
óó  +
)
óó+ ,
{
òò 
CanonicalXml
ôô 
c14n
ôô !
=
ôô" #
new
ôô$ '
CanonicalXml
ôô( 4
(
ôô4 5
(
ôô5 6
XmlDocument
ôô6 A
)
ôôA B
currentInput
ôôB N
,
ôôN O
resolver
ôôP X
)
ôôX Y
;
ôôY Z
MemoryStream
öö 
ms
öö 
=
öö  !
new
öö" %
MemoryStream
öö& 2
(
öö2 3
c14n
öö3 7
.
öö7 8
GetBytes
öö8 @
(
öö@ A
)
ööA B
)
ööB C
;
ööC D
return
õõ 
ms
õõ 
;
õõ 
}
úú 
throw
ùù 
new
ùù 
System
ùù 
.
ùù 
Security
ùù %
.
ùù% &
Cryptography
ùù& 2
.
ùù2 3$
CryptographicException
ùù3 I
(
ùùI J
SR
ùùJ L
.
ùùL M:
,Cryptography_Xml_TransformIncorrectInputType
ùùM y
)
ùùy z
;
ùùz {
}
ûû 	
internal
†† 
Stream
†† $
TransformToOctetStream
†† .
(
††. /
Stream
††/ 5
input
††6 ;
,
††; <
XmlResolver
††= H
resolver
††I Q
,
††Q R
string
††S Y
baseUri
††Z a
)
††a b
{
°° 	
return
¢¢ $
TransformToOctetStream
¢¢ )
(
¢¢) *
input
¢¢* /
,
¢¢/ 0
typeof
¢¢1 7
(
¢¢7 8
Stream
¢¢8 >
)
¢¢> ?
,
¢¢? @
resolver
¢¢A I
,
¢¢I J
baseUri
¢¢K R
)
¢¢R S
;
¢¢S T
}
££ 	
internal
•• 
Stream
•• $
TransformToOctetStream
•• .
(
••. /
XmlDocument
••/ :
document
••; C
,
••C D
XmlResolver
••E P
resolver
••Q Y
,
••Y Z
string
••[ a
baseUri
••b i
)
••i j
{
¶¶ 	
return
ßß $
TransformToOctetStream
ßß )
(
ßß) *
document
ßß* 2
,
ßß2 3
typeof
ßß4 :
(
ßß: ;
XmlDocument
ßß; F
)
ßßF G
,
ßßG H
resolver
ßßI Q
,
ßßQ R
baseUri
ßßS Z
)
ßßZ [
;
ßß[ \
}
®® 	
internal
™™ 

XmlElement
™™ 
GetXml
™™ "
(
™™" #
XmlDocument
™™# .
document
™™/ 7
,
™™7 8
string
™™9 ?
ns
™™@ B
)
™™B C
{
´´ 	

XmlElement
¨¨ 
transformsElement
¨¨ (
=
¨¨) *
document
¨¨+ 3
.
¨¨3 4
CreateElement
¨¨4 A
(
¨¨A B
$str
¨¨B N
,
¨¨N O
ns
¨¨P R
)
¨¨R S
;
¨¨S T
foreach
≠≠ 
(
≠≠ 
	Transform
≠≠ 
	transform
≠≠ (
in
≠≠) +
_transforms
≠≠, 7
)
≠≠7 8
{
ÆÆ 
if
ØØ 
(
ØØ 
	transform
ØØ 
!=
ØØ  
null
ØØ! %
)
ØØ% &
{
∞∞ 

XmlElement
≤≤ 
transformElement
≤≤ /
=
≤≤0 1
	transform
≤≤2 ;
.
≤≤; <
GetXml
≤≤< B
(
≤≤B C
document
≤≤C K
)
≤≤K L
;
≤≤L M
if
≥≥ 
(
≥≥ 
transformElement
≥≥ (
!=
≥≥) +
null
≥≥, 0
)
≥≥0 1
transformsElement
¥¥ )
.
¥¥) *
AppendChild
¥¥* 5
(
¥¥5 6
transformElement
¥¥6 F
)
¥¥F G
;
¥¥G H
}
µµ 
}
∂∂ 
return
∑∑ 
transformsElement
∑∑ $
;
∑∑$ %
}
∏∏ 	
internal
∫∫ 
void
∫∫ 
LoadXml
∫∫ 
(
∫∫ 

XmlElement
∫∫ (
value
∫∫) .
)
∫∫. /
{
ªª 	
if
ºº 
(
ºº 
value
ºº 
==
ºº 
null
ºº 
)
ºº 
throw
ΩΩ 
new
ΩΩ #
ArgumentNullException
ΩΩ /
(
ΩΩ/ 0
nameof
ΩΩ0 6
(
ΩΩ6 7
value
ΩΩ7 <
)
ΩΩ< =
)
ΩΩ= >
;
ΩΩ> ?!
XmlNamespaceManager
øø 
nsm
øø  #
=
øø$ %
new
øø& )!
XmlNamespaceManager
øø* =
(
øø= >
value
øø> C
.
øøC D
OwnerDocument
øøD Q
.
øøQ R
	NameTable
øøR [
)
øø[ \
;
øø\ ]
nsm
¿¿ 
.
¿¿ 
AddNamespace
¿¿ 
(
¿¿ 
$str
¿¿ !
,
¿¿! "
	SignedXml
¿¿# ,
.
¿¿, -!
XmlDsigNamespaceUrl
¿¿- @
)
¿¿@ A
;
¿¿A B
XmlNodeList
¬¬ 
transformNodes
¬¬ &
=
¬¬' (
value
¬¬) .
.
¬¬. /
SelectNodes
¬¬/ :
(
¬¬: ;
$str
¬¬; I
,
¬¬I J
nsm
¬¬K N
)
¬¬N O
;
¬¬O P
if
√√ 
(
√√ 
transformNodes
√√ 
.
√√ 
Count
√√ $
==
√√% '
$num
√√( )
)
√√) *
throw
ƒƒ 
new
ƒƒ 
System
ƒƒ  
.
ƒƒ  !
Security
ƒƒ! )
.
ƒƒ) *
Cryptography
ƒƒ* 6
.
ƒƒ6 7$
CryptographicException
ƒƒ7 M
(
ƒƒM N
SR
ƒƒN P
.
ƒƒP Q-
Cryptography_Xml_InvalidElement
ƒƒQ p
,
ƒƒp q
$str
ƒƒr ~
)
ƒƒ~ 
;ƒƒ Ä
_transforms
∆∆ 
.
∆∆ 
Clear
∆∆ 
(
∆∆ 
)
∆∆ 
;
∆∆  
for
«« 
(
«« 
int
«« 
i
«« 
=
«« 
$num
«« 
;
«« 
i
«« 
<
«« 
transformNodes
««  .
.
««. /
Count
««/ 4
;
««4 5
++
««6 8
i
««8 9
)
««9 :
{
»» 

XmlElement
…… 
transformElement
…… +
=
……, -
(
……. /

XmlElement
……/ 9
)
……9 :
transformNodes
……: H
.
……H I
Item
……I M
(
……M N
i
……N O
)
……O P
;
……P Q
string
   
	algorithm
    
=
  ! "
Utils
  # (
.
  ( )
GetAttribute
  ) 5
(
  5 6
transformElement
  6 F
,
  F G
$str
  H S
,
  S T
	SignedXml
  U ^
.
  ^ _!
XmlDsigNamespaceUrl
  _ r
)
  r s
;
  s t
	Transform
ÀÀ 
	transform
ÀÀ #
=
ÀÀ$ %
CryptoHelpers
ÀÀ& 3
.
ÀÀ3 4
CreateFromName
ÀÀ4 B
<
ÀÀB C
	Transform
ÀÀC L
>
ÀÀL M
(
ÀÀM N
	algorithm
ÀÀN W
)
ÀÀW X
;
ÀÀX Y
if
ÃÃ 
(
ÃÃ 
	transform
ÃÃ 
==
ÃÃ  
null
ÃÃ! %
)
ÃÃ% &
throw
ÕÕ 
new
ÕÕ 
System
ÕÕ $
.
ÕÕ$ %
Security
ÕÕ% -
.
ÕÕ- .
Cryptography
ÕÕ. :
.
ÕÕ: ;$
CryptographicException
ÕÕ; Q
(
ÕÕQ R
SR
ÕÕR T
.
ÕÕT U/
!Cryptography_Xml_UnknownTransform
ÕÕU v
)
ÕÕv w
;
ÕÕw x
	transform
œœ 
.
œœ 
LoadInnerXml
œœ &
(
œœ& '
transformElement
œœ' 7
.
œœ7 8

ChildNodes
œœ8 B
)
œœB C
;
œœC D
_transforms
–– 
.
–– 
Add
–– 
(
––  
	transform
––  )
)
––) *
;
––* +
}
—— 
}
““ 	
}
”” 
}‘‘ ö
=C:\code\bc-xml-security\refactoring\src\TransformInputType.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal		 
enum		 
TransformInputType		 $
{

 
XmlDocument 
= 
$num 
, 
	XmlStream 
= 
$num 
, 

XmlNodeSet 
= 
$num 
} 
} ˆ´
0C:\code\bc-xml-security\refactoring\src\Utils.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
internal 
class 
Utils 
{ 
internal 
const 
int #
MaxCharactersInDocument 2
=3 4
$num5 6
;6 7
internal"" 
const"" 
long"" %
MaxCharactersFromEntities"" 5
=""6 7
(""8 9
long""9 =
)""= >
$num""> A
;""A B
internal'' 
const'' 
int'' 
XmlDsigSearchDepth'' -
=''. /
$num''0 2
;''2 3
private)) 
Utils)) 
()) 
))) 
{)) 
})) 
private++ 
static++ 
bool++ 
HasNamespace++ (
(++( )

XmlElement++) 3
element++4 ;
,++; <
string++= C
prefix++D J
,++J K
string++L R
value++S X
)++X Y
{,, 	
if-- 
(--  
IsCommittedNamespace-- $
(--$ %
element--% ,
,--, -
prefix--. 4
,--4 5
value--6 ;
)--; <
)--< =
return--> D
true--E I
;--I J
if.. 
(.. 
element.. 
... 
Prefix.. 
==.. !
prefix.." (
&&..) +
element.., 3
...3 4
NamespaceURI..4 @
==..A C
value..D I
)..I J
return..K Q
true..R V
;..V W
return// 
false// 
;// 
}00 	
internal33 
static33 
bool33  
IsCommittedNamespace33 1
(331 2

XmlElement332 <
element33= D
,33D E
string33F L
prefix33M S
,33S T
string33U [
value33\ a
)33a b
{44 	
if55 
(55 
element55 
==55 
null55 
)55  
throw66 
new66 !
ArgumentNullException66 /
(66/ 0
nameof660 6
(666 7
element667 >
)66> ?
)66? @
;66@ A
string88 
name88 
=88 
(88 
(88 
prefix88 "
.88" #
Length88# )
>88* +
$num88, -
)88- .
?88/ 0
$str881 9
+88: ;
prefix88< B
:88C D
$str88E L
)88L M
;88M N
if99 
(99 
element99 
.99 
HasAttribute99 $
(99$ %
name99% )
)99) *
&&99+ -
element99. 5
.995 6
GetAttribute996 B
(99B C
name99C G
)99G H
==99I K
value99L Q
)99Q R
return99S Y
true99Z ^
;99^ _
return:: 
false:: 
;:: 
};; 	
internal== 
static== 
bool==  
IsRedundantNamespace== 1
(==1 2

XmlElement==2 <
element=== D
,==D E
string==F L
prefix==M S
,==S T
string==U [
value==\ a
)==a b
{>> 	
if?? 
(?? 
element?? 
==?? 
null?? 
)??  
throw@@ 
new@@ !
ArgumentNullException@@ /
(@@/ 0
nameof@@0 6
(@@6 7
element@@7 >
)@@> ?
)@@? @
;@@@ A
XmlNodeBB 
ancestorNodeBB  
=BB! "
(BB# $
(BB$ %
XmlNodeBB% ,
)BB, -
elementBB- 4
)BB4 5
.BB5 6

ParentNodeBB6 @
;BB@ A
whileCC 
(CC 
ancestorNodeCC 
!=CC  "
nullCC# '
)CC' (
{DD 

XmlElementEE 
ancestorElementEE *
=EE+ ,
ancestorNodeEE- 9
asEE: <

XmlElementEE= G
;EEG H
ifFF 
(FF 
ancestorElementFF #
!=FF$ &
nullFF' +
)FF+ ,
ifGG 
(GG 
HasNamespaceGG $
(GG$ %
ancestorElementGG% 4
,GG4 5
prefixGG6 <
,GG< =
valueGG> C
)GGC D
)GGD E
returnGGF L
trueGGM Q
;GGQ R
ancestorNodeHH 
=HH 
ancestorNodeHH +
.HH+ ,

ParentNodeHH, 6
;HH6 7
}II 
returnKK 
falseKK 
;KK 
}LL 	
internalNN 
staticNN 
stringNN 
GetAttributeNN +
(NN+ ,

XmlElementNN, 6
elementNN7 >
,NN> ?
stringNN@ F
	localNameNNG P
,NNP Q
stringNNR X
namespaceURINNY e
)NNe f
{OO 	
stringPP 
sPP 
=PP 
(PP 
elementPP 
.PP  
HasAttributePP  ,
(PP, -
	localNamePP- 6
)PP6 7
?PP8 9
elementPP: A
.PPA B
GetAttributePPB N
(PPN O
	localNamePPO X
)PPX Y
:PPZ [
nullPP\ `
)PP` a
;PPa b
ifQQ 
(QQ 
sQQ 
==QQ 
nullQQ 
&&QQ 
elementQQ $
.QQ$ %
HasAttributeQQ% 1
(QQ1 2
	localNameQQ2 ;
,QQ; <
namespaceURIQQ= I
)QQI J
)QQJ K
sRR 
=RR 
elementRR 
.RR 
GetAttributeRR (
(RR( )
	localNameRR) 2
,RR2 3
namespaceURIRR4 @
)RR@ A
;RRA B
returnSS 
sSS 
;SS 
}TT 	
internalVV 
staticVV 
boolVV 
HasAttributeVV )
(VV) *

XmlElementVV* 4
elementVV5 <
,VV< =
stringVV> D
	localNameVVE N
,VVN O
stringVVP V
namespaceURIVVW c
)VVc d
{WW 	
returnXX 
elementXX 
.XX 
HasAttributeXX '
(XX' (
	localNameXX( 1
)XX1 2
||XX3 5
elementXX6 =
.XX= >
HasAttributeXX> J
(XXJ K
	localNameXXK T
,XXT U
namespaceURIXXV b
)XXb c
;XXc d
}YY 	
internal[[ 
static[[ 
bool[[ 
VerifyAttributes[[ -
([[- .

XmlElement[[. 8
element[[9 @
,[[@ A
string[[B H
expectedAttrName[[I Y
)[[Y Z
{\\ 	
return]] 
VerifyAttributes]] #
(]]# $
element]]$ +
,]]+ ,
expectedAttrName]]- =
==]]> @
null]]A E
?]]F G
null]]H L
:]]M N
new]]O R
string]]S Y
[]]Y Z
]]]Z [
{]]\ ]
expectedAttrName]]^ n
}]]o p
)]]p q
;]]q r
}^^ 	
internal`` 
static`` 
bool`` 
VerifyAttributes`` -
(``- .

XmlElement``. 8
element``9 @
,``@ A
string``B H
[``H I
]``I J
expectedAttrNames``K \
)``\ ]
{aa 	
foreachbb 
(bb 
XmlAttributebb !
attrbb" &
inbb' )
elementbb* 1
.bb1 2

Attributesbb2 <
)bb< =
{cc 
boolee 
attrIsAllowedee "
=ee# $
attree% )
.ee) *
Nameee* .
==ee/ 1
$stree2 9
||ee: <
attree= A
.eeA B
NameeeB F
.eeF G

StartsWitheeG Q
(eeQ R
$streeR Z
)eeZ [
||ee\ ^
attree_ c
.eec d
Nameeed h
==eei k
$streel w
||eex z
attree{ 
.	ee Ä
Name
eeÄ Ñ
==
eeÖ á
$str
eeà í
||
eeì ï
attr
eeñ ö
.
eeö õ
Name
eeõ ü
==
ee† ¢
$str
ee£ ≠
;
ee≠ Æ
intff 
expectedIndff 
=ff  !
$numff" #
;ff# $
whilegg 
(gg 
!gg 
attrIsAllowedgg %
&&gg& (
expectedAttrNamesgg) :
!=gg; =
nullgg> B
&&ggC E
expectedIndggF Q
<ggR S
expectedAttrNamesggT e
.gge f
Lengthggf l
)ggl m
{hh 
attrIsAllowedii !
=ii" #
attrii$ (
.ii( )
Nameii) -
==ii. 0
expectedAttrNamesii1 B
[iiB C
expectedIndiiC N
]iiN O
;iiO P
expectedIndjj 
++jj !
;jj! "
}kk 
ifll 
(ll 
!ll 
attrIsAllowedll "
)ll" #
returnmm 
falsemm  
;mm  !
}nn 
returnoo 
trueoo 
;oo 
}pp 	
internalrr 
staticrr 
boolrr 
IsNamespaceNoderr ,
(rr, -
XmlNoderr- 4
nrr5 6
)rr6 7
{ss 	
returntt 
ntt 
.tt 
NodeTypett 
==tt  
XmlNodeTypett! ,
.tt, -
	Attributett- 6
&&tt7 9
(tt: ;
ntt; <
.tt< =
Prefixtt= C
.ttC D
EqualsttD J
(ttJ K
$strttK R
)ttR S
||ttT V
(ttW X
nttX Y
.ttY Z
PrefixttZ `
.tt` a
Lengthtta g
==tth j
$numttk l
&&ttm o
nttp q
.ttq r
	LocalNamettr {
.tt{ |
Equals	tt| Ç
(
ttÇ É
$str
ttÉ ä
)
ttä ã
)
ttã å
)
ttå ç
;
ttç é
}uu 	
internalww 
staticww 
boolww 
IsXmlNamespaceNodeww /
(ww/ 0
XmlNodeww0 7
nww8 9
)ww9 :
{xx 	
returnyy 
nyy 
.yy 
NodeTypeyy 
==yy  
XmlNodeTypeyy! ,
.yy, -
	Attributeyy- 6
&&yy7 9
nyy: ;
.yy; <
Prefixyy< B
.yyB C
EqualsyyC I
(yyI J
$stryyJ O
)yyO P
;yyP Q
}zz 	
internal}} 
static}} 
bool}} "
IsDefaultNamespaceNode}} 3
(}}3 4
XmlNode}}4 ;
n}}< =
)}}= >
{~~ 	
bool 
b1 
= 
n 
. 
NodeType  
==! #
XmlNodeType$ /
./ 0
	Attribute0 9
&&: <
n= >
.> ?
Prefix? E
.E F
LengthF L
==M O
$numP Q
&&R T
nU V
.V W
	LocalNameW `
.` a
Equalsa g
(g h
$strh o
)o p
;p q
bool
ÄÄ 
b2
ÄÄ 
=
ÄÄ  
IsXmlNamespaceNode
ÄÄ (
(
ÄÄ( )
n
ÄÄ) *
)
ÄÄ* +
;
ÄÄ+ ,
return
ÅÅ 
b1
ÅÅ 
||
ÅÅ 
b2
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
internal
ÑÑ 
static
ÑÑ 
bool
ÑÑ )
IsEmptyDefaultNamespaceNode
ÑÑ 8
(
ÑÑ8 9
XmlNode
ÑÑ9 @
n
ÑÑA B
)
ÑÑB C
{
ÖÖ 	
return
ÜÜ $
IsDefaultNamespaceNode
ÜÜ )
(
ÜÜ) *
n
ÜÜ* +
)
ÜÜ+ ,
&&
ÜÜ- /
n
ÜÜ0 1
.
ÜÜ1 2
Value
ÜÜ2 7
.
ÜÜ7 8
Length
ÜÜ8 >
==
ÜÜ? A
$num
ÜÜB C
;
ÜÜC D
}
áá 	
internal
ââ 
static
ââ 
string
ââ  
GetNamespacePrefix
ââ 1
(
ââ1 2
XmlAttribute
ââ2 >
a
ââ? @
)
ââ@ A
{
ää 	
Debug
ãã 
.
ãã 
Assert
ãã 
(
ãã 
IsNamespaceNode
ãã (
(
ãã( )
a
ãã) *
)
ãã* +
||
ãã, . 
IsXmlNamespaceNode
ãã/ A
(
ããA B
a
ããB C
)
ããC D
)
ããD E
;
ããE F
return
åå 
a
åå 
.
åå 
Prefix
åå 
.
åå 
Length
åå "
==
åå# %
$num
åå& '
?
åå( )
string
åå* 0
.
åå0 1
Empty
åå1 6
:
åå7 8
a
åå9 :
.
åå: ;
	LocalName
åå; D
;
ååD E
}
çç 	
internal
èè 
static
èè 
bool
èè  
HasNamespacePrefix
èè /
(
èè/ 0
XmlAttribute
èè0 <
a
èè= >
,
èè> ?
string
èè@ F
nsPrefix
èèG O
)
èèO P
{
êê 	
return
ëë  
GetNamespacePrefix
ëë %
(
ëë% &
a
ëë& '
)
ëë' (
.
ëë( )
Equals
ëë) /
(
ëë/ 0
nsPrefix
ëë0 8
)
ëë8 9
;
ëë9 :
}
íí 	
internal
îî 
static
îî 
bool
îî )
IsNonRedundantNamespaceDecl
îî 8
(
îî8 9
XmlAttribute
îî9 E
a
îîF G
,
îîG H
XmlAttribute
îîI U+
nearestAncestorWithSamePrefix
îîV s
)
îîs t
{
ïï 	
if
ññ 
(
ññ +
nearestAncestorWithSamePrefix
ññ -
==
ññ. 0
null
ññ1 5
)
ññ5 6
return
óó 
!
óó )
IsEmptyDefaultNamespaceNode
óó 3
(
óó3 4
a
óó4 5
)
óó5 6
;
óó6 7
else
òò 
return
ôô 
!
ôô +
nearestAncestorWithSamePrefix
ôô 5
.
ôô5 6
Value
ôô6 ;
.
ôô; <
Equals
ôô< B
(
ôôB C
a
ôôC D
.
ôôD E
Value
ôôE J
)
ôôJ K
;
ôôK L
}
öö 	
internal
úú 
static
úú 
bool
úú '
IsXmlPrefixDefinitionNode
úú 6
(
úú6 7
XmlAttribute
úú7 C
a
úúD E
)
úúE F
{
ùù 	
return
ûû 
false
ûû 
;
ûû 
}
†† 	
internal
¢¢ 
static
¢¢ 
string
¢¢  
DiscardWhiteSpaces
¢¢ 1
(
¢¢1 2
string
¢¢2 8
inputBuffer
¢¢9 D
)
¢¢D E
{
££ 	
return
§§  
DiscardWhiteSpaces
§§ %
(
§§% &
inputBuffer
§§& 1
,
§§1 2
$num
§§3 4
,
§§4 5
inputBuffer
§§6 A
.
§§A B
Length
§§B H
)
§§H I
;
§§I J
}
•• 	
internal
®® 
static
®® 
string
®®  
DiscardWhiteSpaces
®® 1
(
®®1 2
string
®®2 8
inputBuffer
®®9 D
,
®®D E
int
®®F I
inputOffset
®®J U
,
®®U V
int
®®W Z

inputCount
®®[ e
)
®®e f
{
©© 	
int
™™ 
i
™™ 
,
™™ 
iCount
™™ 
=
™™ 
$num
™™ 
;
™™ 
for
´´ 
(
´´ 
i
´´ 
=
´´ 
$num
´´ 
;
´´ 
i
´´ 
<
´´ 

inputCount
´´ &
;
´´& '
i
´´( )
++
´´) +
)
´´+ ,
if
¨¨ 
(
¨¨ 
char
¨¨ 
.
¨¨ 
IsWhiteSpace
¨¨ %
(
¨¨% &
inputBuffer
¨¨& 1
[
¨¨1 2
inputOffset
¨¨2 =
+
¨¨> ?
i
¨¨@ A
]
¨¨A B
)
¨¨B C
)
¨¨C D
iCount
¨¨E K
++
¨¨K M
;
¨¨M N
char
≠≠ 
[
≠≠ 
]
≠≠ 
rgbOut
≠≠ 
=
≠≠ 
new
≠≠ 
char
≠≠  $
[
≠≠$ %

inputCount
≠≠% /
-
≠≠0 1
iCount
≠≠2 8
]
≠≠8 9
;
≠≠9 :
iCount
ÆÆ 
=
ÆÆ 
$num
ÆÆ 
;
ÆÆ 
for
ØØ 
(
ØØ 
i
ØØ 
=
ØØ 
$num
ØØ 
;
ØØ 
i
ØØ 
<
ØØ 

inputCount
ØØ &
;
ØØ& '
i
ØØ( )
++
ØØ) +
)
ØØ+ ,
if
∞∞ 
(
∞∞ 
!
∞∞ 
char
∞∞ 
.
∞∞ 
IsWhiteSpace
∞∞ &
(
∞∞& '
inputBuffer
∞∞' 2
[
∞∞2 3
inputOffset
∞∞3 >
+
∞∞? @
i
∞∞A B
]
∞∞B C
)
∞∞C D
)
∞∞D E
{
±± 
rgbOut
≤≤ 
[
≤≤ 
iCount
≤≤ !
++
≤≤! #
]
≤≤# $
=
≤≤% &
inputBuffer
≤≤' 2
[
≤≤2 3
inputOffset
≤≤3 >
+
≤≤? @
i
≤≤A B
]
≤≤B C
;
≤≤C D
}
≥≥ 
return
¥¥ 
new
¥¥ 
string
¥¥ 
(
¥¥ 
rgbOut
¥¥ $
)
¥¥$ %
;
¥¥% &
}
µµ 	
internal
∑∑ 
static
∑∑ 
void
∑∑ %
SBReplaceCharWithString
∑∑ 4
(
∑∑4 5
StringBuilder
∑∑5 B
sb
∑∑C E
,
∑∑E F
char
∑∑G K
oldChar
∑∑L S
,
∑∑S T
string
∑∑U [
	newString
∑∑\ e
)
∑∑e f
{
∏∏ 	
int
ππ 
i
ππ 
=
ππ 
$num
ππ 
;
ππ 
int
∫∫ 
newStringLength
∫∫ 
=
∫∫  !
	newString
∫∫" +
.
∫∫+ ,
Length
∫∫, 2
;
∫∫2 3
while
ªª 
(
ªª 
i
ªª 
<
ªª 
sb
ªª 
.
ªª 
Length
ªª  
)
ªª  !
{
ºº 
if
ΩΩ 
(
ΩΩ 
sb
ΩΩ 
[
ΩΩ 
i
ΩΩ 
]
ΩΩ 
==
ΩΩ 
oldChar
ΩΩ $
)
ΩΩ$ %
{
ææ 
sb
øø 
.
øø 
Remove
øø 
(
øø 
i
øø 
,
øø  
$num
øø! "
)
øø" #
;
øø# $
sb
¿¿ 
.
¿¿ 
Insert
¿¿ 
(
¿¿ 
i
¿¿ 
,
¿¿  
	newString
¿¿! *
)
¿¿* +
;
¿¿+ ,
i
¡¡ 
+=
¡¡ 
newStringLength
¡¡ (
;
¡¡( )
}
¬¬ 
else
√√ 
i
√√ 
++
√√ 
;
√√ 
}
ƒƒ 
}
≈≈ 	
internal
«« 
static
«« 
	XmlReader
«« !#
PreProcessStreamInput
««" 7
(
««7 8
Stream
««8 >
inputStream
««? J
,
««J K
XmlResolver
««L W
xmlResolver
««X c
,
««c d
string
««e k
baseUri
««l s
)
««s t
{
»» 	
XmlReaderSettings
…… 
settings
…… &
=
……' ((
GetSecureXmlReaderSettings
……) C
(
……C D
xmlResolver
……D O
)
……O P
;
……P Q
	XmlReader
   
reader
   
=
   
	XmlReader
   (
.
  ( )
Create
  ) /
(
  / 0
inputStream
  0 ;
,
  ; <
settings
  = E
,
  E F
baseUri
  G N
)
  N O
;
  O P
return
ÀÀ 
reader
ÀÀ 
;
ÀÀ 
}
ÃÃ 	
internal
ŒŒ 
static
ŒŒ 
XmlReaderSettings
ŒŒ )(
GetSecureXmlReaderSettings
ŒŒ* D
(
ŒŒD E
XmlResolver
ŒŒE P
xmlResolver
ŒŒQ \
)
ŒŒ\ ]
{
œœ 	
XmlReaderSettings
–– 
settings
–– &
=
––' (
new
––) ,
XmlReaderSettings
––- >
(
––> ?
)
––? @
;
––@ A
settings
—— 
.
—— 
XmlResolver
——  
=
——! "
xmlResolver
——# .
;
——. /
settings
““ 
.
““ 
DtdProcessing
““ "
=
““# $
DtdProcessing
““% 2
.
““2 3
Parse
““3 8
;
““8 9
settings
”” 
.
”” '
MaxCharactersFromEntities
”” .
=
””/ 0'
MaxCharactersFromEntities
””1 J
;
””J K
settings
‘‘ 
.
‘‘ %
MaxCharactersInDocument
‘‘ ,
=
‘‘- .%
MaxCharactersInDocument
‘‘/ F
;
‘‘F G
return
’’ 
settings
’’ 
;
’’ 
}
÷÷ 	
internal
ÿÿ 
static
ÿÿ 
XmlDocument
ÿÿ #%
PreProcessDocumentInput
ÿÿ$ ;
(
ÿÿ; <
XmlDocument
ÿÿ< G
document
ÿÿH P
,
ÿÿP Q
XmlResolver
ÿÿR ]
xmlResolver
ÿÿ^ i
,
ÿÿi j
string
ÿÿk q
baseUri
ÿÿr y
)
ÿÿy z
{
ŸŸ 	
if
⁄⁄ 
(
⁄⁄ 
document
⁄⁄ 
==
⁄⁄ 
null
⁄⁄  
)
⁄⁄  !
throw
€€ 
new
€€ #
ArgumentNullException
€€ /
(
€€/ 0
nameof
€€0 6
(
€€6 7
document
€€7 ?
)
€€? @
)
€€@ A
;
€€A B
MyXmlDocument
›› 
doc
›› 
=
›› 
new
››  #
MyXmlDocument
››$ 1
(
››1 2
)
››2 3
;
››3 4
doc
ﬁﬁ 
.
ﬁﬁ  
PreserveWhitespace
ﬁﬁ "
=
ﬁﬁ# $
document
ﬁﬁ% -
.
ﬁﬁ- . 
PreserveWhitespace
ﬁﬁ. @
;
ﬁﬁ@ A
using
·· 
(
·· 

TextReader
·· 
stringReader
·· *
=
··+ ,
new
··- 0
StringReader
··1 =
(
··= >
document
··> F
.
··F G
OuterXml
··G O
)
··O P
)
··P Q
{
‚‚ 
XmlReaderSettings
„„ !
settings
„„" *
=
„„+ ,
new
„„- 0
XmlReaderSettings
„„1 B
(
„„B C
)
„„C D
;
„„D E
settings
‰‰ 
.
‰‰ 
XmlResolver
‰‰ $
=
‰‰% &
xmlResolver
‰‰' 2
;
‰‰2 3
settings
ÂÂ 
.
ÂÂ 
DtdProcessing
ÂÂ &
=
ÂÂ' (
DtdProcessing
ÂÂ) 6
.
ÂÂ6 7
Parse
ÂÂ7 <
;
ÂÂ< =
settings
ÊÊ 
.
ÊÊ '
MaxCharactersFromEntities
ÊÊ 2
=
ÊÊ3 4'
MaxCharactersFromEntities
ÊÊ5 N
;
ÊÊN O
settings
ÁÁ 
.
ÁÁ %
MaxCharactersInDocument
ÁÁ 0
=
ÁÁ1 2%
MaxCharactersInDocument
ÁÁ3 J
;
ÁÁJ K
	XmlReader
ËË 
reader
ËË  
=
ËË! "
	XmlReader
ËË# ,
.
ËË, -
Create
ËË- 3
(
ËË3 4
stringReader
ËË4 @
,
ËË@ A
settings
ËËB J
,
ËËJ K
baseUri
ËËL S
)
ËËS T
;
ËËT U
doc
ÈÈ 
.
ÈÈ 
Load
ÈÈ 
(
ÈÈ 
reader
ÈÈ 
)
ÈÈ  
;
ÈÈ  !
}
ÍÍ 
return
ÎÎ 
doc
ÎÎ 
;
ÎÎ 
}
ÏÏ 	
internal
ÓÓ 
static
ÓÓ 
XmlDocument
ÓÓ #$
PreProcessElementInput
ÓÓ$ :
(
ÓÓ: ;

XmlElement
ÓÓ; E
elem
ÓÓF J
,
ÓÓJ K
XmlResolver
ÓÓL W
xmlResolver
ÓÓX c
,
ÓÓc d
string
ÓÓe k
baseUri
ÓÓl s
)
ÓÓs t
{
ÔÔ 	
if
 
(
 
elem
 
==
 
null
 
)
 
throw
ÒÒ 
new
ÒÒ #
ArgumentNullException
ÒÒ /
(
ÒÒ/ 0
nameof
ÒÒ0 6
(
ÒÒ6 7
elem
ÒÒ7 ;
)
ÒÒ; <
)
ÒÒ< =
;
ÒÒ= >
MyXmlDocument
ÛÛ 
doc
ÛÛ 
=
ÛÛ 
new
ÛÛ  #
MyXmlDocument
ÛÛ$ 1
(
ÛÛ1 2
)
ÛÛ2 3
;
ÛÛ3 4
doc
ÙÙ 
.
ÙÙ  
PreserveWhitespace
ÙÙ "
=
ÙÙ# $
true
ÙÙ% )
;
ÙÙ) *
using
ˆˆ 
(
ˆˆ 

TextReader
ˆˆ 
stringReader
ˆˆ *
=
ˆˆ+ ,
new
ˆˆ- 0
StringReader
ˆˆ1 =
(
ˆˆ= >
elem
ˆˆ> B
.
ˆˆB C
OuterXml
ˆˆC K
)
ˆˆK L
)
ˆˆL M
{
˜˜ 
XmlReaderSettings
¯¯ !
settings
¯¯" *
=
¯¯+ ,
new
¯¯- 0
XmlReaderSettings
¯¯1 B
(
¯¯B C
)
¯¯C D
;
¯¯D E
settings
˘˘ 
.
˘˘ 
XmlResolver
˘˘ $
=
˘˘% &
xmlResolver
˘˘' 2
;
˘˘2 3
settings
˙˙ 
.
˙˙ 
DtdProcessing
˙˙ &
=
˙˙' (
DtdProcessing
˙˙) 6
.
˙˙6 7
Parse
˙˙7 <
;
˙˙< =
settings
˚˚ 
.
˚˚ '
MaxCharactersFromEntities
˚˚ 2
=
˚˚3 4'
MaxCharactersFromEntities
˚˚5 N
;
˚˚N O
settings
¸¸ 
.
¸¸ %
MaxCharactersInDocument
¸¸ 0
=
¸¸1 2%
MaxCharactersInDocument
¸¸3 J
;
¸¸J K
	XmlReader
˝˝ 
reader
˝˝  
=
˝˝! "
	XmlReader
˝˝# ,
.
˝˝, -
Create
˝˝- 3
(
˝˝3 4
stringReader
˝˝4 @
,
˝˝@ A
settings
˝˝B J
,
˝˝J K
baseUri
˝˝L S
)
˝˝S T
;
˝˝T U
doc
˛˛ 
.
˛˛ 
Load
˛˛ 
(
˛˛ 
reader
˛˛ 
)
˛˛  
;
˛˛  !
}
ˇˇ 
return
ÄÄ 
doc
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
internal
ÉÉ 
static
ÉÉ 
XmlDocument
ÉÉ #
DiscardComments
ÉÉ$ 3
(
ÉÉ3 4
XmlDocument
ÉÉ4 ?
document
ÉÉ@ H
)
ÉÉH I
{
ÑÑ 	
XmlNodeList
ÖÖ 
nodeList
ÖÖ  
=
ÖÖ! "
document
ÖÖ# +
.
ÖÖ+ ,
SelectNodes
ÖÖ, 7
(
ÖÖ7 8
$str
ÖÖ8 E
)
ÖÖE F
;
ÖÖF G
if
ÜÜ 
(
ÜÜ 
nodeList
ÜÜ 
!=
ÜÜ 
null
ÜÜ  
)
ÜÜ  !
{
áá 
foreach
àà 
(
àà 
XmlNode
àà  
node1
àà! &
in
àà' )
nodeList
àà* 2
)
àà2 3
{
ââ 
node1
ää 
.
ää 

ParentNode
ää $
.
ää$ %
RemoveChild
ää% 0
(
ää0 1
node1
ää1 6
)
ää6 7
;
ää7 8
}
ãã 
}
åå 
return
çç 
document
çç 
;
çç 
}
éé 	
internal
êê 
static
êê 
XmlNodeList
êê # 
AllDescendantNodes
êê$ 6
(
êê6 7
XmlNode
êê7 >
node
êê? C
,
êêC D
bool
êêE I
includeComments
êêJ Y
)
êêY Z
{
ëë 	"
CanonicalXmlNodeList
íí  
nodeList
íí! )
=
íí* +
new
íí, /"
CanonicalXmlNodeList
íí0 D
(
ííD E
)
ííE F
;
ííF G"
CanonicalXmlNodeList
ìì  
elementList
ìì! ,
=
ìì- .
new
ìì/ 2"
CanonicalXmlNodeList
ìì3 G
(
ììG H
)
ììH I
;
ììI J"
CanonicalXmlNodeList
îî  

attribList
îî! +
=
îî, -
new
îî. 1"
CanonicalXmlNodeList
îî2 F
(
îîF G
)
îîG H
;
îîH I"
CanonicalXmlNodeList
ïï  
namespaceList
ïï! .
=
ïï/ 0
new
ïï1 4"
CanonicalXmlNodeList
ïï5 I
(
ïïI J
)
ïïJ K
;
ïïK L
int
óó 
index
óó 
=
óó 
$num
óó 
;
óó 
elementList
òò 
.
òò 
Add
òò 
(
òò 
node
òò  
)
òò  !
;
òò! "
do
öö 
{
õõ 
XmlNode
úú 
rootNode
úú  
=
úú! "
(
úú# $
XmlNode
úú$ +
)
úú+ ,
elementList
úú, 7
[
úú7 8
index
úú8 =
]
úú= >
;
úú> ?
XmlNodeList
ûû 

childNodes
ûû &
=
ûû' (
rootNode
ûû) 1
.
ûû1 2

ChildNodes
ûû2 <
;
ûû< =
if
üü 
(
üü 

childNodes
üü 
!=
üü !
null
üü" &
)
üü& '
{
†† 
foreach
°° 
(
°° 
XmlNode
°° $
node1
°°% *
in
°°+ -

childNodes
°°. 8
)
°°8 9
{
¢¢ 
if
££ 
(
££ 
includeComments
££ +
||
££, .
(
££/ 0
!
££0 1
(
££1 2
node1
££2 7
is
££8 :

XmlComment
££; E
)
££E F
)
££F G
)
££G H
{
§§ 
elementList
•• '
.
••' (
Add
••( +
(
••+ ,
node1
••, 1
)
••1 2
;
••2 3
}
¶¶ 
}
ßß 
}
®® $
XmlAttributeCollection
™™ &
attribNodes
™™' 2
=
™™3 4
rootNode
™™5 =
.
™™= >

Attributes
™™> H
;
™™H I
if
´´ 
(
´´ 
attribNodes
´´ 
!=
´´  "
null
´´# '
)
´´' (
{
¨¨ 
foreach
≠≠ 
(
≠≠ 
XmlNode
≠≠ $

attribNode
≠≠% /
in
≠≠0 2
rootNode
≠≠3 ;
.
≠≠; <

Attributes
≠≠< F
)
≠≠F G
{
ÆÆ 
if
ØØ 
(
ØØ 

attribNode
ØØ &
.
ØØ& '
	LocalName
ØØ' 0
==
ØØ1 3
$str
ØØ4 ;
||
ØØ< >

attribNode
ØØ? I
.
ØØI J
Prefix
ØØJ P
==
ØØQ S
$str
ØØT [
)
ØØ[ \
namespaceList
∞∞ )
.
∞∞) *
Add
∞∞* -
(
∞∞- .

attribNode
∞∞. 8
)
∞∞8 9
;
∞∞9 :
else
±± 

attribList
≤≤ &
.
≤≤& '
Add
≤≤' *
(
≤≤* +

attribNode
≤≤+ 5
)
≤≤5 6
;
≤≤6 7
}
≥≥ 
}
¥¥ 
index
µµ 
++
µµ 
;
µµ 
}
∂∂ 
while
∂∂ 
(
∂∂ 
index
∂∂ 
<
∂∂ 
elementList
∂∂ (
.
∂∂( )
Count
∂∂) .
)
∂∂. /
;
∂∂/ 0
foreach
∑∑ 
(
∑∑ 
XmlNode
∑∑ 
elementNode
∑∑ (
in
∑∑) +
elementList
∑∑, 7
)
∑∑7 8
{
∏∏ 
nodeList
ππ 
.
ππ 
Add
ππ 
(
ππ 
elementNode
ππ (
)
ππ( )
;
ππ) *
}
∫∫ 
foreach
ªª 
(
ªª 
XmlNode
ªª 

attribNode
ªª '
in
ªª( *

attribList
ªª+ 5
)
ªª5 6
{
ºº 
nodeList
ΩΩ 
.
ΩΩ 
Add
ΩΩ 
(
ΩΩ 

attribNode
ΩΩ '
)
ΩΩ' (
;
ΩΩ( )
}
ææ 
foreach
øø 
(
øø 
XmlNode
øø 
namespaceNode
øø *
in
øø+ -
namespaceList
øø. ;
)
øø; <
{
¿¿ 
nodeList
¡¡ 
.
¡¡ 
Add
¡¡ 
(
¡¡ 
namespaceNode
¡¡ *
)
¡¡* +
;
¡¡+ ,
}
¬¬ 
return
ƒƒ 
nodeList
ƒƒ 
;
ƒƒ 
}
≈≈ 	
internal
«« 
static
«« 
bool
«« 

NodeInList
«« '
(
««' (
XmlNode
««( /
node
««0 4
,
««4 5
XmlNodeList
««6 A
nodeList
««B J
)
««J K
{
»» 	
foreach
…… 
(
…… 
XmlNode
…… 
nodeElem
…… %
in
……& (
nodeList
……) 1
)
……1 2
{
   
if
ÀÀ 
(
ÀÀ 
nodeElem
ÀÀ 
==
ÀÀ 
node
ÀÀ  $
)
ÀÀ$ %
return
ÀÀ& ,
true
ÀÀ- 1
;
ÀÀ1 2
}
ÃÃ 
return
ÕÕ 
false
ÕÕ 
;
ÕÕ 
}
ŒŒ 	
internal
–– 
static
–– 
string
–– 
GetIdFromLocalUri
–– 0
(
––0 1
string
––1 7
uri
––8 ;
,
––; <
out
––= @
bool
––A E
discardComments
––F U
)
––U V
{
—— 	
string
““ 
idref
““ 
=
““ 
uri
““ 
.
““ 
	Substring
““ (
(
““( )
$num
““) *
)
““* +
;
““+ ,
discardComments
‘‘ 
=
‘‘ 
true
‘‘ "
;
‘‘" #
if
◊◊ 
(
◊◊ 
idref
◊◊ 
.
◊◊ 

StartsWith
◊◊  
(
◊◊  !
$str
◊◊! /
,
◊◊/ 0
StringComparison
◊◊1 A
.
◊◊A B
Ordinal
◊◊B I
)
◊◊I J
)
◊◊J K
{
ÿÿ 
int
ŸŸ 
startId
ŸŸ 
=
ŸŸ 
idref
ŸŸ #
.
ŸŸ# $
IndexOf
ŸŸ$ +
(
ŸŸ+ ,
$str
ŸŸ, 1
,
ŸŸ1 2
StringComparison
ŸŸ3 C
.
ŸŸC D
Ordinal
ŸŸD K
)
ŸŸK L
;
ŸŸL M
int
⁄⁄ 
endId
⁄⁄ 
=
⁄⁄ 
idref
⁄⁄ !
.
⁄⁄! "
IndexOf
⁄⁄" )
(
⁄⁄) *
$str
⁄⁄* -
,
⁄⁄- .
StringComparison
⁄⁄/ ?
.
⁄⁄? @
Ordinal
⁄⁄@ G
)
⁄⁄G H
;
⁄⁄H I
if
€€ 
(
€€ 
endId
€€ 
<
€€ 
$num
€€ 
||
€€  
endId
€€! &
<
€€' (
startId
€€) 0
+
€€1 2
$num
€€3 4
)
€€4 5
throw
‹‹ 
new
‹‹ 
System
‹‹ $
.
‹‹$ %
Security
‹‹% -
.
‹‹- .
Cryptography
‹‹. :
.
‹‹: ;$
CryptographicException
‹‹; Q
(
‹‹Q R
SR
‹‹R T
.
‹‹T U/
!Cryptography_Xml_InvalidReference
‹‹U v
)
‹‹v w
;
‹‹w x
idref
›› 
=
›› 
idref
›› 
.
›› 
	Substring
›› '
(
››' (
startId
››( /
+
››0 1
$num
››2 3
,
››3 4
endId
››5 :
-
››; <
startId
››= D
-
››E F
$num
››G H
)
››H I
;
››I J
idref
ﬁﬁ 
=
ﬁﬁ 
idref
ﬁﬁ 
.
ﬁﬁ 
Replace
ﬁﬁ %
(
ﬁﬁ% &
$str
ﬁﬁ& *
,
ﬁﬁ* +
$str
ﬁﬁ, .
)
ﬁﬁ. /
;
ﬁﬁ/ 0
idref
ﬂﬂ 
=
ﬂﬂ 
idref
ﬂﬂ 
.
ﬂﬂ 
Replace
ﬂﬂ %
(
ﬂﬂ% &
$str
ﬂﬂ& *
,
ﬂﬂ* +
$str
ﬂﬂ, .
)
ﬂﬂ. /
;
ﬂﬂ/ 0
discardComments
‡‡ 
=
‡‡  !
false
‡‡" '
;
‡‡' (
}
·· 
return
‚‚ 
idref
‚‚ 
;
‚‚ 
}
„„ 	
internal
ÂÂ 
static
ÂÂ 
string
ÂÂ #
ExtractIdFromLocalUri
ÂÂ 4
(
ÂÂ4 5
string
ÂÂ5 ;
uri
ÂÂ< ?
)
ÂÂ? @
{
ÊÊ 	
string
ÁÁ 
idref
ÁÁ 
=
ÁÁ 
uri
ÁÁ 
.
ÁÁ 
	Substring
ÁÁ (
(
ÁÁ( )
$num
ÁÁ) *
)
ÁÁ* +
;
ÁÁ+ ,
if
ÍÍ 
(
ÍÍ 
idref
ÍÍ 
.
ÍÍ 

StartsWith
ÍÍ  
(
ÍÍ  !
$str
ÍÍ! /
,
ÍÍ/ 0
StringComparison
ÍÍ1 A
.
ÍÍA B
Ordinal
ÍÍB I
)
ÍÍI J
)
ÍÍJ K
{
ÎÎ 
int
ÏÏ 
startId
ÏÏ 
=
ÏÏ 
idref
ÏÏ #
.
ÏÏ# $
IndexOf
ÏÏ$ +
(
ÏÏ+ ,
$str
ÏÏ, 1
,
ÏÏ1 2
StringComparison
ÏÏ3 C
.
ÏÏC D
Ordinal
ÏÏD K
)
ÏÏK L
;
ÏÏL M
int
ÌÌ 
endId
ÌÌ 
=
ÌÌ 
idref
ÌÌ !
.
ÌÌ! "
IndexOf
ÌÌ" )
(
ÌÌ) *
$str
ÌÌ* -
,
ÌÌ- .
StringComparison
ÌÌ/ ?
.
ÌÌ? @
Ordinal
ÌÌ@ G
)
ÌÌG H
;
ÌÌH I
if
ÓÓ 
(
ÓÓ 
endId
ÓÓ 
<
ÓÓ 
$num
ÓÓ 
||
ÓÓ  
endId
ÓÓ! &
<
ÓÓ' (
startId
ÓÓ) 0
+
ÓÓ1 2
$num
ÓÓ3 4
)
ÓÓ4 5
throw
ÔÔ 
new
ÔÔ 
System
ÔÔ $
.
ÔÔ$ %
Security
ÔÔ% -
.
ÔÔ- .
Cryptography
ÔÔ. :
.
ÔÔ: ;$
CryptographicException
ÔÔ; Q
(
ÔÔQ R
SR
ÔÔR T
.
ÔÔT U/
!Cryptography_Xml_InvalidReference
ÔÔU v
)
ÔÔv w
;
ÔÔw x
idref
 
=
 
idref
 
.
 
	Substring
 '
(
' (
startId
( /
+
0 1
$num
2 3
,
3 4
endId
5 :
-
; <
startId
= D
-
E F
$num
G H
)
H I
;
I J
idref
ÒÒ 
=
ÒÒ 
idref
ÒÒ 
.
ÒÒ 
Replace
ÒÒ %
(
ÒÒ% &
$str
ÒÒ& *
,
ÒÒ* +
$str
ÒÒ, .
)
ÒÒ. /
;
ÒÒ/ 0
idref
ÚÚ 
=
ÚÚ 
idref
ÚÚ 
.
ÚÚ 
Replace
ÚÚ %
(
ÚÚ% &
$str
ÚÚ& *
,
ÚÚ* +
$str
ÚÚ, .
)
ÚÚ. /
;
ÚÚ/ 0
}
ÛÛ 
return
ÙÙ 
idref
ÙÙ 
;
ÙÙ 
}
ıı 	
internal
¯¯ 
static
¯¯ 
void
¯¯ 
RemoveAllChildren
¯¯ .
(
¯¯. /

XmlElement
¯¯/ 9
inputElement
¯¯: F
)
¯¯F G
{
˘˘ 	
XmlNode
˙˙ 
child
˙˙ 
=
˙˙ 
inputElement
˙˙ (
.
˙˙( )

FirstChild
˙˙) 3
;
˙˙3 4
XmlNode
˚˚ 
sibling
˚˚ 
=
˚˚ 
null
˚˚ "
;
˚˚" #
while
˝˝ 
(
˝˝ 
child
˝˝ 
!=
˝˝ 
null
˝˝  
)
˝˝  !
{
˛˛ 
sibling
ˇˇ 
=
ˇˇ 
child
ˇˇ 
.
ˇˇ  
NextSibling
ˇˇ  +
;
ˇˇ+ ,
inputElement
ÄÄ 
.
ÄÄ 
RemoveChild
ÄÄ (
(
ÄÄ( )
child
ÄÄ) .
)
ÄÄ. /
;
ÄÄ/ 0
child
ÅÅ 
=
ÅÅ 
sibling
ÅÅ 
;
ÅÅ  
}
ÇÇ 
}
ÉÉ 	
internal
ââ 
static
ââ 
long
ââ 
Pump
ââ !
(
ââ! "
Stream
ââ" (
input
ââ) .
,
ââ. /
Stream
ââ0 6
output
ââ7 =
)
ââ= >
{
ää 	
MemoryStream
åå 
inputMS
åå  
=
åå! "
input
åå# (
as
åå) +
MemoryStream
åå, 8
;
åå8 9
if
çç 
(
çç 
inputMS
çç 
!=
çç 
null
çç 
&&
çç  "
inputMS
çç# *
.
çç* +
Position
çç+ 3
==
çç4 6
$num
çç7 8
)
çç8 9
{
éé 
inputMS
èè 
.
èè 
WriteTo
èè 
(
èè  
output
èè  &
)
èè& '
;
èè' (
return
êê 
inputMS
êê 
.
êê 
Length
êê %
;
êê% &
}
ëë 
const
ìì 
int
ìì 
count
ìì 
=
ìì 
$num
ìì "
;
ìì" #
byte
îî 
[
îî 
]
îî 
bytes
îî 
=
îî 
new
îî 
byte
îî #
[
îî# $
count
îî$ )
]
îî) *
;
îî* +
int
ïï 
numBytes
ïï 
;
ïï 
long
ññ 

totalBytes
ññ 
=
ññ 
$num
ññ 
;
ññ  
while
òò 
(
òò 
(
òò 
numBytes
òò 
=
òò 
input
òò $
.
òò$ %
Read
òò% )
(
òò) *
bytes
òò* /
,
òò/ 0
$num
òò1 2
,
òò2 3
count
òò4 9
)
òò9 :
)
òò: ;
>
òò< =
$num
òò> ?
)
òò? @
{
ôô 
output
öö 
.
öö 
Write
öö 
(
öö 
bytes
öö "
,
öö" #
$num
öö$ %
,
öö% &
numBytes
öö' /
)
öö/ 0
;
öö0 1

totalBytes
õõ 
+=
õõ 
numBytes
õõ &
;
õõ& '
}
úú 
return
ûû 

totalBytes
ûû 
;
ûû 
}
üü 	
internal
°° 
static
°° 
	Hashtable
°° !&
TokenizePrefixListString
°°" :
(
°°: ;
string
°°; A
s
°°B C
)
°°C D
{
¢¢ 	
	Hashtable
££ 
set
££ 
=
££ 
new
££ 
	Hashtable
££  )
(
££) *
)
££* +
;
££+ ,
if
§§ 
(
§§ 
s
§§ 
!=
§§ 
null
§§ 
)
§§ 
{
•• 
string
¶¶ 
[
¶¶ 
]
¶¶ 
prefixes
¶¶ !
=
¶¶" #
s
¶¶$ %
.
¶¶% &
Split
¶¶& +
(
¶¶+ ,
null
¶¶, 0
)
¶¶0 1
;
¶¶1 2
foreach
ßß 
(
ßß 
string
ßß 
prefix
ßß  &
in
ßß' )
prefixes
ßß* 2
)
ßß2 3
{
®® 
if
©© 
(
©© 
prefix
©© 
.
©© 
Equals
©© %
(
©©% &
$str
©©& 0
)
©©0 1
)
©©1 2
{
™™ 
set
´´ 
.
´´ 
Add
´´ 
(
´´  
string
´´  &
.
´´& '
Empty
´´' ,
,
´´, -
true
´´. 2
)
´´2 3
;
´´3 4
}
¨¨ 
else
≠≠ 
if
≠≠ 
(
≠≠ 
prefix
≠≠ #
.
≠≠# $
Length
≠≠$ *
>
≠≠+ ,
$num
≠≠- .
)
≠≠. /
{
ÆÆ 
set
ØØ 
.
ØØ 
Add
ØØ 
(
ØØ  
prefix
ØØ  &
,
ØØ& '
true
ØØ( ,
)
ØØ, -
;
ØØ- .
}
∞∞ 
}
±± 
}
≤≤ 
return
≥≥ 
set
≥≥ 
;
≥≥ 
}
¥¥ 	
internal
∂∂ 
static
∂∂ 
string
∂∂ "
EscapeWhitespaceData
∂∂ 3
(
∂∂3 4
string
∂∂4 :
data
∂∂; ?
)
∂∂? @
{
∑∑ 	
StringBuilder
∏∏ 
sb
∏∏ 
=
∏∏ 
new
∏∏ "
StringBuilder
∏∏# 0
(
∏∏0 1
)
∏∏1 2
;
∏∏2 3
sb
ππ 
.
ππ 
Append
ππ 
(
ππ 
data
ππ 
)
ππ 
;
ππ 
Utils
∫∫ 
.
∫∫ %
SBReplaceCharWithString
∫∫ )
(
∫∫) *
sb
∫∫* ,
,
∫∫, -
(
∫∫. /
char
∫∫/ 3
)
∫∫3 4
$num
∫∫4 6
,
∫∫6 7
$str
∫∫8 ?
)
∫∫? @
;
∫∫@ A
return
ªª 
sb
ªª 
.
ªª 
ToString
ªª 
(
ªª 
)
ªª  
;
ªª  !
;
ªª" #
}
ºº 	
internal
ææ 
static
ææ 
string
ææ 
EscapeTextData
ææ -
(
ææ- .
string
ææ. 4
data
ææ5 9
)
ææ9 :
{
øø 	
StringBuilder
¿¿ 
sb
¿¿ 
=
¿¿ 
new
¿¿ "
StringBuilder
¿¿# 0
(
¿¿0 1
)
¿¿1 2
;
¿¿2 3
sb
¡¡ 
.
¡¡ 
Append
¡¡ 
(
¡¡ 
data
¡¡ 
)
¡¡ 
;
¡¡ 
sb
¬¬ 
.
¬¬ 
Replace
¬¬ 
(
¬¬ 
$str
¬¬ 
,
¬¬ 
$str
¬¬ #
)
¬¬# $
;
¬¬$ %
sb
√√ 
.
√√ 
Replace
√√ 
(
√√ 
$str
√√ 
,
√√ 
$str
√√ "
)
√√" #
;
√√# $
sb
ƒƒ 
.
ƒƒ 
Replace
ƒƒ 
(
ƒƒ 
$str
ƒƒ 
,
ƒƒ 
$str
ƒƒ "
)
ƒƒ" #
;
ƒƒ# $%
SBReplaceCharWithString
≈≈ #
(
≈≈# $
sb
≈≈$ &
,
≈≈& '
(
≈≈( )
char
≈≈) -
)
≈≈- .
$num
≈≈. 0
,
≈≈0 1
$str
≈≈2 9
)
≈≈9 :
;
≈≈: ;
return
∆∆ 
sb
∆∆ 
.
∆∆ 
ToString
∆∆ 
(
∆∆ 
)
∆∆  
;
∆∆  !
;
∆∆" #
}
«« 	
internal
…… 
static
…… 
string
…… 
EscapeCData
…… *
(
……* +
string
……+ 1
data
……2 6
)
……6 7
{
   	
return
ÀÀ 
EscapeTextData
ÀÀ !
(
ÀÀ! "
data
ÀÀ" &
)
ÀÀ& '
;
ÀÀ' (
}
ÃÃ 	
internal
ŒŒ 
static
ŒŒ 
string
ŒŒ "
EscapeAttributeValue
ŒŒ 3
(
ŒŒ3 4
string
ŒŒ4 :
value
ŒŒ; @
)
ŒŒ@ A
{
œœ 	
StringBuilder
–– 
sb
–– 
=
–– 
new
–– "
StringBuilder
––# 0
(
––0 1
)
––1 2
;
––2 3
sb
—— 
.
—— 
Append
—— 
(
—— 
value
—— 
)
—— 
;
—— 
sb
““ 
.
““ 
Replace
““ 
(
““ 
$str
““ 
,
““ 
$str
““ #
)
““# $
;
““$ %
sb
”” 
.
”” 
Replace
”” 
(
”” 
$str
”” 
,
”” 
$str
”” "
)
””" #
;
””# $
sb
‘‘ 
.
‘‘ 
Replace
‘‘ 
(
‘‘ 
$str
‘‘ 
,
‘‘ 
$str
‘‘ %
)
‘‘% &
;
‘‘& '%
SBReplaceCharWithString
’’ #
(
’’# $
sb
’’$ &
,
’’& '
(
’’( )
char
’’) -
)
’’- .
$num
’’. /
,
’’/ 0
$str
’’1 8
)
’’8 9
;
’’9 :%
SBReplaceCharWithString
÷÷ #
(
÷÷# $
sb
÷÷$ &
,
÷÷& '
(
÷÷( )
char
÷÷) -
)
÷÷- .
$num
÷÷. 0
,
÷÷0 1
$str
÷÷2 9
)
÷÷9 :
;
÷÷: ;%
SBReplaceCharWithString
◊◊ #
(
◊◊# $
sb
◊◊$ &
,
◊◊& '
(
◊◊( )
char
◊◊) -
)
◊◊- .
$num
◊◊. 0
,
◊◊0 1
$str
◊◊2 9
)
◊◊9 :
;
◊◊: ;
return
ÿÿ 
sb
ÿÿ 
.
ÿÿ 
ToString
ÿÿ 
(
ÿÿ 
)
ÿÿ  
;
ÿÿ  !
}
ŸŸ 	
internal
€€ 
static
€€ 
XmlDocument
€€ #
GetOwnerDocument
€€$ 4
(
€€4 5
XmlNodeList
€€5 @
nodeList
€€A I
)
€€I J
{
‹‹ 	
foreach
›› 
(
›› 
XmlNode
›› 
node
›› !
in
››" $
nodeList
››% -
)
››- .
{
ﬁﬁ 
if
ﬂﬂ 
(
ﬂﬂ 
node
ﬂﬂ 
.
ﬂﬂ 
OwnerDocument
ﬂﬂ &
!=
ﬂﬂ' )
null
ﬂﬂ* .
)
ﬂﬂ. /
return
‡‡ 
node
‡‡ 
.
‡‡  
OwnerDocument
‡‡  -
;
‡‡- .
}
·· 
return
‚‚ 
null
‚‚ 
;
‚‚ 
}
„„ 	
internal
ÂÂ 
static
ÂÂ 
void
ÂÂ 
AddNamespaces
ÂÂ *
(
ÂÂ* +

XmlElement
ÂÂ+ 5
elem
ÂÂ6 :
,
ÂÂ: ;"
CanonicalXmlNodeList
ÂÂ< P

namespaces
ÂÂQ [
)
ÂÂ[ \
{
ÊÊ 	
if
ÁÁ 
(
ÁÁ 

namespaces
ÁÁ 
!=
ÁÁ 
null
ÁÁ "
)
ÁÁ" #
{
ËË 
foreach
ÈÈ 
(
ÈÈ 
XmlNode
ÈÈ  
attrib
ÈÈ! '
in
ÈÈ( *

namespaces
ÈÈ+ 5
)
ÈÈ5 6
{
ÍÍ 
string
ÎÎ 
name
ÎÎ 
=
ÎÎ  !
(
ÎÎ" #
(
ÎÎ# $
attrib
ÎÎ$ *
.
ÎÎ* +
Prefix
ÎÎ+ 1
.
ÎÎ1 2
Length
ÎÎ2 8
>
ÎÎ9 :
$num
ÎÎ; <
)
ÎÎ< =
?
ÎÎ> ?
attrib
ÎÎ@ F
.
ÎÎF G
Prefix
ÎÎG M
+
ÎÎN O
$str
ÎÎP S
+
ÎÎT U
attrib
ÎÎV \
.
ÎÎ\ ]
	LocalName
ÎÎ] f
:
ÎÎg h
attrib
ÎÎi o
.
ÎÎo p
	LocalName
ÎÎp y
)
ÎÎy z
;
ÎÎz {
if
ÌÌ 
(
ÌÌ 
elem
ÌÌ 
.
ÌÌ 
HasAttribute
ÌÌ )
(
ÌÌ) *
name
ÌÌ* .
)
ÌÌ. /
||
ÌÌ0 2
(
ÌÌ3 4
name
ÌÌ4 8
.
ÌÌ8 9
Equals
ÌÌ9 ?
(
ÌÌ? @
$str
ÌÌ@ G
)
ÌÌG H
&&
ÌÌI K
elem
ÌÌL P
.
ÌÌP Q
Prefix
ÌÌQ W
.
ÌÌW X
Length
ÌÌX ^
==
ÌÌ_ a
$num
ÌÌb c
)
ÌÌc d
)
ÌÌd e
continue
ÌÌf n
;
ÌÌn o
XmlAttribute
ÓÓ  
nsattrib
ÓÓ! )
=
ÓÓ* +
(
ÓÓ, -
XmlAttribute
ÓÓ- 9
)
ÓÓ9 :
elem
ÓÓ: >
.
ÓÓ> ?
OwnerDocument
ÓÓ? L
.
ÓÓL M
CreateAttribute
ÓÓM \
(
ÓÓ\ ]
name
ÓÓ] a
)
ÓÓa b
;
ÓÓb c
nsattrib
ÔÔ 
.
ÔÔ 
Value
ÔÔ "
=
ÔÔ# $
attrib
ÔÔ% +
.
ÔÔ+ ,
Value
ÔÔ, 1
;
ÔÔ1 2
elem
 
.
 
SetAttributeNode
 )
(
) *
nsattrib
* 2
)
2 3
;
3 4
}
ÒÒ 
}
ÚÚ 
}
ÛÛ 	
internal
ıı 
static
ıı 
void
ıı 
AddNamespaces
ıı *
(
ıı* +

XmlElement
ıı+ 5
elem
ıı6 :
,
ıı: ;
	Hashtable
ıı< E

namespaces
ııF P
)
ııP Q
{
ˆˆ 	
if
˜˜ 
(
˜˜ 

namespaces
˜˜ 
!=
˜˜ 
null
˜˜ "
)
˜˜" #
{
¯¯ 
foreach
˘˘ 
(
˘˘ 
string
˘˘ 
key
˘˘  #
in
˘˘$ &

namespaces
˘˘' 1
.
˘˘1 2
Keys
˘˘2 6
)
˘˘6 7
{
˙˙ 
if
˚˚ 
(
˚˚ 
elem
˚˚ 
.
˚˚ 
HasAttribute
˚˚ )
(
˚˚) *
key
˚˚* -
)
˚˚- .
)
˚˚. /
continue
˚˚0 8
;
˚˚8 9
XmlAttribute
¸¸  
nsattrib
¸¸! )
=
¸¸* +
(
¸¸, -
XmlAttribute
¸¸- 9
)
¸¸9 :
elem
¸¸: >
.
¸¸> ?
OwnerDocument
¸¸? L
.
¸¸L M
CreateAttribute
¸¸M \
(
¸¸\ ]
key
¸¸] `
)
¸¸` a
;
¸¸a b
nsattrib
˝˝ 
.
˝˝ 
Value
˝˝ "
=
˝˝# $

namespaces
˝˝% /
[
˝˝/ 0
key
˝˝0 3
]
˝˝3 4
as
˝˝5 7
string
˝˝8 >
;
˝˝> ?
elem
˛˛ 
.
˛˛ 
SetAttributeNode
˛˛ )
(
˛˛) *
nsattrib
˛˛* 2
)
˛˛2 3
;
˛˛3 4
}
ˇˇ 
}
ÄÄ 
}
ÅÅ 	
internal
ÑÑ 
static
ÑÑ "
CanonicalXmlNodeList
ÑÑ ,%
GetPropagatedAttributes
ÑÑ- D
(
ÑÑD E

XmlElement
ÑÑE O
elem
ÑÑP T
)
ÑÑT U
{
ÖÖ 	
if
ÜÜ 
(
ÜÜ 
elem
ÜÜ 
==
ÜÜ 
null
ÜÜ 
)
ÜÜ 
return
áá 
null
áá 
;
áá "
CanonicalXmlNodeList
ââ  

namespaces
ââ! +
=
ââ, -
new
ââ. 1"
CanonicalXmlNodeList
ââ2 F
(
ââF G
)
ââG H
;
ââH I
XmlNode
ää 
ancestorNode
ää  
=
ää! "
elem
ää# '
;
ää' (
bool
ãã  
bDefNamespaceToAdd
ãã #
=
ãã$ %
true
ãã& *
;
ãã* +
while
çç 
(
çç 
ancestorNode
çç 
!=
çç  "
null
çç# '
)
çç' (
{
éé 

XmlElement
èè 
ancestorElement
èè *
=
èè+ ,
ancestorNode
èè- 9
as
èè: <

XmlElement
èè= G
;
èèG H
if
êê 
(
êê 
ancestorElement
êê #
==
êê$ &
null
êê' +
)
êê+ ,
{
ëë 
ancestorNode
íí  
=
íí! "
ancestorNode
íí# /
.
íí/ 0

ParentNode
íí0 :
;
íí: ;
continue
ìì 
;
ìì 
}
îî 
if
ïï 
(
ïï 
!
ïï 
Utils
ïï 
.
ïï "
IsCommittedNamespace
ïï /
(
ïï/ 0
ancestorElement
ïï0 ?
,
ïï? @
ancestorElement
ïïA P
.
ïïP Q
Prefix
ïïQ W
,
ïïW X
ancestorElement
ïïY h
.
ïïh i
NamespaceURI
ïïi u
)
ïïu v
)
ïïv w
{
ññ 
if
òò 
(
òò 
!
òò 
Utils
òò 
.
òò "
IsRedundantNamespace
òò 3
(
òò3 4
ancestorElement
òò4 C
,
òòC D
ancestorElement
òòE T
.
òòT U
Prefix
òòU [
,
òò[ \
ancestorElement
òò] l
.
òòl m
NamespaceURI
òòm y
)
òòy z
)
òòz {
{
ôô 
string
öö 
name
öö #
=
öö$ %
(
öö& '
(
öö' (
ancestorElement
öö( 7
.
öö7 8
Prefix
öö8 >
.
öö> ?
Length
öö? E
>
ööF G
$num
ööH I
)
ööI J
?
ööK L
$str
ööM U
+
ööV W
ancestorElement
ööX g
.
öög h
Prefix
ööh n
:
ööo p
$str
ööq x
)
ööx y
;
ööy z
XmlAttribute
õõ $
nsattrib
õõ% -
=
õõ. /
elem
õõ0 4
.
õõ4 5
OwnerDocument
õõ5 B
.
õõB C
CreateAttribute
õõC R
(
õõR S
name
õõS W
)
õõW X
;
õõX Y
nsattrib
úú  
.
úú  !
Value
úú! &
=
úú' (
ancestorElement
úú) 8
.
úú8 9
NamespaceURI
úú9 E
;
úúE F

namespaces
ùù "
.
ùù" #
Add
ùù# &
(
ùù& '
nsattrib
ùù' /
)
ùù/ 0
;
ùù0 1
}
ûû 
}
üü 
if
†† 
(
†† 
ancestorElement
†† #
.
††# $
HasAttributes
††$ 1
)
††1 2
{
°° $
XmlAttributeCollection
¢¢ *
attribs
¢¢+ 2
=
¢¢3 4
ancestorElement
¢¢5 D
.
¢¢D E

Attributes
¢¢E O
;
¢¢O P
foreach
££ 
(
££ 
XmlAttribute
££ )
attrib
££* 0
in
££1 3
attribs
££4 ;
)
££; <
{
§§ 
if
¶¶ 
(
¶¶  
bDefNamespaceToAdd
¶¶ .
&&
¶¶/ 1
attrib
¶¶2 8
.
¶¶8 9
	LocalName
¶¶9 B
==
¶¶C E
$str
¶¶F M
)
¶¶M N
{
ßß 
XmlAttribute
®® (
nsattrib
®®) 1
=
®®2 3
elem
®®4 8
.
®®8 9
OwnerDocument
®®9 F
.
®®F G
CreateAttribute
®®G V
(
®®V W
$str
®®W ^
)
®®^ _
;
®®_ `
nsattrib
©© $
.
©©$ %
Value
©©% *
=
©©+ ,
attrib
©©- 3
.
©©3 4
Value
©©4 9
;
©©9 :

namespaces
™™ &
.
™™& '
Add
™™' *
(
™™* +
nsattrib
™™+ 3
)
™™3 4
;
™™4 5 
bDefNamespaceToAdd
´´ .
=
´´/ 0
false
´´1 6
;
´´6 7
continue
¨¨ $
;
¨¨$ %
}
≠≠ 
if
ØØ 
(
ØØ 
attrib
ØØ "
.
ØØ" #
Prefix
ØØ# )
==
ØØ* ,
$str
ØØ- 4
||
ØØ5 7
attrib
ØØ8 >
.
ØØ> ?
Prefix
ØØ? E
==
ØØF H
$str
ØØI N
)
ØØN O
{
∞∞ 

namespaces
±± &
.
±±& '
Add
±±' *
(
±±* +
attrib
±±+ 1
)
±±1 2
;
±±2 3
continue
≤≤ $
;
≤≤$ %
}
≥≥ 
if
¥¥ 
(
¥¥ 
attrib
¥¥ "
.
¥¥" #
NamespaceURI
¥¥# /
.
¥¥/ 0
Length
¥¥0 6
>
¥¥7 8
$num
¥¥9 :
)
¥¥: ;
{
µµ 
if
∂∂ 
(
∂∂  
!
∂∂  !
Utils
∂∂! &
.
∂∂& '"
IsCommittedNamespace
∂∂' ;
(
∂∂; <
ancestorElement
∂∂< K
,
∂∂K L
attrib
∂∂M S
.
∂∂S T
Prefix
∂∂T Z
,
∂∂Z [
attrib
∂∂\ b
.
∂∂b c
NamespaceURI
∂∂c o
)
∂∂o p
)
∂∂p q
{
∑∑ 
if
ππ  "
(
ππ# $
!
ππ$ %
Utils
ππ% *
.
ππ* +"
IsRedundantNamespace
ππ+ ?
(
ππ? @
ancestorElement
ππ@ O
,
ππO P
attrib
ππQ W
.
ππW X
Prefix
ππX ^
,
ππ^ _
attrib
ππ` f
.
ππf g
NamespaceURI
ππg s
)
ππs t
)
ππt u
{
∫∫  !
string
ªª$ *
name
ªª+ /
=
ªª0 1
(
ªª2 3
(
ªª3 4
attrib
ªª4 :
.
ªª: ;
Prefix
ªª; A
.
ªªA B
Length
ªªB H
>
ªªI J
$num
ªªK L
)
ªªL M
?
ªªN O
$str
ªªP X
+
ªªY Z
attrib
ªª[ a
.
ªªa b
Prefix
ªªb h
:
ªªi j
$str
ªªk r
)
ªªr s
;
ªªs t
XmlAttribute
ºº$ 0
nsattrib
ºº1 9
=
ºº: ;
elem
ºº< @
.
ºº@ A
OwnerDocument
ººA N
.
ººN O
CreateAttribute
ººO ^
(
ºº^ _
name
ºº_ c
)
ººc d
;
ººd e
nsattrib
ΩΩ$ ,
.
ΩΩ, -
Value
ΩΩ- 2
=
ΩΩ3 4
attrib
ΩΩ5 ;
.
ΩΩ; <
NamespaceURI
ΩΩ< H
;
ΩΩH I

namespaces
ææ$ .
.
ææ. /
Add
ææ/ 2
(
ææ2 3
nsattrib
ææ3 ;
)
ææ; <
;
ææ< =
}
øø  !
}
¿¿ 
}
¡¡ 
}
¬¬ 
}
√√ 
ancestorNode
ƒƒ 
=
ƒƒ 
ancestorNode
ƒƒ +
.
ƒƒ+ ,

ParentNode
ƒƒ, 6
;
ƒƒ6 7
}
≈≈ 
return
«« 

namespaces
«« 
;
«« 
}
»» 	
internal
ÀÀ 
static
ÀÀ 
byte
ÀÀ 
[
ÀÀ 
]
ÀÀ #
ConvertIntToByteArray
ÀÀ 4
(
ÀÀ4 5
int
ÀÀ5 8
dwInput
ÀÀ9 @
)
ÀÀ@ A
{
ÃÃ 	
byte
ÕÕ 
[
ÕÕ 
]
ÕÕ 
rgbTemp
ÕÕ 
=
ÕÕ 
new
ÕÕ  
byte
ÕÕ! %
[
ÕÕ% &
$num
ÕÕ& '
]
ÕÕ' (
;
ÕÕ( )
int
ŒŒ 
t1
ŒŒ 
;
ŒŒ 
int
œœ 
t2
œœ 
;
œœ 
int
–– 
i
–– 
=
–– 
$num
–– 
;
–– 
if
““ 
(
““ 
dwInput
““ 
==
““ 
$num
““ 
)
““ 
return
““ $
new
““% (
byte
““) -
[
““- .
$num
““. /
]
““/ 0
;
““0 1
t1
”” 
=
”” 
dwInput
”” 
;
”” 
while
‘‘ 
(
‘‘ 
t1
‘‘ 
>
‘‘ 
$num
‘‘ 
)
‘‘ 
{
’’ 
t2
÷÷ 
=
÷÷ 
t1
÷÷ 
%
÷÷ 
$num
÷÷ 
;
÷÷ 
rgbTemp
◊◊ 
[
◊◊ 
i
◊◊ 
]
◊◊ 
=
◊◊ 
(
◊◊ 
byte
◊◊ "
)
◊◊" #
t2
◊◊# %
;
◊◊% &
t1
ÿÿ 
=
ÿÿ 
(
ÿÿ 
t1
ÿÿ 
-
ÿÿ 
t2
ÿÿ 
)
ÿÿ 
/
ÿÿ  
$num
ÿÿ! $
;
ÿÿ$ %
i
ŸŸ 
++
ŸŸ 
;
ŸŸ 
}
⁄⁄ 
byte
‹‹ 
[
‹‹ 
]
‹‹ 
	rgbOutput
‹‹ 
=
‹‹ 
new
‹‹ "
byte
‹‹# '
[
‹‹' (
i
‹‹( )
]
‹‹) *
;
‹‹* +
for
ﬁﬁ 
(
ﬁﬁ 
int
ﬁﬁ 
j
ﬁﬁ 
=
ﬁﬁ 
$num
ﬁﬁ 
;
ﬁﬁ 
j
ﬁﬁ 
<
ﬁﬁ 
i
ﬁﬁ  !
;
ﬁﬁ! "
j
ﬁﬁ# $
++
ﬁﬁ$ &
)
ﬁﬁ& '
{
ﬂﬂ 
	rgbOutput
‡‡ 
[
‡‡ 
j
‡‡ 
]
‡‡ 
=
‡‡ 
rgbTemp
‡‡ &
[
‡‡& '
i
‡‡' (
-
‡‡) *
j
‡‡+ ,
-
‡‡- .
$num
‡‡/ 0
]
‡‡0 1
;
‡‡1 2
}
·· 
return
‚‚ 
	rgbOutput
‚‚ 
;
‚‚ 
}
„„ 	
internal
ÂÂ 
static
ÂÂ 
int
ÂÂ #
ConvertByteArrayToInt
ÂÂ 1
(
ÂÂ1 2
byte
ÂÂ2 6
[
ÂÂ6 7
]
ÂÂ7 8
input
ÂÂ9 >
)
ÂÂ> ?
{
ÊÊ 	
int
ËË 
dwOutput
ËË 
=
ËË 
$num
ËË 
;
ËË 
for
ÈÈ 
(
ÈÈ 
int
ÈÈ 
i
ÈÈ 
=
ÈÈ 
$num
ÈÈ 
;
ÈÈ 
i
ÈÈ 
<
ÈÈ 
input
ÈÈ  %
.
ÈÈ% &
Length
ÈÈ& ,
;
ÈÈ, -
i
ÈÈ. /
++
ÈÈ/ 1
)
ÈÈ1 2
{
ÍÍ 
dwOutput
ÎÎ 
*=
ÎÎ 
$num
ÎÎ 
;
ÎÎ  
dwOutput
ÏÏ 
+=
ÏÏ 
input
ÏÏ !
[
ÏÏ! "
i
ÏÏ" #
]
ÏÏ# $
;
ÏÏ$ %
}
ÌÌ 
return
ÓÓ 
(
ÓÓ 
dwOutput
ÓÓ 
)
ÓÓ 
;
ÓÓ 
}
ÔÔ 	
internal
ÒÒ 
static
ÒÒ 
int
ÒÒ 
GetHexArraySize
ÒÒ +
(
ÒÒ+ ,
byte
ÒÒ, 0
[
ÒÒ0 1
]
ÒÒ1 2
hex
ÒÒ3 6
)
ÒÒ6 7
{
ÚÚ 	
int
ÛÛ 
index
ÛÛ 
=
ÛÛ 
hex
ÛÛ 
.
ÛÛ 
Length
ÛÛ "
;
ÛÛ" #
while
ÙÙ 
(
ÙÙ 
index
ÙÙ 
--
ÙÙ 
>
ÙÙ 
$num
ÙÙ 
)
ÙÙ 
{
ıı 
if
ˆˆ 
(
ˆˆ 
hex
ˆˆ 
[
ˆˆ 
index
ˆˆ 
]
ˆˆ 
!=
ˆˆ !
$num
ˆˆ" #
)
ˆˆ# $
break
˜˜ 
;
˜˜ 
}
¯¯ 
return
˘˘ 
index
˘˘ 
+
˘˘ 
$num
˘˘ 
;
˘˘ 
}
˙˙ 	
internal
˝˝ 
static
˝˝ 
X509IssuerSerial
˝˝ ($
CreateX509IssuerSerial
˝˝) ?
(
˝˝? @
string
˝˝@ F

issuerName
˝˝G Q
,
˝˝Q R
string
˝˝S Y
serialNumber
˝˝Z f
)
˝˝f g
{
˛˛ 	
if
ˇˇ 
(
ˇˇ 

issuerName
ˇˇ 
==
ˇˇ 
null
ˇˇ "
||
ˇˇ# %

issuerName
ˇˇ& 0
.
ˇˇ0 1
Length
ˇˇ1 7
==
ˇˇ8 :
$num
ˇˇ; <
)
ˇˇ< =
throw
ÄÄ 
new
ÄÄ 
ArgumentException
ÄÄ +
(
ÄÄ+ ,
SR
ÄÄ, .
.
ÄÄ. /#
Arg_EmptyOrNullString
ÄÄ/ D
,
ÄÄD E
nameof
ÄÄF L
(
ÄÄL M

issuerName
ÄÄM W
)
ÄÄW X
)
ÄÄX Y
;
ÄÄY Z
if
ÅÅ 
(
ÅÅ 
serialNumber
ÅÅ 
==
ÅÅ 
null
ÅÅ  $
||
ÅÅ% '
serialNumber
ÅÅ( 4
.
ÅÅ4 5
Length
ÅÅ5 ;
==
ÅÅ< >
$num
ÅÅ? @
)
ÅÅ@ A
throw
ÇÇ 
new
ÇÇ 
ArgumentException
ÇÇ +
(
ÇÇ+ ,
SR
ÇÇ, .
.
ÇÇ. /#
Arg_EmptyOrNullString
ÇÇ/ D
,
ÇÇD E
nameof
ÇÇF L
(
ÇÇL M
serialNumber
ÇÇM Y
)
ÇÇY Z
)
ÇÇZ [
;
ÇÇ[ \
return
ÑÑ 
new
ÑÑ 
X509IssuerSerial
ÑÑ '
(
ÑÑ' (
)
ÑÑ( )
{
ÖÖ 

IssuerName
ÜÜ 
=
ÜÜ 

issuerName
ÜÜ '
,
ÜÜ' (
SerialNumber
áá 
=
áá 
serialNumber
áá +
}
àà 
;
àà 
}
ââ 	
internal
ãã 
static
ãã 
IList
ãã 
<
ãã 
X509Certificate
ãã -
>
ãã- .
BuildBagOfCerts
ãã/ >
(
ãã> ?
KeyInfoX509Data
ãã? N
keyInfoX509Data
ããO ^
,
ãã^ _
CertUsageType
ãã` m
certUsageType
ããn {
)
ãã{ |
{
åå 	
var
çç 

collection
çç 
=
çç 
new
çç  
List
çç! %
<
çç% &
X509Certificate
çç& 5
>
çç5 6
(
çç6 7
)
çç7 8
;
çç8 9
	ArrayList
éé %
decryptionIssuerSerials
éé -
=
éé. /
(
éé0 1
certUsageType
éé1 >
==
éé? A
CertUsageType
ééB O
.
ééO P

Decryption
ééP Z
?
éé[ \
new
éé] `
	ArrayList
ééa j
(
ééj k
)
éék l
:
éém n
null
ééo s
)
éés t
;
éét u
if
èè 
(
èè 
keyInfoX509Data
èè 
.
èè  
Certificates
èè  ,
!=
èè- /
null
èè0 4
)
èè4 5
{
êê 
foreach
ëë 
(
ëë 
X509Certificate
ëë (
certificate
ëë) 4
in
ëë5 7
keyInfoX509Data
ëë8 G
.
ëëG H
Certificates
ëëH T
)
ëëT U
{
íí 
switch
ìì 
(
ìì 
certUsageType
ìì )
)
ìì) *
{
îî 
case
ïï 
CertUsageType
ïï *
.
ïï* +
Verification
ïï+ 7
:
ïï7 8

collection
ññ &
.
ññ& '
Add
ññ' *
(
ññ* +
certificate
ññ+ 6
)
ññ6 7
;
ññ7 8
break
óó !
;
óó! "
case
òò 
CertUsageType
òò *
.
òò* +

Decryption
òò+ 5
:
òò5 6%
decryptionIssuerSerials
ôô 3
.
ôô3 4
Add
ôô4 7
(
ôô7 8
Utils
ôô8 =
.
ôô= >$
CreateX509IssuerSerial
ôô> T
(
ôôT U
certificate
ôôU `
.
ôô` a
IssuerDN
ôôa i
.
ôôi j
ToString
ôôj r
(
ôôr s
)
ôôs t
,
ôôt u
certificateôôv Å
.ôôÅ Ç
SerialNumberôôÇ é
.ôôé è
ToStringôôè ó
(ôôó ò
)ôôò ô
)ôôô ö
)ôôö õ
;ôôõ ú
break
öö !
;
öö! "
}
õõ 
}
úú 
}
ùù 
if
üü 
(
üü 
keyInfoX509Data
üü 
.
üü  
SubjectNames
üü  ,
==
üü- /
null
üü0 4
&&
üü5 7
keyInfoX509Data
üü8 G
.
üüG H
IssuerSerials
üüH U
==
üüV X
null
üüY ]
&&
üü^ `
keyInfoX509Data
†† 
.
††  
SubjectKeyIds
††  -
==
††. 0
null
††1 5
&&
††6 8%
decryptionIssuerSerials
††9 P
==
††Q S
null
††T X
)
††X Y
return
°° 

collection
°° !
;
°°! "
return
ﬂﬂ 

collection
ﬂﬂ 
;
ﬂﬂ 
}
‡‡ 	
private
‚‚ 
static
‚‚ 
readonly
‚‚ 
char
‚‚  $
[
‚‚$ %
]
‚‚% &
s_hexValues
‚‚' 2
=
‚‚3 4
{
‚‚5 6
$char
‚‚6 9
,
‚‚9 :
$char
‚‚; >
,
‚‚> ?
$char
‚‚@ C
,
‚‚C D
$char
‚‚E H
,
‚‚H I
$char
‚‚J M
,
‚‚M N
$char
‚‚O R
,
‚‚R S
$char
‚‚T W
,
‚‚W X
$char
‚‚Y \
,
‚‚\ ]
$char
‚‚^ a
,
‚‚a b
$char
‚‚c f
,
‚‚f g
$char
‚‚h k
,
‚‚k l
$char
‚‚m p
,
‚‚p q
$char
‚‚r u
,
‚‚u v
$char
‚‚w z
,
‚‚z {
$char
‚‚| 
,‚‚ Ä
$char‚‚Å Ñ
}‚‚Ñ Ö
;‚‚Ö Ü
internal
„„ 
static
„„ 
string
„„ 
EncodeHexString
„„ .
(
„„. /
byte
„„/ 3
[
„„3 4
]
„„4 5
sArray
„„6 <
)
„„< =
{
‰‰ 	
return
ÂÂ 
EncodeHexString
ÂÂ "
(
ÂÂ" #
sArray
ÂÂ# )
,
ÂÂ) *
$num
ÂÂ+ ,
,
ÂÂ, -
(
ÂÂ. /
uint
ÂÂ/ 3
)
ÂÂ3 4
sArray
ÂÂ4 :
.
ÂÂ: ;
Length
ÂÂ; A
)
ÂÂA B
;
ÂÂB C
}
ÊÊ 	
internal
ËË 
static
ËË 
string
ËË 
EncodeHexString
ËË .
(
ËË. /
byte
ËË/ 3
[
ËË3 4
]
ËË4 5
sArray
ËË6 <
,
ËË< =
uint
ËË> B
start
ËËC H
,
ËËH I
uint
ËËJ N
end
ËËO R
)
ËËR S
{
ÈÈ 	
string
ÍÍ 
result
ÍÍ 
=
ÍÍ 
null
ÍÍ  
;
ÍÍ  !
if
ÎÎ 
(
ÎÎ 
sArray
ÎÎ 
!=
ÎÎ 
null
ÎÎ 
)
ÎÎ 
{
ÏÏ 
char
ÌÌ 
[
ÌÌ 
]
ÌÌ 
hexOrder
ÌÌ 
=
ÌÌ  !
new
ÌÌ" %
char
ÌÌ& *
[
ÌÌ* +
(
ÌÌ+ ,
end
ÌÌ, /
-
ÌÌ0 1
start
ÌÌ2 7
)
ÌÌ7 8
*
ÌÌ9 :
$num
ÌÌ; <
]
ÌÌ< =
;
ÌÌ= >
uint
ÓÓ 
digit
ÓÓ 
;
ÓÓ 
for
ÔÔ 
(
ÔÔ 
uint
ÔÔ 
i
ÔÔ 
=
ÔÔ 
start
ÔÔ #
,
ÔÔ# $
j
ÔÔ% &
=
ÔÔ' (
$num
ÔÔ) *
;
ÔÔ* +
i
ÔÔ, -
<
ÔÔ. /
end
ÔÔ0 3
;
ÔÔ3 4
i
ÔÔ5 6
++
ÔÔ6 8
)
ÔÔ8 9
{
 
digit
ÒÒ 
=
ÒÒ 
(
ÒÒ 
uint
ÒÒ !
)
ÒÒ! "
(
ÒÒ" #
(
ÒÒ# $
sArray
ÒÒ$ *
[
ÒÒ* +
i
ÒÒ+ ,
]
ÒÒ, -
&
ÒÒ. /
$num
ÒÒ0 4
)
ÒÒ4 5
>>
ÒÒ6 8
$num
ÒÒ9 :
)
ÒÒ: ;
;
ÒÒ; <
hexOrder
ÚÚ 
[
ÚÚ 
j
ÚÚ 
++
ÚÚ  
]
ÚÚ  !
=
ÚÚ" #
s_hexValues
ÚÚ$ /
[
ÚÚ/ 0
digit
ÚÚ0 5
]
ÚÚ5 6
;
ÚÚ6 7
digit
ÛÛ 
=
ÛÛ 
(
ÛÛ 
uint
ÛÛ !
)
ÛÛ! "
(
ÛÛ" #
sArray
ÛÛ# )
[
ÛÛ) *
i
ÛÛ* +
]
ÛÛ+ ,
&
ÛÛ- .
$num
ÛÛ/ 3
)
ÛÛ3 4
;
ÛÛ4 5
hexOrder
ÙÙ 
[
ÙÙ 
j
ÙÙ 
++
ÙÙ  
]
ÙÙ  !
=
ÙÙ" #
s_hexValues
ÙÙ$ /
[
ÙÙ/ 0
digit
ÙÙ0 5
]
ÙÙ5 6
;
ÙÙ6 7
}
ıı 
result
ˆˆ 
=
ˆˆ 
new
ˆˆ 
string
ˆˆ #
(
ˆˆ# $
hexOrder
ˆˆ$ ,
)
ˆˆ, -
;
ˆˆ- .
}
˜˜ 
return
¯¯ 
result
¯¯ 
;
¯¯ 
}
˘˘ 	
internal
˚˚ 
static
˚˚ 
byte
˚˚ 
[
˚˚ 
]
˚˚ 
DecodeHexString
˚˚ .
(
˚˚. /
string
˚˚/ 5
s
˚˚6 7
)
˚˚7 8
{
¸¸ 	
string
˝˝ 
	hexString
˝˝ 
=
˝˝ 
Utils
˝˝ $
.
˝˝$ % 
DiscardWhiteSpaces
˝˝% 7
(
˝˝7 8
s
˝˝8 9
)
˝˝9 :
;
˝˝: ;
uint
˛˛ 
cbHex
˛˛ 
=
˛˛ 
(
˛˛ 
uint
˛˛ 
)
˛˛ 
	hexString
˛˛ (
.
˛˛( )
Length
˛˛) /
/
˛˛0 1
$num
˛˛2 3
;
˛˛3 4
byte
ˇˇ 
[
ˇˇ 
]
ˇˇ 
hex
ˇˇ 
=
ˇˇ 
new
ˇˇ 
byte
ˇˇ !
[
ˇˇ! "
cbHex
ˇˇ" '
]
ˇˇ' (
;
ˇˇ( )
int
ÄÄ 
i
ÄÄ 
=
ÄÄ 
$num
ÄÄ 
;
ÄÄ 
for
ÅÅ 
(
ÅÅ 
int
ÅÅ 
index
ÅÅ 
=
ÅÅ 
$num
ÅÅ 
;
ÅÅ 
index
ÅÅ  %
<
ÅÅ& '
cbHex
ÅÅ( -
;
ÅÅ- .
index
ÅÅ/ 4
++
ÅÅ4 6
)
ÅÅ6 7
{
ÇÇ 
hex
ÉÉ 
[
ÉÉ 
index
ÉÉ 
]
ÉÉ 
=
ÉÉ 
(
ÉÉ 
byte
ÉÉ "
)
ÉÉ" #
(
ÉÉ# $
(
ÉÉ$ %
	HexToByte
ÉÉ% .
(
ÉÉ. /
	hexString
ÉÉ/ 8
[
ÉÉ8 9
i
ÉÉ9 :
]
ÉÉ: ;
)
ÉÉ; <
<<
ÉÉ= ?
$num
ÉÉ@ A
)
ÉÉA B
|
ÉÉC D
	HexToByte
ÉÉE N
(
ÉÉN O
	hexString
ÉÉO X
[
ÉÉX Y
i
ÉÉY Z
+
ÉÉ[ \
$num
ÉÉ] ^
]
ÉÉ^ _
)
ÉÉ_ `
)
ÉÉ` a
;
ÉÉa b
i
ÑÑ 
+=
ÑÑ 
$num
ÑÑ 
;
ÑÑ 
}
ÖÖ 
return
ÜÜ 
hex
ÜÜ 
;
ÜÜ 
}
áá 	
internal
ââ 
static
ââ 
byte
ââ 
	HexToByte
ââ &
(
ââ& '
char
ââ' +
val
ââ, /
)
ââ/ 0
{
ää 	
if
ãã 
(
ãã 
val
ãã 
<=
ãã 
$char
ãã 
&&
ãã 
val
ãã !
>=
ãã" $
$char
ãã% (
)
ãã( )
return
åå 
(
åå 
byte
åå 
)
åå 
(
åå 
val
åå !
-
åå" #
$char
åå$ '
)
åå' (
;
åå( )
else
çç 
if
çç 
(
çç 
val
çç 
>=
çç 
$char
çç 
&&
çç  "
val
çç# &
<=
çç' )
$char
çç* -
)
çç- .
return
éé 
(
éé 
byte
éé 
)
éé 
(
éé 
(
éé 
val
éé "
-
éé# $
$char
éé% (
)
éé( )
+
éé* +
$num
éé, .
)
éé. /
;
éé/ 0
else
èè 
if
èè 
(
èè 
val
èè 
>=
èè 
$char
èè 
&&
èè  "
val
èè# &
<=
èè' )
$char
èè* -
)
èè- .
return
êê 
(
êê 
byte
êê 
)
êê 
(
êê 
(
êê 
val
êê "
-
êê# $
$char
êê% (
)
êê( )
+
êê* +
$num
êê, .
)
êê. /
;
êê/ 0
else
ëë 
return
íí 
$num
íí 
;
íí 
}
ìì 	
internal
ïï 
static
ïï 
bool
ïï 
IsSelfSigned
ïï )
(
ïï) *
IList
ïï* /
<
ïï/ 0
X509Certificate
ïï0 ?
>
ïï? @
chain
ïïA F
)
ïïF G
{
ññ 	
if
óó 
(
óó 
chain
óó 
.
óó 
Count
óó 
!=
óó 
$num
óó  
)
óó  !
return
òò 
false
òò 
;
òò 
X509Certificate
ôô 
certificate
ôô '
=
ôô( )
chain
ôô* /
[
ôô/ 0
$num
ôô0 1
]
ôô1 2
;
ôô2 3
if
öö 
(
öö 
String
öö 
.
öö 
Compare
öö 
(
öö 
certificate
öö *
.
öö* +
	SubjectDN
öö+ 4
.
öö4 5
ToString
öö5 =
(
öö= >
)
öö> ?
,
öö? @
certificate
ööA L
.
ööL M
IssuerDN
ööM U
.
ööU V
ToString
ööV ^
(
öö^ _
)
öö_ `
,
öö` a
StringComparison
ööb r
.
öör s 
OrdinalIgnoreCaseöös Ñ
)ööÑ Ö
==ööÜ à
$numööâ ä
)ööä ã
return
õõ 
true
õõ 
;
õõ 
return
úú 
false
úú 
;
úú 
}
ùù 	
internal
üü 
static
üü 
IList
üü 
<
üü 
X509Certificate
üü -
>
üü- .#
BuildCertificateChain
üü/ D
(
üüD E
X509Certificate
üüE T 
primaryCertificate
üüU g
,
üüg h
IEnumerable
üüi t
<
üüt u
X509Certificateüüu Ñ
>üüÑ Ö&
additionalCertificatesüüÜ ú
)üüú ù
{
†† 	
var
°° 
parser
°° 
=
°° 
new
°° #
X509CertificateParser
°° 2
(
°°2 3
)
°°3 4
;
°°4 5
var
¢¢ 
builder
¢¢ 
=
¢¢ 
new
¢¢ !
PkixCertPathBuilder
¢¢ 1
(
¢¢1 2
)
¢¢2 3
;
¢¢3 4
var
•• 
intermediateCerts
•• !
=
••" #
new
••$ '
List
••( ,
<
••, -
X509Certificate
••- <
>
••< =
(
••= >
)
••> ?
;
••? @
var
¶¶ 
	rootCerts
¶¶ 
=
¶¶ 
new
¶¶ 
BouncyCastle
¶¶  ,
.
¶¶, -
	Utilities
¶¶- 6
.
¶¶6 7
Collections
¶¶7 B
.
¶¶B C
HashSet
¶¶C J
(
¶¶J K
)
¶¶K L
;
¶¶L M
foreach
®® 
(
®® 
var
®® 
cert
®® 
in
®®  $
additionalCertificates
®®! 7
)
®®7 8
{
®®9 :
if
™™ 
(
™™ 
cert
™™ 
.
™™ 
IssuerDN
™™ !
.
™™! "

Equivalent
™™" ,
(
™™, -
cert
™™- 1
.
™™1 2
	SubjectDN
™™2 ;
)
™™; <
)
™™< =
	rootCerts
´´ 
.
´´ 
Add
´´ !
(
´´! "
new
´´" %
TrustAnchor
´´& 1
(
´´1 2
cert
´´2 6
,
´´6 7
null
´´8 <
)
´´< =
)
´´= >
;
´´> ?
else
¨¨ 
intermediateCerts
≠≠ %
.
≠≠% &
Add
≠≠& )
(
≠≠) *
cert
≠≠* .
)
≠≠. /
;
≠≠/ 0
}
ÆÆ 
var
±± 
holder
±± 
=
±± 
new
±± #
X509CertStoreSelector
±± 2
(
±±2 3
)
±±3 4
;
±±4 5
holder
≤≤ 
.
≤≤ 
Certificate
≤≤ 
=
≤≤   
primaryCertificate
≤≤! 3
;
≤≤3 4
intermediateCerts
µµ 
.
µµ 
Add
µµ !
(
µµ! "
holder
µµ" (
.
µµ( )
Certificate
µµ) 4
)
µµ4 5
;
µµ5 6#
PkixBuilderParameters
∑∑ !
builderParams
∑∑" /
=
∑∑0 1
new
∑∑2 5#
PkixBuilderParameters
∑∑6 K
(
∑∑K L
	rootCerts
∑∑L U
,
∑∑U V
holder
∑∑W ]
)
∑∑] ^
;
∑∑^ _
builderParams
∏∏ 
.
∏∏ !
IsRevocationEnabled
∏∏ -
=
∏∏. /
false
∏∏0 5
;
∏∏5 6+
X509CollectionStoreParameters
∫∫ ))
intermediateStoreParameters
∫∫* E
=
∫∫F G
new
ªª +
X509CollectionStoreParameters
ªª 1
(
ªª1 2
intermediateCerts
ªª2 C
)
ªªC D
;
ªªD E
builderParams
ΩΩ 
.
ΩΩ 
AddStore
ΩΩ "
(
ΩΩ" #
X509StoreFactory
ΩΩ# 3
.
ΩΩ3 4
Create
ΩΩ4 :
(
ΩΩ: ;
$str
ææ (
,
ææ( ))
intermediateStoreParameters
ææ* E
)
ææE F
)
ææF G
;
ææG H'
PkixCertPathBuilderResult
¿¿ %
result
¿¿& ,
=
¿¿- .
builder
¿¿/ 6
.
¿¿6 7
Build
¿¿7 <
(
¿¿< =
builderParams
¿¿= J
)
¿¿J K
;
¿¿K L
return
¬¬ 
result
¬¬ 
.
¬¬ 
CertPath
¬¬ "
.
¬¬" #
Certificates
¬¬# /
.
¬¬/ 0
Cast
¬¬0 4
<
¬¬4 5
X509Certificate
¬¬5 D
>
¬¬D E
(
¬¬E F
)
¬¬F G
.
¬¬G H
ToList
¬¬H N
(
¬¬N O
)
¬¬O P
;
¬¬P Q
}
√√ 	
internal
≈≈ 
static
≈≈ $
AsymmetricKeyParameter
≈≈ .
GetAnyPublicKey
≈≈/ >
(
≈≈> ?
X509Certificate
≈≈? N
certificate
≈≈O Z
)
≈≈Z [
{
∆∆ 	
return
«« 
certificate
«« 
.
«« 
GetPublicKey
«« +
(
««+ ,
)
««, -
;
««- .
}
»» 	
internal
   
const
   
int
   '
MaxTransformsPerReference
   4
=
  5 6
$num
  7 9
;
  9 :
internal
ÀÀ 
const
ÀÀ 
int
ÀÀ (
MaxReferencesPerSignedInfo
ÀÀ 5
=
ÀÀ6 7
$num
ÀÀ8 ;
;
ÀÀ; <
internal
ÕÕ 
static
ÕÕ 
IDigest
ÕÕ 
GetSignerDigest
ÕÕ  /
(
ÕÕ/ 0
ISigner
ÕÕ0 7
signer
ÕÕ8 >
)
ÕÕ> ?
{
ŒŒ 	
var
œœ 
fields
œœ 
=
œœ 
signer
œœ 
.
œœ  
GetType
œœ  '
(
œœ' (
)
œœ( )
.
œœ) *
	GetFields
œœ* 3
(
œœ3 4
BindingFlags
œœ4 @
.
œœ@ A
Instance
œœA I
|
œœJ K
BindingFlags
œœL X
.
œœX Y
	NonPublic
œœY b
)
œœb c
;
œœc d
var
–– 

digestType
–– 
=
–– 
typeof
–– #
(
––# $
IDigest
––$ +
)
––+ ,
;
––, -
foreach
—— 
(
—— 
var
—— 
field
—— 
in
—— !
fields
——" (
)
——( )
{
——* +
if
““ 
(
““ 

digestType
““ 
.
““ 
IsAssignableFrom
““ /
(
““/ 0
field
““0 5
.
““5 6
	FieldType
““6 ?
)
““? @
)
““@ A
{
““B C
return
”” 
(
”” 
IDigest
”” #
)
””# $
field
””$ )
.
””) *
GetValue
””* 2
(
””2 3
signer
””3 9
)
””9 :
;
””: ;
}
‘‘ 
}
’’ 
throw
÷÷ 
new
÷÷ '
InvalidOperationException
÷÷ /
(
÷÷/ 0
)
÷÷0 1
;
÷÷1 2
}
◊◊ 	
internal
ŸŸ 
static
ŸŸ 
X509Certificate
ŸŸ '
CloneCertificate
ŸŸ( 8
(
ŸŸ8 9
X509Certificate
ŸŸ9 H
cert
ŸŸI M
)
ŸŸM N
{
⁄⁄ 	
cert
€€ 
=
€€ 
cert
€€ 
??
€€ 
throw
€€  
new
€€! $#
ArgumentNullException
€€% :
(
€€: ;
nameof
€€; A
(
€€A B
cert
€€B F
)
€€F G
)
€€G H
;
€€H I
var
‹‹ 
parser
‹‹ 
=
‹‹ 
new
‹‹ #
X509CertificateParser
‹‹ 2
(
‹‹2 3
)
‹‹3 4
;
‹‹4 5
return
›› 
parser
›› 
.
›› 
ReadCertificate
›› )
(
››) *
cert
››* .
.
››. /

GetEncoded
››/ 9
(
››9 :
)
››: ;
)
››; <
;
››< =
}
ﬁﬁ 	
internal
‡‡ 
static
‡‡ %
AsymmetricCipherKeyPair
‡‡ / 
DSAGenerateKeyPair
‡‡0 B
(
‡‡B C
)
‡‡C D
{
·· 	
var
‚‚ 
keyGen
‚‚ 
=
‚‚  
GeneratorUtilities
‚‚ +
.
‚‚+ ,!
GetKeyPairGenerator
‚‚, ?
(
‚‚? @
$str
‚‚@ E
)
‚‚E F
;
‚‚F G
var
„„ 
rand
„„ 
=
„„ 
new
„„ 
SecureRandom
„„ '
(
„„' (
)
„„( )
;
„„) *
var
‰‰ 
pGen
‰‰ 
=
‰‰ 
new
‰‰ $
DsaParametersGenerator
‰‰ 1
(
‰‰1 2
)
‰‰2 3
;
‰‰3 4
pGen
ÂÂ 
.
ÂÂ 
Init
ÂÂ 
(
ÂÂ 
$num
ÂÂ 
,
ÂÂ 
$num
ÂÂ 
,
ÂÂ 
rand
ÂÂ #
)
ÂÂ# $
;
ÂÂ$ %
keyGen
ÊÊ 
.
ÊÊ 
Init
ÊÊ 
(
ÊÊ 
new
ÊÊ (
DsaKeyGenerationParameters
ÊÊ 6
(
ÊÊ6 7
rand
ÊÊ7 ;
,
ÊÊ; <
pGen
ÊÊ= A
.
ÊÊA B 
GenerateParameters
ÊÊB T
(
ÊÊT U
)
ÊÊU V
)
ÊÊV W
)
ÊÊW X
;
ÊÊX Y
return
ÁÁ 
keyGen
ÁÁ 
.
ÁÁ 
GenerateKeyPair
ÁÁ )
(
ÁÁ) *
)
ÁÁ* +
;
ÁÁ+ ,
}
ËË 	
internal
ÍÍ 
static
ÍÍ %
AsymmetricCipherKeyPair
ÍÍ / 
RSAGenerateKeyPair
ÍÍ0 B
(
ÍÍB C
)
ÍÍC D
{
ÎÎ 	
var
ÏÏ 
keyGen
ÏÏ 
=
ÏÏ  
GeneratorUtilities
ÏÏ +
.
ÏÏ+ ,!
GetKeyPairGenerator
ÏÏ, ?
(
ÏÏ? @
$str
ÏÏ@ E
)
ÏÏE F
;
ÏÏF G
keyGen
ÌÌ 
.
ÌÌ 
Init
ÌÌ 
(
ÌÌ 
new
ÌÌ %
KeyGenerationParameters
ÌÌ 3
(
ÌÌ3 4
new
ÌÌ4 7
SecureRandom
ÌÌ8 D
(
ÌÌD E
)
ÌÌE F
,
ÌÌF G
$num
ÌÌH L
)
ÌÌL M
)
ÌÌM N
;
ÌÌN O
return
ÓÓ 
keyGen
ÓÓ 
.
ÓÓ 
GenerateKeyPair
ÓÓ )
(
ÓÓ) *
)
ÓÓ* +
;
ÓÓ+ ,
}
ÔÔ 	
internal
ÒÒ 
static
ÒÒ 
byte
ÒÒ 
[
ÒÒ 
]
ÒÒ !
GenerateRandomBlock
ÒÒ 2
(
ÒÒ2 3
int
ÒÒ3 6
sizeInBytes
ÒÒ7 B
)
ÒÒB C
{
ÚÚ 	
SecureRandom
ÛÛ 
random
ÛÛ 
=
ÛÛ  !
new
ÛÛ" %
SecureRandom
ÛÛ& 2
(
ÛÛ2 3
)
ÛÛ3 4
;
ÛÛ4 5
byte
ÙÙ 
[
ÙÙ 
]
ÙÙ 
keyBytes
ÙÙ 
=
ÙÙ 
new
ÙÙ !
byte
ÙÙ" &
[
ÙÙ& '
sizeInBytes
ÙÙ' 2
]
ÙÙ2 3
;
ÙÙ3 4
random
ıı 
.
ıı 
	NextBytes
ıı 
(
ıı 
keyBytes
ıı %
)
ıı% &
;
ıı& '
return
ˆˆ 
keyBytes
ˆˆ 
;
ˆˆ 
}
˜˜ 	
}
¯¯ 
}˘˘ ’
<C:\code\bc-xml-security\refactoring\src\X509IncludeOption.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
X509 
{ 
public 

enum 
X509IncludeOption !
{ 
None		 
=		 
$num		 
,		 
ExcludeRoot

 
,

 
EndCertOnly 
, 

WholeChain 
} 
} ®
;C:\code\bc-xml-security\refactoring\src\X509IssuerSerial.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
X509 
{ 
public 

struct 
X509IssuerSerial "
{ 
private 
string 
_issuerName "
;" #
private 
string 
_serialNumber $
;$ %
internal 
X509IssuerSerial !
(! "
string" (

issuerName) 3
,3 4
string5 ;
serialNumber< H
)H I
{ 	
if 
( 

issuerName 
== 
null "
||# %

issuerName& 0
.0 1
Length1 7
==8 :
$num; <
)< =
throw 
new 
ArgumentException +
(+ ,
SR, .
.. /!
Arg_EmptyOrNullString/ D
,D E
$strF R
)R S
;S T
if 
( 
serialNumber 
== 
null  $
||% '
serialNumber( 4
.4 5
Length5 ;
==< >
$num? @
)@ A
throw 
new 
ArgumentException +
(+ ,
SR, .
.. /!
Arg_EmptyOrNullString/ D
,D E
$strF T
)T U
;U V
_issuerName 
= 

issuerName $
;$ %
_serialNumber 
= 
serialNumber (
;( )
} 	
public 
string 

IssuerName  
{ 	
get   
{!! 
return"" 
_issuerName"" "
;""" #
}## 
set$$ 
{%% 
_issuerName&& 
=&& 
value&& #
;&&# $
}'' 
}(( 	
public** 
string** 
SerialNumber** "
{++ 	
get,, 
{-- 
return.. 
_serialNumber.. $
;..$ %
}// 
set00 
{11 
_serialNumber22 
=22 
value22  %
;22% &
}33 
}44 	
}55 
}66 Í∆
AC:\code\bc-xml-security\refactoring\src\XmlDecryptionTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class "
XmlDecryptionTransform '
:( )
	Transform* 3
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlDocument> I
)I J
}K L
;L M
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
XmlDocument/ :
): ;
}< =
;= >
private 
XmlNodeList 
_encryptedDataList .
=/ 0
null1 5
;5 6
private 
	ArrayList 
_arrayListUri '
=( )
null* .
;. /
private 
EncryptedXml 
_exml "
=# $
null% )
;) *
private 
XmlDocument 
_containingDocument /
=0 1
null2 6
;6 7
private 
XmlNamespaceManager #
_nsm$ (
=) *
null+ /
;/ 0
private 
const 
string .
"XmlDecryptionTransformNamespaceUrl ?
=@ A
$strB f
;f g
public   "
XmlDecryptionTransform   %
(  % &
)  & '
{!! 	
	Algorithm"" 
="" 
	SignedXml"" !
.""! "%
XmlDecryptionTransformUrl""" ;
;""; <
}## 	
private%% 
	ArrayList%% 

ExceptUris%% $
{&& 	
get'' 
{(( 
if)) 
()) 
_arrayListUri)) !
==))" $
null))% )
)))) *
_arrayListUri** !
=**" #
new**$ '
	ArrayList**( 1
(**1 2
)**2 3
;**3 4
return++ 
_arrayListUri++ $
;++$ %
},, 
}-- 	
	protected// 
virtual// 
bool// 
IsTargetElement// .
(//. /

XmlElement/// 9
inputElement//: F
,//F G
string//H N
idValue//O V
)//V W
{00 	
if11 
(11 
inputElement11 
==11 
null11  $
)11$ %
return22 
false22 
;22 
if33 
(33 
inputElement33 
.33 
GetAttribute33 )
(33) *
$str33* .
)33. /
==330 2
idValue333 :
||33; =
inputElement33> J
.33J K
GetAttribute33K W
(33W X
$str33X \
)33\ ]
==33^ `
idValue33a h
||33i k
inputElement44 
.44 
GetAttribute44 )
(44) *
$str44* .
)44. /
==440 2
idValue443 :
)44: ;
return55 
true55 
;55 
return77 
false77 
;77 
}88 	
public:: 
EncryptedXml:: 
EncryptedXml:: (
{;; 	
get<< 
{== 
if>> 
(>> 
_exml>> 
!=>> 
null>> !
)>>! "
return?? 
_exml??  
;??  !
	ReferenceAA 
	referenceAA #
=AA$ %
	ReferenceAA& /
;AA/ 0
	SignedXmlBB 
	signedXmlBB #
=BB$ %
(BB& '
	referenceBB' 0
==BB1 3
nullBB4 8
?BB9 :
	SignedXmlBB; D
:BBE F
	referenceBBG P
.BBP Q
	SignedXmlBBQ Z
)BBZ [
;BB[ \
ifCC 
(CC 
	signedXmlCC 
==CC  
nullCC! %
||CC& (
	signedXmlCC) 2
.CC2 3
EncryptedXmlCC3 ?
==CC@ B
nullCCC G
)CCG H
_exmlDD 
=DD 
newDD 
EncryptedXmlDD  ,
(DD, -
_containingDocumentDD- @
)DD@ A
;DDA B
elseEE 
_exmlFF 
=FF 
	signedXmlFF %
.FF% &
EncryptedXmlFF& 2
;FF2 3
returnHH 
_exmlHH 
;HH 
}II 
setJJ 
{JJ 
_exmlJJ 
=JJ 
valueJJ 
;JJ  
}JJ! "
}KK 	
publicMM 
overrideMM 
TypeMM 
[MM 
]MM 

InputTypesMM )
{NN 	
getOO 
{OO 
returnOO 
_inputTypesOO $
;OO$ %
}OO& '
}PP 	
publicRR 
overrideRR 
TypeRR 
[RR 
]RR 
OutputTypesRR *
{SS 	
getTT 
{TT 
returnTT 
_outputTypesTT %
;TT% &
}TT' (
}UU 	
publicWW 
voidWW 
AddExceptUriWW  
(WW  !
stringWW! '
uriWW( +
)WW+ ,
{XX 	
ifYY 
(YY 
uriYY 
==YY 
nullYY 
)YY 
throwZZ 
newZZ !
ArgumentNullExceptionZZ /
(ZZ/ 0
nameofZZ0 6
(ZZ6 7
uriZZ7 :
)ZZ: ;
)ZZ; <
;ZZ< =

ExceptUris[[ 
.[[ 
Add[[ 
([[ 
uri[[ 
)[[ 
;[[  
}\\ 	
public^^ 
override^^ 
void^^ 
LoadInnerXml^^ )
(^^) *
XmlNodeList^^* 5
nodeList^^6 >
)^^> ?
{__ 	
if`` 
(`` 
nodeList`` 
==`` 
null``  
)``  !
throwaa 
newaa 
Systemaa  
.aa  !
Securityaa! )
.aa) *
Cryptographyaa* 6
.aa6 7"
CryptographicExceptionaa7 M
(aaM N
SRaaN P
.aaP Q-
!Cryptography_Xml_UnknownTransformaaQ r
)aar s
;aas t

ExceptUrisbb 
.bb 
Clearbb 
(bb 
)bb 
;bb 
foreachcc 
(cc 
XmlNodecc 
nodecc !
incc" $
nodeListcc% -
)cc- .
{dd 

XmlElementee 
elemee 
=ee  !
nodeee" &
asee' )

XmlElementee* 4
;ee4 5
ifff 
(ff 
elemff 
!=ff 
nullff  
)ff  !
{gg 
ifhh 
(hh 
elemhh 
.hh 
	LocalNamehh &
==hh' )
$strhh* 2
&&hh3 5
elemhh6 :
.hh: ;
NamespaceURIhh; G
==hhH J.
"XmlDecryptionTransformNamespaceUrlhhK m
)hhm n
{ii 
stringkk 
urikk "
=kk# $
Utilskk% *
.kk* +
GetAttributekk+ 7
(kk7 8
elemkk8 <
,kk< =
$strkk> C
,kkC D.
"XmlDecryptionTransformNamespaceUrlkkE g
)kkg h
;kkh i
ifll 
(ll 
urill 
==ll  "
nullll# '
||ll( *
urill+ .
.ll. /
Lengthll/ 5
==ll6 8
$numll9 :
||ll; =
urill> A
[llA B
$numllB C
]llC D
!=llE G
$charllH K
)llK L
throwmm !
newmm" %
Systemmm& ,
.mm, -
Securitymm- 5
.mm5 6
Cryptographymm6 B
.mmB C"
CryptographicExceptionmmC Y
(mmY Z
SRmmZ \
.mm\ ](
Cryptography_Xml_UriRequiredmm] y
)mmy z
;mmz {
ifnn 
(nn 
!nn 
Utilsnn "
.nn" #
VerifyAttributesnn# 3
(nn3 4
elemnn4 8
,nn8 9
$strnn: ?
)nn? @
)nn@ A
{oo 
throwpp !
newpp" %
Systempp& ,
.pp, -
Securitypp- 5
.pp5 6
Cryptographypp6 B
.ppB C"
CryptographicExceptionppC Y
(ppY Z
SRppZ \
.pp\ ]-
!Cryptography_Xml_UnknownTransformpp] ~
)pp~ 
;	pp Ä
}qq 
stringrr 
idrefrr $
=rr% &
Utilsrr' ,
.rr, -!
ExtractIdFromLocalUrirr- B
(rrB C
urirrC F
)rrF G
;rrG H

ExceptUrisss "
.ss" #
Addss# &
(ss& '
idrefss' ,
)ss, -
;ss- .
}tt 
elseuu 
{vv 
throwww 
newww !
Systemww" (
.ww( )
Securityww) 1
.ww1 2
Cryptographyww2 >
.ww> ?"
CryptographicExceptionww? U
(wwU V
SRwwV X
.wwX Y-
!Cryptography_Xml_UnknownTransformwwY z
)wwz {
;ww{ |
}xx 
}yy 
}zz 
}{{ 	
	protected}} 
override}} 
XmlNodeList}} &
GetInnerXml}}' 2
(}}2 3
)}}3 4
{~~ 	
if 
( 

ExceptUris 
. 
Count  
==! #
$num$ %
)% &
return
ÄÄ 
null
ÄÄ 
;
ÄÄ 
XmlDocument
ÅÅ 
document
ÅÅ  
=
ÅÅ! "
new
ÅÅ# &
XmlDocument
ÅÅ' 2
(
ÅÅ2 3
)
ÅÅ3 4
;
ÅÅ4 5

XmlElement
ÇÇ 
element
ÇÇ 
=
ÇÇ  
document
ÇÇ! )
.
ÇÇ) *
CreateElement
ÇÇ* 7
(
ÇÇ7 8
$str
ÇÇ8 C
,
ÇÇC D
	SignedXml
ÇÇE N
.
ÇÇN O!
XmlDsigNamespaceUrl
ÇÇO b
)
ÇÇb c
;
ÇÇc d
if
ÉÉ 
(
ÉÉ 
!
ÉÉ 
string
ÉÉ 
.
ÉÉ 
IsNullOrEmpty
ÉÉ %
(
ÉÉ% &
	Algorithm
ÉÉ& /
)
ÉÉ/ 0
)
ÉÉ0 1
element
ÑÑ 
.
ÑÑ 
SetAttribute
ÑÑ $
(
ÑÑ$ %
$str
ÑÑ% 0
,
ÑÑ0 1
	Algorithm
ÑÑ2 ;
)
ÑÑ; <
;
ÑÑ< =
foreach
ÖÖ 
(
ÖÖ 
string
ÖÖ 
uri
ÖÖ 
in
ÖÖ  "

ExceptUris
ÖÖ# -
)
ÖÖ- .
{
ÜÜ 

XmlElement
áá 
exceptUriElement
áá +
=
áá, -
document
áá. 6
.
áá6 7
CreateElement
áá7 D
(
ááD E
$str
ááE M
,
ááM N0
"XmlDecryptionTransformNamespaceUrl
ááO q
)
ááq r
;
áár s
exceptUriElement
àà  
.
àà  !
SetAttribute
àà! -
(
àà- .
$str
àà. 3
,
àà3 4
uri
àà5 8
)
àà8 9
;
àà9 :
element
ââ 
.
ââ 
AppendChild
ââ #
(
ââ# $
exceptUriElement
ââ$ 4
)
ââ4 5
;
ââ5 6
}
ää 
return
ãã 
element
ãã 
.
ãã 

ChildNodes
ãã %
;
ãã% &
}
åå 	
public
éé 
override
éé 
void
éé 
	LoadInput
éé &
(
éé& '
object
éé' -
obj
éé. 1
)
éé1 2
{
èè 	
if
êê 
(
êê 
obj
êê 
is
êê 
Stream
êê 
)
êê 
{
ëë 
LoadStreamInput
íí 
(
íí  
(
íí  !
Stream
íí! '
)
íí' (
obj
íí( +
)
íí+ ,
;
íí, -
}
ìì 
else
îî 
if
îî 
(
îî 
obj
îî 
is
îî 
XmlDocument
îî '
)
îî' (
{
ïï "
LoadXmlDocumentInput
ññ $
(
ññ$ %
(
ññ% &
XmlDocument
ññ& 1
)
ññ1 2
obj
ññ2 5
)
ññ5 6
;
ññ6 7
}
óó 
}
òò 	
private
öö 
void
öö 
LoadStreamInput
öö $
(
öö$ %
Stream
öö% +
stream
öö, 2
)
öö2 3
{
õõ 	
XmlDocument
úú 
document
úú  
=
úú! "
new
úú# &
XmlDocument
úú' 2
(
úú2 3
)
úú3 4
;
úú4 5
document
ùù 
.
ùù  
PreserveWhitespace
ùù '
=
ùù( )
true
ùù* .
;
ùù. /
XmlResolver
ûû 
resolver
ûû  
=
ûû! "
(
ûû# $
ResolverSet
ûû$ /
?
ûû0 1
_xmlResolver
ûû2 >
:
ûû? @
new
ûûA D
XmlSecureResolver
ûûE V
(
ûûV W
new
ûûW Z
XmlUrlResolver
ûû[ i
(
ûûi j
)
ûûj k
,
ûûk l
BaseURI
ûûm t
)
ûût u
)
ûûu v
;
ûûv w
	XmlReader
üü 
	xmlReader
üü 
=
üü  !
Utils
üü" '
.
üü' (#
PreProcessStreamInput
üü( =
(
üü= >
stream
üü> D
,
üüD E
resolver
üüF N
,
üüN O
BaseURI
üüP W
)
üüW X
;
üüX Y
document
†† 
.
†† 
Load
†† 
(
†† 
	xmlReader
†† #
)
††# $
;
††$ %!
_containingDocument
°° 
=
°°  !
document
°°" *
;
°°* +
_nsm
¢¢ 
=
¢¢ 
new
¢¢ !
XmlNamespaceManager
¢¢ *
(
¢¢* +!
_containingDocument
¢¢+ >
.
¢¢> ?
	NameTable
¢¢? H
)
¢¢H I
;
¢¢I J
_nsm
££ 
.
££ 
AddNamespace
££ 
(
££ 
$str
££ #
,
££# $
EncryptedXml
££% 1
.
££1 2 
XmlEncNamespaceUrl
££2 D
)
££D E
;
££E F 
_encryptedDataList
•• 
=
••  
document
••! )
.
••) *
SelectNodes
••* 5
(
••5 6
$str
••6 K
,
••K L
_nsm
••M Q
)
••Q R
;
••R S
}
¶¶ 	
private
®® 
void
®® "
LoadXmlDocumentInput
®® )
(
®®) *
XmlDocument
®®* 5
document
®®6 >
)
®®> ?
{
©© 	
if
™™ 
(
™™ 
document
™™ 
==
™™ 
null
™™  
)
™™  !
throw
´´ 
new
´´ #
ArgumentNullException
´´ /
(
´´/ 0
nameof
´´0 6
(
´´6 7
document
´´7 ?
)
´´? @
)
´´@ A
;
´´A B!
_containingDocument
¨¨ 
=
¨¨  !
document
¨¨" *
;
¨¨* +
_nsm
≠≠ 
=
≠≠ 
new
≠≠ !
XmlNamespaceManager
≠≠ *
(
≠≠* +
document
≠≠+ 3
.
≠≠3 4
	NameTable
≠≠4 =
)
≠≠= >
;
≠≠> ?
_nsm
ÆÆ 
.
ÆÆ 
AddNamespace
ÆÆ 
(
ÆÆ 
$str
ÆÆ #
,
ÆÆ# $
EncryptedXml
ÆÆ% 1
.
ÆÆ1 2 
XmlEncNamespaceUrl
ÆÆ2 D
)
ÆÆD E
;
ÆÆE F 
_encryptedDataList
∞∞ 
=
∞∞  
document
∞∞! )
.
∞∞) *
SelectNodes
∞∞* 5
(
∞∞5 6
$str
∞∞6 K
,
∞∞K L
_nsm
∞∞M Q
)
∞∞Q R
;
∞∞R S
}
±± 	
private
¥¥ 
void
¥¥ "
ReplaceEncryptedData
¥¥ )
(
¥¥) *

XmlElement
¥¥* 4"
encryptedDataElement
¥¥5 I
,
¥¥I J
byte
¥¥K O
[
¥¥O P
]
¥¥P Q
	decrypted
¥¥R [
)
¥¥[ \
{
µµ 	
XmlNode
∂∂ 
parent
∂∂ 
=
∂∂ "
encryptedDataElement
∂∂ 1
.
∂∂1 2

ParentNode
∂∂2 <
;
∂∂< =
if
∑∑ 
(
∑∑ 
parent
∑∑ 
.
∑∑ 
NodeType
∑∑ 
==
∑∑  "
XmlNodeType
∑∑# .
.
∑∑. /
Document
∑∑/ 7
)
∑∑7 8
{
∏∏ 
parent
ææ 
.
ææ 
InnerXml
ææ 
=
ææ  !
EncryptedXml
ææ" .
.
ææ. /
Encoding
ææ/ 7
.
ææ7 8
	GetString
ææ8 A
(
ææA B
	decrypted
ææB K
)
ææK L
;
ææL M
}
øø 
else
¿¿ 
{
¡¡ 
EncryptedXml
ƒƒ 
.
ƒƒ 
ReplaceData
ƒƒ (
(
ƒƒ( )"
encryptedDataElement
ƒƒ) =
,
ƒƒ= >
	decrypted
ƒƒ? H
)
ƒƒH I
;
ƒƒI J
}
≈≈ 
}
∆∆ 	
private
»» 
bool
»» &
ProcessEncryptedDataItem
»» -
(
»»- .

XmlElement
»». 8"
encryptedDataElement
»»9 M
)
»»M N
{
…… 	
if
ÀÀ 
(
ÀÀ 

ExceptUris
ÀÀ 
.
ÀÀ 
Count
ÀÀ  
>
ÀÀ! "
$num
ÀÀ# $
)
ÀÀ$ %
{
ÃÃ 
for
ÕÕ 
(
ÕÕ 
int
ÕÕ 
index
ÕÕ 
=
ÕÕ  
$num
ÕÕ! "
;
ÕÕ" #
index
ÕÕ$ )
<
ÕÕ* +

ExceptUris
ÕÕ, 6
.
ÕÕ6 7
Count
ÕÕ7 <
;
ÕÕ< =
index
ÕÕ> C
++
ÕÕC E
)
ÕÕE F
{
ŒŒ 
if
œœ 
(
œœ 
IsTargetElement
œœ '
(
œœ' ("
encryptedDataElement
œœ( <
,
œœ< =
(
œœ> ?
string
œœ? E
)
œœE F

ExceptUris
œœF P
[
œœP Q
index
œœQ V
]
œœV W
)
œœW X
)
œœX Y
return
–– 
false
–– $
;
––$ %
}
—— 
}
““ 
EncryptedData
”” 
ed
”” 
=
”” 
new
”” "
EncryptedData
””# 0
(
””0 1
)
””1 2
;
””2 3
ed
‘‘ 
.
‘‘ 
LoadXml
‘‘ 
(
‘‘ "
encryptedDataElement
‘‘ +
)
‘‘+ ,
;
‘‘, -
ICipherParameters
’’ 
symAlg
’’ $
=
’’% &
EncryptedXml
’’' 3
.
’’3 4
GetDecryptionKey
’’4 D
(
’’D E
ed
’’E G
,
’’G H
null
’’I M
)
’’M N
;
’’N O
if
÷÷ 
(
÷÷ 
symAlg
÷÷ 
==
÷÷ 
null
÷÷ 
)
÷÷ 
throw
◊◊ 
new
◊◊ 
System
◊◊  
.
◊◊  !
Security
◊◊! )
.
◊◊) *
Cryptography
◊◊* 6
.
◊◊6 7$
CryptographicException
◊◊7 M
(
◊◊M N
SR
◊◊N P
.
◊◊P Q3
%Cryptography_Xml_MissingDecryptionKey
◊◊Q v
)
◊◊v w
;
◊◊w x
byte
ÿÿ 
[
ÿÿ 
]
ÿÿ 
	decrypted
ÿÿ 
=
ÿÿ 
EncryptedXml
ÿÿ +
.
ÿÿ+ ,
DecryptData
ÿÿ, 7
(
ÿÿ7 8
ed
ÿÿ8 :
,
ÿÿ: ;
symAlg
ÿÿ< B
)
ÿÿB C
;
ÿÿC D"
ReplaceEncryptedData
⁄⁄  
(
⁄⁄  !"
encryptedDataElement
⁄⁄! 5
,
⁄⁄5 6
	decrypted
⁄⁄7 @
)
⁄⁄@ A
;
⁄⁄A B
return
€€ 
true
€€ 
;
€€ 
}
‹‹ 	
private
ﬁﬁ 
void
ﬁﬁ '
ProcessElementRecursively
ﬁﬁ .
(
ﬁﬁ. /
XmlNodeList
ﬁﬁ/ :
encryptedDatas
ﬁﬁ; I
)
ﬁﬁI J
{
ﬂﬂ 	
if
‡‡ 
(
‡‡ 
encryptedDatas
‡‡ 
==
‡‡ !
null
‡‡" &
||
‡‡' )
encryptedDatas
‡‡* 8
.
‡‡8 9
Count
‡‡9 >
==
‡‡? A
$num
‡‡B C
)
‡‡C D
return
·· 
;
·· 
Queue
‚‚ !
encryptedDatasQueue
‚‚ %
=
‚‚& '
new
‚‚( +
Queue
‚‚, 1
(
‚‚1 2
)
‚‚2 3
;
‚‚3 4
foreach
„„ 
(
„„ 
XmlNode
„„ 
value
„„ "
in
„„# %
encryptedDatas
„„& 4
)
„„4 5
{
‰‰ !
encryptedDatasQueue
ÂÂ #
.
ÂÂ# $
Enqueue
ÂÂ$ +
(
ÂÂ+ ,
value
ÂÂ, 1
)
ÂÂ1 2
;
ÂÂ2 3
}
ÊÊ 
XmlNode
ÁÁ 
node
ÁÁ 
=
ÁÁ !
encryptedDatasQueue
ÁÁ .
.
ÁÁ. /
Dequeue
ÁÁ/ 6
(
ÁÁ6 7
)
ÁÁ7 8
as
ÁÁ9 ;
XmlNode
ÁÁ< C
;
ÁÁC D
while
ËË 
(
ËË 
node
ËË 
!=
ËË 
null
ËË 
)
ËË  
{
ÈÈ 

XmlElement
ÍÍ "
encryptedDataElement
ÍÍ /
=
ÍÍ0 1
node
ÍÍ2 6
as
ÍÍ7 9

XmlElement
ÍÍ: D
;
ÍÍD E
if
ÎÎ 
(
ÎÎ "
encryptedDataElement
ÎÎ (
!=
ÎÎ) +
null
ÎÎ, 0
&&
ÎÎ1 3"
encryptedDataElement
ÎÎ4 H
.
ÎÎH I
	LocalName
ÎÎI R
==
ÎÎS U
$str
ÎÎV e
&&
ÎÎf h"
encryptedDataElement
ÏÏ (
.
ÏÏ( )
NamespaceURI
ÏÏ) 5
==
ÏÏ6 8
EncryptedXml
ÏÏ9 E
.
ÏÏE F 
XmlEncNamespaceUrl
ÏÏF X
)
ÏÏX Y
{
ÌÌ 
XmlNode
ÓÓ 
sibling
ÓÓ #
=
ÓÓ$ %"
encryptedDataElement
ÓÓ& :
.
ÓÓ: ;
NextSibling
ÓÓ; F
;
ÓÓF G
XmlNode
ÔÔ 
parent
ÔÔ "
=
ÔÔ# $"
encryptedDataElement
ÔÔ% 9
.
ÔÔ9 :

ParentNode
ÔÔ: D
;
ÔÔD E
if
 
(
 &
ProcessEncryptedDataItem
 0
(
0 1"
encryptedDataElement
1 E
)
E F
)
F G
{
ÒÒ 
XmlNode
ÛÛ 
child
ÛÛ  %
=
ÛÛ& '
parent
ÛÛ( .
.
ÛÛ. /

FirstChild
ÛÛ/ 9
;
ÛÛ9 :
while
ÙÙ 
(
ÙÙ 
child
ÙÙ $
!=
ÙÙ% '
null
ÙÙ( ,
&&
ÙÙ- /
child
ÙÙ0 5
.
ÙÙ5 6
NextSibling
ÙÙ6 A
!=
ÙÙB D
sibling
ÙÙE L
)
ÙÙL M
child
ıı !
=
ıı" #
child
ıı$ )
.
ıı) *
NextSibling
ıı* 5
;
ıı5 6
if
ˆˆ 
(
ˆˆ 
child
ˆˆ !
!=
ˆˆ" $
null
ˆˆ% )
)
ˆˆ) *
{
˜˜ 
XmlNodeList
¯¯ '
nodes
¯¯( -
=
¯¯. /
child
¯¯0 5
.
¯¯5 6
SelectNodes
¯¯6 A
(
¯¯A B
$str
¯¯B W
,
¯¯W X
_nsm
¯¯Y ]
)
¯¯] ^
;
¯¯^ _
if
˘˘ 
(
˘˘  
nodes
˘˘  %
.
˘˘% &
Count
˘˘& +
>
˘˘, -
$num
˘˘. /
)
˘˘/ 0
{
˙˙ 
foreach
˚˚  '
(
˚˚( )
XmlNode
˚˚) 0
value
˚˚1 6
in
˚˚7 9
nodes
˚˚: ?
)
˚˚? @
{
¸¸  !!
encryptedDatasQueue
˝˝$ 7
.
˝˝7 8
Enqueue
˝˝8 ?
(
˝˝? @
value
˝˝@ E
)
˝˝E F
;
˝˝F G
}
˛˛  !
}
ˇˇ 
}
ÄÄ 
}
ÅÅ 
}
ÇÇ 
if
ÉÉ 
(
ÉÉ !
encryptedDatasQueue
ÉÉ '
.
ÉÉ' (
Count
ÉÉ( -
==
ÉÉ. 0
$num
ÉÉ1 2
)
ÉÉ2 3
break
ÑÑ 
;
ÑÑ 
node
ÖÖ 
=
ÖÖ !
encryptedDatasQueue
ÖÖ *
.
ÖÖ* +
Dequeue
ÖÖ+ 2
(
ÖÖ2 3
)
ÖÖ3 4
as
ÖÖ5 7
XmlNode
ÖÖ8 ?
;
ÖÖ? @
}
ÜÜ 
}
áá 	
public
ââ 
override
ââ 
object
ââ 
	GetOutput
ââ (
(
ââ( )
)
ââ) *
{
ää 	
if
åå 
(
åå  
_encryptedDataList
åå "
!=
åå# %
null
åå& *
)
åå* +'
ProcessElementRecursively
çç )
(
çç) * 
_encryptedDataList
çç* <
)
çç< =
;
çç= >
Utils
èè 
.
èè 
AddNamespaces
èè 
(
èè  !
_containingDocument
èè  3
.
èè3 4
DocumentElement
èè4 C
,
èèC D"
PropagatedNamespaces
èèE Y
)
èèY Z
;
èèZ [
return
êê !
_containingDocument
êê &
;
êê& '
}
ëë 	
public
ìì 
override
ìì 
object
ìì 
	GetOutput
ìì (
(
ìì( )
Type
ìì) -
type
ìì. 2
)
ìì2 3
{
îî 	
if
ïï 
(
ïï 
type
ïï 
==
ïï 
typeof
ïï 
(
ïï 
XmlDocument
ïï *
)
ïï* +
)
ïï+ ,
return
ññ 
(
ññ 
XmlDocument
ññ #
)
ññ# $
	GetOutput
ññ$ -
(
ññ- .
)
ññ. /
;
ññ/ 0
else
óó 
throw
òò 
new
òò 
ArgumentException
òò +
(
òò+ ,
SR
òò, .
.
òò. /:
,Cryptography_Xml_TransformIncorrectInputType
òò/ [
,
òò[ \
nameof
òò] c
(
òòc d
type
òòd h
)
òòh i
)
òòi j
;
òòj k
}
ôô 	
}
öö 
}õõ ¶X
AC:\code\bc-xml-security\refactoring\src\XmlDsigBase64Transform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class "
XmlDsigBase64Transform '
:( )
	Transform* 3
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlNodeList> I
)I J
,J K
typeofL R
(R S
XmlDocumentS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
Stream/ 5
)5 6
}7 8
;8 9
private 
CryptoStream 
_cs  
=! "
null# '
;' (
public "
XmlDsigBase64Transform %
(% &
)& '
{ 	
	Algorithm 
= 
	SignedXml !
.! "%
XmlDsigBase64TransformUrl" ;
;; <
} 	
public 
override 
Type 
[ 
] 

InputTypes )
{ 	
get   
{   
return   
_inputTypes   $
;  $ %
}  & '
}!! 	
public## 
override## 
Type## 
[## 
]## 
OutputTypes## *
{$$ 	
get%% 
{%% 
return%% 
_outputTypes%% %
;%%% &
}%%' (
}&& 	
public(( 
override(( 
void(( 
LoadInnerXml(( )
((() *
XmlNodeList((* 5
nodeList((6 >
)((> ?
{)) 	
}** 	
	protected,, 
override,, 
XmlNodeList,, &
GetInnerXml,,' 2
(,,2 3
),,3 4
{-- 	
return.. 
null.. 
;.. 
}// 	
public11 
override11 
void11 
	LoadInput11 &
(11& '
object11' -
obj11. 1
)111 2
{22 	
if33 
(33 
obj33 
is33 
Stream33 
)33 
{44 
LoadStreamInput55 
(55  
(55  !
Stream55! '
)55' (
obj55( +
)55+ ,
;55, -
return66 
;66 
}77 
if88 
(88 
obj88 
is88 
XmlNodeList88 "
)88" #
{99  
LoadXmlNodeListInput:: $
(::$ %
(::% &
XmlNodeList::& 1
)::1 2
obj::2 5
)::5 6
;::6 7
return;; 
;;; 
}<< 
if== 
(== 
obj== 
is== 
XmlDocument== "
)==" #
{>>  
LoadXmlNodeListInput?? $
(??$ %
(??% &
(??& '
XmlDocument??' 2
)??2 3
obj??3 6
)??6 7
.??7 8
SelectNodes??8 C
(??C D
$str??D I
)??I J
)??J K
;??K L
return@@ 
;@@ 
}AA 
}BB 	
privateDD 
voidDD 
LoadStreamInputDD $
(DD$ %
StreamDD% +
inputStreamDD, 7
)DD7 8
{EE 	
ifFF 
(FF 
inputStreamFF 
==FF 
nullFF #
)FF# $
throwFF% *
newFF+ .
ArgumentExceptionFF/ @
(FF@ A
$strFFA F
)FFF G
;FFG H
MemoryStreamGG 
msGG 
=GG 
newGG !
MemoryStreamGG" .
(GG. /
)GG/ 0
;GG0 1
byteHH 
[HH 
]HH 
bufferHH 
=HH 
newHH 
byteHH  $
[HH$ %
$numHH% )
]HH) *
;HH* +
intII 
	bytesReadII 
;II 
doJJ 
{KK 
	bytesReadLL 
=LL 
inputStreamLL '
.LL' (
ReadLL( ,
(LL, -
bufferLL- 3
,LL3 4
$numLL5 6
,LL6 7
$numLL8 <
)LL< =
;LL= >
ifMM 
(MM 
	bytesReadMM 
>MM 
$numMM  !
)MM! "
{NN 
intOO 
iOO 
=OO 
$numOO 
;OO 
intPP 
jPP 
=PP 
$numPP 
;PP 
whileQQ 
(QQ 
(QQ 
jQQ 
<QQ 
	bytesReadQQ  )
)QQ) *
&&QQ+ -
(QQ. /
!QQ/ 0
charQQ0 4
.QQ4 5
IsWhiteSpaceQQ5 A
(QQA B
(QQB C
charQQC G
)QQG H
bufferQQH N
[QQN O
jQQO P
]QQP Q
)QQQ R
)QQR S
)QQS T
jQQU V
++QQV X
;QQX Y
iRR 
=RR 
jRR 
;RR 
jRR 
++RR 
;RR 
whileSS 
(SS 
jSS 
<SS 
	bytesReadSS (
)SS( )
{TT 
ifUU 
(UU 
!UU 
charUU !
.UU! "
IsWhiteSpaceUU" .
(UU. /
(UU/ 0
charUU0 4
)UU4 5
bufferUU5 ;
[UU; <
jUU< =
]UU= >
)UU> ?
)UU? @
{VV 
bufferWW "
[WW" #
iWW# $
]WW$ %
=WW& '
bufferWW( .
[WW. /
jWW/ 0
]WW0 1
;WW1 2
iXX 
++XX 
;XX  
}YY 
jZZ 
++ZZ 
;ZZ 
}[[ 
ms\\ 
.\\ 
Write\\ 
(\\ 
buffer\\ #
,\\# $
$num\\% &
,\\& '
i\\( )
)\\) *
;\\* +
}]] 
}^^ 
while^^ 
(^^ 
	bytesRead^^ 
>^^  
$num^^! "
)^^" #
;^^# $
ms__ 
.__ 
Position__ 
=__ 
$num__ 
;__ 
_cs`` 
=`` 
new`` 
CryptoStream`` "
(``" #
ms``# %
,``% &
new``' *
FromBase64Transform``+ >
(``> ?
)``? @
,``@ A
CryptoStreamMode``B R
.``R S
Read``S W
)``W X
;``X Y
}aa 	
privatecc 
voidcc  
LoadXmlNodeListInputcc )
(cc) *
XmlNodeListcc* 5
nodeListcc6 >
)cc> ?
{dd 	
StringBuilderee 
sbee 
=ee 
newee "
StringBuilderee# 0
(ee0 1
)ee1 2
;ee2 3
foreachff 
(ff 
XmlNodeff 
nodeff !
inff" $
nodeListff% -
)ff- .
{gg 
XmlNodehh 
resulthh 
=hh  
nodehh! %
.hh% &
SelectSingleNodehh& 6
(hh6 7
$strhh7 E
)hhE F
;hhF G
ifii 
(ii 
resultii 
!=ii 
nullii "
)ii" #
sbjj 
.jj 
Appendjj 
(jj 
resultjj $
.jj$ %
OuterXmljj% -
)jj- .
;jj. /
}kk 
UTF8Encodingll 
utf8ll 
=ll 
newll  #
UTF8Encodingll$ 0
(ll0 1
falsell1 6
)ll6 7
;ll7 8
bytemm 
[mm 
]mm 
buffermm 
=mm 
utf8mm  
.mm  !
GetBytesmm! )
(mm) *
sbmm* ,
.mm, -
ToStringmm- 5
(mm5 6
)mm6 7
)mm7 8
;mm8 9
intnn 
inn 
=nn 
$numnn 
;nn 
intoo 
joo 
=oo 
$numoo 
;oo 
whilepp 
(pp 
(pp 
jpp 
<pp 
bufferpp 
.pp 
Lengthpp %
)pp% &
&&pp' )
(pp* +
!pp+ ,
charpp, 0
.pp0 1
IsWhiteSpacepp1 =
(pp= >
(pp> ?
charpp? C
)ppC D
bufferppD J
[ppJ K
jppK L
]ppL M
)ppM N
)ppN O
)ppO P
jppQ R
++ppR T
;ppT U
iqq 
=qq 
jqq 
;qq 
jqq 
++qq 
;qq 
whilerr 
(rr 
jrr 
<rr 
bufferrr 
.rr 
Lengthrr $
)rr$ %
{ss 
iftt 
(tt 
!tt 
chartt 
.tt 
IsWhiteSpacett &
(tt& '
(tt' (
chartt( ,
)tt, -
buffertt- 3
[tt3 4
jtt4 5
]tt5 6
)tt6 7
)tt7 8
{uu 
buffervv 
[vv 
ivv 
]vv 
=vv 
buffervv  &
[vv& '
jvv' (
]vv( )
;vv) *
iww 
++ww 
;ww 
}xx 
jyy 
++yy 
;yy 
}zz 
MemoryStream{{ 
ms{{ 
={{ 
new{{ !
MemoryStream{{" .
({{. /
buffer{{/ 5
,{{5 6
$num{{7 8
,{{8 9
i{{: ;
){{; <
;{{< =
_cs|| 
=|| 
new|| 
CryptoStream|| "
(||" #
ms||# %
,||% &
new||' *
FromBase64Transform||+ >
(||> ?
)||? @
,||@ A
CryptoStreamMode||B R
.||R S
Read||S W
)||W X
;||X Y
}}} 	
public 
override 
object 
	GetOutput (
(( )
)) *
{
ÄÄ 	
return
ÅÅ 
_cs
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
public
ÑÑ 
override
ÑÑ 
object
ÑÑ 
	GetOutput
ÑÑ (
(
ÑÑ( )
Type
ÑÑ) -
type
ÑÑ. 2
)
ÑÑ2 3
{
ÖÖ 	
if
ÜÜ 
(
ÜÜ 
type
ÜÜ 
!=
ÜÜ 
typeof
ÜÜ 
(
ÜÜ 
Stream
ÜÜ %
)
ÜÜ% &
&&
ÜÜ' )
!
ÜÜ* +
type
ÜÜ+ /
.
ÜÜ/ 0
IsSubclassOf
ÜÜ0 <
(
ÜÜ< =
typeof
ÜÜ= C
(
ÜÜC D
Stream
ÜÜD J
)
ÜÜJ K
)
ÜÜK L
)
ÜÜL M
throw
áá 
new
áá 
ArgumentException
áá +
(
áá+ ,
SR
áá, .
.
áá. /:
,Cryptography_Xml_TransformIncorrectInputType
áá/ [
,
áá[ \
nameof
áá] c
(
áác d
type
áád h
)
ááh i
)
áái j
;
ááj k
return
àà 
_cs
àà 
;
àà 
}
ââ 	
}
ää 
}ãã Ò8
?C:\code\bc-xml-security\refactoring\src\XmlDsigC14NTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class  
XmlDsigC14NTransform %
:& '
	Transform( 1
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlDocument> I
)I J
,J K
typeofL R
(R S
XmlNodeListS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
Stream/ 5
)5 6
}7 8
;8 9
private 
CanonicalXml 
_cXml "
;" #
private 
bool 
_includeComments %
=& '
false( -
;- .
public  
XmlDsigC14NTransform #
(# $
)$ %
{ 	
	Algorithm 
= 
	SignedXml !
.! "#
XmlDsigC14NTransformUrl" 9
;9 :
} 	
public  
XmlDsigC14NTransform #
(# $
bool$ (
includeComments) 8
)8 9
{ 	
_includeComments 
= 
includeComments .
;. /
	Algorithm   
=   
(   
includeComments   (
?  ) *
	SignedXml  + 4
.  4 5/
#XmlDsigC14NWithCommentsTransformUrl  5 X
:  Y Z
	SignedXml  [ d
.  d e#
XmlDsigC14NTransformUrl  e |
)  | }
;  } ~
}!! 	
public## 
override## 
Type## 
[## 
]## 

InputTypes## )
{$$ 	
get%% 
{%% 
return%% 
_inputTypes%% $
;%%$ %
}%%& '
}&& 	
public(( 
override(( 
Type(( 
[(( 
](( 
OutputTypes(( *
{)) 	
get** 
{** 
return** 
_outputTypes** %
;**% &
}**' (
}++ 	
public-- 
override-- 
void-- 
LoadInnerXml-- )
(--) *
XmlNodeList--* 5
nodeList--6 >
)--> ?
{.. 	
if// 
(// 
nodeList// 
!=// 
null//  
&&//! #
nodeList//$ ,
.//, -
Count//- 2
>//3 4
$num//5 6
)//6 7
throw00 
new00 
System00  
.00  !
Security00! )
.00) *
Cryptography00* 6
.006 7"
CryptographicException007 M
(00M N
SR00N P
.00P Q-
!Cryptography_Xml_UnknownTransform00Q r
)00r s
;00s t
}11 	
	protected33 
override33 
XmlNodeList33 &
GetInnerXml33' 2
(332 3
)333 4
{44 	
return55 
null55 
;55 
}66 	
public88 
override88 
void88 
	LoadInput88 &
(88& '
object88' -
obj88. 1
)881 2
{99 	
XmlResolver:: 
resolver::  
=::! "
(::# $
ResolverSet::$ /
?::0 1
_xmlResolver::2 >
:::? @
new::A D
XmlSecureResolver::E V
(::V W
new::W Z
XmlUrlResolver::[ i
(::i j
)::j k
,::k l
BaseURI::m t
)::t u
)::u v
;::v w
if;; 
(;; 
obj;; 
is;; 
Stream;; 
);; 
{<< 
_cXml== 
=== 
new== 
CanonicalXml== (
(==( )
(==) *
Stream==* 0
)==0 1
obj==1 4
,==4 5
_includeComments==6 F
,==F G
resolver==H P
,==P Q
BaseURI==R Y
)==Y Z
;==Z [
return>> 
;>> 
}?? 
if@@ 
(@@ 
obj@@ 
is@@ 
XmlDocument@@ "
)@@" #
{AA 
_cXmlBB 
=BB 
newBB 
CanonicalXmlBB (
(BB( )
(BB) *
XmlDocumentBB* 5
)BB5 6
objBB6 9
,BB9 :
resolverBB; C
,BBC D
_includeCommentsBBE U
)BBU V
;BBV W
returnCC 
;CC 
}DD 
ifEE 
(EE 
objEE 
isEE 
XmlNodeListEE "
)EE" #
{FF 
_cXmlGG 
=GG 
newGG 
CanonicalXmlGG (
(GG( )
(GG) *
XmlNodeListGG* 5
)GG5 6
objGG6 9
,GG9 :
resolverGG; C
,GGC D
_includeCommentsGGE U
)GGU V
;GGV W
}HH 
elseII 
{JJ 
throwKK 
newKK 
ArgumentExceptionKK +
(KK+ ,
SRKK, .
.KK. /0
$Cryptography_Xml_IncorrectObjectTypeKK/ S
,KKS T
nameofKKU [
(KK[ \
objKK\ _
)KK_ `
)KK` a
;KKa b
}LL 
}MM 	
publicOO 
overrideOO 
objectOO 
	GetOutputOO (
(OO( )
)OO) *
{PP 	
returnQQ 
newQQ 
MemoryStreamQQ #
(QQ# $
_cXmlQQ$ )
.QQ) *
GetBytesQQ* 2
(QQ2 3
)QQ3 4
)QQ4 5
;QQ5 6
}RR 	
publicTT 
overrideTT 
objectTT 
	GetOutputTT (
(TT( )
TypeTT) -
typeTT. 2
)TT2 3
{UU 	
ifVV 
(VV 
typeVV 
!=VV 
typeofVV 
(VV 
StreamVV %
)VV% &
&&VV' )
!VV* +
typeVV+ /
.VV/ 0
IsSubclassOfVV0 <
(VV< =
typeofVV= C
(VVC D
StreamVVD J
)VVJ K
)VVK L
)VVL M
throwWW 
newWW 
ArgumentExceptionWW +
(WW+ ,
SRWW, .
.WW. /8
,Cryptography_Xml_TransformIncorrectInputTypeWW/ [
,WW[ \
nameofWW] c
(WWc d
typeWWd h
)WWh i
)WWi j
;WWj k
returnXX 
newXX 
MemoryStreamXX #
(XX# $
_cXmlXX$ )
.XX) *
GetBytesXX* 2
(XX2 3
)XX3 4
)XX4 5
;XX5 6
}YY 	
public[[ 
override[[ 
void[[ 
GetDigestedOutput[[ .
([[. /
IHash[[/ 4
hash[[5 9
)[[9 :
{\\ 	
_cXml]] 
.]] 
GetDigestedBytes]] "
(]]" #
hash]]# '
)]]' (
;]]( )
}^^ 	
}__ 
}`` ¯
KC:\code\bc-xml-security\refactoring\src\XmlDsigC14NWithCommentsTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class ,
 XmlDsigC14NWithCommentsTransform 1
:2 3 
XmlDsigC14NTransform4 H
{ 
public ,
 XmlDsigC14NWithCommentsTransform /
(/ 0
)0 1
: 
base 
( 
true 
) 
{ 	
	Algorithm 
= 
	SignedXml !
.! "/
#XmlDsigC14NWithCommentsTransformUrl" E
;E F
} 	
} 
} ˚á
MC:\code\bc-xml-security\refactoring\src\XmlDsigEnvelopedSignatureTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class .
"XmlDsigEnvelopedSignatureTransform 3
:4 5
	Transform6 ?
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlNodeList> I
)I J
,J K
typeofL R
(R S
XmlDocumentS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
XmlNodeList/ :
): ;
,; <
typeof= C
(C D
XmlDocumentD O
)O P
}Q R
;R S
private 
XmlNodeList 
_inputNodeList *
;* +
private 
bool 
_includeComments %
=& '
false( -
;- .
private 
XmlNamespaceManager #
_nsm$ (
=) *
null+ /
;/ 0
private 
XmlDocument 
_containingDocument /
=0 1
null2 6
;6 7
private 
int 
_signaturePosition &
=' (
$num) *
;* +
internal 
int 
SignaturePosition &
{ 	
set 
{ 
_signaturePosition $
=% &
value' ,
;, -
}. /
} 	
public   .
"XmlDsigEnvelopedSignatureTransform   1
(  1 2
)  2 3
{!! 	
	Algorithm"" 
="" 
	SignedXml"" !
.""! "1
%XmlDsigEnvelopedSignatureTransformUrl""" G
;""G H
}## 	
public&& .
"XmlDsigEnvelopedSignatureTransform&& 1
(&&1 2
bool&&2 6
includeComments&&7 F
)&&F G
{'' 	
_includeComments(( 
=(( 
includeComments(( .
;((. /
	Algorithm)) 
=)) 
	SignedXml)) !
.))! "1
%XmlDsigEnvelopedSignatureTransformUrl))" G
;))G H
}** 	
public,, 
override,, 
Type,, 
[,, 
],, 

InputTypes,, )
{-- 	
get.. 
{.. 
return.. 
_inputTypes.. $
;..$ %
}..& '
}// 	
public11 
override11 
Type11 
[11 
]11 
OutputTypes11 *
{22 	
get33 
{33 
return33 
_outputTypes33 %
;33% &
}33' (
}44 	
public77 
override77 
void77 
LoadInnerXml77 )
(77) *
XmlNodeList77* 5
nodeList776 >
)77> ?
{88 	
if99 
(99 
nodeList99 
!=99 
null99  
&&99! #
nodeList99$ ,
.99, -
Count99- 2
>993 4
$num995 6
)996 7
throw:: 
new:: 
System::  
.::  !
Security::! )
.::) *
Cryptography::* 6
.::6 7"
CryptographicException::7 M
(::M N
SR::N P
.::P Q-
!Cryptography_Xml_UnknownTransform::Q r
)::r s
;::s t
};; 	
	protected>> 
override>> 
XmlNodeList>> &
GetInnerXml>>' 2
(>>2 3
)>>3 4
{?? 	
return@@ 
null@@ 
;@@ 
}AA 	
publicCC 
overrideCC 
voidCC 
	LoadInputCC &
(CC& '
objectCC' -
objCC. 1
)CC1 2
{DD 	
ifEE 
(EE 
objEE 
isEE 
StreamEE 
)EE 
{FF 
LoadStreamInputGG 
(GG  
(GG  !
StreamGG! '
)GG' (
objGG( +
)GG+ ,
;GG, -
returnHH 
;HH 
}II 
ifJJ 
(JJ 
objJJ 
isJJ 
XmlNodeListJJ "
)JJ" #
{KK  
LoadXmlNodeListInputLL $
(LL$ %
(LL% &
XmlNodeListLL& 1
)LL1 2
objLL2 5
)LL5 6
;LL6 7
returnMM 
;MM 
}NN 
ifOO 
(OO 
objOO 
isOO 
XmlDocumentOO "
)OO" #
{PP  
LoadXmlDocumentInputQQ $
(QQ$ %
(QQ% &
XmlDocumentQQ& 1
)QQ1 2
objQQ2 5
)QQ5 6
;QQ6 7
returnRR 
;RR 
}SS 
}TT 	
privateVV 
voidVV 
LoadStreamInputVV $
(VV$ %
StreamVV% +
streamVV, 2
)VV2 3
{WW 	
XmlDocumentXX 
docXX 
=XX 
newXX !
XmlDocumentXX" -
(XX- .
)XX. /
;XX/ 0
docYY 
.YY 
PreserveWhitespaceYY "
=YY# $
trueYY% )
;YY) *
XmlResolverZZ 
resolverZZ  
=ZZ! "
(ZZ# $
ResolverSetZZ$ /
?ZZ0 1
_xmlResolverZZ2 >
:ZZ? @
newZZA D
XmlSecureResolverZZE V
(ZZV W
newZZW Z
XmlUrlResolverZZ[ i
(ZZi j
)ZZj k
,ZZk l
BaseURIZZm t
)ZZt u
)ZZu v
;ZZv w
	XmlReader[[ 
	xmlReader[[ 
=[[  !
Utils[[" '
.[[' (!
PreProcessStreamInput[[( =
([[= >
stream[[> D
,[[D E
resolver[[F N
,[[N O
BaseURI[[P W
)[[W X
;[[X Y
doc\\ 
.\\ 
Load\\ 
(\\ 
	xmlReader\\ 
)\\ 
;\\  
_containingDocument]] 
=]]  !
doc]]" %
;]]% &
if^^ 
(^^ 
_containingDocument^^ #
==^^$ &
null^^' +
)^^+ ,
throw__ 
new__ 
System__  
.__  !
Security__! )
.__) *
Cryptography__* 6
.__6 7"
CryptographicException__7 M
(__M N
SR__N P
.__P Q?
2Cryptography_Xml_EnvelopedSignatureRequiresContext	__Q É
)
__É Ñ
;
__Ñ Ö
_nsm`` 
=`` 
new`` 
XmlNamespaceManager`` *
(``* +
_containingDocument``+ >
.``> ?
	NameTable``? H
)``H I
;``I J
_nsmaa 
.aa 
AddNamespaceaa 
(aa 
$straa $
,aa$ %
	SignedXmlaa& /
.aa/ 0
XmlDsigNamespaceUrlaa0 C
)aaC D
;aaD E
}bb 	
privatedd 
voiddd  
LoadXmlNodeListInputdd )
(dd) *
XmlNodeListdd* 5
nodeListdd6 >
)dd> ?
{ee 	
ifgg 
(gg 
nodeListgg 
==gg 
nullgg  
)gg  !
throwhh 
newhh !
ArgumentNullExceptionhh /
(hh/ 0
nameofhh0 6
(hh6 7
nodeListhh7 ?
)hh? @
)hh@ A
;hhA B
_containingDocumentii 
=ii  !
Utilsii" '
.ii' (
GetOwnerDocumentii( 8
(ii8 9
nodeListii9 A
)iiA B
;iiB C
ifjj 
(jj 
_containingDocumentjj #
==jj$ &
nulljj' +
)jj+ ,
throwkk 
newkk 
Systemkk  
.kk  !
Securitykk! )
.kk) *
Cryptographykk* 6
.kk6 7"
CryptographicExceptionkk7 M
(kkM N
SRkkN P
.kkP Q?
2Cryptography_Xml_EnvelopedSignatureRequiresContext	kkQ É
)
kkÉ Ñ
;
kkÑ Ö
_nsmmm 
=mm 
newmm 
XmlNamespaceManagermm *
(mm* +
_containingDocumentmm+ >
.mm> ?
	NameTablemm? H
)mmH I
;mmI J
_nsmnn 
.nn 
AddNamespacenn 
(nn 
$strnn $
,nn$ %
	SignedXmlnn& /
.nn/ 0
XmlDsigNamespaceUrlnn0 C
)nnC D
;nnD E
_inputNodeListoo 
=oo 
nodeListoo %
;oo% &
}pp 	
privaterr 
voidrr  
LoadXmlDocumentInputrr )
(rr) *
XmlDocumentrr* 5
docrr6 9
)rr9 :
{ss 	
iftt 
(tt 
doctt 
==tt 
nulltt 
)tt 
throwuu 
newuu !
ArgumentNullExceptionuu /
(uu/ 0
nameofuu0 6
(uu6 7
docuu7 :
)uu: ;
)uu; <
;uu< =
_containingDocumentvv 
=vv  !
docvv" %
;vv% &
_nsmww 
=ww 
newww 
XmlNamespaceManagerww *
(ww* +
_containingDocumentww+ >
.ww> ?
	NameTableww? H
)wwH I
;wwI J
_nsmxx 
.xx 
AddNamespacexx 
(xx 
$strxx $
,xx$ %
	SignedXmlxx& /
.xx/ 0
XmlDsigNamespaceUrlxx0 C
)xxC D
;xxD E
}yy 	
public{{ 
override{{ 
object{{ 
	GetOutput{{ (
({{( )
){{) *
{|| 	
if}} 
(}} 
_containingDocument}} #
==}}$ &
null}}' +
)}}+ ,
throw~~ 
new~~ 
System~~  
.~~  !
Security~~! )
.~~) *
Cryptography~~* 6
.~~6 7"
CryptographicException~~7 M
(~~M N
SR~~N P
.~~P Q?
2Cryptography_Xml_EnvelopedSignatureRequiresContext	~~Q É
)
~~É Ñ
;
~~Ñ Ö
if
ÅÅ 
(
ÅÅ 
_inputNodeList
ÅÅ 
!=
ÅÅ !
null
ÅÅ" &
)
ÅÅ& '
{
ÇÇ 
if
ÑÑ 
(
ÑÑ  
_signaturePosition
ÑÑ &
==
ÑÑ' )
$num
ÑÑ* +
)
ÑÑ+ ,
return
ÑÑ- 3
_inputNodeList
ÑÑ4 B
;
ÑÑB C
XmlNodeList
ÖÖ 
signatureList
ÖÖ )
=
ÖÖ* +!
_containingDocument
ÖÖ, ?
.
ÖÖ? @
SelectNodes
ÖÖ@ K
(
ÖÖK L
$str
ÖÖL ^
,
ÖÖ^ _
_nsm
ÖÖ` d
)
ÖÖd e
;
ÖÖe f
if
ÜÜ 
(
ÜÜ 
signatureList
ÜÜ !
==
ÜÜ" $
null
ÜÜ% )
)
ÜÜ) *
return
ÜÜ+ 1
_inputNodeList
ÜÜ2 @
;
ÜÜ@ A"
CanonicalXmlNodeList
àà $
resultNodeList
àà% 3
=
àà4 5
new
àà6 9"
CanonicalXmlNodeList
àà: N
(
ààN O
)
ààO P
;
ààP Q
foreach
ââ 
(
ââ 
XmlNode
ââ  
node
ââ! %
in
ââ& (
_inputNodeList
ââ) 7
)
ââ7 8
{
ää 
if
ãã 
(
ãã 
node
ãã 
==
ãã 
null
ãã  $
)
ãã$ %
continue
ãã& .
;
ãã. /
if
çç 
(
çç 
Utils
çç 
.
çç  
IsXmlNamespaceNode
çç 0
(
çç0 1
node
çç1 5
)
çç5 6
||
çç7 9
Utils
çç: ?
.
çç? @
IsNamespaceNode
çç@ O
(
ççO P
node
ççP T
)
ççT U
)
ççU V
{
éé 
resultNodeList
èè &
.
èè& '
Add
èè' *
(
èè* +
node
èè+ /
)
èè/ 0
;
èè0 1
}
êê 
else
ëë 
{
íí 
try
îî 
{
ïï 
XmlNode
óó #
result
óó$ *
=
óó+ ,
node
óó- 1
.
óó1 2
SelectSingleNode
óó2 B
(
óóB C
$str
óóC h
,
óóh i
_nsm
óój n
)
óón o
;
óóo p
int
òò 
position
òò  (
=
òò) *
$num
òò+ ,
;
òò, -
foreach
ôô #
(
ôô$ %
XmlNode
ôô% ,
node1
ôô- 2
in
ôô3 5
signatureList
ôô6 C
)
ôôC D
{
öö 
position
õõ  (
++
õõ( *
;
õõ* +
if
úú  "
(
úú# $
node1
úú$ )
==
úú* ,
result
úú- 3
)
úú3 4
break
úú5 :
;
úú: ;
}
ùù 
if
ûû 
(
ûû  
result
ûû  &
==
ûû' )
null
ûû* .
||
ûû/ 1
position
ûû2 :
!=
ûû; = 
_signaturePosition
ûû> P
)
ûûP Q
{
üü 
resultNodeList
††  .
.
††. /
Add
††/ 2
(
††2 3
node
††3 7
)
††7 8
;
††8 9
}
°° 
}
¢¢ 
catch
££ 
{
££ 
}
££  !
}
§§ 
}
•• 
return
¶¶ 
resultNodeList
¶¶ %
;
¶¶% &
}
ßß 
else
©© 
{
™™ 
XmlNodeList
´´ 
signatureList
´´ )
=
´´* +!
_containingDocument
´´, ?
.
´´? @
SelectNodes
´´@ K
(
´´K L
$str
´´L ^
,
´´^ _
_nsm
´´` d
)
´´d e
;
´´e f
if
¨¨ 
(
¨¨ 
signatureList
¨¨ !
==
¨¨" $
null
¨¨% )
)
¨¨) *
return
¨¨+ 1!
_containingDocument
¨¨2 E
;
¨¨E F
if
≠≠ 
(
≠≠ 
signatureList
≠≠ !
.
≠≠! "
Count
≠≠" '
<
≠≠( ) 
_signaturePosition
≠≠* <
||
≠≠= ? 
_signaturePosition
≠≠@ R
<=
≠≠S U
$num
≠≠V W
)
≠≠W X
return
≠≠Y _!
_containingDocument
≠≠` s
;
≠≠s t
signatureList
∞∞ 
[
∞∞  
_signaturePosition
∞∞ 0
-
∞∞1 2
$num
∞∞3 4
]
∞∞4 5
.
∞∞5 6

ParentNode
∞∞6 @
.
∞∞@ A
RemoveChild
∞∞A L
(
∞∞L M
signatureList
∞∞M Z
[
∞∞Z [ 
_signaturePosition
∞∞[ m
-
∞∞n o
$num
∞∞p q
]
∞∞q r
)
∞∞r s
;
∞∞s t
return
±± !
_containingDocument
±± *
;
±±* +
}
≤≤ 
}
≥≥ 	
public
µµ 
override
µµ 
object
µµ 
	GetOutput
µµ (
(
µµ( )
Type
µµ) -
type
µµ. 2
)
µµ2 3
{
∂∂ 	
if
∑∑ 
(
∑∑ 
type
∑∑ 
==
∑∑ 
typeof
∑∑ 
(
∑∑ 
XmlNodeList
∑∑ *
)
∑∑* +
||
∑∑, .
type
∑∑/ 3
.
∑∑3 4
IsSubclassOf
∑∑4 @
(
∑∑@ A
typeof
∑∑A G
(
∑∑G H
XmlNodeList
∑∑H S
)
∑∑S T
)
∑∑T U
)
∑∑U V
{
∏∏ 
if
ππ 
(
ππ 
_inputNodeList
ππ "
==
ππ# %
null
ππ& *
)
ππ* +
{
∫∫ 
_inputNodeList
ªª "
=
ªª# $
Utils
ªª% *
.
ªª* + 
AllDescendantNodes
ªª+ =
(
ªª= >!
_containingDocument
ªª> Q
,
ªªQ R
true
ªªS W
)
ªªW X
;
ªªX Y
}
ºº 
return
ΩΩ 
(
ΩΩ 
XmlNodeList
ΩΩ #
)
ΩΩ# $
	GetOutput
ΩΩ$ -
(
ΩΩ- .
)
ΩΩ. /
;
ΩΩ/ 0
}
ææ 
else
øø 
if
øø 
(
øø 
type
øø 
==
øø 
typeof
øø #
(
øø# $
XmlDocument
øø$ /
)
øø/ 0
||
øø1 3
type
øø4 8
.
øø8 9
IsSubclassOf
øø9 E
(
øøE F
typeof
øøF L
(
øøL M
XmlDocument
øøM X
)
øøX Y
)
øøY Z
)
øøZ [
{
¿¿ 
if
¡¡ 
(
¡¡ 
_inputNodeList
¡¡ "
!=
¡¡# %
null
¡¡& *
)
¡¡* +
throw
¡¡, 1
new
¡¡2 5
ArgumentException
¡¡6 G
(
¡¡G H
SR
¡¡H J
.
¡¡J K:
,Cryptography_Xml_TransformIncorrectInputType
¡¡K w
,
¡¡w x
nameof
¡¡y 
(¡¡ Ä
type¡¡Ä Ñ
)¡¡Ñ Ö
)¡¡Ö Ü
;¡¡Ü á
return
¬¬ 
(
¬¬ 
XmlDocument
¬¬ #
)
¬¬# $
	GetOutput
¬¬$ -
(
¬¬- .
)
¬¬. /
;
¬¬/ 0
}
√√ 
else
ƒƒ 
{
≈≈ 
throw
∆∆ 
new
∆∆ 
ArgumentException
∆∆ +
(
∆∆+ ,
SR
∆∆, .
.
∆∆. /:
,Cryptography_Xml_TransformIncorrectInputType
∆∆/ [
,
∆∆[ \
nameof
∆∆] c
(
∆∆c d
type
∆∆d h
)
∆∆h i
)
∆∆i j
;
∆∆j k
}
«« 
}
»» 	
}
…… 
}   Í`
BC:\code\bc-xml-security\refactoring\src\XmlDsigExcC14NTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class #
XmlDsigExcC14NTransform (
:) *
	Transform+ 4
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlDocument> I
)I J
,J K
typeofL R
(R S
XmlNodeListS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
Stream/ 5
)5 6
}7 8
;8 9
private 
bool 
_includeComments %
=& '
false( -
;- .
private 
string *
_inclusiveNamespacesPrefixList 5
;5 6
private 
ExcCanonicalXml 
_excCanonicalXml  0
;0 1
public #
XmlDsigExcC14NTransform &
(& '
)' (
:) *
this+ /
(/ 0
false0 5
,5 6
null7 ;
); <
{= >
}? @
public #
XmlDsigExcC14NTransform &
(& '
bool' +
includeComments, ;
); <
:= >
this? C
(C D
includeCommentsD S
,S T
nullU Y
)Y Z
{[ \
}] ^
public #
XmlDsigExcC14NTransform &
(& '
string' -)
inclusiveNamespacesPrefixList. K
)K L
:M N
thisO S
(S T
falseT Y
,Y Z)
inclusiveNamespacesPrefixList[ x
)x y
{z {
}| }
public #
XmlDsigExcC14NTransform &
(& '
bool' +
includeComments, ;
,; <
string= C)
inclusiveNamespacesPrefixListD a
)a b
{   	
_includeComments!! 
=!! 
includeComments!! .
;!!. /*
_inclusiveNamespacesPrefixList"" *
=""+ ,)
inclusiveNamespacesPrefixList""- J
;""J K
	Algorithm## 
=## 
(## 
includeComments## (
?##) *
	SignedXml##+ 4
.##4 52
&XmlDsigExcC14NWithCommentsTransformUrl##5 [
:##\ ]
	SignedXml##^ g
.##g h'
XmlDsigExcC14NTransformUrl	##h Ç
)
##Ç É
;
##É Ñ
}$$ 	
public&& 
string&& )
InclusiveNamespacesPrefixList&& 3
{'' 	
get(( 
{(( 
return(( *
_inclusiveNamespacesPrefixList(( 7
;((7 8
}((9 :
set)) 
{)) *
_inclusiveNamespacesPrefixList)) 0
=))1 2
value))3 8
;))8 9
})): ;
}** 	
public,, 
override,, 
Type,, 
[,, 
],, 

InputTypes,, )
{-- 	
get.. 
{.. 
return.. 
_inputTypes.. $
;..$ %
}..& '
}// 	
public11 
override11 
Type11 
[11 
]11 
OutputTypes11 *
{22 	
get33 
{33 
return33 
_outputTypes33 %
;33% &
}33' (
}44 	
public66 
override66 
void66 
LoadInnerXml66 )
(66) *
XmlNodeList66* 5
nodeList666 >
)66> ?
{77 	
if88 
(88 
nodeList88 
!=88 
null88  
)88  !
{99 
foreach:: 
(:: 
XmlNode::  
n::! "
in::# %
nodeList::& .
)::. /
{;; 

XmlElement<< 
e<<  
=<<! "
n<<# $
as<<% '

XmlElement<<( 2
;<<2 3
if== 
(== 
e== 
!=== 
null== !
)==! "
{>> 
if?? 
(?? 
e?? 
.?? 
	LocalName?? '
.??' (
Equals??( .
(??. /
$str??/ D
)??D E
&&@@ 
e@@ 
.@@ 
NamespaceURI@@ )
.@@) *
Equals@@* 0
(@@0 1
	SignedXml@@1 :
.@@: ;&
XmlDsigExcC14NTransformUrl@@; U
)@@U V
&&@@W Y
UtilsAA 
.AA 
HasAttributeAA *
(AA* +
eAA+ ,
,AA, -
$strAA. :
,AA: ;
	SignedXmlAA< E
.AAE F
XmlDsigNamespaceUrlAAF Y
)AAY Z
)AAZ [
{BB 
ifCC 
(CC  
!CC  !
UtilsCC! &
.CC& '
VerifyAttributesCC' 7
(CC7 8
eCC8 9
,CC9 :
$strCC; G
)CCG H
)CCH I
{DD 
throwEE  %
newEE& )
SystemEE* 0
.EE0 1
SecurityEE1 9
.EE9 :
CryptographyEE: F
.EEF G"
CryptographicExceptionEEG ]
(EE] ^
SREE^ `
.EE` a.
!Cryptography_Xml_UnknownTransform	EEa Ç
)
EEÇ É
;
EEÉ Ñ
}FF 
thisGG  
.GG  !)
InclusiveNamespacesPrefixListGG! >
=GG? @
UtilsGGA F
.GGF G
GetAttributeGGG S
(GGS T
eGGT U
,GGU V
$strGGW c
,GGc d
	SignedXmlGGe n
.GGn o 
XmlDsigNamespaceUrl	GGo Ç
)
GGÇ É
;
GGÉ Ñ
returnHH "
;HH" #
}II 
elseJJ 
{KK 
throwLL !
newLL" %
SystemLL& ,
.LL, -
SecurityLL- 5
.LL5 6
CryptographyLL6 B
.LLB C"
CryptographicExceptionLLC Y
(LLY Z
SRLLZ \
.LL\ ]-
!Cryptography_Xml_UnknownTransformLL] ~
)LL~ 
;	LL Ä
}MM 
}NN 
}OO 
}PP 
}QQ 	
publicSS 
overrideSS 
voidSS 
	LoadInputSS &
(SS& '
objectSS' -
objSS. 1
)SS1 2
{TT 	
XmlResolverUU 
resolverUU  
=UU! "
(UU# $
ResolverSetUU$ /
?UU0 1
_xmlResolverUU2 >
:UU? @
newUUA D
XmlSecureResolverUUE V
(UUV W
newUUW Z
XmlUrlResolverUU[ i
(UUi j
)UUj k
,UUk l
BaseURIUUm t
)UUt u
)UUu v
;UUv w
ifVV 
(VV 
objVV 
isVV 
StreamVV 
)VV 
{WW 
_excCanonicalXmlXX  
=XX! "
newXX# &
ExcCanonicalXmlXX' 6
(XX6 7
(XX7 8
StreamXX8 >
)XX> ?
objXX? B
,XXB C
_includeCommentsXXD T
,XXT U*
_inclusiveNamespacesPrefixListXXV t
,XXt u
resolverXXv ~
,XX~ 
BaseURI
XXÄ á
)
XXá à
;
XXà â
}YY 
elseZZ 
ifZZ 
(ZZ 
objZZ 
isZZ 
XmlDocumentZZ '
)ZZ' (
{[[ 
_excCanonicalXml\\  
=\\! "
new\\# &
ExcCanonicalXml\\' 6
(\\6 7
(\\7 8
XmlDocument\\8 C
)\\C D
obj\\D G
,\\G H
_includeComments\\I Y
,\\Y Z*
_inclusiveNamespacesPrefixList\\[ y
,\\y z
resolver	\\{ É
)
\\É Ñ
;
\\Ñ Ö
}]] 
else^^ 
if^^ 
(^^ 
obj^^ 
is^^ 
XmlNodeList^^ '
)^^' (
{__ 
_excCanonicalXml``  
=``! "
new``# &
ExcCanonicalXml``' 6
(``6 7
(``7 8
XmlNodeList``8 C
)``C D
obj``D G
,``G H
_includeComments``I Y
,``Y Z*
_inclusiveNamespacesPrefixList``[ y
,``y z
resolver	``{ É
)
``É Ñ
;
``Ñ Ö
}aa 
elsebb 
throwcc 
newcc 
ArgumentExceptioncc +
(cc+ ,
SRcc, .
.cc. /0
$Cryptography_Xml_IncorrectObjectTypecc/ S
,ccS T
nameofccU [
(cc[ \
objcc\ _
)cc_ `
)cc` a
;cca b
}dd 	
	protectedff 
overrideff 
XmlNodeListff &
GetInnerXmlff' 2
(ff2 3
)ff3 4
{gg 	
ifhh 
(hh )
InclusiveNamespacesPrefixListhh -
==hh. 0
nullhh1 5
)hh5 6
returnii 
nullii 
;ii 
XmlDocumentjj 
documentjj  
=jj! "
newjj# &
XmlDocumentjj' 2
(jj2 3
)jj3 4
;jj4 5

XmlElementkk 
elementkk 
=kk  
documentkk! )
.kk) *
CreateElementkk* 7
(kk7 8
$strkk8 C
,kkC D
	SignedXmlkkE N
.kkN O
XmlDsigNamespaceUrlkkO b
)kkb c
;kkc d
ifll 
(ll 
!ll 
stringll 
.ll 
IsNullOrEmptyll %
(ll% &
	Algorithmll& /
)ll/ 0
)ll0 1
elementmm 
.mm 
SetAttributemm $
(mm$ %
$strmm% 0
,mm0 1
	Algorithmmm2 ;
)mm; <
;mm< =

XmlElementnn 
prefixListElementnn (
=nn) *
documentnn+ 3
.nn3 4
CreateElementnn4 A
(nnA B
$strnnB W
,nnW X
	SignedXmlnnY b
.nnb c&
XmlDsigExcC14NTransformUrlnnc }
)nn} ~
;nn~ 
prefixListElementoo 
.oo 
SetAttributeoo *
(oo* +
$stroo+ 7
,oo7 8)
InclusiveNamespacesPrefixListoo9 V
)ooV W
;ooW X
elementpp 
.pp 
AppendChildpp 
(pp  
prefixListElementpp  1
)pp1 2
;pp2 3
returnqq 
elementqq 
.qq 

ChildNodesqq %
;qq% &
}rr 	
publictt 
overridett 
objecttt 
	GetOutputtt (
(tt( )
)tt) *
{uu 	
returnvv 
newvv 
MemoryStreamvv #
(vv# $
_excCanonicalXmlvv$ 4
.vv4 5
GetBytesvv5 =
(vv= >
)vv> ?
)vv? @
;vv@ A
}ww 	
publicyy 
overrideyy 
objectyy 
	GetOutputyy (
(yy( )
Typeyy) -
typeyy. 2
)yy2 3
{zz 	
if{{ 
({{ 
type{{ 
!={{ 
typeof{{ 
({{ 
Stream{{ %
){{% &
&&{{' )
!{{* +
type{{+ /
.{{/ 0
IsSubclassOf{{0 <
({{< =
typeof{{= C
({{C D
Stream{{D J
){{J K
){{K L
){{L M
throw|| 
new|| 
ArgumentException|| +
(||+ ,
SR||, .
.||. /8
,Cryptography_Xml_TransformIncorrectInputType||/ [
,||[ \
nameof||] c
(||c d
type||d h
)||h i
)||i j
;||j k
return}} 
new}} 
MemoryStream}} #
(}}# $
_excCanonicalXml}}$ 4
.}}4 5
GetBytes}}5 =
(}}= >
)}}> ?
)}}? @
;}}@ A
}~~ 	
public
ÄÄ 
override
ÄÄ 
void
ÄÄ 
GetDigestedOutput
ÄÄ .
(
ÄÄ. /
IHash
ÄÄ/ 4
signer
ÄÄ5 ;
)
ÄÄ; <
{
ÅÅ 	
_excCanonicalXml
ÇÇ 
.
ÇÇ 
GetDigestedBytes
ÇÇ -
(
ÇÇ- .
signer
ÇÇ. 4
)
ÇÇ4 5
;
ÇÇ5 6
}
ÉÉ 	
}
ÑÑ 
}ÖÖ ‰	
NC:\code\bc-xml-security\refactoring\src\XmlDsigExcC14NWithCommentsTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class /
#XmlDsigExcC14NWithCommentsTransform 4
:5 6#
XmlDsigExcC14NTransform7 N
{ 
public /
#XmlDsigExcC14NWithCommentsTransform 2
(2 3
)3 4
:5 6
base7 ;
(; <
true< @
)@ A
{ 	
	Algorithm 
= 
	SignedXml !
.! "2
&XmlDsigExcC14NWithCommentsTransformUrl" H
;H I
} 	
public /
#XmlDsigExcC14NWithCommentsTransform 2
(2 3
string3 9)
inclusiveNamespacesPrefixList: W
)W X
:Y Z
base[ _
(_ `
true` d
,d e*
inclusiveNamespacesPrefixList	f É
)
É Ñ
{ 	
	Algorithm 
= 
	SignedXml !
.! "2
&XmlDsigExcC14NWithCommentsTransformUrl" H
;H I
} 	
}   
}!! —Ñ
@C:\code\bc-xml-security\refactoring\src\XmlDsigXPathTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class !
XmlDsigXPathTransform &
:' (
	Transform) 2
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlNodeList> I
)I J
,J K
typeofL R
(R S
XmlDocumentS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
XmlNodeList/ :
): ;
}< =
;= >
private 
string 

_xpathexpr !
;! "
private 
XmlDocument 
	_document %
;% &
private 
XmlNamespaceManager #
_nsm$ (
;( )
public !
XmlDsigXPathTransform $
($ %
)% &
{ 	
	Algorithm 
= 
	SignedXml !
.! "$
XmlDsigXPathTransformUrl" :
;: ;
} 	
public   
override   
Type   
[   
]   

InputTypes   )
{!! 	
get"" 
{"" 
return"" 
_inputTypes"" $
;""$ %
}""& '
}## 	
public%% 
override%% 
Type%% 
[%% 
]%% 
OutputTypes%% *
{&& 	
get'' 
{'' 
return'' 
_outputTypes'' %
;''% &
}''' (
}(( 	
public** 
override** 
void** 
LoadInnerXml** )
(**) *
XmlNodeList*** 5
nodeList**6 >
)**> ?
{++ 	
if-- 
(-- 
nodeList-- 
==-- 
null--  
)--  !
throw.. 
new.. 
System..  
...  !
Security..! )
...) *
Cryptography..* 6
...6 7"
CryptographicException..7 M
(..M N
SR..N P
...P Q-
!Cryptography_Xml_UnknownTransform..Q r
)..r s
;..s t
foreach00 
(00 
XmlNode00 
node00 !
in00" $
nodeList00% -
)00- .
{11 
string22 
prefix22 
=22 
null22  $
;22$ %
string33 
namespaceURI33 #
=33$ %
null33& *
;33* +

XmlElement44 
elem44 
=44  !
node44" &
as44' )

XmlElement44* 4
;444 5
if55 
(55 
elem55 
!=55 
null55  
)55  !
{66 
if77 
(77 
elem77 
.77 
	LocalName77 &
==77' )
$str77* 1
)771 2
{88 

_xpathexpr99 "
=99# $
elem99% )
.99) *
InnerXml99* 2
.992 3
Trim993 7
(997 8
null998 <
)99< =
;99= >
XmlNodeReader:: %
nr::& (
=::) *
new::+ .
XmlNodeReader::/ <
(::< =
elem::= A
)::A B
;::B C
XmlNameTable;; $
nt;;% '
=;;( )
nr;;* ,
.;;, -
	NameTable;;- 6
;;;6 7
_nsm<< 
=<< 
new<< "
XmlNamespaceManager<<# 6
(<<6 7
nt<<7 9
)<<9 :
;<<: ;
if== 
(== 
!== 
Utils== "
.==" #
VerifyAttributes==# 3
(==3 4
elem==4 8
,==8 9
(==: ;
string==; A
)==A B
null==B F
)==F G
)==G H
{>> 
throw?? !
new??" %
System??& ,
.??, -
Security??- 5
.??5 6
Cryptography??6 B
.??B C"
CryptographicException??C Y
(??Y Z
SR??Z \
.??\ ]-
!Cryptography_Xml_UnknownTransform??] ~
)??~ 
;	?? Ä
}@@ 
foreachBB 
(BB  !
XmlAttributeBB! -
attribBB. 4
inBB5 7
elemBB8 <
.BB< =

AttributesBB= G
)BBG H
{CC 
ifDD 
(DD  
attribDD  &
.DD& '
PrefixDD' -
==DD. 0
$strDD1 8
)DD8 9
{EE 
prefixFF  &
=FF' (
attribFF) /
.FF/ 0
	LocalNameFF0 9
;FF9 :
namespaceURIGG  ,
=GG- .
attribGG/ 5
.GG5 6
ValueGG6 ;
;GG; <
ifHH  "
(HH# $
prefixHH$ *
==HH+ -
nullHH. 2
)HH2 3
{II  !
prefixJJ$ *
=JJ+ ,
elemJJ- 1
.JJ1 2
PrefixJJ2 8
;JJ8 9
namespaceURIKK$ 0
=KK1 2
elemKK3 7
.KK7 8
NamespaceURIKK8 D
;KKD E
}LL  !
_nsmMM  $
.MM$ %
AddNamespaceMM% 1
(MM1 2
prefixMM2 8
,MM8 9
namespaceURIMM: F
)MMF G
;MMG H
}NN 
}OO 
breakPP 
;PP 
}QQ 
elseRR 
{SS 
throwTT 
newTT !
SystemTT" (
.TT( )
SecurityTT) 1
.TT1 2
CryptographyTT2 >
.TT> ?"
CryptographicExceptionTT? U
(TTU V
SRTTV X
.TTX Y-
!Cryptography_Xml_UnknownTransformTTY z
)TTz {
;TT{ |
}UU 
}VV 
}WW 
ifYY 
(YY 

_xpathexprYY 
==YY 
nullYY "
)YY" #
throwZZ 
newZZ 
SystemZZ  
.ZZ  !
SecurityZZ! )
.ZZ) *
CryptographyZZ* 6
.ZZ6 7"
CryptographicExceptionZZ7 M
(ZZM N
SRZZN P
.ZZP Q-
!Cryptography_Xml_UnknownTransformZZQ r
)ZZr s
;ZZs t
}[[ 	
	protected]] 
override]] 
XmlNodeList]] &
GetInnerXml]]' 2
(]]2 3
)]]3 4
{^^ 	
XmlDocument__ 
document__  
=__! "
new__# &
XmlDocument__' 2
(__2 3
)__3 4
;__4 5

XmlElement`` 
element`` 
=``  
document``! )
.``) *
CreateElement``* 7
(``7 8
null``8 <
,``< =
$str``> E
,``E F
	SignedXml``G P
.``P Q
XmlDsigNamespaceUrl``Q d
)``d e
;``e f
ifbb 
(bb 
_nsmbb 
!=bb 
nullbb 
)bb 
{cc 
foreachee 
(ee 
stringee 
prefixee  &
inee' )
_nsmee* .
)ee. /
{ff 
switchgg 
(gg 
prefixgg "
)gg" #
{hh 
casejj 
$strjj "
:jj" #
casekk 
$strkk $
:kk$ %
breakll !
;ll! "
defaultoo 
:oo  
ifqq 
(qq  
prefixqq  &
!=qq' )
nullqq* .
&&qq/ 1
prefixqq2 8
.qq8 9
Lengthqq9 ?
>qq@ A
$numqqB C
)qqC D
elementrr  '
.rr' (
SetAttributerr( 4
(rr4 5
$strrr5 =
+rr> ?
prefixrr@ F
,rrF G
_nsmrrH L
.rrL M
LookupNamespacerrM \
(rr\ ]
prefixrr] c
)rrc d
)rrd e
;rre f
breakss !
;ss! "
}tt 
}uu 
}vv 
elementxx 
.xx 
InnerXmlxx 
=xx 

_xpathexprxx )
;xx) *
documentyy 
.yy 
AppendChildyy  
(yy  !
elementyy! (
)yy( )
;yy) *
returnzz 
documentzz 
.zz 

ChildNodeszz &
;zz& '
}{{ 	
public}} 
override}} 
void}} 
	LoadInput}} &
(}}& '
object}}' -
obj}}. 1
)}}1 2
{~~ 	
if 
( 
obj 
is 
Stream 
) 
{
ÄÄ 
LoadStreamInput
ÅÅ 
(
ÅÅ  
(
ÅÅ  !
Stream
ÅÅ! '
)
ÅÅ' (
obj
ÅÅ( +
)
ÅÅ+ ,
;
ÅÅ, -
}
ÇÇ 
else
ÉÉ 
if
ÉÉ 
(
ÉÉ 
obj
ÉÉ 
is
ÉÉ 
XmlNodeList
ÉÉ '
)
ÉÉ' (
{
ÑÑ "
LoadXmlNodeListInput
ÖÖ $
(
ÖÖ$ %
(
ÖÖ% &
XmlNodeList
ÖÖ& 1
)
ÖÖ1 2
obj
ÖÖ2 5
)
ÖÖ5 6
;
ÖÖ6 7
}
ÜÜ 
else
áá 
if
áá 
(
áá 
obj
áá 
is
áá 
XmlDocument
áá '
)
áá' (
{
àà "
LoadXmlDocumentInput
ââ $
(
ââ$ %
(
ââ% &
XmlDocument
ââ& 1
)
ââ1 2
obj
ââ2 5
)
ââ5 6
;
ââ6 7
}
ää 
}
ãã 	
private
çç 
void
çç 
LoadStreamInput
çç $
(
çç$ %
Stream
çç% +
stream
çç, 2
)
çç2 3
{
éé 	
XmlResolver
èè 
resolver
èè  
=
èè! "
(
èè# $
ResolverSet
èè$ /
?
èè0 1
_xmlResolver
èè2 >
:
èè? @
new
èèA D
XmlSecureResolver
èèE V
(
èèV W
new
èèW Z
XmlUrlResolver
èè[ i
(
èèi j
)
èèj k
,
èèk l
BaseURI
èèm t
)
èèt u
)
èèu v
;
èèv w
	XmlReader
êê 
	valReader
êê 
=
êê  !
Utils
êê" '
.
êê' (#
PreProcessStreamInput
êê( =
(
êê= >
stream
êê> D
,
êêD E
resolver
êêF N
,
êêN O
BaseURI
êêP W
)
êêW X
;
êêX Y
	_document
ëë 
=
ëë 
new
ëë 
XmlDocument
ëë '
(
ëë' (
)
ëë( )
;
ëë) *
	_document
íí 
.
íí  
PreserveWhitespace
íí (
=
íí) *
true
íí+ /
;
íí/ 0
	_document
ìì 
.
ìì 
Load
ìì 
(
ìì 
	valReader
ìì $
)
ìì$ %
;
ìì% &
}
îî 	
private
ññ 
void
ññ "
LoadXmlNodeListInput
ññ )
(
ññ) *
XmlNodeList
ññ* 5
nodeList
ññ6 >
)
ññ> ?
{
óó 	
XmlResolver
ôô 
resolver
ôô  
=
ôô! "
(
ôô# $
ResolverSet
ôô$ /
?
ôô0 1
_xmlResolver
ôô2 >
:
ôô? @
new
ôôA D
XmlSecureResolver
ôôE V
(
ôôV W
new
ôôW Z
XmlUrlResolver
ôô[ i
(
ôôi j
)
ôôj k
,
ôôk l
BaseURI
ôôm t
)
ôôt u
)
ôôu v
;
ôôv w
CanonicalXml
öö 
c14n
öö 
=
öö 
new
öö  #
CanonicalXml
öö$ 0
(
öö0 1
(
öö1 2
XmlNodeList
öö2 =
)
öö= >
nodeList
öö> F
,
ööF G
resolver
ööH P
,
ööP Q
true
ööR V
)
ööV W
;
ööW X
using
õõ 
(
õõ 
MemoryStream
õõ 
ms
õõ  "
=
õõ# $
new
õõ% (
MemoryStream
õõ) 5
(
õõ5 6
c14n
õõ6 :
.
õõ: ;
GetBytes
õõ; C
(
õõC D
)
õõD E
)
õõE F
)
õõF G
{
úú 
LoadStreamInput
ùù 
(
ùù  
ms
ùù  "
)
ùù" #
;
ùù# $
}
ûû 
}
üü 	
private
°° 
void
°° "
LoadXmlDocumentInput
°° )
(
°°) *
XmlDocument
°°* 5
doc
°°6 9
)
°°9 :
{
¢¢ 	
	_document
££ 
=
££ 
doc
££ 
;
££ 
}
§§ 	
public
¶¶ 
override
¶¶ 
object
¶¶ 
	GetOutput
¶¶ (
(
¶¶( )
)
¶¶) *
{
ßß 	"
CanonicalXmlNodeList
®®  
resultNodeList
®®! /
=
®®0 1
new
®®2 5"
CanonicalXmlNodeList
®®6 J
(
®®J K
)
®®K L
;
®®L M
if
©© 
(
©© 
!
©© 
string
©© 
.
©© 
IsNullOrEmpty
©© %
(
©©% &

_xpathexpr
©©& 0
)
©©0 1
)
©©1 2
{
™™ 
XPathNavigator
´´ 
	navigator
´´ (
=
´´) *
	_document
´´+ 4
.
´´4 5
CreateNavigator
´´5 D
(
´´D E
)
´´E F
;
´´F G
XPathNodeIterator
¨¨ !
it
¨¨" $
=
¨¨% &
	navigator
¨¨' 0
.
¨¨0 1
Select
¨¨1 7
(
¨¨7 8
$str
¨¨8 D
)
¨¨D E
;
¨¨E F
XPathExpression
ÆÆ 
	xpathExpr
ÆÆ  )
=
ÆÆ* +
	navigator
ÆÆ, 5
.
ÆÆ5 6
Compile
ÆÆ6 =
(
ÆÆ= >
$str
ÆÆ> H
+
ÆÆI J

_xpathexpr
ÆÆK U
+
ÆÆV W
$str
ÆÆX [
)
ÆÆ[ \
;
ÆÆ\ ]
	xpathExpr
ØØ 
.
ØØ 

SetContext
ØØ $
(
ØØ$ %
_nsm
ØØ% )
)
ØØ) *
;
ØØ* +
while
±± 
(
±± 
it
±± 
.
±± 
MoveNext
±± "
(
±±" #
)
±±# $
)
±±$ %
{
≤≤ 
XmlNode
≥≥ 
node
≥≥  
=
≥≥! "
(
≥≥# $
(
≥≥$ %
IHasXmlNode
≥≥% 0
)
≥≥0 1
it
≥≥1 3
.
≥≥3 4
Current
≥≥4 ;
)
≥≥; <
.
≥≥< =
GetNode
≥≥= D
(
≥≥D E
)
≥≥E F
;
≥≥F G
bool
µµ 
include
µµ  
=
µµ! "
(
µµ# $
bool
µµ$ (
)
µµ( )
it
µµ) +
.
µµ+ ,
Current
µµ, 3
.
µµ3 4
Evaluate
µµ4 <
(
µµ< =
	xpathExpr
µµ= F
)
µµF G
;
µµG H
if
∂∂ 
(
∂∂ 
include
∂∂ 
==
∂∂  "
true
∂∂# '
)
∂∂' (
resultNodeList
∑∑ &
.
∑∑& '
Add
∑∑' *
(
∑∑* +
node
∑∑+ /
)
∑∑/ 0
;
∑∑0 1
}
∏∏ 
it
ªª 
=
ªª 
	navigator
ªª 
.
ªª 
Select
ªª %
(
ªª% &
$str
ªª& 6
)
ªª6 7
;
ªª7 8
while
ºº 
(
ºº 
it
ºº 
.
ºº 
MoveNext
ºº "
(
ºº" #
)
ºº# $
)
ºº$ %
{
ΩΩ 
XmlNode
ææ 
node
ææ  
=
ææ! "
(
ææ# $
(
ææ$ %
IHasXmlNode
ææ% 0
)
ææ0 1
it
ææ1 3
.
ææ3 4
Current
ææ4 ;
)
ææ; <
.
ææ< =
GetNode
ææ= D
(
ææD E
)
ææE F
;
ææF G
resultNodeList
øø "
.
øø" #
Add
øø# &
(
øø& '
node
øø' +
)
øø+ ,
;
øø, -
}
¿¿ 
}
¡¡ 
return
√√ 
resultNodeList
√√ !
;
√√! "
}
ƒƒ 	
public
∆∆ 
override
∆∆ 
object
∆∆ 
	GetOutput
∆∆ (
(
∆∆( )
Type
∆∆) -
type
∆∆. 2
)
∆∆2 3
{
«« 	
if
»» 
(
»» 
type
»» 
!=
»» 
typeof
»» 
(
»» 
XmlNodeList
»» *
)
»»* +
&&
»», .
!
»»/ 0
type
»»0 4
.
»»4 5
IsSubclassOf
»»5 A
(
»»A B
typeof
»»B H
(
»»H I
XmlNodeList
»»I T
)
»»T U
)
»»U V
)
»»V W
throw
…… 
new
…… 
ArgumentException
…… +
(
……+ ,
SR
……, .
.
……. /:
,Cryptography_Xml_TransformIncorrectInputType
……/ [
,
……[ \
nameof
……] c
(
……c d
type
……d h
)
……h i
)
……i j
;
……j k
return
   
(
   
XmlNodeList
   
)
    
	GetOutput
    )
(
  ) *
)
  * +
;
  + ,
}
ÀÀ 	
}
ÃÃ 
}ÕÕ ∂c
?C:\code\bc-xml-security\refactoring\src\XmlDsigXsltTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class  
XmlDsigXsltTransform %
:& '
	Transform( 1
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
Stream. 4
)4 5
,5 6
typeof7 =
(= >
XmlDocument> I
)I J
,J K
typeofL R
(R S
XmlNodeListS ^
)^ _
}` a
;a b
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
Stream/ 5
)5 6
}7 8
;8 9
private 
XmlNodeList 
	_xslNodes %
;% &
private 
string 
_xslFragment #
;# $
private 
Stream 
_inputStream #
;# $
private 
bool 
_includeComments %
=& '
false( -
;- .
public  
XmlDsigXsltTransform #
(# $
)$ %
{ 	
	Algorithm 
= 
	SignedXml !
.! "#
XmlDsigXsltTransformUrl" 9
;9 :
} 	
public  
XmlDsigXsltTransform #
(# $
bool$ (
includeComments) 8
)8 9
{   	
_includeComments!! 
=!! 
includeComments!! .
;!!. /
	Algorithm"" 
="" 
	SignedXml"" !
.""! "#
XmlDsigXsltTransformUrl""" 9
;""9 :
}## 	
public%% 
override%% 
Type%% 
[%% 
]%% 

InputTypes%% )
{&& 	
get'' 
{(( 
return)) 
_inputTypes)) "
;))" #
}** 
}++ 	
public-- 
override-- 
Type-- 
[-- 
]-- 
OutputTypes-- *
{.. 	
get// 
{00 
return11 
_outputTypes11 #
;11# $
}22 
}33 	
public55 
override55 
void55 
LoadInnerXml55 )
(55) *
XmlNodeList55* 5
nodeList556 >
)55> ?
{66 	
if77 
(77 
nodeList77 
==77 
null77  
)77  !
throw88 
new88 
System88  
.88  !
Security88! )
.88) *
Cryptography88* 6
.886 7"
CryptographicException887 M
(88M N
SR88N P
.88P Q-
!Cryptography_Xml_UnknownTransform88Q r
)88r s
;88s t

XmlElement:: 
firstDataElement:: '
=::( )
null::* .
;::. /
int;; 
count;; 
=;; 
$num;; 
;;; 
foreach<< 
(<< 
XmlNode<< 
node<< !
in<<" $
nodeList<<% -
)<<- .
{== 
if?? 
(?? 
node?? 
is?? 
XmlWhitespace?? )
)??) *
continue??+ 3
;??3 4
if@@ 
(@@ 
node@@ 
is@@ 

XmlElement@@ &
)@@& '
{AA 
ifBB 
(BB 
countBB 
!=BB  
$numBB! "
)BB" #
throwCC 
newCC !
SystemCC" (
.CC( )
SecurityCC) 1
.CC1 2
CryptographyCC2 >
.CC> ?"
CryptographicExceptionCC? U
(CCU V
SRCCV X
.CCX Y-
!Cryptography_Xml_UnknownTransformCCY z
)CCz {
;CC{ |
firstDataElementDD $
=DD% &
nodeDD' +
asDD, .

XmlElementDD/ 9
;DD9 :
countEE 
++EE 
;EE 
continueFF 
;FF 
}GG 
countII 
++II 
;II 
}JJ 
ifKK 
(KK 
countKK 
!=KK 
$numKK 
||KK 
firstDataElementKK .
==KK/ 1
nullKK2 6
)KK6 7
throwLL 
newLL 
SystemLL  
.LL  !
SecurityLL! )
.LL) *
CryptographyLL* 6
.LL6 7"
CryptographicExceptionLL7 M
(LLM N
SRLLN P
.LLP Q-
!Cryptography_Xml_UnknownTransformLLQ r
)LLr s
;LLs t
	_xslNodesMM 
=MM 
nodeListMM  
;MM  !
_xslFragmentNN 
=NN 
firstDataElementNN +
.NN+ ,
OuterXmlNN, 4
.NN4 5
TrimNN5 9
(NN9 :
nullNN: >
)NN> ?
;NN? @
}OO 	
	protectedQQ 
overrideQQ 
XmlNodeListQQ &
GetInnerXmlQQ' 2
(QQ2 3
)QQ3 4
{RR 	
returnSS 
	_xslNodesSS 
;SS 
}TT 	
publicVV 
overrideVV 
voidVV 
	LoadInputVV &
(VV& '
objectVV' -
objVV. 1
)VV1 2
{WW 	
ifXX 
(XX 
_inputStreamXX 
!=XX 
nullXX  $
)XX$ %
_inputStreamYY 
.YY 
CloseYY "
(YY" #
)YY# $
;YY$ %
_inputStreamZZ 
=ZZ 
newZZ 
MemoryStreamZZ +
(ZZ+ ,
)ZZ, -
;ZZ- .
if[[ 
([[ 
obj[[ 
is[[ 
Stream[[ 
)[[ 
{\\ 
_inputStream]] 
=]] 
(]]  
Stream]]  &
)]]& '
obj]]' *
;]]* +
}^^ 
else__ 
if__ 
(__ 
obj__ 
is__ 
XmlNodeList__ '
)__' (
{`` 
CanonicalXmlaa 
xmlDocaa #
=aa$ %
newaa& )
CanonicalXmlaa* 6
(aa6 7
(aa7 8
XmlNodeListaa8 C
)aaC D
objaaD G
,aaG H
nullaaI M
,aaM N
_includeCommentsaaO _
)aa_ `
;aa` a
bytebb 
[bb 
]bb 
bufferbb 
=bb 
xmlDocbb  &
.bb& '
GetBytesbb' /
(bb/ 0
)bb0 1
;bb1 2
ifcc 
(cc 
buffercc 
==cc 
nullcc "
)cc" #
returncc$ *
;cc* +
_inputStreamdd 
.dd 
Writedd "
(dd" #
bufferdd# )
,dd) *
$numdd+ ,
,dd, -
bufferdd. 4
.dd4 5
Lengthdd5 ;
)dd; <
;dd< =
_inputStreamee 
.ee 
Flushee "
(ee" #
)ee# $
;ee$ %
_inputStreamff 
.ff 
Positionff %
=ff& '
$numff( )
;ff) *
}gg 
elsehh 
ifhh 
(hh 
objhh 
ishh 
XmlDocumenthh '
)hh' (
{ii 
CanonicalXmljj 
xmlDocjj #
=jj$ %
newjj& )
CanonicalXmljj* 6
(jj6 7
(jj7 8
XmlDocumentjj8 C
)jjC D
objjjD G
,jjG H
nulljjI M
,jjM N
_includeCommentsjjO _
)jj_ `
;jj` a
bytekk 
[kk 
]kk 
bufferkk 
=kk 
xmlDockk  &
.kk& '
GetByteskk' /
(kk/ 0
)kk0 1
;kk1 2
ifll 
(ll 
bufferll 
==ll 
nullll "
)ll" #
returnll$ *
;ll* +
_inputStreammm 
.mm 
Writemm "
(mm" #
buffermm# )
,mm) *
$nummm+ ,
,mm, -
buffermm. 4
.mm4 5
Lengthmm5 ;
)mm; <
;mm< =
_inputStreamnn 
.nn 
Flushnn "
(nn" #
)nn# $
;nn$ %
_inputStreamoo 
.oo 
Positionoo %
=oo& '
$numoo( )
;oo) *
}pp 
}qq 	
publicss 
overridess 
objectss 
	GetOutputss (
(ss( )
)ss) *
{tt 	 
XslCompiledTransform{{  
xslt{{! %
={{& '
new{{( + 
XslCompiledTransform{{, @
({{@ A
){{A B
;{{B C
XmlReaderSettings|| 
settings|| &
=||' (
new||) ,
XmlReaderSettings||- >
(||> ?
)||? @
;||@ A
settings}} 
.}} 
XmlResolver}}  
=}}! "
null}}# '
;}}' (
settings~~ 
.~~ %
MaxCharactersFromEntities~~ .
=~~/ 0
Utils~~1 6
.~~6 7%
MaxCharactersFromEntities~~7 P
;~~P Q
settings 
. #
MaxCharactersInDocument ,
=- .
Utils/ 4
.4 5#
MaxCharactersInDocument5 L
;L M
using
ÄÄ 
(
ÄÄ 
StringReader
ÄÄ 
sr
ÄÄ  "
=
ÄÄ# $
new
ÄÄ% (
StringReader
ÄÄ) 5
(
ÄÄ5 6
_xslFragment
ÄÄ6 B
)
ÄÄB C
)
ÄÄC D
{
ÅÅ 
	XmlReader
ÇÇ 
	readerXsl
ÇÇ #
=
ÇÇ$ %
	XmlReader
ÇÇ& /
.
ÇÇ/ 0
Create
ÇÇ0 6
(
ÇÇ6 7
sr
ÇÇ7 9
,
ÇÇ9 :
settings
ÇÇ; C
,
ÇÇC D
(
ÇÇE F
string
ÇÇF L
)
ÇÇL M
null
ÇÇM Q
)
ÇÇQ R
;
ÇÇR S
xslt
ÉÉ 
.
ÉÉ 
Load
ÉÉ 
(
ÉÉ 
	readerXsl
ÉÉ #
,
ÉÉ# $
XsltSettings
ÉÉ% 1
.
ÉÉ1 2
Default
ÉÉ2 9
,
ÉÉ9 :
null
ÉÉ; ?
)
ÉÉ? @
;
ÉÉ@ A
	XmlReader
ÜÜ 
reader
ÜÜ  
=
ÜÜ! "
	XmlReader
ÜÜ# ,
.
ÜÜ, -
Create
ÜÜ- 3
(
ÜÜ3 4
_inputStream
ÜÜ4 @
,
ÜÜ@ A
settings
ÜÜB J
,
ÜÜJ K
BaseURI
ÜÜL S
)
ÜÜS T
;
ÜÜT U
XPathDocument
áá 
	inputData
áá '
=
áá( )
new
áá* -
XPathDocument
áá. ;
(
áá; <
reader
áá< B
,
ááB C
XmlSpace
ááD L
.
ááL M
Preserve
ááM U
)
ááU V
;
ááV W
MemoryStream
ää 
ms
ää 
=
ää  !
new
ää" %
MemoryStream
ää& 2
(
ää2 3
)
ää3 4
;
ää4 5
	XmlWriter
ãã 
writer
ãã  
=
ãã! "
new
ãã# &
XmlTextWriter
ãã' 4
(
ãã4 5
ms
ãã5 7
,
ãã7 8
null
ãã9 =
)
ãã= >
;
ãã> ?
xslt
éé 
.
éé 
	Transform
éé 
(
éé 
	inputData
éé (
,
éé( )
null
éé* .
,
éé. /
writer
éé0 6
)
éé6 7
;
éé7 8
ms
èè 
.
èè 
Position
èè 
=
èè 
$num
èè 
;
èè  
return
êê 
ms
êê 
;
êê 
}
ëë 
}
íí 	
public
îî 
override
îî 
object
îî 
	GetOutput
îî (
(
îî( )
Type
îî) -
type
îî. 2
)
îî2 3
{
ïï 	
if
ññ 
(
ññ 
type
ññ 
!=
ññ 
typeof
ññ 
(
ññ 
Stream
ññ %
)
ññ% &
&&
ññ' )
!
ññ* +
type
ññ+ /
.
ññ/ 0
IsSubclassOf
ññ0 <
(
ññ< =
typeof
ññ= C
(
ññC D
Stream
ññD J
)
ññJ K
)
ññK L
)
ññL M
throw
óó 
new
óó 
ArgumentException
óó +
(
óó+ ,
SR
óó, .
.
óó. /:
,Cryptography_Xml_TransformIncorrectInputType
óó/ [
,
óó[ \
nameof
óó] c
(
óóc d
type
óód h
)
óóh i
)
óói j
;
óój k
return
òò 
(
òò 
Stream
òò 
)
òò 
	GetOutput
òò $
(
òò$ %
)
òò% &
;
òò& '
}
ôô 	
}
öö 
}õõ ∏ê
>C:\code\bc-xml-security\refactoring\src\XmlLicenseTransform.cs
	namespace 	
Org
 
. 
BouncyCastle 
. 
Crypto !
.! "
Xml" %
{ 
public 

class 
XmlLicenseTransform $
:% &
	Transform' 0
{ 
private 
Type 
[ 
] 
_inputTypes "
=# $
{% &
typeof' -
(- .
XmlDocument. 9
)9 :
}; <
;< =
private 
Type 
[ 
] 
_outputTypes #
=$ %
{& '
typeof( .
(. /
XmlDocument/ :
): ;
}< =
;= >
private 
XmlNamespaceManager #
_namespaceManager$ 5
=6 7
null8 <
;< =
private 
XmlDocument 
_license $
=% &
null' +
;+ ,
private 
IRelDecryptor 
_relDecryptor +
=, -
null. 2
;2 3
private 
const 
string 
ElementIssuer *
=+ ,
$str- 5
;5 6
private 
const 
string 
NamespaceUriCore -
=. /
$str0 R
;R S
public 
XmlLicenseTransform "
(" #
)# $
{ 	
	Algorithm 
= 
	SignedXml !
.! ""
XmlLicenseTransformUrl" 8
;8 9
} 	
public   
override   
Type   
[   
]   

InputTypes   )
{!! 	
get"" 
{"" 
return"" 
_inputTypes"" $
;""$ %
}""& '
}## 	
public%% 
override%% 
Type%% 
[%% 
]%% 
OutputTypes%% *
{&& 	
get'' 
{'' 
return'' 
_outputTypes'' %
;''% &
}''' (
}(( 	
public** 
IRelDecryptor** 
	Decryptor** &
{++ 	
get,, 
{,, 
return,, 
_relDecryptor,, &
;,,& '
},,( )
set-- 
{-- 
_relDecryptor-- 
=--  !
value--" '
;--' (
}--) *
}.. 	
private00 
void00 "
DecryptEncryptedGrants00 +
(00+ ,
XmlNodeList00, 7
encryptedGrantList008 J
,00J K
IRelDecryptor00L Y
	decryptor00Z c
)00c d
{11 	

XmlElement22 
encryptionMethod22 '
=22( )
null22* .
;22. /

XmlElement33 
keyInfo33 
=33  
null33! %
;33% &

XmlElement44 

cipherData44 !
=44" #
null44$ (
;44( )
EncryptionMethod55 
encryptionMethodObj55 0
=551 2
null553 7
;557 8
KeyInfo66 

keyInfoObj66 
=66  
null66! %
;66% &

CipherData77 
cipherDataObj77 $
=77% &
null77' +
;77+ ,
for99 
(99 
int99 
i99 
=99 
$num99 
,99 
count99 !
=99" #
encryptedGrantList99$ 6
.996 7
Count997 <
;99< =
i99> ?
<99@ A
count99B G
;99G H
i99I J
++99J L
)99L M
{:: 
encryptionMethod;;  
=;;! "
encryptedGrantList;;# 5
[;;5 6
i;;6 7
];;7 8
.;;8 9
SelectSingleNode;;9 I
(;;I J
$str;;J s
,;;s t
_namespaceManager	;;u Ü
)
;;Ü á
as
;;à ä

XmlElement
;;ã ï
;
;;ï ñ
keyInfo<< 
=<< 
encryptedGrantList<< ,
[<<, -
i<<- .
]<<. /
.<</ 0
SelectSingleNode<<0 @
(<<@ A
$str<<A b
,<<b c
_namespaceManager<<d u
)<<u v
as<<w y

XmlElement	<<z Ñ
;
<<Ñ Ö

cipherData== 
=== 
encryptedGrantList== /
[==/ 0
i==0 1
]==1 2
.==2 3
SelectSingleNode==3 C
(==C D
$str==D g
,==g h
_namespaceManager==i z
)==z {
as==| ~

XmlElement	== â
;
==â ä
if>> 
(>> 
(>> 
encryptionMethod>> %
!=>>& (
null>>) -
)>>- .
&&>>/ 1
(?? 
keyInfo?? 
!=?? 
null??  $
)??$ %
&&??& (
(@@ 

cipherData@@ 
!=@@  "
null@@# '
)@@' (
)@@( )
{AA 
encryptionMethodObjBB '
=BB( )
newBB* -
EncryptionMethodBB. >
(BB> ?
)BB? @
;BB@ A

keyInfoObjCC 
=CC  
newCC! $
KeyInfoCC% ,
(CC, -
)CC- .
;CC. /
cipherDataObjDD !
=DD" #
newDD$ '

CipherDataDD( 2
(DD2 3
)DD3 4
;DD4 5
encryptionMethodObjFF '
.FF' (
LoadXmlFF( /
(FF/ 0
encryptionMethodFF0 @
)FF@ A
;FFA B

keyInfoObjGG 
.GG 
LoadXmlGG &
(GG& '
keyInfoGG' .
)GG. /
;GG/ 0
cipherDataObjHH !
.HH! "
LoadXmlHH" )
(HH) *

cipherDataHH* 4
)HH4 5
;HH5 6
MemoryStreamJJ  
	toDecryptJJ! *
=JJ+ ,
nullJJ- 1
;JJ1 2
StreamKK 
decryptedContentKK +
=KK, -
nullKK. 2
;KK2 3
StreamReaderLL  
streamReaderLL! -
=LL. /
nullLL0 4
;LL4 5
tryNN 
{OO 
	toDecryptPP !
=PP" #
newPP$ '
MemoryStreamPP( 4
(PP4 5
cipherDataObjPP5 B
.PPB C
CipherValuePPC N
)PPN O
;PPO P
decryptedContentQQ (
=QQ) *
_relDecryptorQQ+ 8
.QQ8 9
DecryptQQ9 @
(QQ@ A
encryptionMethodObjQQA T
,QQT U

keyInfoObjRR@ J
,RRJ K
	toDecryptRRL U
)RRU V
;RRV W
ifTT 
(TT 
(TT 
decryptedContentTT -
==TT. 0
nullTT1 5
)TT5 6
||TT7 9
(TT: ;
decryptedContentTT; K
.TTK L
LengthTTL R
==TTS U
$numTTV W
)TTW X
)TTX Y
throwUU !
newUU" %
SystemUU& ,
.UU, -
SecurityUU- 5
.UU5 6
CryptographyUU6 B
.UUB C"
CryptographicExceptionUUC Y
(UUY Z
SRUUZ \
.UU\ ]6
)Cryptography_Xml_XrmlUnableToDecryptGrant	UU] Ü
)
UUÜ á
;
UUá à
streamReaderWW $
=WW% &
newWW' *
StreamReaderWW+ 7
(WW7 8
decryptedContentWW8 H
)WWH I
;WWI J
stringXX 
clearContentXX +
=XX, -
streamReaderXX. :
.XX: ;
	ReadToEndXX; D
(XXD E
)XXE F
;XXF G
encryptedGrantListZZ *
[ZZ* +
iZZ+ ,
]ZZ, -
.ZZ- .

ParentNodeZZ. 8
.ZZ8 9
InnerXmlZZ9 A
=ZZB C
clearContentZZD P
;ZZP Q
}[[ 
finally\\ 
{]] 
if^^ 
(^^ 
	toDecrypt^^ %
!=^^& (
null^^) -
)^^- .
	toDecrypt__ %
.__% &
Close__& +
(__+ ,
)__, -
;__- .
ifaa 
(aa 
decryptedContentaa ,
!=aa- /
nullaa0 4
)aa4 5
decryptedContentbb ,
.bb, -
Closebb- 2
(bb2 3
)bb3 4
;bb4 5
ifdd 
(dd 
streamReaderdd (
!=dd) +
nulldd, 0
)dd0 1
streamReaderee (
.ee( )
Closeee) .
(ee. /
)ee/ 0
;ee0 1
}ff 
encryptionMethodObjhh '
=hh( )
nullhh* .
;hh. /

keyInfoObjii 
=ii  
nullii! %
;ii% &
cipherDataObjjj !
=jj" #
nulljj$ (
;jj( )
}kk 
encryptionMethodmm  
=mm! "
nullmm# '
;mm' (
keyInfonn 
=nn 
nullnn 
;nn 

cipherDataoo 
=oo 
nulloo !
;oo! "
}pp 
}qq 	
	protectedtt 
overridett 
XmlNodeListtt &
GetInnerXmltt' 2
(tt2 3
)tt3 4
{uu 	
returnvv 
nullvv 
;vv 
}ww 	
publicyy 
overrideyy 
objectyy 
	GetOutputyy (
(yy( )
)yy) *
{zz 	
return{{ 
_license{{ 
;{{ 
}|| 	
public~~ 
override~~ 
object~~ 
	GetOutput~~ (
(~~( )
Type~~) -
type~~. 2
)~~2 3
{ 	
if
ÄÄ 
(
ÄÄ 
(
ÄÄ 
type
ÄÄ 
!=
ÄÄ 
typeof
ÄÄ 
(
ÄÄ  
XmlDocument
ÄÄ  +
)
ÄÄ+ ,
)
ÄÄ, -
&&
ÄÄ. 0
(
ÄÄ1 2
!
ÄÄ2 3
type
ÄÄ3 7
.
ÄÄ7 8
IsSubclassOf
ÄÄ8 D
(
ÄÄD E
typeof
ÄÄE K
(
ÄÄK L
XmlDocument
ÄÄL W
)
ÄÄW X
)
ÄÄX Y
)
ÄÄY Z
)
ÄÄZ [
throw
ÅÅ 
new
ÅÅ 
ArgumentException
ÅÅ +
(
ÅÅ+ ,
SR
ÅÅ, .
.
ÅÅ. /:
,Cryptography_Xml_TransformIncorrectInputType
ÅÅ/ [
,
ÅÅ[ \
nameof
ÅÅ] c
(
ÅÅc d
type
ÅÅd h
)
ÅÅh i
)
ÅÅi j
;
ÅÅj k
return
ÉÉ 
	GetOutput
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
áá 
override
áá 
void
áá 
LoadInnerXml
áá )
(
áá) *
XmlNodeList
áá* 5
nodeList
áá6 >
)
áá> ?
{
àà 	
if
ââ 
(
ââ 
nodeList
ââ 
!=
ââ 
null
ââ  
&&
ââ! #
nodeList
ââ$ ,
.
ââ, -
Count
ââ- 2
>
ââ3 4
$num
ââ5 6
)
ââ6 7
throw
ää 
new
ää 
System
ää  
.
ää  !
Security
ää! )
.
ää) *
Cryptography
ää* 6
.
ää6 7$
CryptographicException
ää7 M
(
ääM N
SR
ääN P
.
ääP Q/
!Cryptography_Xml_UnknownTransform
ääQ r
)
äär s
;
ääs t
}
ãã 	
public
çç 
override
çç 
void
çç 
	LoadInput
çç &
(
çç& '
object
çç' -
obj
çç. 1
)
çç1 2
{
éé 	
if
êê 
(
êê 
Context
êê 
==
êê 
null
êê 
)
êê  
throw
ëë 
new
ëë 
System
ëë  
.
ëë  !
Security
ëë! )
.
ëë) *
Cryptography
ëë* 6
.
ëë6 7$
CryptographicException
ëë7 M
(
ëëM N
SR
ëëN P
.
ëëP Q1
#Cryptography_Xml_XrmlMissingContext
ëëQ t
)
ëët u
;
ëëu v
_license
ìì 
=
ìì 
new
ìì 
XmlDocument
ìì &
(
ìì& '
)
ìì' (
;
ìì( )
_license
îî 
.
îî  
PreserveWhitespace
îî '
=
îî( )
true
îî* .
;
îî. /
_namespaceManager
ïï 
=
ïï 
new
ïï  #!
XmlNamespaceManager
ïï$ 7
(
ïï7 8
_license
ïï8 @
.
ïï@ A
	NameTable
ïïA J
)
ïïJ K
;
ïïK L
_namespaceManager
ññ 
.
ññ 
AddNamespace
ññ *
(
ññ* +
$str
ññ+ 1
,
ññ1 2
	SignedXml
ññ3 <
.
ññ< =!
XmlDsigNamespaceUrl
ññ= P
)
ññP Q
;
ññQ R
_namespaceManager
óó 
.
óó 
AddNamespace
óó *
(
óó* +
$str
óó+ 0
,
óó0 1
EncryptedXml
óó2 >
.
óó> ? 
XmlEncNamespaceUrl
óó? Q
)
óóQ R
;
óóR S
_namespaceManager
òò 
.
òò 
AddNamespace
òò *
(
òò* +
$str
òò+ .
,
òò. /
NamespaceUriCore
òò0 @
)
òò@ A
;
òòA B

XmlElement
öö "
currentIssuerContext
öö +
=
öö, -
null
öö. 2
;
öö2 3

XmlElement
õõ #
currentLicenseContext
õõ ,
=
õõ- .
null
õõ/ 3
;
õõ3 4
XmlNode
úú 
signatureNode
úú !
=
úú" #
null
úú$ (
;
úú( )"
currentIssuerContext
üü  
=
üü! "
Context
üü# *
.
üü* +
SelectSingleNode
üü+ ;
(
üü; <
$str
üü< [
,
üü[ \
_namespaceManager
üü] n
)
üün o
as
üüp r

XmlElement
üüs }
;
üü} ~
if
†† 
(
†† "
currentIssuerContext
†† $
==
††% '
null
††( ,
)
††, -
throw
°° 
new
°° 
System
°°  
.
°°  !
Security
°°! )
.
°°) *
Cryptography
°°* 6
.
°°6 7$
CryptographicException
°°7 M
(
°°M N
SR
°°N P
.
°°P Q0
"Cryptography_Xml_XrmlMissingIssuer
°°Q s
)
°°s t
;
°°t u
signatureNode
££ 
=
££ "
currentIssuerContext
££ 0
.
££0 1
SelectSingleNode
££1 A
(
££A B
$str
££B i
,
££i j
_namespaceManager
££k |
)
££| }
as££~ Ä

XmlElement££Å ã
;££ã å
if
§§ 
(
§§ 
signatureNode
§§ 
!=
§§  
null
§§! %
)
§§% &
signatureNode
•• 
.
•• 

ParentNode
•• (
.
••( )
RemoveChild
••) 4
(
••4 5
signatureNode
••5 B
)
••B C
;
••C D#
currentLicenseContext
®® !
=
®®" #"
currentIssuerContext
®®$ 8
.
®®8 9
SelectSingleNode
®®9 I
(
®®I J
$str
®®J j
,
®®j k
_namespaceManager
®®l }
)
®®} ~
as®® Å

XmlElement®®Ç å
;®®å ç
if
©© 
(
©© #
currentLicenseContext
©© %
==
©©& (
null
©©) -
)
©©- .
throw
™™ 
new
™™ 
System
™™  
.
™™  !
Security
™™! )
.
™™) *
Cryptography
™™* 6
.
™™6 7$
CryptographicException
™™7 M
(
™™M N
SR
™™N P
.
™™P Q1
#Cryptography_Xml_XrmlMissingLicence
™™Q t
)
™™t u
;
™™u v
XmlNodeList
¨¨ 

issuerList
¨¨ "
=
¨¨# $#
currentLicenseContext
¨¨% :
.
¨¨: ;
SelectNodes
¨¨; F
(
¨¨F G
$str
¨¨G r
,
¨¨r s 
_namespaceManager¨¨t Ö
)¨¨Ö Ü
;¨¨Ü á
for
ØØ 
(
ØØ 
int
ØØ 
i
ØØ 
=
ØØ 
$num
ØØ 
,
ØØ 
count
ØØ !
=
ØØ" #

issuerList
ØØ$ .
.
ØØ. /
Count
ØØ/ 4
;
ØØ4 5
i
ØØ6 7
<
ØØ8 9
count
ØØ: ?
;
ØØ? @
i
ØØA B
++
ØØB D
)
ØØD E
{
∞∞ 
if
±± 
(
±± 

issuerList
±± 
[
±± 
i
±±  
]
±±  !
==
±±" $"
currentIssuerContext
±±% 9
)
±±9 :
continue
≤≤ 
;
≤≤ 
if
¥¥ 
(
¥¥ 
(
¥¥ 

issuerList
¥¥ 
[
¥¥  
i
¥¥  !
]
¥¥! "
.
¥¥" #
	LocalName
¥¥# ,
==
¥¥- /
ElementIssuer
¥¥0 =
)
¥¥= >
&&
¥¥? A
(
µµ 

issuerList
µµ 
[
µµ  
i
µµ  !
]
µµ! "
.
µµ" #
NamespaceURI
µµ# /
==
µµ0 2
NamespaceUriCore
µµ3 C
)
µµC D
)
µµD E

issuerList
∂∂ 
[
∂∂ 
i
∂∂  
]
∂∂  !
.
∂∂! "

ParentNode
∂∂" ,
.
∂∂, -
RemoveChild
∂∂- 8
(
∂∂8 9

issuerList
∂∂9 C
[
∂∂C D
i
∂∂D E
]
∂∂E F
)
∂∂F G
;
∂∂G H
}
∑∑ 
XmlNodeList
ππ  
encryptedGrantList
ππ *
=
ππ+ ,#
currentLicenseContext
ππ- B
.
ππB C
SelectNodes
ππC N
(
ππN O
$str
ππO t
,
ππt u 
_namespaceManagerππv á
)ππá à
;ππà â
if
ªª 
(
ªª  
encryptedGrantList
ªª "
.
ªª" #
Count
ªª# (
>
ªª) *
$num
ªª+ ,
)
ªª, -
{
ºº 
if
ΩΩ 
(
ΩΩ 
_relDecryptor
ΩΩ !
==
ΩΩ" $
null
ΩΩ% )
)
ΩΩ) *
throw
ææ 
new
ææ 
System
ææ $
.
ææ$ %
Security
ææ% -
.
ææ- .
Cryptography
ææ. :
.
ææ: ;$
CryptographicException
ææ; Q
(
ææQ R
SR
ææR T
.
ææT U7
)Cryptography_Xml_XrmlMissingIRelDecryptor
ææU ~
)
ææ~ 
;ææ Ä$
DecryptEncryptedGrants
¿¿ &
(
¿¿& ' 
encryptedGrantList
¿¿' 9
,
¿¿9 :
_relDecryptor
¿¿; H
)
¿¿H I
;
¿¿I J
}
¡¡ 
_license
√√ 
.
√√ 
InnerXml
√√ 
=
√√ #
currentLicenseContext
√√  5
.
√√5 6
OuterXml
√√6 >
;
√√> ?
}
ƒƒ 	
}
≈≈ 
}∆∆ 
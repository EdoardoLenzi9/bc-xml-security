�<
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
DD� �
nsLocallyDeclared
DD� �
)
DD� �
;
DD� �
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
,	EE �
	Hashtable
EE� �
nsLocallyDeclared
EE� �
)
EE� �
;
EE� �
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
}cc �
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
} �L
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
nsLocallyDeclared	} �
)
� �
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
,	;; �
	Hashtable
;;� �
nsLocallyDeclared
;;� �
)
;;� �
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
rDepth	DD~ �
)
DD� �
;
DD� �
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
nsLocallyDeclared	UUq �
)
UU� �
;
UU� �
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
__� �
nsLocallyDeclared
__� �
)
__� �
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
}dd �&
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
anc	~ �
)
� �
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
 AncestralNamespaceContextManager	h �
anc
� �
)
� �
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
anc	77 �
)
77� �
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
}CC �Y
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
}zz � 
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
defaultNodeSetInclusionState	q �
)
� �
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
}00 �
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
},, �0
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
}II �K
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
}vv ��
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
defaultNodeSetInclusionState	o �
)
� �
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
attr	))} �
)
))� �
)
))� �
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
attr	rr} �
)
rr� �
)
rr� �
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
�� 
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� "
IsCommittedNamespace
�� +
(
��+ ,
this
��, 0
,
��0 1
Prefix
��2 8
,
��8 9
NamespaceURI
��: F
)
��F G
)
��G H
{
�� 
string
�� 
name
�� 
=
�� 
(
�� 
(
��  
Prefix
��  &
.
��& '
Length
��' -
>
��. /
$num
��0 1
)
��1 2
?
��3 4
$str
��5 <
+
��= >
$str
��? B
+
��C D
Prefix
��E K
:
��L M
$str
��N U
)
��U V
;
��V W
XmlAttribute
�� 
nsattrib
�� %
=
��& '
(
��( )
XmlAttribute
��) 5
)
��5 6
OwnerDocument
��6 C
.
��C D
CreateAttribute
��D S
(
��S T
name
��T X
)
��X Y
;
��Y Z
nsattrib
�� 
.
�� 
Value
�� 
=
��  
NamespaceURI
��! -
;
��- .
anc
�� 
.
��  
TrackNamespaceNode
�� &
(
��& '
nsattrib
��' /
,
��/ 0
nsListToRender
��1 ?
,
��? @
nsLocallyDeclared
��A R
)
��R S
;
��S T
}
�� 
if
�� 
(
�� 
IsInNodeSet
�� 
)
�� 
{
�� 
anc
�� 
.
�� #
GetNamespacesToRender
�� )
(
��) *
this
��* .
,
��. /
attrListToRender
��0 @
,
��@ A
nsListToRender
��B P
,
��P Q
nsLocallyDeclared
��R c
)
��c d
;
��d e
rgbData
�� 
=
�� 
utf8
�� 
.
�� 
GetBytes
�� '
(
��' (
$str
��( +
+
��, -
Name
��. 2
)
��2 3
;
��3 4
hash
�� 
.
�� 
BlockUpdate
��  
(
��  !
rgbData
��! (
,
��( )
$num
��* +
,
��+ ,
rgbData
��- 4
.
��4 5
Length
��5 ;
)
��; <
;
��< =
foreach
�� 
(
�� 
object
�� 
attr
��  $
in
��% '
nsListToRender
��( 6
.
��6 7

GetKeyList
��7 A
(
��A B
)
��B C
)
��C D
{
�� 
(
�� 
attr
�� 
as
�� #
CanonicalXmlAttribute
�� 2
)
��2 3
.
��3 4
	WriteHash
��4 =
(
��= >
hash
��> B
,
��B C
docPos
��D J
,
��J K
anc
��L O
)
��O P
;
��P Q
}
�� 
foreach
�� 
(
�� 
object
�� 
attr
��  $
in
��% '
attrListToRender
��( 8
.
��8 9

GetKeyList
��9 C
(
��C D
)
��D E
)
��E F
{
�� 
(
�� 
attr
�� 
as
�� #
CanonicalXmlAttribute
�� 2
)
��2 3
.
��3 4
	WriteHash
��4 =
(
��= >
hash
��> B
,
��B C
docPos
��D J
,
��J K
anc
��L O
)
��O P
;
��P Q
}
�� 
rgbData
�� 
=
�� 
utf8
�� 
.
�� 
GetBytes
�� '
(
��' (
$str
��( +
)
��+ ,
;
��, -
hash
�� 
.
�� 
BlockUpdate
��  
(
��  !
rgbData
��! (
,
��( )
$num
��* +
,
��+ ,
rgbData
��- 4
.
��4 5
Length
��5 ;
)
��; <
;
��< =
}
�� 
anc
�� 
.
�� !
EnterElementContext
�� #
(
��# $
)
��$ %
;
��% &
anc
�� 
.
�� &
LoadUnrenderedNamespaces
�� (
(
��( )
nsLocallyDeclared
��) :
)
��: ;
;
��; <
anc
�� 
.
�� $
LoadRenderedNamespaces
�� &
(
��& '
nsListToRender
��' 5
)
��5 6
;
��6 7
XmlNodeList
�� 

childNodes
�� "
=
��# $

ChildNodes
��% /
;
��/ 0
foreach
�� 
(
�� 
XmlNode
�� 
	childNode
�� &
in
��' )

childNodes
��* 4
)
��4 5
{
�� (
CanonicalizationDispatcher
�� *
.
��* +
	WriteHash
��+ 4
(
��4 5
	childNode
��5 >
,
��> ?
hash
��@ D
,
��D E
docPos
��F L
,
��L M
anc
��N Q
)
��Q R
;
��R S
}
�� 
anc
�� 
.
��  
ExitElementContext
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
IsInNodeSet
�� 
)
�� 
{
�� 
rgbData
�� 
=
�� 
utf8
�� 
.
�� 
GetBytes
�� '
(
��' (
$str
��( ,
+
��- .
Name
��/ 3
+
��4 5
$str
��6 9
)
��9 :
;
��: ;
hash
�� 
.
�� 
BlockUpdate
��  
(
��  !
rgbData
��! (
,
��( )
$num
��* +
,
��+ ,
rgbData
��- 4
.
��4 5
Length
��5 ;
)
��; <
;
��< =
}
�� 
}
�� 	
}
�� 
}�� �
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
}** �4
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
}qq �6
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
)	 �
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
}LL �
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
}.. �
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
}.. �
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
}.. �
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
} �N
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
+Cryptography_Xml_CipherValueElementRequired	--U �
)
--� �
;
--� �
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
+Cryptography_Xml_CipherValueElementRequired	<<U �
)
<<� �
;
<<� �
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
+Cryptography_Xml_CipherValueElementRequired	ZZU �
)
ZZ� �
;
ZZ� �
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
+Cryptography_Xml_CipherValueElementRequired	mmU �
)
mm� �
;
mm� �
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
}~~ �4
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
}[[ �a
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
$str	i �
)
� �
]
� �
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
$str	i �
)
� �
]
� �
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
�� 
static
�� 
T
�� 
CreateFromName
�� &
<
��& '
T
��' (
>
��( )
(
��) *
string
��* 0
name
��1 5
)
��5 6
where
��7 <
T
��= >
:
��? @
class
��A F
{
�� 	
if
�� 
(
�� 
name
�� 
==
�� 
null
�� 
||
�� 
name
��  $
.
��$ %

IndexOfAny
��% /
(
��/ 0
_invalidChars
��0 =
)
��= >
>=
��? A
$num
��B C
)
��C D
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
try
�� 
{
�� 
return
�� !
CreateFromKnownName
�� *
(
��* +
name
��+ /
)
��/ 0
as
��1 3
T
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �
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
} �H
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
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
_elData
��) 0
)
��0 1
{
�� 
objectElement
�� !
.
��! "
AppendChild
��" -
(
��- .
document
��. 6
.
��6 7

ImportNode
��7 A
(
��A B
node
��B F
,
��F G
true
��H L
)
��L M
)
��M N
;
��N O
}
�� 
}
�� 
return
�� 
objectElement
��  
;
��  !
}
�� 	
public
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� &
value
��' ,
)
��, -
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?
_id
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� $
(
��$ %
value
��% *
,
��* +
$str
��, 0
,
��0 1
	SignedXml
��2 ;
.
��; <!
XmlDsigNamespaceUrl
��< O
)
��O P
;
��P Q
	_mimeType
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� *
(
��* +
value
��+ 0
,
��0 1
$str
��2 <
,
��< =
	SignedXml
��> G
.
��G H!
XmlDsigNamespaceUrl
��H [
)
��[ \
;
��\ ]
	_encoding
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� *
(
��* +
value
��+ 0
,
��0 1
$str
��2 <
,
��< =
	SignedXml
��> G
.
��G H!
XmlDsigNamespaceUrl
��H [
)
��[ \
;
��\ ]
foreach
�� 
(
�� 
XmlNode
�� 
node
�� !
in
��" $
value
��% *
.
��* +

ChildNodes
��+ 5
)
��5 6
{
�� 
_elData
�� 
.
�� 
Add
�� 
(
�� 
node
��  
)
��  !
;
��! "
}
�� 

_cachedXml
�� 
=
�� 
value
�� 
;
�� 
}
�� 	
}
�� 
}�� �

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
} �
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
} �
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
}$$ ��
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
GetSeed	qq �
(
qq� �
)
qq� �
)
qq� �
)
qq� �
)
qq� �
;
qq� �
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

Parameters	uu~ �
.
uu� �"
ValidationParameters
uu� �
.
uu� �
Counter
uu� �
)
uu� �
)
uu� �
)
uu� �
)
uu� �
;
uu� �
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
�� 
override
�� 
void
�� 
LoadXml
�� $
(
��$ %

XmlElement
��% /
value
��0 5
)
��5 6
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
value
�� 
.
�� 
Name
�� 
!=
�� !
KeyValueElementName
�� 1
||
�� 
value
�� 
.
�� 
NamespaceURI
�� %
!=
��& (
	SignedXml
��) 2
.
��2 3!
XmlDsigNamespaceUrl
��3 F
)
��F G
{
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P#
Root element must be 
��P e
{
��e f!
KeyValueElementName
��f y
}
��y z%
 element in namepsace ��z �
{��� �
	SignedXml��� �
.��� �#
XmlDsigNamespaceUrl��� �
}��� �
"��� �
)��� �
;��� �
}
�� 
const
�� 
string
�� $
xmlDsigNamespacePrefix
�� /
=
��0 1
$str
��2 8
;
��8 9!
XmlNamespaceManager
�� !
xmlNamespaceManager
��  3
=
��4 5
new
��6 9!
XmlNamespaceManager
��: M
(
��M N
value
��N S
.
��S T
OwnerDocument
��T a
.
��a b
	NameTable
��b k
)
��k l
;
��l m!
xmlNamespaceManager
�� 
.
��  
AddNamespace
��  ,
(
��, -$
xmlDsigNamespacePrefix
��- C
,
��C D
	SignedXml
��E N
.
��N O!
XmlDsigNamespaceUrl
��O b
)
��b c
;
��c d
XmlNode
��  
dsaKeyValueElement
�� &
=
��' (
value
��) .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \$
DSAKeyValueElementName
��\ r
}
��r s
"
��s t
,
��t u"
xmlNamespaceManager��v �
)��� �
;��� �
if
�� 
(
��  
dsaKeyValueElement
�� "
==
��# %
null
��& *
)
��* +
{
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P
{
��P Q!
KeyValueElementName
��Q d
}
��d e+
 must contain child element ��e �
{��� �&
DSAKeyValueElementName��� �
}��� �
"��� �
)��� �
;��� �
}
�� 
XmlNode
�� 
yNode
�� 
=
��  
dsaKeyValueElement
�� .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \
YElementName
��\ h
}
��h i
"
��i j
,
��j k!
xmlNamespaceManager
��l 
)�� �
;��� �
if
�� 
(
�� 
yNode
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P
{
��P Q
YElementName
��Q ]
}
��] ^
 is missing
��^ i
"
��i j
)
��j k
;
��k l
XmlNode
�� 
pNode
�� 
=
��  
dsaKeyValueElement
�� .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \
PElementName
��\ h
}
��h i
"
��i j
,
��j k!
xmlNamespaceManager
��l 
)�� �
;��� �
XmlNode
�� 
qNode
�� 
=
��  
dsaKeyValueElement
�� .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \
QElementName
��\ h
}
��h i
"
��i j
,
��j k!
xmlNamespaceManager
��l 
)�� �
;��� �
if
�� 
(
�� 
(
�� 
pNode
�� 
==
�� 
null
�� 
&&
�� !
qNode
��" '
!=
��( *
null
��+ /
)
��/ 0
||
��1 3
(
��4 5
pNode
��5 :
!=
��; =
null
��> B
&&
��C E
qNode
��F K
==
��L N
null
��O S
)
��S T
)
��T U
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P
{
��P Q
PElementName
��Q ]
}
��] ^
 and 
��^ c
{
��c d
QElementName
��d p
}
��p q.
 can only occour in combination��q �
"��� �
)��� �
;��� �
XmlNode
�� 
gNode
�� 
=
��  
dsaKeyValueElement
�� .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \
GElementName
��\ h
}
��h i
"
��i j
,
��j k!
xmlNamespaceManager
��l 
)�� �
;��� �
XmlNode
�� 
jNode
�� 
=
��  
dsaKeyValueElement
�� .
.
��. /
SelectSingleNode
��/ ?
(
��? @
$"
��@ B
{
��B C$
xmlDsigNamespacePrefix
��C Y
}
��Y Z
:
��Z [
{
��[ \
JElementName
��\ h
}
��h i
"
��i j
,
��j k!
xmlNamespaceManager
��l 
)�� �
;��� �
XmlNode
�� 
seedNode
�� 
=
��  
dsaKeyValueElement
�� 1
.
��1 2
SelectSingleNode
��2 B
(
��B C
$"
��C E
{
��E F$
xmlDsigNamespacePrefix
��F \
}
��\ ]
:
��] ^
{
��^ _
SeedElementName
��_ n
}
��n o
"
��o p
,
��p q"
xmlNamespaceManager��r �
)��� �
;��� �
XmlNode
�� 
pgenCounterNode
�� #
=
��$ % 
dsaKeyValueElement
��& 8
.
��8 9
SelectSingleNode
��9 I
(
��I J
$"
��J L
{
��L M$
xmlDsigNamespacePrefix
��M c
}
��c d
:
��d e
{
��e f$
PgenCounterElementName
��f |
}
��| }
"
��} ~
,
��~ #
xmlNamespaceManager��� �
)��� �
;��� �
if
�� 
(
�� 
(
�� 
seedNode
�� 
==
�� 
null
�� !
&&
��" $
pgenCounterNode
��% 4
!=
��5 7
null
��8 <
)
��< =
||
��> @
(
��A B
seedNode
��B J
!=
��K M
null
��N R
&&
��S U
pgenCounterNode
��V e
==
��f h
null
��i m
)
��m n
)
��n o
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P
{
��P Q
SeedElementName
��Q `
}
��` a
 and 
��a f
{
��f g$
PgenCounterElementName
��g }
}
��} ~-
 can only occur in combination��~ �
"��� �
)��� �
;��� �
try
�� 
{
�� 
_key
�� 
=
�� 
new
�� $
DsaPublicKeyParameters
�� 1
(
��1 2
new
��2 5
Math
��6 :
.
��: ;

BigInteger
��; E
(
��E F
$num
��F G
,
��G H
Convert
��I P
.
��P Q
FromBase64String
��Q a
(
��a b
yNode
��b g
.
��g h
	InnerText
��h q
)
��q r
)
��r s
,
��s t
new
�� 
DsaParameters
�� %
(
��% &
new
�� 
Math
��  
.
��  !

BigInteger
��! +
(
��+ ,
$num
��, -
,
��- .
(
��/ 0
pNode
��0 5
!=
��6 8
null
��9 =
)
��= >
?
��? @
Convert
��A H
.
��H I
FromBase64String
��I Y
(
��Y Z
pNode
��Z _
.
��_ `
	InnerText
��` i
)
��i j
:
��k l
null
��m q
)
��q r
,
��r s
new
�� 
Math
��  
.
��  !

BigInteger
��! +
(
��+ ,
$num
��, -
,
��- .
(
��/ 0
qNode
��0 5
!=
��6 8
null
��9 =
)
��= >
?
��? @
Convert
��A H
.
��H I
FromBase64String
��I Y
(
��Y Z
qNode
��Z _
.
��_ `
	InnerText
��` i
)
��i j
:
��k l
null
��m q
)
��q r
,
��r s
new
�� 
Math
��  
.
��  !

BigInteger
��! +
(
��+ ,
$num
��, -
,
��- .
(
��/ 0
gNode
��0 5
!=
��6 8
null
��9 =
)
��= >
?
��? @
Convert
��A H
.
��H I
FromBase64String
��I Y
(
��Y Z
gNode
��Z _
.
��_ `
	InnerText
��` i
)
��i j
:
��k l
null
��m q
)
��q r
,
��r s
new
�� %
DsaValidationParameters
�� 3
(
��3 4
(
�� 
seedNode
�� %
!=
��& (
null
��) -
)
��- .
?
��/ 0
Convert
��1 8
.
��8 9
FromBase64String
��9 I
(
��I J
seedNode
��J R
.
��R S
	InnerText
��S \
)
��\ ]
:
��^ _
null
��` d
,
��d e
(
�� 
pgenCounterNode
�� ,
!=
��- /
null
��0 4
)
��4 5
?
��6 7
Utils
��8 =
.
��= >#
ConvertByteArrayToInt
��> S
(
��S T
Convert
��T [
.
��[ \
FromBase64String
��\ l
(
��l m
pgenCounterNode
��m |
.
��| }
	InnerText��} �
)��� �
)��� �
:��� �
$num��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P:
,An error occurred parsing the key components
��P |
"
��| }
,
��} ~
ex�� �
)��� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �[
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
XmlEncNamespaceUrl	QQo �
)
QQ� �
;
QQ� �
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
XmlEncNamespaceUrl	mmu �
)
mm� �
;
mm� �
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
}xx ��
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
�� 
XmlNodeList
��  
dataReferenceNodes
�� .
=
��/ 0
referenceListNode
��1 B
.
��B C
SelectNodes
��C N
(
��N O
$str
��O b
,
��b c
nsm
��d g
)
��g h
;
��h i
if
�� 
(
��  
dataReferenceNodes
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
foreach
�� 
(
�� 
XmlNode
�� $
node
��% )
in
��* , 
dataReferenceNodes
��- ?
)
��? @
{
�� 
DataReference
�� %
dr
��& (
=
��) *
new
��+ .
DataReference
��/ <
(
��< =
)
��= >
;
��> ?
dr
�� 
.
�� 
LoadXml
�� "
(
��" #
node
��# '
as
��( *

XmlElement
��+ 5
)
��5 6
;
��6 7
ReferenceList
�� %
.
��% &
Add
��& )
(
��) *
dr
��* ,
)
��, -
;
��- .
}
�� 
}
�� 
XmlNodeList
�� 
keyReferenceNodes
�� -
=
��. /
referenceListNode
��0 A
.
��A B
SelectNodes
��B M
(
��M N
$str
��N `
,
��` a
nsm
��b e
)
��e f
;
��f g
if
�� 
(
�� 
keyReferenceNodes
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
foreach
�� 
(
�� 
XmlNode
�� $
node
��% )
in
��* ,
keyReferenceNodes
��- >
)
��> ?
{
�� 
KeyReference
�� $
kr
��% '
=
��( )
new
��* -
KeyReference
��. :
(
��: ;
)
��; <
;
��< =
kr
�� 
.
�� 
LoadXml
�� "
(
��" #
node
��# '
as
��( *

XmlElement
��+ 5
)
��5 6
;
��6 7
ReferenceList
�� %
.
��% &
Add
��& )
(
��) *
kr
��* ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 

_cachedXml
�� 
=
�� 
value
�� 
;
�� 
}
�� 	
public
�� 
override
�� 

XmlElement
�� "
GetXml
��# )
(
��) *
)
��* +
{
�� 	
if
�� 
(
�� 

CacheValid
�� 
)
�� 
return
�� "

_cachedXml
��# -
;
��- .
XmlDocument
�� 
document
��  
=
��! "
new
��# &
XmlDocument
��' 2
(
��2 3
)
��3 4
;
��4 5
document
�� 
.
��  
PreserveWhitespace
�� '
=
��( )
true
��* .
;
��. /
return
�� 
GetXml
�� 
(
�� 
document
�� "
)
��" #
;
��# $
}
�� 	
internal
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
)
��7 8
{
�� 	

XmlElement
�� !
encryptedKeyElement
�� *
=
��+ ,
(
��- .

XmlElement
��. 8
)
��8 9
document
��9 A
.
��A B
CreateElement
��B O
(
��O P
$str
��P ^
,
��^ _
EncryptedXml
��` l
.
��l m 
XmlEncNamespaceUrl
��m 
)�� �
;��� �
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
Id
��& (
)
��( )
)
��) *!
encryptedKeyElement
�� #
.
��# $
SetAttribute
��$ 0
(
��0 1
$str
��1 5
,
��5 6
Id
��7 9
)
��9 :
;
��: ;
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
Type
��& *
)
��* +
)
��+ ,!
encryptedKeyElement
�� #
.
��# $
SetAttribute
��$ 0
(
��0 1
$str
��1 7
,
��7 8
Type
��9 =
)
��= >
;
��> ?
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
MimeType
��& .
)
��. /
)
��/ 0!
encryptedKeyElement
�� #
.
��# $
SetAttribute
��$ 0
(
��0 1
$str
��1 ;
,
��; <
MimeType
��= E
)
��E F
;
��F G
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
Encoding
��& .
)
��. /
)
��/ 0!
encryptedKeyElement
�� #
.
��# $
SetAttribute
��$ 0
(
��0 1
$str
��1 ;
,
��; <
Encoding
��= E
)
��E F
;
��F G
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
	Recipient
��& /
)
��/ 0
)
��0 1!
encryptedKeyElement
�� #
.
��# $
SetAttribute
��$ 0
(
��0 1
$str
��1 <
,
��< =
	Recipient
��> G
)
��G H
;
��H I
if
�� 
(
�� 
EncryptionMethod
��  
!=
��! #
null
��$ (
)
��( )!
encryptedKeyElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0
EncryptionMethod
��0 @
.
��@ A
GetXml
��A G
(
��G H
document
��H P
)
��P Q
)
��Q R
;
��R S
if
�� 
(
�� 
KeyInfo
�� 
.
�� 
Count
�� 
>
�� 
$num
��  !
)
��! "!
encryptedKeyElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0
KeyInfo
��0 7
.
��7 8
GetXml
��8 >
(
��> ?
document
��? G
)
��G H
)
��H I
;
��I J
if
�� 
(
�� 

CipherData
�� 
==
�� 
null
�� "
)
��" #
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q0
"Cryptography_Xml_MissingCipherData
��Q s
)
��s t
;
��t u!
encryptedKeyElement
�� 
.
��  
AppendChild
��  +
(
��+ ,

CipherData
��, 6
.
��6 7
GetXml
��7 =
(
��= >
document
��> F
)
��F G
)
��G H
;
��H I
if
�� 
(
�� "
EncryptionProperties
�� $
.
��$ %
Count
��% *
>
��+ ,
$num
��- .
)
��. /
{
�� 

XmlElement
�� )
encryptionPropertiesElement
�� 6
=
��7 8
document
��9 A
.
��A B
CreateElement
��B O
(
��O P
$str
��P f
,
��f g
EncryptedXml
��h t
.
��t u!
XmlEncNamespaceUrl��u �
)��� �
;��� �
for
�� 
(
�� 
int
�� 
index
�� 
=
��  
$num
��! "
;
��" #
index
��$ )
<
��* +"
EncryptionProperties
��, @
.
��@ A
Count
��A F
;
��F G
index
��H M
++
��M O
)
��O P
{
��  
EncryptionProperty
�� &
ep
��' )
=
��* +"
EncryptionProperties
��, @
.
��@ A
Item
��A E
(
��E F
index
��F K
)
��K L
;
��L M)
encryptionPropertiesElement
�� /
.
��/ 0
AppendChild
��0 ;
(
��; <
ep
��< >
.
��> ?
GetXml
��? E
(
��E F
document
��F N
)
��N O
)
��O P
;
��P Q
}
�� !
encryptedKeyElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0)
encryptionPropertiesElement
��0 K
)
��K L
;
��L M
}
�� 
if
�� 
(
�� 
ReferenceList
�� 
.
�� 
Count
�� #
>
��$ %
$num
��& '
)
��' (
{
�� 

XmlElement
�� "
referenceListElement
�� /
=
��0 1
document
��2 :
.
��: ;
CreateElement
��; H
(
��H I
$str
��I X
,
��X Y
EncryptedXml
��Z f
.
��f g 
XmlEncNamespaceUrl
��g y
)
��y z
;
��z {
for
�� 
(
�� 
int
�� 
index
�� 
=
��  
$num
��! "
;
��" #
index
��$ )
<
��* +
ReferenceList
��, 9
.
��9 :
Count
��: ?
;
��? @
index
��A F
++
��F H
)
��H I
{
�� "
referenceListElement
�� (
.
��( )
AppendChild
��) 4
(
��4 5
ReferenceList
��5 B
[
��B C
index
��C H
]
��H I
.
��I J
GetXml
��J P
(
��P Q
document
��Q Y
)
��Y Z
)
��Z [
;
��[ \
}
�� !
encryptedKeyElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0"
referenceListElement
��0 D
)
��D E
;
��E F
}
�� 
if
�� 
(
�� 
CarriedKeyName
�� 
!=
�� !
null
��" &
)
��& '
{
�� 

XmlElement
�� #
carriedKeyNameElement
�� 0
=
��1 2
(
��3 4

XmlElement
��4 >
)
��> ?
document
��? G
.
��G H
CreateElement
��H U
(
��U V
$str
��V f
,
��f g
EncryptedXml
��h t
.
��t u!
XmlEncNamespaceUrl��u �
)��� �
;��� �
XmlText
��  
carriedKeyNameText
�� *
=
��+ ,
document
��- 5
.
��5 6
CreateTextNode
��6 D
(
��D E
CarriedKeyName
��E S
)
��S T
;
��T U#
carriedKeyNameElement
�� %
.
��% &
AppendChild
��& 1
(
��1 2 
carriedKeyNameText
��2 D
)
��D E
;
��E F!
encryptedKeyElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0#
carriedKeyNameElement
��0 E
)
��E F
;
��F G
}
�� 
return
�� !
encryptedKeyElement
�� &
;
��& '
}
�� 	
}
�� 
}�� �D
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
�� 
=
�� 
value
�� 
;
�� 
}
�� 	
}
�� 
}�� �.
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
�� 
}�� ʳ
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
�� 
XmlResolver
�� 
Resolver
�� #
{
�� 	
get
�� 
{
�� 
return
�� 
_xmlResolver
�� %
;
��% &
}
��' (
set
�� 
{
�� 
_xmlResolver
�� 
=
��  
value
��! &
;
��& '
}
��( )
}
�� 	
public
�� 
string
�� 
Padding
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
_padding
�� !
;
��! "
}
��# $
set
�� 
{
�� 
_padding
�� 
=
�� 
value
�� "
;
��" #
}
��$ %
}
�� 	
public
�� 
string
�� 
Mode
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
_mode
�� 
;
�� 
}
��  !
set
�� 
{
�� 
_mode
�� 
=
�� 
value
�� 
;
��  
}
��! "
}
�� 	
public
�� 
Encoding
�� 
Encoding
��  
{
�� 	
get
�� 
{
�� 
return
�� 
	_encoding
�� "
;
��" #
}
��$ %
set
�� 
{
�� 
	_encoding
�� 
=
�� 
value
�� #
;
��# $
}
��% &
}
�� 	
public
�� 
string
�� 
	Recipient
�� 
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 

_recipient
�� 
==
�� !
null
��" &
)
��& '

_recipient
�� 
=
��  
string
��! '
.
��' (
Empty
��( -
;
��- .
return
�� 

_recipient
�� !
;
��! "
}
�� 
set
�� 
{
�� 

_recipient
�� 
=
�� 
value
�� $
;
��$ %
}
��& '
}
�� 	
private
�� 
byte
�� 
[
�� 
]
�� 
GetCipherValue
�� %
(
��% &

CipherData
��& 0

cipherData
��1 ;
)
��; <
{
�� 	
if
�� 
(
�� 

cipherData
�� 
==
�� 
null
�� "
)
��" #
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7

cipherData
��7 A
)
��A B
)
��B C
;
��C D
Stream
�� 
inputStream
�� 
=
��  
null
��! %
;
��% &
if
�� 
(
�� 

cipherData
�� 
.
�� 
CipherValue
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
return
�� 

cipherData
�� !
.
��! "
CipherValue
��" -
;
��- .
}
�� 
else
�� 
if
�� 
(
�� 

cipherData
�� 
.
��  
CipherReference
��  /
!=
��0 2
null
��3 7
)
��7 8
{
�� 
if
�� 
(
�� 

cipherData
�� 
.
�� 
CipherReference
�� .
.
��. /
CipherValue
��/ :
!=
��; =
null
��> B
)
��B C
return
�� 

cipherData
�� %
.
��% &
CipherReference
��& 5
.
��5 6
CipherValue
��6 A
;
��A B
Stream
�� 
decInputStream
�� %
=
��& '
null
��( ,
;
��, -
if
�� 
(
�� 

cipherData
�� 
.
�� 
CipherReference
�� .
.
��. /
Uri
��/ 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U.
 Cryptography_Xml_UriNotSupported
��U u
)
��u v
;
��v w
}
�� 
if
�� 
(
�� 

cipherData
�� 
.
�� 
CipherReference
�� .
.
��. /
Uri
��/ 2
.
��2 3
Length
��3 9
==
��: <
$num
��= >
)
��> ?
{
�� 
string
�� 
baseUri
�� "
=
��# $
(
��% &
	_document
��& /
==
��0 2
null
��3 7
?
��8 9
null
��: >
:
��? @
	_document
��A J
.
��J K
BaseURI
��K R
)
��R S
;
��S T
TransformChain
�� "
tc
��# %
=
��& '

cipherData
��( 2
.
��2 3
CipherReference
��3 B
.
��B C
TransformChain
��C Q
;
��Q R
if
�� 
(
�� 
tc
�� 
==
�� 
null
�� "
)
��" #
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y.
 Cryptography_Xml_UriNotSupported
��Y y
)
��y z
;
��z {
}
�� 
decInputStream
�� "
=
��# $
tc
��% '
.
��' ($
TransformToOctetStream
��( >
(
��> ?
	_document
��? H
,
��H I
_xmlResolver
��J V
,
��V W
baseUri
��X _
)
��_ `
;
��` a
}
�� 
else
�� 
if
�� 
(
�� 

cipherData
�� #
.
��# $
CipherReference
��$ 3
.
��3 4
Uri
��4 7
[
��7 8
$num
��8 9
]
��9 :
==
��; =
$char
��> A
)
��A B
{
�� 
string
�� 
idref
��  
=
��! "
Utils
��# (
.
��( )#
ExtractIdFromLocalUri
��) >
(
��> ?

cipherData
��? I
.
��I J
CipherReference
��J Y
.
��Y Z
Uri
��Z ]
)
��] ^
;
��^ _

XmlElement
�� 
idElem
�� %
=
��& '
GetIdElement
��( 4
(
��4 5
	_document
��5 >
,
��> ?
idref
��@ E
)
��E F
;
��F G
if
�� 
(
�� 
idElem
�� 
==
�� !
null
��" &
||
��' )
idElem
��* 0
.
��0 1
OuterXml
��1 9
==
��: <
null
��= A
)
��A B
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y.
 Cryptography_Xml_UriNotSupported
��Y y
)
��y z
;
��z {
}
�� 
inputStream
�� 
=
��  !
new
��" %
MemoryStream
��& 2
(
��2 3
	_encoding
��3 <
.
��< =
GetBytes
��= E
(
��E F
idElem
��F L
.
��L M
OuterXml
��M U
)
��U V
)
��V W
;
��W X
string
�� 
baseUri
�� "
=
��# $
(
��% &
	_document
��& /
==
��0 2
null
��3 7
?
��8 9
null
��: >
:
��? @
	_document
��A J
.
��J K
BaseURI
��K R
)
��R S
;
��S T
TransformChain
�� "
tc
��# %
=
��& '

cipherData
��( 2
.
��2 3
CipherReference
��3 B
.
��B C
TransformChain
��C Q
;
��Q R
if
�� 
(
�� 
tc
�� 
==
�� 
null
�� "
)
��" #
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y.
 Cryptography_Xml_UriNotSupported
��Y y
)
��y z
;
��z {
}
�� 
decInputStream
�� "
=
��# $
tc
��% '
.
��' ($
TransformToOctetStream
��( >
(
��> ?
inputStream
��? J
,
��J K
_xmlResolver
��L X
,
��X Y
baseUri
��Z a
)
��a b
;
��b c
}
�� 
else
�� 
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_UriNotResolved
��U t
,
��t u

cipherData��v �
.��� �
CipherReference��� �
.��� �
Uri��� �
)��� �
;��� �
}
�� 
byte
�� 
[
�� 
]
�� 
cipherValue
�� "
=
��# $
null
��% )
;
��) *
using
�� 
(
�� 
MemoryStream
�� #
ms
��$ &
=
��' (
new
��) ,
MemoryStream
��- 9
(
��9 :
)
��: ;
)
��; <
{
�� 
Utils
�� 
.
�� 
Pump
�� 
(
�� 
decInputStream
�� -
,
��- .
ms
��/ 1
)
��1 2
;
��2 3
cipherValue
�� 
=
��  !
ms
��" $
.
��$ %
ToArray
��% ,
(
��, -
)
��- .
;
��. /
if
�� 
(
�� 
inputStream
�� #
!=
��$ &
null
��' +
)
��+ ,
inputStream
�� #
.
��# $
Close
��$ )
(
��) *
)
��* +
;
��+ ,
decInputStream
�� "
.
��" #
Close
��# (
(
��( )
)
��) *
;
��* +
}
�� 

cipherData
�� 
.
�� 
CipherReference
�� *
.
��* +
CipherValue
��+ 6
=
��7 8
cipherValue
��9 D
;
��D E
return
�� 
cipherValue
�� "
;
��" #
}
�� 
throw
�� 
new
�� 
System
�� 
.
�� 
Security
�� %
.
��% &
Cryptography
��& 2
.
��2 3$
CryptographicException
��3 I
(
��I J
SR
��J L
.
��L M0
"Cryptography_Xml_MissingCipherData
��M o
)
��o p
;
��p q
}
�� 	
public
�� 
virtual
�� 

XmlElement
�� !
GetIdElement
��" .
(
��. /
XmlDocument
��/ :
document
��; C
,
��C D
string
��E K
idValue
��L S
)
��S T
{
�� 	
return
�� 
	SignedXml
�� 
.
�� !
DefaultGetIdElement
�� 0
(
��0 1
document
��1 9
,
��9 :
idValue
��; B
)
��B C
;
��C D
}
�� 	
public
�� 
virtual
�� 
byte
�� 
[
�� 
]
�� 
GetDecryptionIV
�� -
(
��- .
EncryptedData
��. ;
encryptedData
��< I
,
��I J
string
��K Q#
symmetricAlgorithmUri
��R g
)
��g h
{
�� 	
if
�� 
(
�� 
encryptedData
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
encryptedData
��7 D
)
��D E
)
��E F
;
��F G
int
�� 
initBytesSize
�� 
=
�� 
$num
��  !
;
��! "
if
�� 
(
�� #
symmetricAlgorithmUri
�� %
==
��& (
null
��) -
)
��- .
{
�� 
if
�� 
(
�� 
encryptedData
�� !
.
��! "
EncryptionMethod
��" 2
==
��3 5
null
��6 :
)
��: ;
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_MissingAlgorithm
��U v
)
��v w
;
��w x#
symmetricAlgorithmUri
�� %
=
��& '
encryptedData
��( 5
.
��5 6
EncryptionMethod
��6 F
.
��F G
KeyAlgorithm
��G S
;
��S T
}
�� 
switch
�� 
(
�� #
symmetricAlgorithmUri
�� )
)
��) *
{
�� 
case
�� 
EncryptedXml
�� !
.
��! "
XmlEncDESUrl
��" .
:
��. /
case
�� 
EncryptedXml
�� !
.
��! " 
XmlEncTripleDESUrl
��" 4
:
��4 5
initBytesSize
�� !
=
��" #
$num
��$ %
;
��% &
break
�� 
;
�� 
case
�� 
EncryptedXml
�� !
.
��! "
XmlEncAES128Url
��" 1
:
��1 2
case
�� 
EncryptedXml
�� !
.
��! "
XmlEncAES192Url
��" 1
:
��1 2
case
�� 
EncryptedXml
�� !
.
��! "
XmlEncAES256Url
��" 1
:
��1 2
initBytesSize
�� !
=
��" #
$num
��$ &
;
��& '
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U.
 Cryptography_Xml_UriNotSupported
��U u
)
��u v
;
��v w
}
�� 
byte
�� 
[
�� 
]
�� 
IV
�� 
=
�� 
new
�� 
byte
��  
[
��  !
initBytesSize
��! .
]
��. /
;
��/ 0
byte
�� 
[
�� 
]
�� 
cipherValue
�� 
=
��  
GetCipherValue
��! /
(
��/ 0
encryptedData
��0 =
.
��= >

CipherData
��> H
)
��H I
;
��I J
Buffer
�� 
.
�� 
	BlockCopy
�� 
(
�� 
cipherValue
�� (
,
��( )
$num
��* +
,
��+ ,
IV
��- /
,
��/ 0
$num
��1 2
,
��2 3
IV
��4 6
.
��6 7
Length
��7 =
)
��= >
;
��> ?
return
�� 
IV
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
ICipherParameters
�� (
GetDecryptionKey
��) 9
(
��9 :
EncryptedData
��: G
encryptedData
��H U
,
��U V
string
��W ]#
symmetricAlgorithmUri
��^ s
)
��s t
{
�� 	
if
�� 
(
�� 
encryptedData
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
encryptedData
��7 D
)
��D E
)
��E F
;
��F G
if
�� 
(
�� 
encryptedData
�� 
.
�� 
KeyInfo
�� %
==
��& (
null
��) -
)
��- .
return
�� 
null
�� 
;
�� 
IEnumerator
�� 
keyInfoEnum
�� #
=
��$ %
encryptedData
��& 3
.
��3 4
KeyInfo
��4 ;
.
��; <
GetEnumerator
��< I
(
��I J
)
��J K
;
��K L$
KeyInfoRetrievalMethod
�� "
kiRetrievalMethod
��# 4
;
��4 5
KeyInfoName
�� 
kiName
�� 
;
�� !
KeyInfoEncryptedKey
�� 
kiEncKey
��  (
;
��( )
EncryptedKey
�� 
ek
�� 
=
�� 
null
�� "
;
��" #
while
�� 
(
�� 
keyInfoEnum
�� 
.
�� 
MoveNext
�� '
(
��' (
)
��( )
)
��) *
{
�� 
kiName
�� 
=
�� 
keyInfoEnum
�� $
.
��$ %
Current
��% ,
as
��- /
KeyInfoName
��0 ;
;
��; <
if
�� 
(
�� 
kiName
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
string
�� 
keyName
�� "
=
��# $
kiName
��% +
.
��+ ,
Value
��, 1
;
��1 2
if
�� 
(
�� 
_keyNameMapping
�� '
[
��' (
keyName
��( /
]
��/ 0
as
��1 3
ICipherParameters
��4 E
!=
��F H
null
��I M
)
��M N
return
�� 
(
��  
ICipherParameters
��  1
)
��1 2
_keyNameMapping
��2 A
[
��A B
keyName
��B I
]
��I J
;
��J K!
XmlNamespaceManager
�� '
nsm
��( +
=
��, -
new
��. 1!
XmlNamespaceManager
��2 E
(
��E F
	_document
��F O
.
��O P
	NameTable
��P Y
)
��Y Z
;
��Z [
nsm
�� 
.
�� 
AddNamespace
�� $
(
��$ %
$str
��% *
,
��* +
EncryptedXml
��, 8
.
��8 9 
XmlEncNamespaceUrl
��9 K
)
��K L
;
��L M
XmlNodeList
�� 
encryptedKeyList
��  0
=
��1 2
	_document
��3 <
.
��< =
SelectNodes
��= H
(
��H I
$str
��I ]
,
��] ^
nsm
��_ b
)
��b c
;
��c d
if
�� 
(
�� 
encryptedKeyList
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
foreach
�� 
(
��  !
XmlNode
��! (
encryptedKeyNode
��) 9
in
��: <
encryptedKeyList
��= M
)
��M N
{
�� 

XmlElement
�� &!
encryptedKeyElement
��' :
=
��; <
encryptedKeyNode
��= M
as
��N P

XmlElement
��Q [
;
��[ \
EncryptedKey
�� (
ek1
��) ,
=
��- .
new
��/ 2
EncryptedKey
��3 ?
(
��? @
)
��@ A
;
��A B
ek1
�� 
.
��  
LoadXml
��  '
(
��' (!
encryptedKeyElement
��( ;
)
��; <
;
��< =
if
�� 
(
��  
ek1
��  #
.
��# $
CarriedKeyName
��$ 2
==
��3 5
keyName
��6 =
&&
��> @
ek1
��A D
.
��D E
	Recipient
��E N
==
��O Q
	Recipient
��R [
)
��[ \
{
�� 
ek
��  "
=
��# $
ek1
��% (
;
��( )
break
��  %
;
��% &
}
�� 
}
�� 
}
�� 
break
�� 
;
�� 
}
�� 
kiRetrievalMethod
�� !
=
��" #
keyInfoEnum
��$ /
.
��/ 0
Current
��0 7
as
��8 :$
KeyInfoRetrievalMethod
��; Q
;
��Q R
if
�� 
(
�� 
kiRetrievalMethod
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
string
�� 
idref
��  
=
��! "
Utils
��# (
.
��( )#
ExtractIdFromLocalUri
��) >
(
��> ?
kiRetrievalMethod
��? P
.
��P Q
Uri
��Q T
)
��T U
;
��U V
ek
�� 
=
�� 
new
�� 
EncryptedKey
�� )
(
��) *
)
��* +
;
��+ ,
ek
�� 
.
�� 
LoadXml
�� 
(
�� 
GetIdElement
�� +
(
��+ ,
	_document
��, 5
,
��5 6
idref
��7 <
)
��< =
)
��= >
;
��> ?
break
�� 
;
�� 
}
�� 
kiEncKey
�� 
=
�� 
keyInfoEnum
�� &
.
��& '
Current
��' .
as
��/ 1!
KeyInfoEncryptedKey
��2 E
;
��E F
if
�� 
(
�� 
kiEncKey
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
ek
�� 
=
�� 
kiEncKey
�� !
.
��! "
EncryptedKey
��" .
;
��. /
break
�� 
;
�� 
}
�� 
}
�� 
if
�� 
(
�� 
ek
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� #
symmetricAlgorithmUri
�� )
==
��* ,
null
��- 1
)
��1 2
{
�� 
if
�� 
(
�� 
encryptedData
�� %
.
��% &
EncryptionMethod
��& 6
==
��7 9
null
��: >
)
��> ?
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y/
!Cryptography_Xml_MissingAlgorithm
��Y z
)
��z {
;
��{ |#
symmetricAlgorithmUri
�� )
=
��* +
encryptedData
��, 9
.
��9 :
EncryptionMethod
��: J
.
��J K
KeyAlgorithm
��K W
;
��W X
}
�� 
byte
�� 
[
�� 
]
�� 
key
�� 
=
�� !
DecryptEncryptedKey
�� 0
(
��0 1
ek
��1 3
)
��3 4
;
��4 5
if
�� 
(
�� 
key
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U3
%Cryptography_Xml_MissingDecryptionKey
��U z
)
��z {
;
��{ |
IBufferedCipher
�� 
symAlg
��  &
=
��' (
CryptoHelpers
��) 6
.
��6 7
CreateFromName
��7 E
<
��E F
IBufferedCipher
��F U
>
��U V
(
��V W#
symmetricAlgorithmUri
��W l
)
��l m
;
��m n
if
�� 
(
�� 
symAlg
�� 
==
�� 
null
�� "
)
��" #
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_MissingAlgorithm
��U v
)
��v w
;
��w x
}
�� 
KeyParameter
�� 
keyParam
�� %
;
��% &
if
�� 
(
�� 
symAlg
�� 
.
�� 
AlgorithmName
�� (
.
��( )
IndexOf
��) 0
(
��0 1
$str
��1 9
,
��9 :
StringComparison
��; K
.
��K L
OrdinalIgnoreCase
��L ]
)
��] ^
>=
��_ a
$num
��b c
)
��c d
keyParam
�� 
=
�� 
new
�� "
DesEdeParameters
��# 3
(
��3 4
key
��4 7
)
��7 8
;
��8 9
else
�� 
if
�� 
(
�� 
symAlg
�� 
.
��  
AlgorithmName
��  -
.
��- .
IndexOf
��. 5
(
��5 6
$str
��6 ;
,
��; <
StringComparison
��= M
.
��M N
OrdinalIgnoreCase
��N _
)
��_ `
>=
��a c
$num
��d e
)
��e f
keyParam
�� 
=
�� 
new
�� "
DesParameters
��# 0
(
��0 1
key
��1 4
)
��4 5
;
��5 6
else
�� 
keyParam
�� 
=
�� 
new
�� "
KeyParameter
��# /
(
��/ 0
key
��0 3
)
��3 4
;
��4 5
return
�� 
keyParam
�� 
;
��  
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
byte
�� 
[
�� 
]
�� !
DecryptEncryptedKey
�� 1
(
��1 2
EncryptedKey
��2 >
encryptedKey
��? K
,
��K L
RsaKeyParameters
��M ]

privateKey
��^ h
=
��i j
null
��k o
)
��o p
{
�� 	
if
�� 
(
�� 
encryptedKey
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
encryptedKey
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
encryptedKey
�� 
.
�� 
KeyInfo
�� $
==
��% '
null
��( ,
)
��, -
return
�� 
null
�� 
;
�� 
IEnumerator
�� 
keyInfoEnum
�� #
=
��$ %
encryptedKey
��& 2
.
��2 3
KeyInfo
��3 :
.
��: ;
GetEnumerator
��; H
(
��H I
)
��I J
;
��J K
KeyInfoName
�� 
kiName
�� 
;
�� 
KeyInfoX509Data
�� 

kiX509Data
�� &
;
��& '$
KeyInfoRetrievalMethod
�� "
kiRetrievalMethod
��# 4
;
��4 5!
KeyInfoEncryptedKey
�� 
kiEncKey
��  (
;
��( )
EncryptedKey
�� 
ek
�� 
=
�� 
null
�� "
;
��" #
bool
�� 
fOAEP
�� 
=
�� 
false
�� 
;
�� 
while
�� 
(
�� 
keyInfoEnum
�� 
.
�� 
MoveNext
�� '
(
��' (
)
��( )
)
��) *
{
�� 
kiName
�� 
=
�� 
keyInfoEnum
�� $
.
��$ %
Current
��% ,
as
��- /
KeyInfoName
��0 ;
;
��; <
if
�� 
(
�� 
kiName
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
string
�� 
keyName
�� "
=
��# $
kiName
��% +
.
��+ ,
Value
��, 1
;
��1 2
object
�� 
kek
�� 
=
��  
_keyNameMapping
��! 0
[
��0 1
keyName
��1 8
]
��8 9
;
��9 :
if
�� 
(
�� 
kek
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
if
�� 
(
�� 
encryptedKey
�� (
.
��( )

CipherData
��) 3
==
��4 6
null
��7 ;
||
��< >
encryptedKey
��? K
.
��K L

CipherData
��L V
.
��V W
CipherValue
��W b
==
��c e
null
��f j
)
��j k
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]/
!Cryptography_Xml_MissingAlgorithm
��] ~
)
��~ 
;�� �
}
�� 
if
�� 
(
�� 
kek
�� 
is
��  "
KeyParameter
��# /
kp
��0 2
)
��2 3
return
�� "
EncryptedXml
��# /
.
��/ 0

DecryptKey
��0 :
(
��: ;
encryptedKey
��; G
.
��G H

CipherData
��H R
.
��R S
CipherValue
��S ^
,
��^ _
kp
��` b
)
��b c
;
��c d
else
�� 
if
�� 
(
��  !
kek
��! $
is
��% '
ParametersWithIV
��( 8
piv
��9 <
)
��< =
return
�� "
EncryptedXml
��# /
.
��/ 0

DecryptKey
��0 :
(
��: ;
encryptedKey
��; G
.
��G H

CipherData
��H R
.
��R S
CipherValue
��S ^
,
��^ _
piv
��` c
.
��c d

Parameters
��d n
as
��o q
KeyParameter
��r ~
)
��~ 
;�� �
fOAEP
�� 
=
�� 
(
��  !
encryptedKey
��! -
.
��- .
EncryptionMethod
��. >
!=
��? A
null
��B F
&&
��G I
encryptedKey
��J V
.
��V W
EncryptionMethod
��W g
.
��g h
KeyAlgorithm
��h t
==
��u w
EncryptedXml��x �
.��� � 
XmlEncRSAOAEPUrl��� �
)��� �
;��� �
return
�� 
EncryptedXml
�� +
.
��+ ,

DecryptKey
��, 6
(
��6 7
encryptedKey
��7 C
.
��C D

CipherData
��D N
.
��N O
CipherValue
��O Z
,
��Z [
(
��\ ]
RsaKeyParameters
��] m
)
��m n
kek
��n q
,
��q r
fOAEP
��s x
)
��x y
;
��y z
}
�� 
break
�� 
;
�� 
}
�� 

kiX509Data
�� 
=
�� 
keyInfoEnum
�� (
.
��( )
Current
��) 0
as
��1 3
KeyInfoX509Data
��4 C
;
��C D
if
�� 
(
�� 

kiX509Data
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
var
�� 

collection
�� "
=
��# $
Utils
��% *
.
��* +
BuildBagOfCerts
��+ :
(
��: ;

kiX509Data
��; E
,
��E F
CertUsageType
��G T
.
��T U

Decryption
��U _
)
��_ `
;
��` a
foreach
�� 
(
�� 
X509Certificate
�� ,
certificate
��- 8
in
��9 ;

collection
��< F
)
��F G
{
�� 
if
�� 
(
�� 

privateKey
�� &
!=
��' )
null
��* .
)
��. /
{
�� 
if
�� 
(
��  
encryptedKey
��  ,
.
��, -

CipherData
��- 7
==
��8 :
null
��; ?
||
��@ B
encryptedKey
��C O
.
��O P

CipherData
��P Z
.
��Z [
CipherValue
��[ f
==
��g i
null
��j n
)
��n o
{
�� 
throw
��  %
new
��& )
System
��* 0
.
��0 1
Security
��1 9
.
��9 :
Cryptography
��: F
.
��F G$
CryptographicException
��G ]
(
��] ^
SR
��^ `
.
��` a0
!Cryptography_Xml_MissingAlgorithm��a �
)��� �
;��� �
}
�� 
fOAEP
�� !
=
��" #
(
��$ %
encryptedKey
��% 1
.
��1 2
EncryptionMethod
��2 B
!=
��C E
null
��F J
&&
��K M
encryptedKey
��N Z
.
��Z [
EncryptionMethod
��[ k
.
��k l
KeyAlgorithm
��l x
==
��y {
EncryptedXml��| �
.��� � 
XmlEncRSAOAEPUrl��� �
)��� �
;��� �
return
�� "
EncryptedXml
��# /
.
��/ 0

DecryptKey
��0 :
(
��: ;
encryptedKey
��; G
.
��G H

CipherData
��H R
.
��R S
CipherValue
��S ^
,
��^ _

privateKey
��` j
,
��j k
fOAEP
��l q
)
��q r
;
��r s
}
�� 
}
�� 
break
�� 
;
�� 
}
�� 
kiRetrievalMethod
�� !
=
��" #
keyInfoEnum
��$ /
.
��/ 0
Current
��0 7
as
��8 :$
KeyInfoRetrievalMethod
��; Q
;
��Q R
if
�� 
(
�� 
kiRetrievalMethod
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
string
�� 
idref
��  
=
��! "
Utils
��# (
.
��( )#
ExtractIdFromLocalUri
��) >
(
��> ?
kiRetrievalMethod
��? P
.
��P Q
Uri
��Q T
)
��T U
;
��U V
ek
�� 
=
�� 
new
�� 
EncryptedKey
�� )
(
��) *
)
��* +
;
��+ ,
ek
�� 
.
�� 
LoadXml
�� 
(
�� 
GetIdElement
�� +
(
��+ ,
	_document
��, 5
,
��5 6
idref
��7 <
)
��< =
)
��= >
;
��> ?
try
�� 
{
�� (
_xmlDsigSearchDepthCounter
�� 2
++
��2 4
;
��4 5
if
�� 
(
�� )
IsOverXmlDsigRecursionLimit
�� 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
throw
�� !
new
��" %/
!CryptoSignedXmlRecursionException
��& G
(
��G H
)
��H I
;
��I J
}
�� 
else
�� 
{
�� 
return
�� "!
DecryptEncryptedKey
��# 6
(
��6 7
ek
��7 9
,
��9 :

privateKey
��; E
)
��E F
;
��F G
}
�� 
}
�� 
finally
�� 
{
�� (
_xmlDsigSearchDepthCounter
�� 2
--
��2 4
;
��4 5
}
�� 
}
�� 
kiEncKey
�� 
=
�� 
keyInfoEnum
�� &
.
��& '
Current
��' .
as
��/ 1!
KeyInfoEncryptedKey
��2 E
;
��E F
if
�� 
(
�� 
kiEncKey
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
ek
�� 
=
�� 
kiEncKey
�� !
.
��! "
EncryptedKey
��" .
;
��. /
byte
�� 
[
�� 
]
�� 
encryptionKey
�� (
=
��) *!
DecryptEncryptedKey
��+ >
(
��> ?
ek
��? A
,
��A B

privateKey
��C M
)
��M N
;
��N O
if
�� 
(
�� 
encryptionKey
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
IBlockCipher
�� $
blockSymAlg
��% 0
=
��1 2
CryptoHelpers
��3 @
.
��@ A
CreateFromName
��A O
<
��O P
IBlockCipher
��P \
>
��\ ]
(
��] ^
encryptedKey
��^ j
.
��j k
EncryptionMethod
��k {
.
��{ |
KeyAlgorithm��| �
)��� �
;��� �
if
�� 
(
�� 
blockSymAlg
�� '
==
��( *
null
��+ /
)
��/ 0
{
�� 
IBufferedCipher
�� +
bufferedSymAlg
��, :
=
��; <
CryptoHelpers
��= J
.
��J K
CreateFromName
��K Y
<
��Y Z
IBufferedCipher
��Z i
>
��i j
(
��j k
encryptedKey
��k w
.
��w x
EncryptionMethod��x �
.��� �
KeyAlgorithm��� �
)��� �
;��� �
if
�� 
(
��  
bufferedSymAlg
��  .
==
��/ 1
null
��2 6
)
��6 7
{
�� 
throw
��  %
new
��& )
System
��* 0
.
��0 1
Security
��1 9
.
��9 :
Cryptography
��: F
.
��F G$
CryptographicException
��G ]
(
��] ^
SR
��^ `
.
��` a0
!Cryptography_Xml_MissingAlgorithm��a �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
encryptedKey
�� (
.
��( )

CipherData
��) 3
==
��4 6
null
��7 ;
||
��< >
encryptedKey
��? K
.
��K L

CipherData
��L V
.
��V W
CipherValue
��W b
==
��c e
null
��f j
)
��j k
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]/
!Cryptography_Xml_MissingAlgorithm
��] ~
)
��~ 
;�� �
}
�� 
return
�� 
EncryptedXml
�� +
.
��+ ,

DecryptKey
��, 6
(
��6 7
encryptedKey
��7 C
.
��C D

CipherData
��D N
.
��N O
CipherValue
��O Z
,
��Z [
new
��\ _
KeyParameter
��` l
(
��l m
encryptionKey
��m z
)
��z {
)
��{ |
;
��| }
}
�� 
}
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
AddKeyNameMapping
�� %
(
��% &
string
��& ,
keyName
��- 4
,
��4 5
object
��6 <
	keyObject
��= F
)
��F G
{
�� 	
if
�� 
(
�� 
keyName
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyName
��7 >
)
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
	keyObject
�� 
==
�� 
null
�� !
)
��! "
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
	keyObject
��7 @
)
��@ A
)
��A B
;
��B C
if
�� 
(
�� 
!
�� 
(
�� 
	keyObject
�� 
is
�� 
RsaKeyParameters
�� /
)
��/ 0
&&
��1 3
!
��4 5
(
��5 6
	keyObject
��6 ?
is
��@ B
ICipherParameters
��C T
)
��T U
)
��U V
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P QB
3Cryptography_Xml_NotSupportedCryptographicTransform��Q �
)��� �
;��� �
_keyNameMapping
�� 
.
�� 
Add
�� 
(
��  
keyName
��  '
,
��' (
	keyObject
��) 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
void
�� "
ClearKeyNameMappings
�� (
(
��( )
)
��) *
{
�� 	
_keyNameMapping
�� 
.
�� 
Clear
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
EncryptedData
�� 
Encrypt
�� $
(
��$ %

XmlElement
��% /
inputElement
��0 <
,
��< =
X509Certificate
��> M
certificate
��N Y
)
��Y Z
{
�� 	
if
�� 
(
�� 
inputElement
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
inputElement
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
certificate
�� 
==
�� 
null
�� #
)
��# $
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
certificate
��7 B
)
��B C
)
��C D
;
��D E$
AsymmetricKeyParameter
�� "
rsaPublicKey
��# /
=
��0 1
certificate
��2 =
.
��= >
GetPublicKey
��> J
(
��J K
)
��K L
;
��L M
if
�� 
(
�� 
rsaPublicKey
�� 
==
�� 
null
��  $
||
��% '
!
��( )
(
��) *
rsaPublicKey
��* 6
is
��7 9
RsaKeyParameters
��: J
)
��J K
)
��K L
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
SR
��0 2
.
��2 3'
NotSupported_KeyAlgorithm
��3 L
)
��L M
;
��M N
EncryptedData
�� 
ed
�� 
=
�� 
new
�� "
EncryptedData
��# 0
(
��0 1
)
��1 2
;
��2 3
ed
�� 
.
�� 
Type
�� 
=
�� 
EncryptedXml
�� "
.
��" #
XmlEncElementUrl
��# 3
;
��3 4
ed
�� 
.
�� 
EncryptionMethod
�� 
=
��  !
new
��" %
EncryptionMethod
��& 6
(
��6 7
EncryptedXml
��7 C
.
��C D
XmlEncAES256Url
��D S
)
��S T
;
��T U
EncryptedKey
�� 
ek
�� 
=
�� 
new
�� !
EncryptedKey
��" .
(
��. /
)
��/ 0
;
��0 1
ek
�� 
.
�� 
EncryptionMethod
�� 
=
��  !
new
��" %
EncryptionMethod
��& 6
(
��6 7
EncryptedXml
��7 C
.
��C D
XmlEncRSA15Url
��D R
)
��R S
;
��S T
ek
�� 
.
�� 
KeyInfo
�� 
.
�� 
	AddClause
��  
(
��  !
new
��! $
KeyInfoX509Data
��% 4
(
��4 5
certificate
��5 @
)
��@ A
)
��A B
;
��B C
IBufferedCipher
�� 
rijn
��  
=
��! "
CipherUtilities
��# 2
.
��2 3
	GetCipher
��3 <
(
��< =
$str
��= Q
)
��Q R
;
��R S
KeyParameter
�� 
keyParam
�� !
=
��" #
new
��$ '
KeyParameter
��( 4
(
��4 5
Utils
��5 :
.
��: ;!
GenerateRandomBlock
��; N
(
��N O
rijn
��O S
.
��S T
GetBlockSize
��T `
(
��` a
)
��a b
)
��b c
)
��c d
;
��d e
ParametersWithIV
�� 
rijnKey
�� $
=
��% &
new
��' *
ParametersWithIV
��+ ;
(
��; <
keyParam
��< D
,
��D E
Utils
��F K
.
��K L!
GenerateRandomBlock
��L _
(
��_ `
rijn
��` d
.
��d e
GetBlockSize
��e q
(
��q r
)
��r s
)
��s t
)
��t u
;
��u v
ek
�� 
.
�� 

CipherData
�� 
.
�� 
CipherValue
�� %
=
��& '
EncryptedXml
��( 4
.
��4 5

EncryptKey
��5 ?
(
��? @
keyParam
��@ H
.
��H I
GetKey
��I O
(
��O P
)
��P Q
,
��Q R
(
��S T
RsaKeyParameters
��T d
)
��d e
rsaPublicKey
��e q
,
��q r
false
��s x
)
��x y
;
��y z!
KeyInfoEncryptedKey
�� 
kek
��  #
=
��$ %
new
��& )!
KeyInfoEncryptedKey
��* =
(
��= >
ek
��> @
)
��@ A
;
��A B
ed
�� 
.
�� 
KeyInfo
�� 
.
�� 
	AddClause
��  
(
��  !
kek
��! $
)
��$ %
;
��% &
ed
�� 
.
�� 

CipherData
�� 
.
�� 
CipherValue
�� %
=
��& '
EncryptData
��( 3
(
��3 4
inputElement
��4 @
,
��@ A
rijnKey
��B I
,
��I J
false
��K P
)
��P Q
;
��Q R
return
�� 
ed
�� 
;
�� 
}
�� 	
public
�� 
EncryptedData
�� 
Encrypt
�� $
(
��$ %

XmlElement
��% /
inputElement
��0 <
,
��< =
string
��> D
keyName
��E L
)
��L M
{
�� 	
if
�� 
(
�� 
inputElement
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
inputElement
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
keyName
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyName
��7 >
)
��> ?
)
��? @
;
��@ A
object
�� 
encryptionKey
��  
=
��! "
null
��# '
;
��' (
if
�� 
(
�� 
_keyNameMapping
�� 
!=
��  "
null
��# '
)
��' (
encryptionKey
�� 
=
�� 
_keyNameMapping
��  /
[
��/ 0
keyName
��0 7
]
��7 8
;
��8 9
if
�� 
(
�� 
encryptionKey
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q3
%Cryptography_Xml_MissingEncryptionKey
��Q v
)
��v w
;
��w x
ParametersWithIV
�� 
iv
�� 
=
��  !
encryptionKey
��" /
as
��0 2
ParametersWithIV
��3 C
;
��C D
KeyParameter
�� 
symKey
�� 
=
��  !
encryptionKey
��" /
as
��0 2
KeyParameter
��3 ?
;
��? @
RsaKeyParameters
�� 
rsa
��  
=
��! "
encryptionKey
��# 0
as
��1 3
RsaKeyParameters
��4 D
;
��D E
EncryptedData
�� 
ed
�� 
=
�� 
new
�� "
EncryptedData
��# 0
(
��0 1
)
��1 2
;
��2 3
ed
�� 
.
�� 
Type
�� 
=
�� 
EncryptedXml
�� "
.
��" #
XmlEncElementUrl
��# 3
;
��3 4
ed
�� 
.
�� 
EncryptionMethod
�� 
=
��  !
new
��" %
EncryptionMethod
��& 6
(
��6 7
EncryptedXml
��7 C
.
��C D
XmlEncAES256Url
��D S
)
��S T
;
��T U
string
�� 
encryptionMethod
�� #
=
��$ %
null
��& *
;
��* +
if
�� 
(
�� 
symKey
�� 
==
�� 
null
�� 
&&
�� !
iv
��" $
==
��% '
null
��( ,
)
��, -
{
�� 
encryptionMethod
��  
=
��! "
EncryptedXml
��# /
.
��/ 0
XmlEncRSA15Url
��0 >
;
��> ?
}
�� 
else
�� 
if
�� 
(
�� 
iv
�� 
!=
�� 
null
�� 
)
��  
{
�� 
symKey
�� 
=
�� 
iv
�� 
.
�� 

Parameters
�� &
as
��' )
KeyParameter
��* 6
;
��6 7
}
�� 
if
�� 
(
�� 
symKey
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
symKey
�� 
is
�� 
DesParameters
�� +
)
��+ ,
{
�� 
encryptionMethod
�� $
=
��% &
EncryptedXml
��' 3
.
��3 4'
XmlEncTripleDESKeyWrapUrl
��4 M
;
��M N
}
�� 
else
�� 
{
�� 
switch
�� 
(
�� 
symKey
�� "
.
��" #
GetKey
��# )
(
��) *
)
��* +
.
��+ ,
Length
��, 2
*
��3 4
$num
��5 6
)
��6 7
{
�� 
case
�� 
$num
��  
:
��  !
encryptionMethod
�� ,
=
��- .
EncryptedXml
��/ ;
.
��; <$
XmlEncAES128KeyWrapUrl
��< R
;
��R S
break
�� !
;
��! "
case
�� 
$num
��  
:
��  !
encryptionMethod
�� ,
=
��- .
EncryptedXml
��/ ;
.
��; <$
XmlEncAES192KeyWrapUrl
��< R
;
��R S
break
�� !
;
��! "
case
�� 
$num
��  
:
��  !
encryptionMethod
�� ,
=
��- .
EncryptedXml
��/ ;
.
��; <$
XmlEncAES256KeyWrapUrl
��< R
;
��R S
break
�� !
;
��! "
}
�� 
}
�� 
}
�� 
EncryptedKey
�� 
ek
�� 
=
�� 
new
�� !
EncryptedKey
��" .
(
��. /
)
��/ 0
;
��0 1
ek
�� 
.
�� 
EncryptionMethod
�� 
=
��  !
new
��" %
EncryptionMethod
��& 6
(
��6 7
encryptionMethod
��7 G
)
��G H
;
��H I
ek
�� 
.
�� 
KeyInfo
�� 
.
�� 
	AddClause
��  
(
��  !
new
��! $
KeyInfoName
��% 0
(
��0 1
keyName
��1 8
)
��8 9
)
��9 :
;
��: ;
var
�� 
keydata
�� 
=
�� 
Utils
�� 
.
��  !
GenerateRandomBlock
��  3
(
��3 4
$num
��4 7
/
��8 9
$num
��: ;
)
��; <
;
��< =
var
�� 
ivdata
�� 
=
�� 
Utils
�� 
.
�� !
GenerateRandomBlock
�� 2
(
��2 3
$num
��3 6
/
��7 8
$num
��9 :
)
��: ;
;
��; <
var
�� 
rijn
�� 
=
�� 
new
�� 
ParametersWithIV
�� +
(
��+ ,
new
��, /
KeyParameter
��0 <
(
��< =
keydata
��= D
)
��D E
,
��E F
ivdata
��G M
)
��M N
;
��N O
ek
�� 
.
�� 

CipherData
�� 
.
�� 
CipherValue
�� %
=
��& '
(
��( )
symKey
��) /
==
��0 2
null
��3 7
?
��8 9
EncryptedXml
��: F
.
��F G

EncryptKey
��G Q
(
��Q R
keydata
��R Y
,
��Y Z
rsa
��[ ^
,
��^ _
false
��` e
)
��e f
:
��g h
EncryptedXml
��i u
.
��u v

EncryptKey��v �
(��� �
keydata��� �
,��� �
symKey��� �
)��� �
)��� �
;��� �!
KeyInfoEncryptedKey
�� 
kek
��  #
=
��$ %
new
��& )!
KeyInfoEncryptedKey
��* =
(
��= >
ek
��> @
)
��@ A
;
��A B
ed
�� 
.
�� 
KeyInfo
�� 
.
�� 
	AddClause
��  
(
��  !
kek
��! $
)
��$ %
;
��% &
ed
�� 
.
�� 

CipherData
�� 
.
�� 
CipherValue
�� %
=
��& '
EncryptData
��( 3
(
��3 4
inputElement
��4 @
,
��@ A
rijn
��B F
,
��F G
false
��H M
)
��M N
;
��N O
return
�� 
ed
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
DecryptDocument
�� #
(
��# $
)
��$ %
{
�� 	!
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
	_document
��> G
.
��G H
	NameTable
��H Q
)
��Q R
;
��R S
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� "
,
��" #
EncryptedXml
��$ 0
.
��0 1 
XmlEncNamespaceUrl
��1 C
)
��C D
;
��D E
XmlNodeList
�� 
encryptedDataList
�� )
=
��* +
	_document
��, 5
.
��5 6
SelectNodes
��6 A
(
��A B
$str
��B W
,
��W X
nsm
��Y \
)
��\ ]
;
��] ^
if
�� 
(
�� 
encryptedDataList
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
encryptedDataNode
��! 2
in
��3 5
encryptedDataList
��6 G
)
��G H
{
�� 

XmlElement
�� "
encryptedDataElement
�� 3
=
��4 5
encryptedDataNode
��6 G
as
��H J

XmlElement
��K U
;
��U V
EncryptedData
�� !
ed
��" $
=
��% &
new
��' *
EncryptedData
��+ 8
(
��8 9
)
��9 :
;
��: ;
ed
�� 
.
�� 
LoadXml
�� 
(
�� "
encryptedDataElement
�� 3
)
��3 4
;
��4 5
ICipherParameters
�� %
symAlg
��& ,
=
��- .
GetDecryptionKey
��/ ?
(
��? @
ed
��@ B
,
��B C
null
��D H
)
��H I
;
��I J
if
�� 
(
�� 
symAlg
�� 
==
�� !
null
��" &
)
��& '
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y3
%Cryptography_Xml_MissingDecryptionKey
��Y ~
)
��~ 
;�� �
byte
�� 
[
�� 
]
�� 
	decrypted
�� $
=
��% &
DecryptData
��' 2
(
��2 3
ed
��3 5
,
��5 6
symAlg
��7 =
)
��= >
;
��> ?
ReplaceData
�� 
(
��  "
encryptedDataElement
��  4
,
��4 5
	decrypted
��6 ?
)
��? @
;
��@ A
}
�� 
}
�� 
}
�� 	
public
�� 
byte
�� 
[
�� 
]
�� 
EncryptData
�� !
(
��! "
byte
��" &
[
��& '
]
��' (
	plaintext
��) 2
,
��2 3
ICipherParameters
��4 E 
symmetricAlgorithm
��F X
)
��X Y
{
�� 	
if
�� 
(
�� 
	plaintext
�� 
==
�� 
null
�� !
)
��! "
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
	plaintext
��7 @
)
��@ A
)
��A B
;
��B C
if
�� 
(
��  
symmetricAlgorithm
�� "
==
��# %
null
��& *
)
��* +
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7 
symmetricAlgorithm
��7 I
)
��I J
)
��J K
;
��K L
var
�� 
ivParam
�� 
=
��  
symmetricAlgorithm
�� ,
as
��- /
ParametersWithIV
��0 @
;
��@ A
var
�� 
keyParam
�� 
=
�� 
ivParam
�� "
==
��# %
null
��& *
?
��+ , 
symmetricAlgorithm
��- ?
as
��@ B
KeyParameter
��C O
:
��P Q
ivParam
��R Y
.
��Y Z

Parameters
��Z d
as
��e g
KeyParameter
��h t
;
��t u
IBufferedCipher
�� 
enc
�� 
;
��  
if
�� 
(
�� 
keyParam
�� 
is
�� 
DesEdeParameters
�� ,
)
��, -
enc
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
DESede/
��2 9
{
��9 :
_mode
��: ?
}
��? @
/
��@ A
{
��A B
_padding
��B J
}
��J K
"
��K L
)
��L M
;
��M N
else
�� 
if
�� 
(
�� 
keyParam
�� 
is
��  
DesParameters
��! .
)
��. /
enc
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
DES/
��2 6
{
��6 7
_mode
��7 <
}
��< =
/
��= >
{
��> ?
_padding
��? G
}
��G H
"
��H I
)
��I J
;
��J K
else
�� 
enc
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
AES/
��2 6
{
��6 7
_mode
��7 <
}
��< =
/
��= >
{
��> ?
_padding
��? G
}
��G H
"
��H I
)
��I J
;
��J K
enc
�� 
.
�� 
Init
�� 
(
�� 
true
�� 
,
��  
symmetricAlgorithm
�� -
)
��- .
;
��. /
byte
�� 
[
�� 
]
�� 
cipher
�� 
=
�� 
enc
�� 
.
��  
DoFinal
��  '
(
��' (
	plaintext
��( 1
)
��1 2
;
��2 3
byte
�� 
[
�� 
]
�� 
output
�� 
=
�� 
null
��  
;
��  !
if
�� 
(
�� 
_mode
�� 
.
�� 
Equals
�� 
(
�� 
$str
�� "
,
��" #
StringComparison
��$ 4
.
��4 5
OrdinalIgnoreCase
��5 F
)
��F G
)
��G H
{
�� 
output
�� 
=
�� 
cipher
�� 
;
��  
}
�� 
else
�� 
{
�� 
byte
�� 
[
�� 
]
�� 
IV
�� 
=
�� 
(
�� 
(
�� 
ParametersWithIV
�� .
)
��. / 
symmetricAlgorithm
��/ A
)
��A B
.
��B C
GetIV
��C H
(
��H I
)
��I J
;
��J K
output
�� 
=
�� 
new
�� 
byte
�� !
[
��! "
cipher
��" (
.
��( )
Length
��) /
+
��0 1
IV
��2 4
.
��4 5
Length
��5 ;
]
��; <
;
��< =
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !
IV
��! #
,
��# $
$num
��% &
,
��& '
output
��( .
,
��. /
$num
��0 1
,
��1 2
IV
��3 5
.
��5 6
Length
��6 <
)
��< =
;
��= >
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !
cipher
��! '
,
��' (
$num
��) *
,
��* +
output
��, 2
,
��2 3
IV
��4 6
.
��6 7
Length
��7 =
,
��= >
cipher
��? E
.
��E F
Length
��F L
)
��L M
;
��M N
}
�� 
return
�� 
output
�� 
;
�� 
}
�� 	
public
�� 
byte
�� 
[
�� 
]
�� 
EncryptData
�� !
(
��! "

XmlElement
��" ,
inputElement
��- 9
,
��9 :
ICipherParameters
��; L 
symmetricAlgorithm
��M _
,
��_ `
bool
��a e
content
��f m
)
��m n
{
�� 	
if
�� 
(
�� 
inputElement
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
inputElement
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
��  
symmetricAlgorithm
�� "
==
��# %
null
��& *
)
��* +
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7 
symmetricAlgorithm
��7 I
)
��I J
)
��J K
;
��K L
byte
�� 
[
�� 
]
�� 
	plainText
�� 
=
�� 
(
��  
content
��  '
?
��( )
	_encoding
��* 3
.
��3 4
GetBytes
��4 <
(
��< =
inputElement
��= I
.
��I J
InnerXml
��J R
)
��R S
:
��T U
	_encoding
��V _
.
��_ `
GetBytes
��` h
(
��h i
inputElement
��i u
.
��u v
OuterXml
��v ~
)
��~ 
)�� �
;��� �
return
�� 
EncryptData
�� 
(
�� 
	plainText
�� (
,
��( ) 
symmetricAlgorithm
��* <
)
��< =
;
��= >
}
�� 	
public
�� 
byte
�� 
[
�� 
]
�� 
DecryptData
�� !
(
��! "
EncryptedData
��" /
encryptedData
��0 =
,
��= >
ICipherParameters
��? P 
symmetricAlgorithm
��Q c
)
��c d
{
�� 	
if
�� 
(
�� 
encryptedData
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
encryptedData
��7 D
)
��D E
)
��E F
;
��F G
if
�� 
(
��  
symmetricAlgorithm
�� "
==
��# %
null
��& *
)
��* +
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7 
symmetricAlgorithm
��7 I
)
��I J
)
��J K
;
��K L
var
�� 
ivParam
�� 
=
��  
symmetricAlgorithm
�� ,
as
��- /
ParametersWithIV
��0 @
;
��@ A
var
�� 
keyParam
�� 
=
�� 
ivParam
�� "
==
��# %
null
��& *
?
��+ , 
symmetricAlgorithm
��- ?
as
��@ B
KeyParameter
��C O
:
��P Q
ivParam
��R Y
.
��Y Z

Parameters
��Z d
as
��e g
KeyParameter
��h t
;
��t u
byte
�� 
[
�� 
]
�� 
cipherValue
�� 
=
��  
GetCipherValue
��! /
(
��/ 0
encryptedData
��0 =
.
��= >

CipherData
��> H
)
��H I
;
��I J
byte
�� 
[
�� 
]
�� 
decryptionIV
�� 
=
��  !
null
��" &
;
��& '
if
�� 
(
�� 
!
�� 
_mode
�� 
.
�� 
Equals
�� 
(
�� 
$str
�� #
,
��# $
StringComparison
��% 5
.
��5 6
OrdinalIgnoreCase
��6 G
)
��G H
)
��H I
decryptionIV
�� 
=
�� 
GetDecryptionIV
�� .
(
��. /
encryptedData
��/ <
,
��< =
null
��> B
)
��B C
;
��C D
byte
�� 
[
�� 
]
�� 
output
�� 
=
�� 
null
��  
;
��  !
int
�� 
lengthIV
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
decryptionIV
�� 
!=
�� 
null
��  $
)
��$ %
{
��  
symmetricAlgorithm
�� "
=
��# $
new
��% (
ParametersWithIV
��) 9
(
��9 :
keyParam
��: B
,
��B C
decryptionIV
��D P
)
��P Q
;
��Q R
lengthIV
�� 
=
�� 
decryptionIV
�� '
.
��' (
Length
��( .
;
��. /
}
�� 
IBufferedCipher
�� 
dec
�� 
;
��  
if
�� 
(
�� 
keyParam
�� 
is
�� 
DesEdeParameters
�� ,
)
��, -
dec
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
DESede/
��2 9
{
��9 :
_mode
��: ?
}
��? @
/
��@ A
{
��A B
_padding
��B J
}
��J K
"
��K L
)
��L M
;
��M N
else
�� 
if
�� 
(
�� 
keyParam
�� 
is
��  
DesParameters
��! .
)
��. /
dec
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
DES/
��2 6
{
��6 7
_mode
��7 <
}
��< =
/
��= >
{
��> ?
_padding
��? G
}
��G H
"
��H I
)
��I J
;
��J K
else
�� 
dec
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$"
��0 2
AES/
��2 6
{
��6 7
_mode
��7 <
}
��< =
/
��= >
{
��> ?
_padding
��? G
}
��G H
"
��H I
)
��I J
;
��J K
dec
�� 
.
�� 
Init
�� 
(
�� 
false
�� 
,
��  
symmetricAlgorithm
�� .
)
��. /
;
��/ 0
output
�� 
=
�� 
dec
�� 
.
�� 
DoFinal
��  
(
��  !
cipherValue
��! ,
,
��, -
lengthIV
��. 6
,
��6 7
cipherValue
��8 C
.
��C D
Length
��D J
-
��K L
lengthIV
��M U
)
��U V
;
��V W
return
�� 
output
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
ReplaceData
�� 
(
��  

XmlElement
��  *
inputElement
��+ 7
,
��7 8
byte
��9 =
[
��= >
]
��> ?
decryptedData
��@ M
)
��M N
{
�� 	
if
�� 
(
�� 
inputElement
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
inputElement
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
decryptedData
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
decryptedData
��7 D
)
��D E
)
��E F
;
��F G
XmlNode
�� 
parent
�� 
=
�� 
inputElement
�� )
.
��) *

ParentNode
��* 4
;
��4 5
if
�� 
(
�� 
parent
�� 
.
�� 
NodeType
�� 
==
��  "
XmlNodeType
��# .
.
��. /
Document
��/ 7
)
��7 8
{
�� 
XmlDocument
�� 
importDocument
�� *
=
��+ ,
new
��- 0
XmlDocument
��1 <
(
��< =
)
��= >
;
��> ?
importDocument
�� 
.
��  
PreserveWhitespace
�� 1
=
��2 3
true
��4 8
;
��8 9
string
�� 
decryptedString
�� &
=
��' (
	_encoding
��) 2
.
��2 3
	GetString
��3 <
(
��< =
decryptedData
��= J
)
��J K
;
��K L
using
�� 
(
�� 
StringReader
�� #
sr
��$ &
=
��' (
new
��) ,
StringReader
��- 9
(
��9 :
decryptedString
��: I
)
��I J
)
��J K
{
�� 
using
�� 
(
�� 
	XmlReader
�� $
xr
��% '
=
��( )
	XmlReader
��* 3
.
��3 4
Create
��4 :
(
��: ;
sr
��; =
,
��= >
Utils
��? D
.
��D E(
GetSecureXmlReaderSettings
��E _
(
��_ `
_xmlResolver
��` l
)
��l m
)
��m n
)
��n o
{
�� 
importDocument
�� &
.
��& '
Load
��' +
(
��+ ,
xr
��, .
)
��. /
;
��/ 0
}
�� 
}
�� 
XmlNode
�� 
importedNode
�� $
=
��% &
inputElement
��' 3
.
��3 4
OwnerDocument
��4 A
.
��A B

ImportNode
��B L
(
��L M
importDocument
��M [
.
��[ \
DocumentElement
��\ k
,
��k l
true
��m q
)
��q r
;
��r s
parent
�� 
.
�� 
RemoveChild
�� "
(
��" #
inputElement
��# /
)
��/ 0
;
��0 1
parent
�� 
.
�� 
AppendChild
�� "
(
��" #
importedNode
��# /
)
��/ 0
;
��0 1
}
�� 
else
�� 
{
�� 
XmlNode
�� 
dummy
�� 
=
�� 
parent
��  &
.
��& '
OwnerDocument
��' 4
.
��4 5
CreateElement
��5 B
(
��B C
parent
��C I
.
��I J
Prefix
��J P
,
��P Q
parent
��R X
.
��X Y
	LocalName
��Y b
,
��b c
parent
��d j
.
��j k
NamespaceURI
��k w
)
��w x
;
��x y
try
�� 
{
�� 
parent
�� 
.
�� 
AppendChild
�� &
(
��& '
dummy
��' ,
)
��, -
;
��- .
dummy
�� 
.
�� 
InnerXml
�� "
=
��# $
	_encoding
��% .
.
��. /
	GetString
��/ 8
(
��8 9
decryptedData
��9 F
)
��F G
;
��G H
XmlNode
�� 
child
�� !
=
��" #
dummy
��$ )
.
��) *

FirstChild
��* 4
;
��4 5
XmlNode
�� 
sibling
�� #
=
��$ %
inputElement
��& 2
.
��2 3
NextSibling
��3 >
;
��> ?
XmlNode
�� 
	nextChild
�� %
=
��& '
null
��( ,
;
��, -
while
�� 
(
�� 
child
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
	nextChild
�� !
=
��" #
child
��$ )
.
��) *
NextSibling
��* 5
;
��5 6
parent
�� 
.
�� 
InsertBefore
�� +
(
��+ ,
child
��, 1
,
��1 2
sibling
��3 :
)
��: ;
;
��; <
child
�� 
=
�� 
	nextChild
��  )
;
��) *
}
�� 
}
�� 
finally
�� 
{
�� 
parent
�� 
.
�� 
RemoveChild
�� &
(
��& '
dummy
��' ,
)
��, -
;
��- .
}
�� 
parent
�� 
.
�� 
RemoveChild
�� "
(
��" #
inputElement
��# /
)
��/ 0
;
��0 1
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
ReplaceElement
�� )
(
��) *

XmlElement
��* 4
inputElement
��5 A
,
��A B
EncryptedData
��C P
encryptedData
��Q ^
,
��^ _
bool
��` d
content
��e l
)
��l m
{
�� 	
if
�� 
(
�� 
inputElement
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
inputElement
��7 C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
encryptedData
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
encryptedData
��7 D
)
��D E
)
��E F
;
��F G

XmlElement
�� 
elemED
�� 
=
�� 
encryptedData
��  -
.
��- .
GetXml
��. 4
(
��4 5
inputElement
��5 A
.
��A B
OwnerDocument
��B O
)
��O P
;
��P Q
switch
�� 
(
�� 
content
�� 
)
�� 
{
�� 
case
�� 
true
�� 
:
�� 
Utils
�� 
.
�� 
RemoveAllChildren
�� +
(
��+ ,
inputElement
��, 8
)
��8 9
;
��9 :
inputElement
��  
.
��  !
AppendChild
��! ,
(
��, -
elemED
��- 3
)
��3 4
;
��4 5
break
�� 
;
�� 
case
�� 
false
�� 
:
�� 
XmlNode
�� 

parentNode
�� &
=
��' (
inputElement
��) 5
.
��5 6

ParentNode
��6 @
;
��@ A

parentNode
�� 
.
�� 
ReplaceChild
�� +
(
��+ ,
elemED
��, 2
,
��2 3
inputElement
��4 @
)
��@ A
;
��A B
break
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
byte
�� 
[
�� 
]
�� 

EncryptKey
�� '
(
��' (
byte
��( ,
[
��, -
]
��- .
keyData
��/ 6
,
��6 7
KeyParameter
��8 D 
symmetricAlgorithm
��E W
)
��W X
{
�� 	
if
�� 
(
�� 
keyData
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyData
��7 >
)
��> ?
)
��? @
;
��@ A
if
�� 
(
��  
symmetricAlgorithm
�� "
==
��# %
null
��& *
)
��* +
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7 
symmetricAlgorithm
��7 I
)
��I J
)
��J K
;
��K L
if
�� 
(
��  
symmetricAlgorithm
�� "
is
��# %
DesParameters
��& 3
)
��3 4
{
�� 
return
�� 
SymmetricKeyWrap
�� '
.
��' (%
TripleDESKeyWrapEncrypt
��( ?
(
��? @ 
symmetricAlgorithm
��@ R
.
��R S
GetKey
��S Y
(
��Y Z
)
��Z [
,
��[ \
keyData
��] d
)
��d e
;
��e f
}
�� 
else
�� 
{
�� 
return
�� 
SymmetricKeyWrap
�� '
.
��' (
AESKeyWrapEncrypt
��( 9
(
��9 : 
symmetricAlgorithm
��: L
.
��L M
GetKey
��M S
(
��S T
)
��T U
,
��U V
keyData
��W ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
public
�� 
static
�� 
byte
�� 
[
�� 
]
�� 

EncryptKey
�� '
(
��' (
byte
��( ,
[
��, -
]
��- .
keyData
��/ 6
,
��6 7
RsaKeyParameters
��8 H
rsa
��I L
,
��L M
bool
��N R
useOAEP
��S Z
)
��Z [
{
�� 	
if
�� 
(
�� 
keyData
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyData
��7 >
)
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
rsa
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
rsa
��7 :
)
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
useOAEP
�� 
)
�� 
{
�� )
RSAOAEPKeyExchangeFormatter
�� +
rsaFormatter
��, 8
=
��9 :
new
��; >)
RSAOAEPKeyExchangeFormatter
��? Z
(
��Z [
rsa
��[ ^
)
��^ _
;
��_ `
return
�� 
rsaFormatter
�� #
.
��# $
CreateKeyExchange
��$ 5
(
��5 6
keyData
��6 =
)
��= >
;
��> ?
}
�� 
else
�� 
{
�� *
RSAPKCS1KeyExchangeFormatter
�� ,
rsaFormatter
��- 9
=
��: ;
new
��< ?*
RSAPKCS1KeyExchangeFormatter
��@ \
(
��\ ]
rsa
��] `
)
��` a
;
��a b
return
�� 
rsaFormatter
�� #
.
��# $
CreateKeyExchange
��$ 5
(
��5 6
keyData
��6 =
)
��= >
;
��> ?
}
�� 
}
�� 	
public
�� 
static
�� 
byte
�� 
[
�� 
]
�� 

DecryptKey
�� '
(
��' (
byte
��( ,
[
��, -
]
��- .
keyData
��/ 6
,
��6 7
KeyParameter
��8 D 
symmetricAlgorithm
��E W
)
��W X
{
�� 	
if
�� 
(
�� 
keyData
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyData
��7 >
)
��> ?
)
��? @
;
��@ A
if
�� 
(
��  
symmetricAlgorithm
�� "
==
��# %
null
��& *
)
��* +
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7 
symmetricAlgorithm
��7 I
)
��I J
)
��J K
;
��K L
if
�� 
(
��  
symmetricAlgorithm
�� "
is
��# %
DesParameters
��& 3
)
��3 4
{
�� 
return
�� 
SymmetricKeyWrap
�� '
.
��' (%
TripleDESKeyWrapDecrypt
��( ?
(
��? @ 
symmetricAlgorithm
��@ R
.
��R S
GetKey
��S Y
(
��Y Z
)
��Z [
,
��[ \
keyData
��] d
)
��d e
;
��e f
}
�� 
else
�� 
{
�� 
return
�� 
SymmetricKeyWrap
�� '
.
��' (
AESKeyWrapDecrypt
��( 9
(
��9 : 
symmetricAlgorithm
��: L
.
��L M
GetKey
��M S
(
��S T
)
��T U
,
��U V
keyData
��W ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
public
�� 
static
�� 
byte
�� 
[
�� 
]
�� 

DecryptKey
�� '
(
��' (
byte
��( ,
[
��, -
]
��- .
keyData
��/ 6
,
��6 7
RsaKeyParameters
��8 H
rsa
��I L
,
��L M
bool
��N R
useOAEP
��S Z
)
��Z [
{
�� 	
if
�� 
(
�� 
keyData
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
keyData
��7 >
)
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
rsa
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
rsa
��7 :
)
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
useOAEP
�� 
)
�� 
{
�� +
RSAOAEPKeyExchangeDeformatter
�� -
rsaDeformatter
��. <
=
��= >
new
��? B+
RSAOAEPKeyExchangeDeformatter
��C `
(
��` a
rsa
��a d
)
��d e
;
��e f
return
�� 
rsaDeformatter
�� %
.
��% & 
DecryptKeyExchange
��& 8
(
��8 9
keyData
��9 @
)
��@ A
;
��A B
}
�� 
else
�� 
{
�� ,
RSAPKCS1KeyExchangeDeformatter
�� .
rsaDeformatter
��/ =
=
��> ?
new
��@ C,
RSAPKCS1KeyExchangeDeformatter
��D b
(
��b c
rsa
��c f
)
��f g
;
��g h
return
�� 
rsaDeformatter
�� %
.
��% & 
DecryptKeyExchange
��& 8
(
��8 9
keyData
��9 @
)
��@ A
;
��A B
}
�� 
}
�� 	
}
�� 
}�� �7
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
XmlEncNamespaceUrl	FFu �
)
FF� �
;
FF� �
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
}hh �5
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
XmlEncNamespaceUrl	r �
)
� �
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
)	22 �
;
22� �
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
}]] �W
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
�� 
{
�� 
return
�� 
(
��  
EncryptionProperty
�� *
)
��* +
(
��+ ,
(
��, -
IList
��- 2
)
��2 3
this
��3 7
)
��7 8
[
��8 9
index
��9 >
]
��> ?
;
��? @
}
�� 
set
�� 
{
�� 
(
�� 
(
�� 
IList
�� 
)
�� 
this
�� 
)
�� 
[
�� 
index
�� #
]
��# $
=
��% &
value
��' ,
;
��, -
}
�� 
}
�� 	
object
�� 
IList
�� 
.
�� 
this
�� 
[
�� 
int
�� 
index
�� #
]
��# $
{
�� 	
get
�� 
{
�� 
return
�� 
_props
�� 
[
��  
index
��  %
]
��% &
;
��& '
}
��( )
set
�� 
{
�� 
if
�� 
(
�� 
!
�� 
(
�� 
value
�� 
is
��  
EncryptionProperty
�� 1
)
��1 2
)
��2 3
throw
�� 
new
�� 
ArgumentException
�� /
(
��/ 0
SR
��0 2
.
��2 32
$Cryptography_Xml_IncorrectObjectType
��3 W
,
��W X
nameof
��Y _
(
��_ `
value
��` e
)
��e f
)
��f g
;
��g h
_props
�� 
[
�� 
index
�� 
]
�� 
=
�� 
value
��  %
;
��% &
}
�� 
}
�� 	
public
�� 
void
�� 
CopyTo
�� 
(
�� 
Array
��  
array
��! &
,
��& '
int
��( +
index
��, 1
)
��1 2
{
�� 	
_props
�� 
.
�� 
CopyTo
�� 
(
�� 
array
�� 
,
��  
index
��! &
)
��& '
;
��' (
}
�� 	
public
�� 
void
�� 
CopyTo
�� 
(
��  
EncryptionProperty
�� -
[
��- .
]
��. /
array
��0 5
,
��5 6
int
��7 :
index
��; @
)
��@ A
{
�� 	
_props
�� 
.
�� 
CopyTo
�� 
(
�� 
array
�� 
,
��  
index
��! &
)
��& '
;
��' (
}
�� 	
public
�� 
object
�� 
SyncRoot
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
_props
�� 
.
��  
SyncRoot
��  (
;
��( )
}
��* +
}
�� 	
public
�� 
bool
�� 
IsSynchronized
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
_props
�� 
.
��  
IsSynchronized
��  .
;
��. /
}
��0 1
}
�� 	
}
�� 
}�� �=
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
,	>> �
	Hashtable
>>� �
nsLocallyDeclared
>>� �
)
>>� �
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
TT� �
nsLocallyDeclared
TT� �
)
TT� �
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
}ZZ �Y
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
resolver	} �
,
� �
string
� �

strBaseUri
� �
)
� �
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
resolver	 �
)
� �
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
resolver	(( �
)
((� �
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
}tt �1
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
}ii �
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
} �
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
} �O
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
$str	XX~ �
)
XX� �
;
XX� �
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
�� 	
public
�� 
IEnumerator
�� 
GetEnumerator
�� (
(
��( )
)
��) *
{
�� 	
return
�� 
_keyInfoClauses
�� "
.
��" #
GetEnumerator
��# 0
(
��0 1
)
��1 2
;
��2 3
}
�� 	
public
�� 
IEnumerator
�� 
GetEnumerator
�� (
(
��( )
Type
��) -!
requestedObjectType
��. A
)
��A B
{
�� 	
	ArrayList
�� 
requestedList
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
(
��3 4
)
��4 5
;
��5 6
object
�� 
tempObj
�� 
;
�� 
IEnumerator
�� 
tempEnum
��  
=
��! "
_keyInfoClauses
��# 2
.
��2 3
GetEnumerator
��3 @
(
��@ A
)
��A B
;
��B C
while
�� 
(
�� 
tempEnum
�� 
.
�� 
MoveNext
�� $
(
��$ %
)
��% &
)
��& '
{
�� 
tempObj
�� 
=
�� 
tempEnum
�� "
.
��" #
Current
��# *
;
��* +
if
�� 
(
�� !
requestedObjectType
�� '
.
��' (
Equals
��( .
(
��. /
tempObj
��/ 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
)
��@ A
)
��A B
requestedList
�� !
.
��! "
Add
��" %
(
��% &
tempObj
��& -
)
��- .
;
��. /
}
�� 
return
�� 
requestedList
��  
.
��  !
GetEnumerator
��! .
(
��. /
)
��/ 0
;
��0 1
}
�� 	
}
�� 
}�� �

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
} �
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
$str	!!r �
)
!!� �
;
!!� �
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
$str	((r �
)
((� �
;
((� �
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
}22 �
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
}@@ �
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
}<< �%
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
}QQ ��
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
�� 
void
�� 
AddSubjectKeyId
�� #
(
��# $
string
��$ *
subjectKeyId
��+ 7
)
��7 8
{
�� 	
if
�� 
(
�� 
_subjectKeyIds
�� 
==
�� !
null
��" &
)
��& '
_subjectKeyIds
�� 
=
��  
new
��! $
	ArrayList
��% .
(
��. /
)
��/ 0
;
��0 1
_subjectKeyIds
�� 
.
�� 
Add
�� 
(
�� 
Utils
�� $
.
��$ %
DecodeHexString
��% 4
(
��4 5
subjectKeyId
��5 A
)
��A B
)
��B C
;
��C D
}
�� 	
public
�� 
	ArrayList
�� 
SubjectNames
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
_subjectNames
�� &
;
��& '
}
��( )
}
�� 	
public
�� 
void
�� 
AddSubjectName
�� "
(
��" #
string
��# )
subjectName
��* 5
)
��5 6
{
�� 	
if
�� 
(
�� 
_subjectNames
�� 
==
��  
null
��! %
)
��% &
_subjectNames
�� 
=
�� 
new
��  #
	ArrayList
��$ -
(
��- .
)
��. /
;
��/ 0
_subjectNames
�� 
.
�� 
Add
�� 
(
�� 
subjectName
�� )
)
��) *
;
��* +
}
�� 	
public
�� 
	ArrayList
�� 
IssuerSerials
�� &
{
�� 	
get
�� 
{
�� 
return
�� 
_issuerSerials
�� '
;
��' (
}
��) *
}
�� 	
public
�� 
void
�� 
AddIssuerSerial
�� #
(
��# $
string
��$ *

issuerName
��+ 5
,
��5 6
string
��7 =
serialNumber
��> J
)
��J K
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %

issuerName
��% /
)
��/ 0
)
��0 1
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /#
Arg_EmptyOrNullString
��/ D
,
��D E
nameof
��F L
(
��L M

issuerName
��M W
)
��W X
)
��X Y
;
��Y Z
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
serialNumber
��% 1
)
��1 2
)
��2 3
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /#
Arg_EmptyOrNullString
��/ D
,
��D E
nameof
��F L
(
��L M
serialNumber
��M Y
)
��Y Z
)
��Z [
;
��[ \

BigInteger
�� 
h
�� 
;
�� 
try
�� 
{
�� 
h
�� 
=
�� 
new
�� 

BigInteger
�� "
(
��" #
serialNumber
��# /
)
��/ 0
;
��0 1
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /<
.Cryptography_Xml_InvalidX509IssuerSerialNumber
��/ ]
,
��] ^
nameof
��_ e
(
��e f
serialNumber
��f r
)
��r s
)
��s t
;
��t u
}
�� 
if
�� 
(
�� 
_issuerSerials
�� 
==
�� !
null
��" &
)
��& '
_issuerSerials
�� 
=
��  
new
��! $
	ArrayList
��% .
(
��. /
)
��/ 0
;
��0 1
_issuerSerials
�� 
.
�� 
Add
�� 
(
�� 
Utils
�� $
.
��$ %$
CreateX509IssuerSerial
��% ;
(
��; <

issuerName
��< F
,
��F G
h
��H I
.
��I J
ToString
��J R
(
��R S
)
��S T
)
��T U
)
��U V
;
��V W
}
�� 	
internal
�� 
void
�� %
InternalAddIssuerSerial
�� -
(
��- .
string
��. 4

issuerName
��5 ?
,
��? @
string
��A G
serialNumber
��H T
)
��T U
{
�� 	
if
�� 
(
�� 
_issuerSerials
�� 
==
�� !
null
��" &
)
��& '
_issuerSerials
�� 
=
��  
new
��! $
	ArrayList
��% .
(
��. /
)
��/ 0
;
��0 1
_issuerSerials
�� 
.
�� 
Add
�� 
(
�� 
Utils
�� $
.
��$ %$
CreateX509IssuerSerial
��% ;
(
��; <

issuerName
��< F
,
��F G
serialNumber
��H T
)
��T U
)
��U V
;
��V W
}
�� 	
public
�� 
byte
�� 
[
�� 
]
�� 
CRL
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
_CRL
�� 
;
�� 
}
��  
set
�� 
{
�� 
_CRL
�� 
=
�� 
value
�� 
;
�� 
}
��  !
}
�� 	
private
�� 
void
�� 
Clear
�� 
(
�� 
)
�� 
{
�� 	
_CRL
�� 
=
�� 
null
�� 
;
�� 
if
�� 
(
�� 
_subjectKeyIds
�� 
!=
�� !
null
��" &
)
��& '
_subjectKeyIds
��( 6
.
��6 7
Clear
��7 <
(
��< =
)
��= >
;
��> ?
if
�� 
(
�� 
_subjectNames
�� 
!=
��  
null
��! %
)
��% &
_subjectNames
��' 4
.
��4 5
Clear
��5 :
(
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
_issuerSerials
�� 
!=
�� !
null
��" &
)
��& '
_issuerSerials
��( 6
.
��6 7
Clear
��7 <
(
��< =
)
��= >
;
��> ?
if
�� 
(
�� 
_certificates
�� 
!=
��  
null
��! %
)
��% &
_certificates
��' 4
.
��4 5
Clear
��5 :
(
��: ;
)
��; <
;
��< =
}
�� 	
public
�� 
override
�� 

XmlElement
�� "
GetXml
��# )
(
��) *
)
��* +
{
�� 	
XmlDocument
�� 
xmlDocument
�� #
=
��$ %
new
��& )
XmlDocument
��* 5
(
��5 6
)
��6 7
;
��7 8
xmlDocument
�� 
.
��  
PreserveWhitespace
�� *
=
��+ ,
true
��- 1
;
��1 2
return
�� 
GetXml
�� 
(
�� 
xmlDocument
�� %
)
��% &
;
��& '
}
�� 	
internal
�� 
override
�� 

XmlElement
�� $
GetXml
��% +
(
��+ ,
XmlDocument
��, 7
xmlDocument
��8 C
)
��C D
{
�� 	

XmlElement
�� 
x509DataElement
�� &
=
��' (
xmlDocument
��) 4
.
��4 5
CreateElement
��5 B
(
��B C
$str
��C M
,
��M N
	SignedXml
��O X
.
��X Y!
XmlDsigNamespaceUrl
��Y l
)
��l m
;
��m n
if
�� 
(
�� 
_issuerSerials
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
foreach
�� 
(
�� 
X509IssuerSerial
�� )
issuerSerial
��* 6
in
��7 9
_issuerSerials
��: H
)
��H I
{
�� 

XmlElement
�� !
issuerSerialElement
�� 2
=
��3 4
xmlDocument
��5 @
.
��@ A
CreateElement
��A N
(
��N O
$str
��O a
,
��a b
	SignedXml
��c l
.
��l m"
XmlDsigNamespaceUrl��m �
)��� �
;��� �

XmlElement
�� 
issuerNameElement
�� 0
=
��1 2
xmlDocument
��3 >
.
��> ?
CreateElement
��? L
(
��L M
$str
��M ]
,
��] ^
	SignedXml
��_ h
.
��h i!
XmlDsigNamespaceUrl
��i |
)
��| }
;
��} ~
issuerNameElement
�� %
.
��% &
AppendChild
��& 1
(
��1 2
xmlDocument
��2 =
.
��= >
CreateTextNode
��> L
(
��L M
issuerSerial
��M Y
.
��Y Z

IssuerName
��Z d
)
��d e
)
��e f
;
��f g!
issuerSerialElement
�� '
.
��' (
AppendChild
��( 3
(
��3 4
issuerNameElement
��4 E
)
��E F
;
��F G

XmlElement
�� !
serialNumberElement
�� 2
=
��3 4
xmlDocument
��5 @
.
��@ A
CreateElement
��A N
(
��N O
$str
��O a
,
��a b
	SignedXml
��c l
.
��l m"
XmlDsigNamespaceUrl��m �
)��� �
;��� �!
serialNumberElement
�� '
.
��' (
AppendChild
��( 3
(
��3 4
xmlDocument
��4 ?
.
��? @
CreateTextNode
��@ N
(
��N O
issuerSerial
��O [
.
��[ \
SerialNumber
��\ h
)
��h i
)
��i j
;
��j k!
issuerSerialElement
�� '
.
��' (
AppendChild
��( 3
(
��3 4!
serialNumberElement
��4 G
)
��G H
;
��H I
x509DataElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0!
issuerSerialElement
��0 C
)
��C D
;
��D E
}
�� 
}
�� 
if
�� 
(
�� 
_subjectKeyIds
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
foreach
�� 
(
�� 
byte
�� 
[
�� 
]
�� 
subjectKeyId
��  ,
in
��- /
_subjectKeyIds
��0 >
)
��> ?
{
�� 

XmlElement
�� !
subjectKeyIdElement
�� 2
=
��3 4
xmlDocument
��5 @
.
��@ A
CreateElement
��A N
(
��N O
$str
��O X
,
��X Y
	SignedXml
��Z c
.
��c d!
XmlDsigNamespaceUrl
��d w
)
��w x
;
��x y!
subjectKeyIdElement
�� '
.
��' (
AppendChild
��( 3
(
��3 4
xmlDocument
��4 ?
.
��? @
CreateTextNode
��@ N
(
��N O
Convert
��O V
.
��V W
ToBase64String
��W e
(
��e f
subjectKeyId
��f r
)
��r s
)
��s t
)
��t u
;
��u v
x509DataElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0!
subjectKeyIdElement
��0 C
)
��C D
;
��D E
}
�� 
}
�� 
if
�� 
(
�� 
_subjectNames
�� 
!=
��  
null
��! %
)
��% &
{
�� 
foreach
�� 
(
�� 
string
�� 
subjectName
��  +
in
��, .
_subjectNames
��/ <
)
��< =
{
�� 

XmlElement
��  
subjectNameElement
�� 1
=
��2 3
xmlDocument
��4 ?
.
��? @
CreateElement
��@ M
(
��M N
$str
��N _
,
��_ `
	SignedXml
��a j
.
��j k!
XmlDsigNamespaceUrl
��k ~
)
��~ 
;�� � 
subjectNameElement
�� &
.
��& '
AppendChild
��' 2
(
��2 3
xmlDocument
��3 >
.
��> ?
CreateTextNode
��? M
(
��M N
subjectName
��N Y
)
��Y Z
)
��Z [
;
��[ \
x509DataElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0 
subjectNameElement
��0 B
)
��B C
;
��C D
}
�� 
}
�� 
if
�� 
(
�� 
_certificates
�� 
!=
��  
null
��! %
)
��% &
{
�� 
foreach
�� 
(
�� 
X509Certificate
�� (
certificate
��) 4
in
��5 7
_certificates
��8 E
)
��E F
{
�� 

XmlElement
�� 
x509Element
�� *
=
��+ ,
xmlDocument
��- 8
.
��8 9
CreateElement
��9 F
(
��F G
$str
��G X
,
��X Y
	SignedXml
��Z c
.
��c d!
XmlDsigNamespaceUrl
��d w
)
��w x
;
��x y
x509Element
�� 
.
��  
AppendChild
��  +
(
��+ ,
xmlDocument
��, 7
.
��7 8
CreateTextNode
��8 F
(
��F G
Convert
��G N
.
��N O
ToBase64String
��O ]
(
��] ^
certificate
��^ i
.
��i j

GetEncoded
��j t
(
��t u
)
��u v
)
��v w
)
��w x
)
��x y
;
��y z
x509DataElement
�� #
.
��# $
AppendChild
��$ /
(
��/ 0
x509Element
��0 ;
)
��; <
;
��< =
}
�� 
}
�� 
if
�� 
(
�� 
_CRL
�� 
!=
�� 
null
�� 
)
�� 
{
�� 

XmlElement
�� 

crlElement
�� %
=
��& '
xmlDocument
��( 3
.
��3 4
CreateElement
��4 A
(
��A B
$str
��B K
,
��K L
	SignedXml
��M V
.
��V W!
XmlDsigNamespaceUrl
��W j
)
��j k
;
��k l

crlElement
�� 
.
�� 
AppendChild
�� &
(
��& '
xmlDocument
��' 2
.
��2 3
CreateTextNode
��3 A
(
��A B
Convert
��B I
.
��I J
ToBase64String
��J X
(
��X Y
_CRL
��Y ]
)
��] ^
)
��^ _
)
��_ `
;
��` a
x509DataElement
�� 
.
��  
AppendChild
��  +
(
��+ ,

crlElement
��, 6
)
��6 7
;
��7 8
}
�� 
return
�� 
x509DataElement
�� "
;
��" #
}
�� 	
public
�� 
override
�� 
void
�� 
LoadXml
�� $
(
��$ %

XmlElement
��% /
element
��0 7
)
��7 8
{
�� 	
if
�� 
(
�� 
element
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
element
��7 >
)
��> ?
)
��? @
;
��@ A!
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
element
��> E
.
��E F
OwnerDocument
��F S
.
��S T
	NameTable
��T ]
)
��] ^
;
��^ _
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� !
,
��! "
	SignedXml
��# ,
.
��, -!
XmlDsigNamespaceUrl
��- @
)
��@ A
;
��A B
XmlNodeList
�� #
x509IssuerSerialNodes
�� -
=
��. /
element
��0 7
.
��7 8
SelectNodes
��8 C
(
��C D
$str
��D Y
,
��Y Z
nsm
��[ ^
)
��^ _
;
��_ `
XmlNodeList
�� 
x509SKINodes
�� $
=
��% &
element
��' .
.
��. /
SelectNodes
��/ :
(
��: ;
$str
��; G
,
��G H
nsm
��I L
)
��L M
;
��M N
XmlNodeList
�� "
x509SubjectNameNodes
�� ,
=
��- .
element
��/ 6
.
��6 7
SelectNodes
��7 B
(
��B C
$str
��C W
,
��W X
nsm
��Y \
)
��\ ]
;
��] ^
XmlNodeList
�� "
x509CertificateNodes
�� ,
=
��- .
element
��/ 6
.
��6 7
SelectNodes
��7 B
(
��B C
$str
��C W
,
��W X
nsm
��Y \
)
��\ ]
;
��] ^
XmlNodeList
�� 
x509CRLNodes
�� $
=
��% &
element
��' .
.
��. /
SelectNodes
��/ :
(
��: ;
$str
��; G
,
��G H
nsm
��I L
)
��L M
;
��M N
if
�� 
(
�� 
(
�� 
x509CRLNodes
�� 
.
�� 
Count
�� #
==
��$ &
$num
��' (
&&
��) +#
x509IssuerSerialNodes
��, A
.
��A B
Count
��B G
==
��H J
$num
��K L
&&
��M O
x509SKINodes
��P \
.
��\ ]
Count
��] b
==
��c e
$num
��f g
&&
�� "
x509SubjectNameNodes
�� +
.
��+ ,
Count
��, 1
==
��2 4
$num
��5 6
&&
��7 9"
x509CertificateNodes
��: N
.
��N O
Count
��O T
==
��U W
$num
��X Y
)
��Y Z
)
��Z [
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r |
)
��| }
;
��} ~
Clear
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
x509CRLNodes
�� 
.
�� 
Count
�� "
!=
��# %
$num
��& '
)
��' (
_CRL
�� 
=
�� 
Convert
�� 
.
�� 
FromBase64String
�� /
(
��/ 0
Utils
��0 5
.
��5 6 
DiscardWhiteSpaces
��6 H
(
��H I
x509CRLNodes
��I U
.
��U V
Item
��V Z
(
��Z [
$num
��[ \
)
��\ ]
.
��] ^
	InnerText
��^ g
)
��g h
)
��h i
;
��i j
foreach
�� 
(
�� 
XmlNode
�� 
issuerSerialNode
�� -
in
��. 0#
x509IssuerSerialNodes
��1 F
)
��F G
{
�� 
XmlNode
��  
x509IssuerNameNode
�� *
=
��+ ,
issuerSerialNode
��- =
.
��= >
SelectSingleNode
��> N
(
��N O
$str
��O b
,
��b c
nsm
��d g
)
��g h
;
��h i
XmlNode
�� "
x509SerialNumberNode
�� ,
=
��- .
issuerSerialNode
��/ ?
.
��? @
SelectSingleNode
��@ P
(
��P Q
$str
��Q f
,
��f g
nsm
��h k
)
��k l
;
��l m
if
�� 
(
��  
x509IssuerNameNode
�� &
==
��' )
null
��* .
||
��/ 1"
x509SerialNumberNode
��2 F
==
��G I
null
��J N
)
��N O
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str��v �
)��� �
;��� �%
InternalAddIssuerSerial
�� '
(
��' ( 
x509IssuerNameNode
��( :
.
��: ;
	InnerText
��; D
.
��D E
Trim
��E I
(
��I J
)
��J K
,
��K L"
x509SerialNumberNode
��M a
.
��a b
	InnerText
��b k
.
��k l
Trim
��l p
(
��p q
)
��q r
)
��r s
;
��s t
}
�� 
foreach
�� 
(
�� 
XmlNode
�� 
node
�� !
in
��" $
x509SKINodes
��% 1
)
��1 2
{
�� 
AddSubjectKeyId
�� 
(
��  
Convert
��  '
.
��' (
FromBase64String
��( 8
(
��8 9
Utils
��9 >
.
��> ? 
DiscardWhiteSpaces
��? Q
(
��Q R
node
��R V
.
��V W
	InnerText
��W `
)
��` a
)
��a b
)
��b c
;
��c d
}
�� 
foreach
�� 
(
�� 
XmlNode
�� 
node
�� !
in
��" $"
x509SubjectNameNodes
��% 9
)
��9 :
{
�� 
AddSubjectName
�� 
(
�� 
node
�� #
.
��# $
	InnerText
��$ -
.
��- .
Trim
��. 2
(
��2 3
)
��3 4
)
��4 5
;
��5 6
}
�� 
var
�� 
parser
�� 
=
�� 
new
�� #
X509CertificateParser
�� 2
(
��2 3
)
��3 4
;
��4 5
foreach
�� 
(
�� 
XmlNode
�� 
node
�� !
in
��" $"
x509CertificateNodes
��% 9
)
��9 :
{
�� 
var
�� 
cert
�� 
=
�� 
Convert
�� "
.
��" #
FromBase64String
��# 3
(
��3 4
Utils
��4 9
.
��9 : 
DiscardWhiteSpaces
��: L
(
��L M
node
��M Q
.
��Q R
	InnerText
��R [
)
��[ \
)
��\ ]
;
��] ^
AddCertificate
�� 
(
�� 
parser
�� %
.
��% &
ReadCertificate
��& 5
(
��5 6
cert
��6 :
)
��: ;
)
��; <
;
��< =
}
�� 
}
�� 	
}
�� 
}�� �

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
} �
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
} �
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
}00 �
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
} �
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
]$$) *Ս
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
�� 
if
�� 
(
�� 
_transformChain
�� #
==
��$ &
null
��' +
)
��+ ,
_transformChain
�� #
=
��$ %
new
��& )
TransformChain
��* 8
(
��8 9
)
��9 :
;
��: ;
return
�� 
_transformChain
�� &
;
��& '
}
�� 
set
�� 
{
�� 
_transformChain
�� 
=
��  !
value
��" '
;
��' (

_cachedXml
�� 
=
�� 
null
�� !
;
��! "
}
�� 
}
�� 	
internal
�� 
bool
�� 

CacheValid
��  
{
�� 	
get
�� 
{
�� 
return
�� 
(
�� 

_cachedXml
�� "
!=
��# %
null
��& *
)
��* +
;
��+ ,
}
�� 
}
�� 	
internal
�� 
	SignedXml
�� 
	SignedXml
�� $
{
�� 	
get
�� 
{
�� 
return
�� 

_signedXml
�� #
;
��# $
}
��% &
set
�� 
{
�� 

_signedXml
�� 
=
�� 
value
�� $
;
��$ %
}
��& '
}
�� 	
internal
�� !
ReferenceTargetType
�� $!
ReferenceTargetType
��% 8
{
�� 	
get
�� 
{
�� 
return
�� 
_refTargetType
�� %
;
��% &
}
�� 
}
�� 	
public
�� 

XmlElement
�� 
GetXml
��  
(
��  !
)
��! "
{
�� 	
if
�� 
(
�� 

CacheValid
�� 
)
�� 
return
�� "
(
��# $

_cachedXml
��$ .
)
��. /
;
��/ 0
XmlDocument
�� 
document
��  
=
��! "
new
��# &
XmlDocument
��' 2
(
��2 3
)
��3 4
;
��4 5
document
�� 
.
��  
PreserveWhitespace
�� '
=
��( )
true
��* .
;
��. /
return
�� 
GetXml
�� 
(
�� 
document
�� "
)
��" #
;
��# $
}
�� 	
internal
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
)
��7 8
{
�� 	

XmlElement
�� 
referenceElement
�� '
=
��( )
document
��* 2
.
��2 3
CreateElement
��3 @
(
��@ A
$str
��A L
,
��L M
	SignedXml
��N W
.
��W X!
XmlDsigNamespaceUrl
��X k
)
��k l
;
��l m
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
_id
��& )
)
��) *
)
��* +
referenceElement
��  
.
��  !
SetAttribute
��! -
(
��- .
$str
��. 2
,
��2 3
_id
��4 7
)
��7 8
;
��8 9
if
�� 
(
�� 
_uri
�� 
!=
�� 
null
�� 
)
�� 
referenceElement
��  
.
��  !
SetAttribute
��! -
(
��- .
$str
��. 3
,
��3 4
_uri
��5 9
)
��9 :
;
��: ;
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
_type
��& +
)
��+ ,
)
��, -
referenceElement
��  
.
��  !
SetAttribute
��! -
(
��- .
$str
��. 4
,
��4 5
_type
��6 ;
)
��; <
;
��< =
if
�� 
(
�� 
TransformChain
�� 
.
�� 
Count
�� $
!=
��% '
$num
��( )
)
��) *
referenceElement
��  
.
��  !
AppendChild
��! ,
(
��, -
TransformChain
��- ;
.
��; <
GetXml
��< B
(
��B C
document
��C K
,
��K L
	SignedXml
��M V
.
��V W!
XmlDsigNamespaceUrl
��W j
)
��j k
)
��k l
;
��l m
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
_digestMethod
��% 2
)
��2 3
)
��3 4
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q3
%Cryptography_Xml_DigestMethodRequired
��Q v
)
��v w
;
��w x

XmlElement
�� !
digestMethodElement
�� *
=
��+ ,
document
��- 5
.
��5 6
CreateElement
��6 C
(
��C D
$str
��D R
,
��R S
	SignedXml
��T ]
.
��] ^!
XmlDsigNamespaceUrl
��^ q
)
��q r
;
��r s!
digestMethodElement
�� 
.
��  
SetAttribute
��  ,
(
��, -
$str
��- 8
,
��8 9
_digestMethod
��: G
)
��G H
;
��H I
referenceElement
�� 
.
�� 
AppendChild
�� (
(
��( )!
digestMethodElement
��) <
)
��< =
;
��= >
if
�� 
(
�� 
DigestValue
�� 
==
�� 
null
�� #
)
��# $
{
�� 
if
�� 
(
�� 
_hashval
�� 
==
�� 
null
��  $
)
��$ %
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U2
$Cryptography_Xml_DigestValueRequired
��U y
)
��y z
;
��z {
DigestValue
�� 
=
�� 
_hashval
�� &
;
��& '
}
�� 

XmlElement
��  
digestValueElement
�� )
=
��* +
document
��, 4
.
��4 5
CreateElement
��5 B
(
��B C
$str
��C P
,
��P Q
	SignedXml
��R [
.
��[ \!
XmlDsigNamespaceUrl
��\ o
)
��o p
;
��p q 
digestValueElement
�� 
.
�� 
AppendChild
�� *
(
��* +
document
��+ 3
.
��3 4
CreateTextNode
��4 B
(
��B C
Convert
��C J
.
��J K
ToBase64String
��K Y
(
��Y Z
_digestValue
��Z f
)
��f g
)
��g h
)
��h i
;
��i j
referenceElement
�� 
.
�� 
AppendChild
�� (
(
��( ) 
digestValueElement
��) ;
)
��; <
;
��< =
return
�� 
referenceElement
�� #
;
��# $
}
�� 	
public
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� &
value
��' ,
)
��, -
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?
_id
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� $
(
��$ %
value
��% *
,
��* +
$str
��, 0
,
��0 1
	SignedXml
��2 ;
.
��; <!
XmlDsigNamespaceUrl
��< O
)
��O P
;
��P Q
_uri
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� %
(
��% &
value
��& +
,
��+ ,
$str
��- 2
,
��2 3
	SignedXml
��4 =
.
��= >!
XmlDsigNamespaceUrl
��> Q
)
��Q R
;
��R S
_type
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� &
(
��& '
value
��' ,
,
��, -
$str
��. 4
,
��4 5
	SignedXml
��6 ?
.
��? @!
XmlDsigNamespaceUrl
��@ S
)
��S T
;
��T U
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� '
(
��' (
value
��( -
,
��- .
new
��/ 2
string
��3 9
[
��9 :
]
��: ;
{
��< =
$str
��> B
,
��B C
$str
��D I
,
��I J
$str
��K Q
}
��R S
)
��S T
)
��T U
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r }
)
��} ~
;
��~ !
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
value
��> C
.
��C D
OwnerDocument
��D Q
.
��Q R
	NameTable
��R [
)
��[ \
;
��\ ]
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� !
,
��! "
	SignedXml
��# ,
.
��, -!
XmlDsigNamespaceUrl
��- @
)
��@ A
;
��A B
bool
�� 
hasTransforms
�� 
=
��  
false
��! &
;
��& '
TransformChain
�� 
=
�� 
new
��  
TransformChain
��! /
(
��/ 0
)
��0 1
;
��1 2
XmlNodeList
�� 
transformsNodes
�� '
=
��( )
value
��* /
.
��/ 0
SelectNodes
��0 ;
(
��; <
$str
��< K
,
��K L
nsm
��M P
)
��P Q
;
��Q R
if
�� 
(
�� 
transformsNodes
�� 
!=
��  "
null
��# '
&&
��( *
transformsNodes
��+ :
.
��: ;
Count
��; @
!=
��A C
$num
��D E
)
��E F
{
�� 
if
�� 
(
�� 
transformsNodes
�� #
.
��# $
Count
��$ )
>
��* +
$num
��, -
)
��- .
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str��v �
)��� �
;��� �
}
�� 
hasTransforms
�� 
=
�� 
true
��  $
;
��$ %

XmlElement
�� 
transformsElement
�� ,
=
��- .
transformsNodes
��/ >
[
��> ?
$num
��? @
]
��@ A
as
��B D

XmlElement
��E O
;
��O P
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� +
(
��+ ,
transformsElement
��, =
,
��= >
(
��? @
string
��@ F
[
��F G
]
��G H
)
��H I
null
��I M
)
��M N
)
��N O
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str��v �
)��� �
;��� �
}
�� 
XmlNodeList
�� 
transformNodes
�� *
=
��+ ,
transformsElement
��- >
.
��> ?
SelectNodes
��? J
(
��J K
$str
��K Y
,
��Y Z
nsm
��[ ^
)
��^ _
;
��_ `
if
�� 
(
�� 
transformNodes
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
if
�� 
(
�� 
transformNodes
�� &
.
��& '
Count
��' ,
!=
��- /
transformsElement
��0 A
.
��A B
SelectNodes
��B M
(
��M N
$str
��N Q
)
��Q R
.
��R S
Count
��S X
)
��X Y
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y-
Cryptography_Xml_InvalidElement
��Y x
,
��x y
$str��z �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
transformNodes
�� &
.
��& '
Count
��' ,
>
��- .
Utils
��/ 4
.
��4 5'
MaxTransformsPerReference
��5 N
)
��N O
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y-
Cryptography_Xml_InvalidElement
��Y x
,
��x y
$str��z �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
XmlNode
�� $
transformNode
��% 2
in
��3 5
transformNodes
��6 D
)
��D E
{
�� 

XmlElement
�� "
transformElement
��# 3
=
��4 5
transformNode
��6 C
as
��D F

XmlElement
��G Q
;
��Q R
string
�� 
	algorithm
�� (
=
��) *
Utils
��+ 0
.
��0 1
GetAttribute
��1 =
(
��= >
transformElement
��> N
,
��N O
$str
��P [
,
��[ \
	SignedXml
��] f
.
��f g!
XmlDsigNamespaceUrl
��g z
)
��z {
;
��{ |
if
�� 
(
�� 
	algorithm
�� %
==
��& (
null
��) -
||
��. 0
!
��1 2
Utils
��2 7
.
��7 8
VerifyAttributes
��8 H
(
��H I
transformElement
��I Y
,
��Y Z
$str
��[ f
)
��f g
)
��g h
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]/
!Cryptography_Xml_UnknownTransform
��] ~
)
��~ 
;�� �
}
�� 
	Transform
�� !
	transform
��" +
=
��, -
CryptoHelpers
��. ;
.
��; <
CreateFromName
��< J
<
��J K
	Transform
��K T
>
��T U
(
��U V
	algorithm
��V _
)
��_ `
;
��` a
if
�� 
(
�� 
	transform
�� %
==
��& (
null
��) -
)
��- .
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]/
!Cryptography_Xml_UnknownTransform
��] ~
)
��~ 
;�� �
}
�� 
AddTransform
�� $
(
��$ %
	transform
��% .
)
��. /
;
��/ 0
	transform
�� !
.
��! "
LoadInnerXml
��" .
(
��. /
transformElement
��/ ?
.
��? @

ChildNodes
��@ J
)
��J K
;
��K L
if
�� 
(
�� 
	transform
�� %
is
��& (0
"XmlDsigEnvelopedSignatureTransform
��) K
)
��K L
{
�� 
XmlNode
�� #
signatureTag
��$ 0
=
��1 2
transformElement
��3 C
.
��C D
SelectSingleNode
��D T
(
��T U
$str
��U p
,
��p q
nsm
��r u
)
��u v
;
��v w
XmlNodeList
�� '
signatureList
��( 5
=
��6 7
transformElement
��8 H
.
��H I
SelectNodes
��I T
(
��T U
$str
��U e
,
��e f
nsm
��g j
)
��j k
;
��k l
if
�� 
(
��  
signatureList
��  -
!=
��. 0
null
��1 5
)
��5 6
{
�� 
int
��  #
position
��$ ,
=
��- .
$num
��/ 0
;
��0 1
foreach
��  '
(
��( )
XmlNode
��) 0
node
��1 5
in
��6 8
signatureList
��9 F
)
��F G
{
��  !
position
��$ ,
++
��, .
;
��. /
if
��$ &
(
��' (
node
��( ,
==
��- /
signatureTag
��0 <
)
��< =
{
��$ %
(
��( )
(
��) *0
"XmlDsigEnvelopedSignatureTransform
��* L
)
��L M
	transform
��M V
)
��V W
.
��W X
SignaturePosition
��X i
=
��j k
position
��l t
;
��t u
break
��( -
;
��- .
}
��$ %
}
��  !
}
�� 
}
�� 
}
�� 
}
�� 
}
�� 
XmlNodeList
�� 
digestMethodNodes
�� )
=
��* +
value
��, 1
.
��1 2
SelectNodes
��2 =
(
��= >
$str
��> O
,
��O P
nsm
��Q T
)
��T U
;
��U V
if
�� 
(
�� 
digestMethodNodes
�� !
==
��" $
null
��% )
||
��* ,
digestMethodNodes
��- >
.
��> ?
Count
��? D
==
��E G
$num
��H I
||
��J L
digestMethodNodes
��M ^
.
��^ _
Count
��_ d
>
��e f
$num
��g h
)
��h i
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
�� !
digestMethodElement
�� *
=
��+ ,
digestMethodNodes
��- >
[
��> ?
$num
��? @
]
��@ A
as
��B D

XmlElement
��E O
;
��O P
_digestMethod
�� 
=
�� 
Utils
�� !
.
��! "
GetAttribute
��" .
(
��. /!
digestMethodElement
��/ B
,
��B C
$str
��D O
,
��O P
	SignedXml
��Q Z
.
��Z [!
XmlDsigNamespaceUrl
��[ n
)
��n o
;
��o p
if
�� 
(
�� 
_digestMethod
�� 
==
��  
null
��! %
||
��& (
!
��) *
Utils
��* /
.
��/ 0
VerifyAttributes
��0 @
(
��@ A!
digestMethodElement
��A T
,
��T U
$str
��V a
)
��a b
)
��b c
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �
XmlNodeList
�� 
digestValueNodes
�� (
=
��) *
value
��+ 0
.
��0 1
SelectNodes
��1 <
(
��< =
$str
��= M
,
��M N
nsm
��O R
)
��R S
;
��S T
if
�� 
(
�� 
digestValueNodes
��  
==
��! #
null
��$ (
||
��) +
digestValueNodes
��, <
.
��< =
Count
��= B
==
��C E
$num
��F G
||
��H J
digestValueNodes
��K [
.
��[ \
Count
��\ a
>
��b c
$num
��d e
)
��e f
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
��  
digestValueElement
�� )
=
��* +
digestValueNodes
��, <
[
��< =
$num
��= >
]
��> ?
as
��@ B

XmlElement
��C M
;
��M N
_digestValue
�� 
=
�� 
Convert
�� "
.
��" #
FromBase64String
��# 3
(
��3 4
Utils
��4 9
.
��9 : 
DiscardWhiteSpaces
��: L
(
��L M 
digestValueElement
��M _
.
��_ `
	InnerText
��` i
)
��i j
)
��j k
;
��k l
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� '
(
��' ( 
digestValueElement
��( :
,
��: ;
(
��< =
string
��= C
[
��C D
]
��D E
)
��E F
null
��F J
)
��J K
)
��K L
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �
int
�� $
expectedChildNodeCount
�� &
=
��' (
hasTransforms
��) 6
?
��7 8
$num
��9 :
:
��; <
$num
��= >
;
��> ?
if
�� 
(
�� 
value
�� 
.
�� 
SelectNodes
�� !
(
��! "
$str
��" %
)
��% &
.
��& '
Count
��' ,
!=
��- /$
expectedChildNodeCount
��0 F
)
��F G
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r }
)
��} ~
;
��~ 

_cachedXml
�� 
=
�� 
value
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
AddTransform
��  
(
��  !
	Transform
��! *
	transform
��+ 4
)
��4 5
{
�� 	
if
�� 
(
�� 
	transform
�� 
==
�� 
null
�� !
)
��! "
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 ;
)
��; <
;
��< =
	transform
�� 
.
�� 
	Reference
�� 
=
��  !
this
��" &
;
��& '
TransformChain
�� 
.
�� 
Add
�� 
(
�� 
	transform
�� (
)
��( )
;
��) *
}
�� 	
internal
�� 
void
�� 
UpdateHashValue
�� %
(
��% &
XmlDocument
��& 1
document
��2 :
,
��: ;"
CanonicalXmlNodeList
��< P
refList
��Q X
)
��X Y
{
�� 	
DigestValue
�� 
=
��  
CalculateHashValue
�� ,
(
��, -
document
��- 5
,
��5 6
refList
��7 >
)
��> ?
;
��? @
}
�� 	
internal
�� 
byte
�� 
[
�� 
]
��  
CalculateHashValue
�� *
(
��* +
XmlDocument
��+ 6
document
��7 ?
,
��? @"
CanonicalXmlNodeList
��A U
refList
��V ]
)
��] ^
{
�� 	
IDigest
�� 
digest
�� 
=
�� 
CryptoHelpers
�� *
.
��* +
CreateFromName
��+ 9
<
��9 :
IDigest
��: A
>
��A B
(
��B C
_digestMethod
��C P
)
��P Q
;
��Q R
if
�� 
(
�� 
digest
�� 
==
�� 
null
�� 
)
�� 
{
�� 
IMac
�� 
mac
�� 
=
�� 
CryptoHelpers
�� (
.
��( )
CreateFromName
��) 7
<
��7 8
IMac
��8 <
>
��< =
(
��= >
_digestMethod
��> K
)
��K L
;
��L M
if
�� 
(
�� 
mac
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U8
*Cryptography_Xml_CreateHashAlgorithmFailed
��U 
)�� �
;��� �
byte
�� 
[
�� 
]
�� 
	randomKey
��  
=
��! "
Utils
��# (
.
��( )!
GenerateRandomBlock
��) <
(
��< =
mac
��= @
.
��@ A

GetMacSize
��A K
(
��K L
)
��L M
)
��M N
;
��N O
mac
�� 
.
�� 
Init
�� 
(
�� 
new
�� 
KeyParameter
�� )
(
��) *
	randomKey
��* 3
)
��3 4
)
��4 5
;
��5 6
_hashAlgorithm
�� 
=
��  
new
��! $
MacHashWrapper
��% 3
(
��3 4
mac
��4 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
_hashAlgorithm
�� 
=
��  
new
��! $
DigestHashWrapper
��% 6
(
��6 7
digest
��7 =
)
��= >
;
��> ?
}
�� 
string
�� 
baseUri
�� 
=
�� 
(
�� 
document
�� &
==
��' )
null
��* .
?
��/ 0
System
��1 7
.
��7 8
Environment
��8 C
.
��C D
CurrentDirectory
��D T
+
��U V
$str
��W [
:
��\ ]
document
��^ f
.
��f g
BaseURI
��g n
)
��n o
;
��o p
Stream
�� 
hashInputStream
�� "
=
��# $
null
��% )
;
��) *
WebResponse
�� 
response
��  
=
��! "
null
��# '
;
��' (
Stream
�� 
inputStream
�� 
=
��  
null
��! %
;
��% &
XmlResolver
�� 
resolver
��  
=
��! "
null
��# '
;
��' (
_hashval
�� 
=
�� 
null
�� 
;
�� 
try
�� 
{
�� 
switch
�� 
(
�� 
_refTargetType
�� &
)
��& '
{
�� 
case
�� !
ReferenceTargetType
�� ,
.
��, -
Stream
��- 3
:
��3 4
resolver
��  
=
��! "
(
��# $
	SignedXml
��$ -
.
��- .
ResolverSet
��. 9
?
��: ;
	SignedXml
��< E
.
��E F
_xmlResolver
��F R
:
��S T
new
��U X
XmlSecureResolver
��Y j
(
��j k
new
��k n
XmlUrlResolver
��o }
(
��} ~
)
��~ 
,�� �
baseUri��� �
)��� �
)��� �
;��� �
hashInputStream
�� '
=
��( )
TransformChain
��* 8
.
��8 9$
TransformToOctetStream
��9 O
(
��O P
(
��P Q
Stream
��Q W
)
��W X

_refTarget
��X b
,
��b c
resolver
��d l
,
��l m
baseUri
��n u
)
��u v
;
��v w
break
�� 
;
�� 
case
�� !
ReferenceTargetType
�� ,
.
��, -
UriReference
��- 9
:
��9 :
if
�� 
(
�� 
_uri
��  
==
��! #
null
��$ (
)
��( )
{
�� 
resolver
�� $
=
��% &
(
��' (
	SignedXml
��( 1
.
��1 2
ResolverSet
��2 =
?
��> ?
	SignedXml
��@ I
.
��I J
_xmlResolver
��J V
:
��W X
new
��Y \
XmlSecureResolver
��] n
(
��n o
new
��o r
XmlUrlResolver��s �
(��� �
)��� �
,��� �
baseUri��� �
)��� �
)��� �
;��� �
hashInputStream
�� +
=
��, -
TransformChain
��. <
.
��< =$
TransformToOctetStream
��= S
(
��S T
(
��T U
Stream
��U [
)
��[ \
null
��\ `
,
��` a
resolver
��b j
,
��j k
baseUri
��l s
)
��s t
;
��t u
}
�� 
else
�� 
if
�� 
(
��  !
_uri
��! %
.
��% &
Length
��& ,
==
��- /
$num
��0 1
)
��1 2
{
�� 
if
�� 
(
��  
document
��  (
==
��) +
null
��, 0
)
��0 1
throw
��  %
new
��& )
System
��* 0
.
��0 1
Security
��1 9
.
��9 :
Cryptography
��: F
.
��F G$
CryptographicException
��G ]
(
��] ^
string
��^ d
.
��d e
Format
��e k
(
��k l
CultureInfo
��l w
.
��w x
CurrentCulture��x �
,��� �
SR��� �
.��� �=
-Cryptography_Xml_SelfReferenceRequiresContext��� �
,��� �
_uri��� �
)��� �
)��� �
;��� �
resolver
�� $
=
��% &
(
��' (
	SignedXml
��( 1
.
��1 2
ResolverSet
��2 =
?
��> ?
	SignedXml
��@ I
.
��I J
_xmlResolver
��J V
:
��W X
new
��Y \
XmlSecureResolver
��] n
(
��n o
new
��o r
XmlUrlResolver��s �
(��� �
)��� �
,��� �
baseUri��� �
)��� �
)��� �
;��� �
XmlDocument
�� '
docWithNoComments
��( 9
=
��: ;
Utils
��< A
.
��A B
DiscardComments
��B Q
(
��Q R
Utils
��R W
.
��W X%
PreProcessDocumentInput
��X o
(
��o p
document
��p x
,
��x y
resolver��z �
,��� �
baseUri��� �
)��� �
)��� �
;��� �
hashInputStream
�� +
=
��, -
TransformChain
��. <
.
��< =$
TransformToOctetStream
��= S
(
��S T
docWithNoComments
��T e
,
��e f
resolver
��g o
,
��o p
baseUri
��q x
)
��x y
;
��y z
}
�� 
else
�� 
if
�� 
(
��  !
_uri
��! %
[
��% &
$num
��& '
]
��' (
==
��) +
$char
��, /
)
��/ 0
{
�� 
bool
��  
discardComments
��! 0
=
��1 2
true
��3 7
;
��7 8
string
�� "
idref
��# (
=
��) *
Utils
��+ 0
.
��0 1
GetIdFromLocalUri
��1 B
(
��B C
_uri
��C G
,
��G H
out
��I L
discardComments
��M \
)
��\ ]
;
��] ^
if
�� 
(
��  
idref
��  %
==
��& (
$str
��) 6
)
��6 7
{
�� 
if
��  "
(
��# $
document
��$ ,
==
��- /
null
��0 4
)
��4 5
throw
��$ )
new
��* -
System
��. 4
.
��4 5
Security
��5 =
.
��= >
Cryptography
��> J
.
��J K$
CryptographicException
��K a
(
��a b
string
��b h
.
��h i
Format
��i o
(
��o p
CultureInfo
��p {
.
��{ |
CurrentCulture��| �
,��� �
SR��� �
.��� �=
-Cryptography_Xml_SelfReferenceRequiresContext��� �
,��� �
_uri��� �
)��� �
)��� �
;��� �
resolver
��  (
=
��) *
(
��+ ,
	SignedXml
��, 5
.
��5 6
ResolverSet
��6 A
?
��B C
	SignedXml
��D M
.
��M N
_xmlResolver
��N Z
:
��[ \
new
��] `
XmlSecureResolver
��a r
(
��r s
new
��s v
XmlUrlResolver��w �
(��� �
)��� �
,��� �
baseUri��� �
)��� �
)��� �
;��� �
hashInputStream
��  /
=
��0 1
TransformChain
��2 @
.
��@ A$
TransformToOctetStream
��A W
(
��W X
Utils
��X ]
.
��] ^%
PreProcessDocumentInput
��^ u
(
��u v
document
��v ~
,
��~ 
resolver��� �
,��� �
baseUri��� �
)��� �
,��� �
resolver��� �
,��� �
baseUri��� �
)��� �
;��� �
break
��  %
;
��% &
}
�� 

XmlElement
�� &
elem
��' +
=
��, -
	SignedXml
��. 7
.
��7 8
GetIdElement
��8 D
(
��D E
document
��E M
,
��M N
idref
��O T
)
��T U
;
��U V
if
�� 
(
��  
elem
��  $
!=
��% '
null
��( ,
)
��, -
_namespaces
��  +
=
��, -
Utils
��. 3
.
��3 4%
GetPropagatedAttributes
��4 K
(
��K L
elem
��L P
.
��P Q

ParentNode
��Q [
as
��\ ^

XmlElement
��_ i
)
��i j
;
��j k
if
�� 
(
��  
elem
��  $
==
��% '
null
��( ,
)
��, -
{
�� 
if
��  "
(
��# $
refList
��$ +
!=
��, .
null
��/ 3
)
��3 4
{
��  !
foreach
��$ +
(
��, -
XmlNode
��- 4
node
��5 9
in
��: <
refList
��= D
)
��D E
{
��$ %

XmlElement
��( 2
tempElem
��3 ;
=
��< =
node
��> B
as
��C E

XmlElement
��F P
;
��P Q
if
��( *
(
��+ ,
(
��, -
tempElem
��- 5
!=
��6 8
null
��9 =
)
��= >
&&
��? A
(
��B C
Utils
��C H
.
��H I
HasAttribute
��I U
(
��U V
tempElem
��V ^
,
��^ _
$str
��` d
,
��d e
	SignedXml
��f o
.
��o p"
XmlDsigNamespaceUrl��p �
)��� �
)��� �
&&
��, .
(
��/ 0
Utils
��0 5
.
��5 6
GetAttribute
��6 B
(
��B C
tempElem
��C K
,
��K L
$str
��M Q
,
��Q R
	SignedXml
��S \
.
��\ ]!
XmlDsigNamespaceUrl
��] p
)
��p q
.
��q r
Equals
��r x
(
��x y
idref
��y ~
)
��~ 
)�� �
)��� �
{
��( )
elem
��, 0
=
��1 2
tempElem
��3 ;
;
��; <
if
��, .
(
��/ 0

_signedXml
��0 :
.
��: ;
_context
��; C
!=
��D F
null
��G K
)
��K L
_namespaces
��0 ;
=
��< =
Utils
��> C
.
��C D%
GetPropagatedAttributes
��D [
(
��[ \

_signedXml
��\ f
.
��f g
_context
��g o
)
��o p
;
��p q
break
��, 1
;
��1 2
}
��( )
}
��$ %
}
��  !
}
�� 
if
�� 
(
��  
elem
��  $
==
��% '
null
��( ,
)
��, -
throw
��  %
new
��& )
System
��* 0
.
��0 1
Security
��1 9
.
��9 :
Cryptography
��: F
.
��F G$
CryptographicException
��G ]
(
��] ^
SR
��^ `
.
��` a0
!Cryptography_Xml_InvalidReference��a �
)��� �
;��� �
XmlDocument
�� '
normDocument
��( 4
=
��5 6
Utils
��7 <
.
��< =$
PreProcessElementInput
��= S
(
��S T
elem
��T X
,
��X Y
resolver
��Z b
,
��b c
baseUri
��d k
)
��k l
;
��l m
Utils
�� !
.
��! "
AddNamespaces
��" /
(
��/ 0
normDocument
��0 <
.
��< =
DocumentElement
��= L
,
��L M
_namespaces
��N Y
)
��Y Z
;
��Z [
resolver
�� $
=
��% &
(
��' (
	SignedXml
��( 1
.
��1 2
ResolverSet
��2 =
?
��> ?
	SignedXml
��@ I
.
��I J
_xmlResolver
��J V
:
��W X
new
��Y \
XmlSecureResolver
��] n
(
��n o
new
��o r
XmlUrlResolver��s �
(��� �
)��� �
,��� �
baseUri��� �
)��� �
)��� �
;��� �
if
�� 
(
��  
discardComments
��  /
)
��/ 0
{
�� 
XmlDocument
��  +
docWithNoComments
��, =
=
��> ?
Utils
��@ E
.
��E F
DiscardComments
��F U
(
��U V
normDocument
��V b
)
��b c
;
��c d
hashInputStream
��  /
=
��0 1
TransformChain
��2 @
.
��@ A$
TransformToOctetStream
��A W
(
��W X
docWithNoComments
��X i
,
��i j
resolver
��k s
,
��s t
baseUri
��u |
)
��| }
;
��} ~
}
�� 
else
��  
{
�� 
hashInputStream
��  /
=
��0 1
TransformChain
��2 @
.
��@ A$
TransformToOctetStream
��A W
(
��W X
normDocument
��X d
,
��d e
resolver
��f n
,
��n o
baseUri
��p w
)
��w x
;
��x y
}
�� 
}
�� 
else
�� 
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]-
Cryptography_Xml_UriNotResolved
��] |
,
��| }
_uri��~ �
)��� �
;��� �
}
�� 
break
�� 
;
�� 
case
�� !
ReferenceTargetType
�� ,
.
��, -

XmlElement
��- 7
:
��7 8
resolver
��  
=
��! "
(
��# $
	SignedXml
��$ -
.
��- .
ResolverSet
��. 9
?
��: ;
	SignedXml
��< E
.
��E F
_xmlResolver
��F R
:
��S T
new
��U X
XmlSecureResolver
��Y j
(
��j k
new
��k n
XmlUrlResolver
��o }
(
��} ~
)
��~ 
,�� �
baseUri��� �
)��� �
)��� �
;��� �
hashInputStream
�� '
=
��( )
TransformChain
��* 8
.
��8 9$
TransformToOctetStream
��9 O
(
��O P
Utils
��P U
.
��U V$
PreProcessElementInput
��V l
(
��l m
(
��m n

XmlElement
��n x
)
��x y

_refTarget��y �
,��� �
resolver��� �
,��� �
baseUri��� �
)��� �
,��� �
resolver��� �
,��� �
baseUri��� �
)��� �
;��� �
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y-
Cryptography_Xml_UriNotResolved
��Y x
,
��x y
_uri
��z ~
)
��~ 
;�� �
}
�� 
hashInputStream
�� 
=
��  !
SignedXmlDebugLog
��" 3
.
��3 4
LogReferenceData
��4 D
(
��D E
this
��E I
,
��I J
hashInputStream
��K Z
)
��Z [
;
��[ \
byte
�� 
[
�� 
]
�� 
buffer
�� 
=
�� 
new
��  #
byte
��$ (
[
��( )
$num
��) -
]
��- .
;
��. /
int
�� 
	bytesRead
�� 
;
�� 
_hashAlgorithm
�� 
.
�� 
Reset
�� $
(
��$ %
)
��% &
;
��& '
while
�� 
(
�� 
(
�� 
	bytesRead
�� !
=
��" #
hashInputStream
��$ 3
.
��3 4
Read
��4 8
(
��8 9
buffer
��9 ?
,
��? @
$num
��A B
,
��B C
buffer
��D J
.
��J K
Length
��K Q
)
��Q R
)
��R S
>
��T U
$num
��V W
)
��W X
{
��Y Z
_hashAlgorithm
�� "
.
��" #
BlockUpdate
��# .
(
��. /
buffer
��/ 5
,
��5 6
$num
��7 8
,
��8 9
	bytesRead
��: C
)
��C D
;
��D E
}
�� 
_hashval
�� 
=
�� 
new
�� 
byte
�� #
[
��# $
_hashAlgorithm
��$ 2
.
��2 3
GetHashSize
��3 >
(
��> ?
)
��? @
]
��@ A
;
��A B
_hashAlgorithm
�� 
.
�� 
DoFinal
�� &
(
��& '
_hashval
��' /
,
��/ 0
$num
��1 2
)
��2 3
;
��3 4
}
�� 
finally
�� 
{
�� 
if
�� 
(
�� 
hashInputStream
�� #
!=
��$ &
null
��' +
)
��+ ,
hashInputStream
�� #
.
��# $
Close
��$ )
(
��) *
)
��* +
;
��+ ,
if
�� 
(
�� 
response
�� 
!=
�� 
null
��  $
)
��$ %
response
�� 
.
�� 
Close
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
inputStream
�� 
!=
��  "
null
��# '
)
��' (
inputStream
�� 
.
��  
Close
��  %
(
��% &
)
��& '
;
��' (
}
�� 
return
�� 
_hashval
�� 
;
�� 
}
�� 	
}
�� 
}�� �D
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
�� 
object
�� 
SyncRoot
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
_references
�� $
.
��$ %
SyncRoot
��% -
;
��- .
}
��/ 0
}
�� 	
public
�� 
bool
�� 
IsSynchronized
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
_references
�� $
.
��$ %
IsSynchronized
��% 3
;
��3 4
}
��5 6
}
�� 	
}
�� 
}�� �
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
} �Q
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
)	NN �
;
NN� �
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
 element in namespace 	nnz �
{
nn� �
	SignedXml
nn� �
.
nn� �!
XmlDsigNamespaceUrl
nn� �
}
nn� �
"
nn� �
)
nn� �
;
nn� �
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
xmlNamespaceManager	uuv �
)
uu� �
;
uu� �
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
 must contain child element 	xxe �
{
xx� �$
RSAKeyValueElementName
xx� �
}
xx� �
"
xx� �
)
xx� �
;
xx� �
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
xmlDsigNamespacePrefix	~~k �
}
~~� �
:
~~� �
{
~~� � 
ModulusElementName
~~� �
}
~~� �
"
~~� �
,
~~� �!
xmlNamespaceManager
~~� �
)
~~� �
.
~~� �
	InnerText
~~� �
)
~~� �
)
~~� �
,
~~� �
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
xmlDsigNamespacePrefix	k �
}
� �
:
� �
{
� �!
ExponentElementName
� �
}
� �
"
� �
,
� �!
xmlNamespaceManager
� �
)
� �
.
� �
	InnerText
� �
)
� �
)
� �
)
� �
;
� �
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
$"
��N P,
An error occurred parsing the 
��P n
{
��n o!
ModulusElementName��o �
}��� �
 and ��� �
{��� �#
ExponentElementName��� �
}��� �
	 elements��� �
"��� �
,��� �
ex��� �
)��� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �
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
}11 �&
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
}TT �
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
}88 �
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
$str	 �
;
� �
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
}?? �
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
�� 
dataObj
�� "
=
��# $
obj
��% (
as
��) +

DataObject
��, 6
;
��6 7
if
�� 
(
�� 
dataObj
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
signatureElement
�� $
.
��$ %
AppendChild
��% 0
(
��0 1
dataObj
��1 8
.
��8 9
GetXml
��9 ?
(
��? @
document
��@ H
)
��H I
)
��I J
;
��J K
}
�� 
}
�� 
return
�� 
signatureElement
�� #
;
��# $
}
�� 	
public
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� &
value
��' ,
)
��, -
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?

XmlElement
�� 
signatureElement
�� '
=
��( )
value
��* /
;
��/ 0
if
�� 
(
�� 
!
�� 
signatureElement
�� !
.
��! "
	LocalName
��" +
.
��+ ,
Equals
��, 2
(
��2 3
$str
��3 >
)
��> ?
)
��? @
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r }
)
��} ~
;
��~ 
_id
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� $
(
��$ %
signatureElement
��% 5
,
��5 6
$str
��7 ;
,
��; <
	SignedXml
��= F
.
��F G!
XmlDsigNamespaceUrl
��G Z
)
��Z [
;
��[ \
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� '
(
��' (
signatureElement
��( 8
,
��8 9
$str
��: >
)
��> ?
)
��? @
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r }
)
��} ~
;
��~ !
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
value
��> C
.
��C D
OwnerDocument
��D Q
.
��Q R
	NameTable
��R [
)
��[ \
;
��\ ]
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� !
,
��! "
	SignedXml
��# ,
.
��, -!
XmlDsigNamespaceUrl
��- @
)
��@ A
;
��A B
int
��  
expectedChildNodes
�� "
=
��# $
$num
��% &
;
��& '
XmlNodeList
�� 
signedInfoNodes
�� '
=
��( )
signatureElement
��* :
.
��: ;
SelectNodes
��; F
(
��F G
$str
��G V
,
��V W
nsm
��X [
)
��[ \
;
��\ ]
if
�� 
(
�� 
signedInfoNodes
�� 
==
��  "
null
��# '
||
��( *
signedInfoNodes
��+ :
.
��: ;
Count
��; @
==
��A C
$num
��D E
||
��F H
signedInfoNodes
��I X
.
��X Y
Count
��Y ^
>
��_ `
$num
��a b
)
��b c
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r ~
)
��~ 
;�� �

XmlElement
�� 
signedInfoElement
�� (
=
��) *
signedInfoNodes
��+ :
[
��: ;
$num
��; <
]
��< =
as
��> @

XmlElement
��A K
;
��K L 
expectedChildNodes
�� 
+=
�� !
signedInfoNodes
��" 1
.
��1 2
Count
��2 7
;
��7 8

SignedInfo
�� 
=
�� 
new
�� 

SignedInfo
�� '
(
��' (
)
��( )
;
��) *

SignedInfo
�� 
.
�� 
LoadXml
�� 
(
�� 
signedInfoElement
�� 0
)
��0 1
;
��1 2
XmlNodeList
�� !
signatureValueNodes
�� +
=
��, -
signatureElement
��. >
.
��> ?
SelectNodes
��? J
(
��J K
$str
��K ^
,
��^ _
nsm
��` c
)
��c d
;
��d e
if
�� 
(
�� !
signatureValueNodes
�� #
==
��$ &
null
��' +
||
��, .!
signatureValueNodes
��/ B
.
��B C
Count
��C H
==
��I K
$num
��L M
||
��N P!
signatureValueNodes
��Q d
.
��d e
Count
��e j
>
��k l
$num
��m n
)
��n o
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
�� #
signatureValueElement
�� ,
=
��- .!
signatureValueNodes
��/ B
[
��B C
$num
��C D
]
��D E
as
��F H

XmlElement
��I S
;
��S T 
expectedChildNodes
�� 
+=
�� !!
signatureValueNodes
��" 5
.
��5 6
Count
��6 ;
;
��; <
_signatureValue
�� 
=
�� 
Convert
�� %
.
��% &
FromBase64String
��& 6
(
��6 7
Utils
��7 <
.
��< = 
DiscardWhiteSpaces
��= O
(
��O P#
signatureValueElement
��P e
.
��e f
	InnerText
��f o
)
��o p
)
��p q
;
��q r
_signatureValueId
�� 
=
�� 
Utils
��  %
.
��% &
GetAttribute
��& 2
(
��2 3#
signatureValueElement
��3 H
,
��H I
$str
��J N
,
��N O
	SignedXml
��P Y
.
��Y Z!
XmlDsigNamespaceUrl
��Z m
)
��m n
;
��n o
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� '
(
��' (#
signatureValueElement
��( =
,
��= >
$str
��? C
)
��C D
)
��D E
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �
XmlNodeList
�� 
keyInfoNodes
�� $
=
��% &
signatureElement
��' 7
.
��7 8
SelectNodes
��8 C
(
��C D
$str
��D P
,
��P Q
nsm
��R U
)
��U V
;
��V W
_keyInfo
�� 
=
�� 
new
�� 
KeyInfo
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
keyInfoNodes
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
if
�� 
(
�� 
keyInfoNodes
��  
.
��  !
Count
��! &
>
��' (
$num
��) *
)
��* +
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str
��v 
)�� �
;��� �
}
�� 
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
keyInfoNodes
��) 5
)
��5 6
{
�� 

XmlElement
�� 
keyInfoElement
�� -
=
��. /
node
��0 4
as
��5 7

XmlElement
��8 B
;
��B C
if
�� 
(
�� 
keyInfoElement
�� &
!=
��' )
null
��* .
)
��. /
_keyInfo
��  
.
��  !
LoadXml
��! (
(
��( )
keyInfoElement
��) 7
)
��7 8
;
��8 9
}
��  
expectedChildNodes
�� "
+=
��# %
keyInfoNodes
��& 2
.
��2 3
Count
��3 8
;
��8 9
}
�� 
XmlNodeList
�� 
objectNodes
�� #
=
��$ %
signatureElement
��& 6
.
��6 7
SelectNodes
��7 B
(
��B C
$str
��C N
,
��N O
nsm
��P S
)
��S T
;
��T U
_embeddedObjects
�� 
.
�� 
Clear
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
objectNodes
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
objectNodes
��) 4
)
��4 5
{
�� 

XmlElement
�� 
objectElement
�� ,
=
��- .
node
��/ 3
as
��4 6

XmlElement
��7 A
;
��A B
if
�� 
(
�� 
objectElement
�� %
!=
��& (
null
��) -
)
��- .
{
�� 

DataObject
�� "
dataObj
��# *
=
��+ ,
new
��- 0

DataObject
��1 ;
(
��; <
)
��< =
;
��= >
dataObj
�� 
.
��  
LoadXml
��  '
(
��' (
objectElement
��( 5
)
��5 6
;
��6 7
_embeddedObjects
�� (
.
��( )
Add
��) ,
(
��, -
dataObj
��- 4
)
��4 5
;
��5 6
}
�� 
}
��  
expectedChildNodes
�� "
+=
��# %
objectNodes
��& 1
.
��1 2
Count
��2 7
;
��7 8
}
�� 
XmlNodeList
�� 
nodeList
��  
=
��! "
signatureElement
��# 3
.
��3 4
SelectNodes
��4 ?
(
��? @
$str
��@ J
,
��J K
nsm
��L O
)
��O P
;
��P Q
if
�� 
(
�� 
nodeList
�� 
!=
�� 
null
��  
)
��  !
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
nodeList
��) 1
)
��1 2
{
�� 
_referencedItems
�� $
.
��$ %
Add
��% (
(
��( )
node
��) -
)
��- .
;
��. /
}
�� 
}
�� 
if
�� 
(
�� 
signatureElement
��  
.
��  !
SelectNodes
��! ,
(
��, -
$str
��- 0
)
��0 1
.
��1 2
Count
��2 7
!=
��8 : 
expectedChildNodes
��; M
)
��M N
{
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r }
)
��} ~
;
��~ 
}
�� 
}
�� 	
public
�� 
void
�� 
	AddObject
�� 
(
�� 

DataObject
�� (

dataObject
��) 3
)
��3 4
{
�� 	
_embeddedObjects
�� 
.
�� 
Add
��  
(
��  !

dataObject
��! +
)
��+ ,
;
��, -
}
�� 	
}
�� 
}�� ��
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
gg� �
.
gg� �4
&Cryptography_Xml_CreateTransformFailed
gg� �
,
gg� �$
CanonicalizationMethod
gg� �
)
gg� �
)
gg� �
;
gg� �,
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
�� 
}
�� 	
public
�� 
	ArrayList
�� 

References
�� #
{
�� 	
get
�� 
{
�� 
return
�� 
_references
�� $
;
��$ %
}
��& '
}
�� 	
internal
�� 
bool
�� 

CacheValid
��  
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 

_cachedXml
�� 
==
�� !
null
��" &
)
��& '
return
��( .
false
��/ 4
;
��4 5
foreach
�� 
(
�� 
	Reference
�� "
	reference
��# ,
in
��- /

References
��0 :
)
��: ;
{
�� 
if
�� 
(
�� 
!
�� 
	reference
�� "
.
��" #

CacheValid
��# -
)
��- .
return
��/ 5
false
��6 ;
;
��; <
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 
}
�� 	
public
�� 

XmlElement
�� 
GetXml
��  
(
��  !
)
��! "
{
�� 	
if
�� 
(
�� 

CacheValid
�� 
)
�� 
return
�� "

_cachedXml
��# -
;
��- .
XmlDocument
�� 
document
��  
=
��! "
new
��# &
XmlDocument
��' 2
(
��2 3
)
��3 4
;
��4 5
document
�� 
.
��  
PreserveWhitespace
�� '
=
��( )
true
��* .
;
��. /
return
�� 
GetXml
�� 
(
�� 
document
�� "
)
��" #
;
��# $
}
�� 	
internal
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
)
��7 8
{
�� 	

XmlElement
�� 
signedInfoElement
�� (
=
��) *
document
��+ 3
.
��3 4
CreateElement
��4 A
(
��A B
$str
��B N
,
��N O
	SignedXml
��P Y
.
��Y Z!
XmlDsigNamespaceUrl
��Z m
)
��m n
;
��n o
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
_id
��& )
)
��) *
)
��* +
signedInfoElement
�� !
.
��! "
SetAttribute
��" .
(
��. /
$str
��/ 3
,
��3 4
_id
��5 8
)
��8 9
;
��9 :

XmlElement
�� +
canonicalizationMethodElement
�� 4
=
��5 6*
CanonicalizationMethodObject
��7 S
.
��S T
GetXml
��T Z
(
��Z [
document
��[ c
,
��c d
$str
��e }
)
��} ~
;
��~ 
signedInfoElement
�� 
.
�� 
AppendChild
�� )
(
��) *+
canonicalizationMethodElement
��* G
)
��G H
;
��H I
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
_signatureMethod
��% 5
)
��5 6
)
��6 7
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q6
(Cryptography_Xml_SignatureMethodRequired
��Q y
)
��y z
;
��z {

XmlElement
�� $
signatureMethodElement
�� -
=
��. /
document
��0 8
.
��8 9
CreateElement
��9 F
(
��F G
$str
��G X
,
��X Y
	SignedXml
��Z c
.
��c d!
XmlDsigNamespaceUrl
��d w
)
��w x
;
��x y$
signatureMethodElement
�� "
.
��" #
SetAttribute
��# /
(
��/ 0
$str
��0 ;
,
��; <
_signatureMethod
��= M
)
��M N
;
��N O
if
�� 
(
�� 
_signatureLength
��  
!=
��! #
null
��$ (
)
��( )
{
�� 

XmlElement
�� 
hmacLengthElement
�� ,
=
��- .
document
��/ 7
.
��7 8
CreateElement
��8 E
(
��E F
null
��F J
,
��J K
$str
��L ^
,
��^ _
	SignedXml
��` i
.
��i j!
XmlDsigNamespaceUrl
��j }
)
��} ~
;
��~ 
XmlText
�� 
outputLength
�� $
=
��% &
document
��' /
.
��/ 0
CreateTextNode
��0 >
(
��> ?
_signatureLength
��? O
)
��O P
;
��P Q
hmacLengthElement
�� !
.
��! "
AppendChild
��" -
(
��- .
outputLength
��. :
)
��: ;
;
��; <$
signatureMethodElement
�� &
.
��& '
AppendChild
��' 2
(
��2 3
hmacLengthElement
��3 D
)
��D E
;
��E F
}
�� 
signedInfoElement
�� 
.
�� 
AppendChild
�� )
(
��) *$
signatureMethodElement
��* @
)
��@ A
;
��A B
if
�� 
(
�� 
_references
�� 
.
�� 
Count
�� !
==
��" $
$num
��% &
)
��& '
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q7
)Cryptography_Xml_ReferenceElementRequired
��Q z
)
��z {
;
��{ |
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
_references
��  +
.
��+ ,
Count
��, 1
;
��1 2
++
��3 5
i
��5 6
)
��6 7
{
�� 
	Reference
�� 
	reference
�� #
=
��$ %
(
��& '
	Reference
��' 0
)
��0 1
_references
��1 <
[
��< =
i
��= >
]
��> ?
;
��? @
signedInfoElement
�� !
.
��! "
AppendChild
��" -
(
��- .
	reference
��. 7
.
��7 8
GetXml
��8 >
(
��> ?
document
��? G
)
��G H
)
��H I
;
��I J
}
�� 
return
�� 
signedInfoElement
�� $
;
��$ %
}
�� 	
public
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� &
value
��' ,
)
��, -
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?

XmlElement
�� 
signedInfoElement
�� (
=
��) *
value
��+ 0
;
��0 1
if
�� 
(
�� 
!
�� 
signedInfoElement
�� "
.
��" #
	LocalName
��# ,
.
��, -
Equals
��- 3
(
��3 4
$str
��4 @
)
��@ A
)
��A B
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r ~
)
��~ 
;�� �!
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
value
��> C
.
��C D
OwnerDocument
��D Q
.
��Q R
	NameTable
��R [
)
��[ \
;
��\ ]
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� !
,
��! "
	SignedXml
��# ,
.
��, -!
XmlDsigNamespaceUrl
��- @
)
��@ A
;
��A B
int
��  
expectedChildNodes
�� "
=
��# $
$num
��% &
;
��& '
_id
�� 
=
�� 
Utils
�� 
.
�� 
GetAttribute
�� $
(
��$ %
signedInfoElement
��% 6
,
��6 7
$str
��8 <
,
��< =
	SignedXml
��> G
.
��G H!
XmlDsigNamespaceUrl
��H [
)
��[ \
;
��\ ]
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� 
VerifyAttributes
�� '
(
��' (
signedInfoElement
��( 9
,
��9 :
$str
��; ?
)
��? @
)
��@ A
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r ~
)
��~ 
;�� �
XmlNodeList
�� )
canonicalizationMethodNodes
�� 3
=
��4 5
signedInfoElement
��6 G
.
��G H
SelectNodes
��H S
(
��S T
$str
��T o
,
��o p
nsm
��q t
)
��t u
;
��u v
if
�� 
(
�� )
canonicalizationMethodNodes
�� +
==
��, .
null
��/ 3
||
��4 6)
canonicalizationMethodNodes
��7 R
.
��R S
Count
��S X
==
��Y [
$num
��\ ]
||
��^ `)
canonicalizationMethodNodes
��a |
.
��| }
Count��} �
>��� �
$num��� �
)��� �
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
�� +
canonicalizationMethodElement
�� 4
=
��5 6)
canonicalizationMethodNodes
��7 R
.
��R S
Item
��S W
(
��W X
$num
��X Y
)
��Y Z
as
��[ ]

XmlElement
��^ h
;
��h i 
expectedChildNodes
�� 
+=
�� !)
canonicalizationMethodNodes
��" =
.
��= >
Count
��> C
;
��C D%
_canonicalizationMethod
�� #
=
��$ %
Utils
��& +
.
��+ ,
GetAttribute
��, 8
(
��8 9+
canonicalizationMethodElement
��9 V
,
��V W
$str
��X c
,
��c d
	SignedXml
��e n
.
��n o"
XmlDsigNamespaceUrl��o �
)��� �
;��� �
if
�� 
(
�� %
_canonicalizationMethod
�� '
==
��( *
null
��+ /
||
��0 2
!
��3 4
Utils
��4 9
.
��9 :
VerifyAttributes
��: J
(
��J K+
canonicalizationMethodElement
��K h
,
��h i
$str
��j u
)
��u v
)
��v w
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �.
 _canonicalizationMethodTransform
�� ,
=
��- .
null
��/ 3
;
��3 4
if
�� 
(
�� +
canonicalizationMethodElement
�� -
.
��- .

ChildNodes
��. 8
.
��8 9
Count
��9 >
>
��? @
$num
��A B
)
��B C*
CanonicalizationMethodObject
�� ,
.
��, -
LoadInnerXml
��- 9
(
��9 :+
canonicalizationMethodElement
��: W
.
��W X

ChildNodes
��X b
)
��b c
;
��c d
XmlNodeList
�� "
signatureMethodNodes
�� ,
=
��- .
signedInfoElement
��/ @
.
��@ A
SelectNodes
��A L
(
��L M
$str
��M a
,
��a b
nsm
��c f
)
��f g
;
��g h
if
�� 
(
�� "
signatureMethodNodes
�� $
==
��% '
null
��( ,
||
��- /"
signatureMethodNodes
��0 D
.
��D E
Count
��E J
==
��K M
$num
��N O
||
��P R"
signatureMethodNodes
��S g
.
��g h
Count
��h m
>
��n o
$num
��p q
)
��q r
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
�� $
signatureMethodElement
�� -
=
��. /"
signatureMethodNodes
��0 D
.
��D E
Item
��E I
(
��I J
$num
��J K
)
��K L
as
��M O

XmlElement
��P Z
;
��Z [ 
expectedChildNodes
�� 
+=
�� !"
signatureMethodNodes
��" 6
.
��6 7
Count
��7 <
;
��< =
_signatureMethod
�� 
=
�� 
Utils
�� $
.
��$ %
GetAttribute
��% 1
(
��1 2$
signatureMethodElement
��2 H
,
��H I
$str
��J U
,
��U V
	SignedXml
��W `
.
��` a!
XmlDsigNamespaceUrl
��a t
)
��t u
;
��u v
if
�� 
(
�� 
_signatureMethod
��  
==
��! #
null
��$ (
||
��) +
!
��, -
Utils
��- 2
.
��2 3
VerifyAttributes
��3 C
(
��C D$
signatureMethodElement
��D Z
,
��Z [
$str
��\ g
)
��g h
)
��h i
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str��r �
)��� �
;��� �

XmlElement
�� $
signatureLengthElement
�� -
=
��. /$
signatureMethodElement
��0 F
.
��F G
SelectSingleNode
��G W
(
��W X
$str
��X m
,
��m n
nsm
��o r
)
��r s
as
��t v

XmlElement��w �
;��� �
if
�� 
(
�� $
signatureLengthElement
�� &
!=
��' )
null
��* .
)
��. /
_signatureLength
��  
=
��! "$
signatureLengthElement
��# 9
.
��9 :
InnerXml
��: B
;
��B C
_references
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
��  
XmlNodeList
�� 
referenceNodes
�� &
=
��' (
signedInfoElement
��) :
.
��: ;
SelectNodes
��; F
(
��F G
$str
��G U
,
��U V
nsm
��W Z
)
��Z [
;
��[ \
if
�� 
(
�� 
referenceNodes
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
if
�� 
(
�� 
referenceNodes
�� "
.
��" #
Count
��# (
>
��) *
Utils
��+ 0
.
��0 1(
MaxReferencesPerSignedInfo
��1 K
)
��K L
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str��v �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
referenceNodes
��) 7
)
��7 8
{
�� 

XmlElement
�� 
referenceElement
�� /
=
��0 1
node
��2 6
as
��7 9

XmlElement
��: D
;
��D E
	Reference
�� 
	reference
�� '
=
��( )
new
��* -
	Reference
��. 7
(
��7 8
)
��8 9
;
��9 :
AddReference
��  
(
��  !
	reference
��! *
)
��* +
;
��+ ,
	reference
�� 
.
�� 
LoadXml
�� %
(
��% &
referenceElement
��& 6
)
��6 7
;
��7 8
}
��  
expectedChildNodes
�� "
+=
��# %
referenceNodes
��& 4
.
��4 5
Count
��5 :
;
��: ;
if
�� 
(
�� 
signedInfoElement
�� %
.
��% &
SelectNodes
��& 1
(
��1 2
$str
��2 5
)
��5 6
.
��6 7
Count
��7 <
!=
��= ? 
expectedChildNodes
��@ R
)
��R S
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U-
Cryptography_Xml_InvalidElement
��U t
,
��t u
$str��v �
)��� �
;��� �
}
�� 
}
�� 

_cachedXml
�� 
=
�� 
signedInfoElement
�� *
;
��* +
}
�� 	
public
�� 
void
�� 
AddReference
��  
(
��  !
	Reference
��! *
	reference
��+ 4
)
��4 5
{
�� 	
if
�� 
(
�� 
	reference
�� 
==
�� 
null
�� !
)
��! "
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
	reference
��7 @
)
��@ A
)
��A B
;
��B C
	reference
�� 
.
�� 
	SignedXml
�� 
=
��  !
	SignedXml
��" +
;
��+ ,
_references
�� 
.
�� 
Add
�� 
(
�� 
	reference
�� %
)
��% &
;
��& '
}
�� 	
}
�� 
}�� ��
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
$str	VVB �
;
VV� �
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
$str	hh; �
;
hh� �
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
$str	jj? �
;
jj� �
publicll 
constll 
stringll (
XmlDsigGost3410_2012_512_Urlll 8
=ll9 :
$str	ll; �
;
ll� �
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
$str	nn? �
;
nn� �
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
�� 
	SignedXml
�� 
(
�� 

XmlElement
�� #
elem
��$ (
)
��( )
{
�� 	
if
�� 
(
�� 
elem
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
elem
��7 ;
)
��; <
)
��< =
;
��= >

Initialize
�� 
(
�� 
elem
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
void
�� 

Initialize
�� 
(
��  

XmlElement
��  *
element
��+ 2
)
��2 3
{
�� 	!
_containingDocument
�� 
=
��  !
(
��" #
element
��# *
==
��+ -
null
��. 2
?
��3 4
null
��5 9
:
��: ;
element
��< C
.
��C D
OwnerDocument
��D Q
)
��Q R
;
��R S
_context
�� 
=
�� 
element
�� 
;
�� 
m_signature
�� 
=
�� 
new
�� 
	Signature
�� '
(
��' (
)
��( )
;
��) *
m_signature
�� 
.
�� 
	SignedXml
�� !
=
��" #
this
��$ (
;
��( )
m_signature
�� 
.
�� 

SignedInfo
�� "
=
��# $
new
��% (

SignedInfo
��) 3
(
��3 4
)
��4 5
;
��5 6
_signingKey
�� 
=
�� 
null
�� 
;
�� *
_safeCanonicalizationMethods
�� (
=
��) *
new
��+ .

Collection
��/ 9
<
��9 :
string
��: @
>
��@ A
(
��A B*
KnownCanonicalizationMethods
��B ^
)
��^ _
;
��_ `
}
�� 	
public
�� 
string
�� 
SigningKeyName
�� $
{
�� 	
get
�� 
{
�� 
return
�� !
m_strSigningKeyName
�� ,
;
��, -
}
��. /
set
�� 
{
�� !
m_strSigningKeyName
�� %
=
��& '
value
��( -
;
��- .
}
��/ 0
}
�� 	
public
�� 
XmlResolver
�� 
Resolver
�� #
{
�� 	
set
�� 
{
�� 
_xmlResolver
�� 
=
�� 
value
�� $
;
��$ %
_bResolverSet
�� 
=
�� 
true
��  $
;
��$ %
}
�� 
}
�� 	
internal
�� 
bool
�� 
ResolverSet
�� !
{
�� 	
get
�� 
{
�� 
return
�� 
_bResolverSet
�� &
;
��& '
}
��( )
}
�� 	
public
�� 
Func
�� 
<
�� 
	SignedXml
�� 
,
�� 
bool
�� #
>
��# $&
SignatureFormatValidator
��% =
{
�� 	
get
�� 
{
�� 
return
�� '
_signatureFormatValidator
�� 2
;
��2 3
}
��4 5
set
�� 
{
�� '
_signatureFormatValidator
�� +
=
��, -
value
��. 3
;
��3 4
}
��5 6
}
�� 	
public
�� 

Collection
�� 
<
�� 
string
��  
>
��  !)
SafeCanonicalizationMethods
��" =
{
�� 	
get
�� 
{
�� 
return
�� *
_safeCanonicalizationMethods
�� 5
;
��5 6
}
��7 8
}
�� 	
public
�� $
AsymmetricKeyParameter
�� %

SigningKey
��& 0
{
�� 	
get
�� 
{
�� 
return
�� 
_signingKey
�� $
;
��$ %
}
��& '
set
�� 
{
�� 
_signingKey
�� 
=
�� 
value
��  %
;
��% &
}
��' (
}
�� 	
public
�� 
EncryptedXml
�� 
EncryptedXml
�� (
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_exml
�� 
==
�� 
null
�� !
)
��! "
_exml
�� 
=
�� 
new
�� 
EncryptedXml
��  ,
(
��, -!
_containingDocument
��- @
)
��@ A
;
��A B
return
�� 
_exml
�� 
;
�� 
}
�� 
set
�� 
{
�� 
_exml
�� 
=
�� 
value
�� 
;
��  
}
��! "
}
�� 	
public
�� 
	Signature
�� 
	Signature
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
;
��$ %
}
��& '
}
�� 	
public
�� 

SignedInfo
�� 

SignedInfo
�� $
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
.
��$ %

SignedInfo
��% /
;
��/ 0
}
��1 2
}
�� 	
public
�� 
string
�� 
SignatureMethod
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
.
��$ %

SignedInfo
��% /
.
��/ 0
SignatureMethod
��0 ?
;
��? @
}
��A B
}
�� 	
public
�� 
string
�� 
SignatureLength
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
.
��$ %

SignedInfo
��% /
.
��/ 0
SignatureLength
��0 ?
;
��? @
}
��A B
}
�� 	
public
�� 
byte
�� 
[
�� 
]
�� 
SignatureValue
�� $
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
.
��$ %
SignatureValue
��% 3
;
��3 4
}
��5 6
}
�� 	
public
�� 
KeyInfo
�� 
KeyInfo
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
m_signature
�� $
.
��$ %
KeyInfo
��% ,
;
��, -
}
��. /
set
�� 
{
�� 
m_signature
�� 
.
�� 
KeyInfo
�� %
=
��& '
value
��( -
;
��- .
}
��/ 0
}
�� 	
public
�� 

XmlElement
�� 
GetXml
��  
(
��  !
)
��! "
{
�� 	
if
�� 
(
�� !
_containingDocument
�� #
!=
��$ &
null
��' +
)
��+ ,
return
�� 
m_signature
�� "
.
��" #
GetXml
��# )
(
��) *!
_containingDocument
��* =
)
��= >
;
��> ?
else
�� 
return
�� 
m_signature
�� "
.
��" #
GetXml
��# )
(
��) *
)
��* +
;
��+ ,
}
�� 	
public
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� &
value
��' ,
)
��, -
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?
m_signature
�� 
.
�� 
LoadXml
�� 
(
��  
value
��  %
)
��% &
;
��& '
if
�� 
(
�� 
_context
�� 
==
�� 
null
��  
)
��  !
{
�� 
_context
�� 
=
�� 
value
��  
;
��  !
}
�� 
_bCacheValid
�� 
=
�� 
false
��  
;
��  !
}
�� 	
public
�� 
void
�� 
AddReference
��  
(
��  !
	Reference
��! *
	reference
��+ 4
)
��4 5
{
�� 	
m_signature
�� 
.
�� 

SignedInfo
�� "
.
��" #
AddReference
��# /
(
��/ 0
	reference
��0 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
void
�� 
	AddObject
�� 
(
�� 

DataObject
�� (

dataObject
��) 3
)
��3 4
{
�� 	
m_signature
�� 
.
�� 
	AddObject
�� !
(
��! "

dataObject
��" ,
)
��, -
;
��- .
}
�� 	
public
�� 
bool
�� 
CheckSignature
�� "
(
��" #
)
��# $
{
�� 	$
AsymmetricKeyParameter
�� "

signingKey
��# -
;
��- .
return
�� (
CheckSignatureReturningKey
�� -
(
��- .
out
��. 1

signingKey
��2 <
)
��< =
;
��= >
}
�� 	
public
�� 
bool
�� (
CheckSignatureReturningKey
�� .
(
��. /
out
��/ 2$
AsymmetricKeyParameter
��3 I

signingKey
��J T
)
��T U
{
�� 	
SignedXmlDebugLog
�� 
.
�� +
LogBeginSignatureVerification
�� ;
(
��; <
this
��< @
,
��@ A
_context
��B J
)
��J K
;
��K L
int
�� 
count
�� 
=
�� 
$num
�� 
;
�� 

signingKey
�� 
=
�� 
null
�� 
;
�� 
bool
�� 
bRet
�� 
=
�� 
false
�� 
;
�� $
AsymmetricKeyParameter
�� "
key
��# &
=
��' (
null
��) -
;
��- .
if
�� 
(
�� 
!
�� "
CheckSignatureFormat
�� %
(
��% &
)
��& '
)
��' (
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
do
�� 
{
�� 
key
�� 
=
�� 
GetPublicKey
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
key
�� 
!=
�� 
null
�� 
)
��  
{
�� 
if
�� 
(
�� 
count
�� 
++
�� 
>
��  !
$num
��" #
)
��# $
_bCacheValid
�� $
=
��% &
false
��' ,
;
��, -
bRet
�� 
=
�� 
CheckSignature
�� )
(
��) *
key
��* -
)
��- .
;
��. /
SignedXmlDebugLog
�� %
.
��% &#
LogVerificationResult
��& ;
(
��; <
this
��< @
,
��@ A
key
��B E
,
��E F
bRet
��G K
)
��K L
;
��L M
}
�� 
}
�� 
while
�� 
(
�� 
key
�� 
!=
�� 
null
��  
&&
��! #
bRet
��$ (
==
��) +
false
��, 1
)
��1 2
;
��2 3

signingKey
�� 
=
�� 
key
�� 
;
�� 
return
�� 
bRet
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
CheckSignature
�� "
(
��" #$
AsymmetricKeyParameter
��# 9
key
��: =
)
��= >
{
�� 	
if
�� 
(
�� 
!
�� "
CheckSignatureFormat
�� %
(
��% &
)
��& '
)
��' (
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
CheckSignedInfo
��  
(
��  !
key
��! $
)
��$ %
)
��% &
{
�� 
SignedXmlDebugLog
�� !
.
��! "$
LogVerificationFailure
��" 8
(
��8 9
this
��9 =
,
��= >
SR
��? A
.
��A B/
!Log_VerificationFailed_SignedInfo
��B c
)
��c d
;
��d e
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� %
CheckDigestedReferences
�� (
(
��( )
)
��) *
)
��* +
{
�� 
SignedXmlDebugLog
�� !
.
��! "$
LogVerificationFailure
��" 8
(
��8 9
this
��9 =
,
��= >
SR
��? A
.
��A B/
!Log_VerificationFailed_References
��B c
)
��c d
;
��d e
return
�� 
false
�� 
;
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� #
LogVerificationResult
�� 3
(
��3 4
this
��4 8
,
��8 9
key
��: =
,
��= >
true
��? C
)
��C D
;
��D E
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
CheckSignature
�� "
(
��" #
IMac
��# '
macAlg
��( .
)
��. /
{
�� 	
if
�� 
(
�� 
!
�� "
CheckSignatureFormat
�� %
(
��% &
)
��& '
)
��' (
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
CheckSignedInfo
��  
(
��  !
macAlg
��! '
)
��' (
)
��( )
{
�� 
SignedXmlDebugLog
�� !
.
��! "$
LogVerificationFailure
��" 8
(
��8 9
this
��9 =
,
��= >
SR
��? A
.
��A B/
!Log_VerificationFailed_SignedInfo
��B c
)
��c d
;
��d e
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� %
CheckDigestedReferences
�� (
(
��( )
)
��) *
)
��* +
{
�� 
SignedXmlDebugLog
�� !
.
��! "$
LogVerificationFailure
��" 8
(
��8 9
this
��9 =
,
��= >
SR
��? A
.
��A B/
!Log_VerificationFailed_References
��B c
)
��c d
;
��d e
return
�� 
false
�� 
;
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� #
LogVerificationResult
�� 3
(
��3 4
this
��4 8
,
��8 9
macAlg
��: @
,
��@ A
true
��B F
)
��F G
;
��G H
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
CheckSignature
�� "
(
��" #
X509Certificate
��# 2
certificate
��3 >
,
��> ?
bool
��@ D!
verifySignatureOnly
��E X
)
��X Y
{
�� 	
if
�� 
(
�� 
!
�� !
verifySignatureOnly
�� $
)
��$ %
{
�� 
var
�� 
exts
�� 
=
�� 
certificate
�� &
.
��& '"
CertificateStructure
��' ;
.
��; <
TbsCertificate
��< J
.
��J K

Extensions
��K U
;
��U V
foreach
�� 
(
�� !
DerObjectIdentifier
�� ,
	extension
��- 6
in
��7 9
exts
��: >
.
��> ?
ExtensionOids
��? L
)
��L M
{
�� 
if
�� 
(
�� 
	extension
�� !
.
��! "
Equals
��" (
(
��( )
X509Extensions
��) 7
.
��7 8
KeyUsage
��8 @
)
��@ A
)
��A B
{
�� 
var
�� 
keyUsage
�� $
=
��% &
certificate
��' 2
.
��2 3
GetKeyUsage
��3 >
(
��> ?
)
��? @
;
��@ A
bool
�� 
validKeyUsage
�� *
=
��+ ,
(
��- .
keyUsage
��. 6
[
��6 7
$num
��7 8
]
��O P
||
��Q S
keyUsage
��T \
[
��\ ]
$num
��] ^
]
��s t
)
��t u
;
��u v
if
�� 
(
�� 
!
�� 
validKeyUsage
�� *
)
��* +
{
�� 
SignedXmlDebugLog
�� -
.
��- .$
LogVerificationFailure
��. D
(
��D E
this
��E I
,
��I J
SR
��K M
.
��M N1
#Log_VerificationFailed_X509KeyUsage
��N q
)
��q r
;
��r s
return
�� "
false
��# (
;
��( )
}
�� 
break
�� 
;
�� 
}
�� 
}
�� 
}
�� $
AsymmetricKeyParameter
�� "
	publicKey
��# ,
=
��- .
certificate
��/ :
.
��: ;
GetPublicKey
��; G
(
��G H
)
��H I
;
��I J
if
�� 
(
�� 
!
�� 
CheckSignature
�� 
(
��  
	publicKey
��  )
)
��) *
)
��* +
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� #
LogVerificationResult
�� 3
(
��3 4
this
��4 8
,
��8 9
certificate
��: E
,
��E F
true
��G K
)
��K L
;
��L M
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
ComputeSignature
�� $
(
��$ %
)
��% &
{
�� 	
SignedXmlDebugLog
�� 
.
�� *
LogBeginSignatureComputation
�� :
(
��: ;
this
��; ?
,
��? @
_context
��A I
)
��I J
;
��J K%
BuildDigestedReferences
�� #
(
��# $
)
��$ %
;
��% &$
AsymmetricKeyParameter
�� "
key
��# &
=
��' (

SigningKey
��) 3
;
��3 4
if
�� 
(
�� 
key
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q,
Cryptography_Xml_LoadKeyFailed
��Q o
)
��o p
;
��p q
if
�� 
(
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� *
==
��+ -
null
��. 2
)
��2 3
{
�� 
if
�� 
(
�� 
key
�� 
is
�� 
DsaKeyParameters
�� +
)
��+ ,
{
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
XmlDsigDSAUrl
��1 >
;
��> ?
}
�� 
else
�� 
if
�� 
(
�� 
key
�� 
is
�� 
RsaKeyParameters
��  0
)
��0 1
{
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0!
XmlDsigRSASHA256Url
��1 D
;
��D E
}
�� 
else
�� 
{
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_CreatedKeyFailed
��U v
)
��v w
;
��w x
}
�� 
}
�� 
ISigner
�� "
signatureDescription
�� (
=
��) *
CryptoHelpers
��+ 8
.
��8 9
CreateFromName
��9 G
<
��G H
ISigner
��H O
>
��O P
(
��P Q

SignedInfo
��Q [
.
��[ \
SignatureMethod
��\ k
)
��k l
;
��l m
if
�� 
(
�� "
signatureDescription
�� $
==
��% '
null
��( ,
)
��, -
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q>
/Cryptography_Xml_SignatureDescriptionNotCreated��Q �
)��� �
;��� �"
signatureDescription
��  
.
��  !
Init
��! %
(
��% &
true
��& *
,
��* +
key
��, /
)
��/ 0
;
��0 1
GetC14NDigest
�� 
(
�� 
new
�� 
SignerHashWrapper
�� /
(
��/ 0"
signatureDescription
��0 D
)
��D E
)
��E F
;
��F G
SignedXmlDebugLog
�� 
.
�� 

LogSigning
�� (
(
��( )
this
��) -
,
��- .
key
��/ 2
,
��2 3"
signatureDescription
��4 H
)
��H I
;
��I J
m_signature
�� 
.
�� 
SignatureValue
�� &
=
��' ("
signatureDescription
��) =
.
��= >
GenerateSignature
��> O
(
��O P
)
��P Q
;
��Q R
}
�� 	
public
�� 
void
�� 
ComputeSignature
�� $
(
��$ %
IMac
��% )
macAlg
��* 0
)
��0 1
{
�� 	
if
�� 
(
�� 
macAlg
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
macAlg
��7 =
)
��= >
)
��> ?
;
��? @
if
�� 
(
�� 
!
�� 
(
�� 
macAlg
�� 
is
�� 
HMac
��  
)
��  !
)
��! "
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q9
+Cryptography_Xml_SignatureMethodKeyMismatch
��Q |
)
��| }
;
��} ~
int
�� 
signatureLength
�� 
;
��  
if
�� 
(
�� 
m_signature
�� 
.
�� 

SignedInfo
�� &
.
��& '
SignatureLength
��' 6
==
��7 9
null
��: >
)
��> ?
signatureLength
�� 
=
��  !
macAlg
��" (
.
��( )

GetMacSize
��) 3
(
��3 4
)
��4 5
*
��6 7
$num
��8 9
;
��9 :
else
�� 
signatureLength
�� 
=
��  !
Convert
��" )
.
��) *
ToInt32
��* 1
(
��1 2
m_signature
��2 =
.
��= >

SignedInfo
��> H
.
��H I
SignatureLength
��I X
,
��X Y
null
��Z ^
)
��^ _
;
��_ `
if
�� 
(
�� 
signatureLength
�� 
<
��  !
$num
��" #
||
��$ &
signatureLength
��' 6
>
��7 8
macAlg
��9 ?
.
��? @

GetMacSize
��@ J
(
��J K
)
��K L
*
��M N
$num
��O P
)
��P Q
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q5
'Cryptography_Xml_InvalidSignatureLength
��Q x
)
��x y
;
��y z
if
�� 
(
�� 
signatureLength
�� 
%
��  !
$num
��" #
!=
��$ &
$num
��' (
)
��( )
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q6
(Cryptography_Xml_InvalidSignatureLength2
��Q y
)
��y z
;
��z {%
BuildDigestedReferences
�� #
(
��# $
)
��$ %
;
��% &
switch
�� 
(
�� 
macAlg
�� 
.
�� 
AlgorithmName
�� (
.
��( )
	Substring
��) 2
(
��2 3
$num
��3 4
,
��4 5
macAlg
��6 <
.
��< =
AlgorithmName
��= J
.
��J K
IndexOf
��K R
(
��R S
$char
��S V
)
��V W
)
��W X
.
��X Y
ToUpperInvariant
��Y i
(
��i j
)
��j k
)
��k l
{
��m n
case
�� 
$str
�� 
:
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ; 
XmlDsigHMACSHA1Url
��; M
;
��M N
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ;&
XmlDsigMoreHMACSHA256Url
��; S
;
��S T
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ;&
XmlDsigMoreHMACSHA384Url
��; S
;
��S T
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ;&
XmlDsigMoreHMACSHA512Url
��; S
;
��S T
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ;#
XmlDsigMoreHMACMD5Url
��; P
;
��P Q
break
�� 
;
�� 
case
�� 
$str
��  
:
��  !

SignedInfo
�� 
.
�� 
SignatureMethod
�� .
=
��/ 0
	SignedXml
��1 :
.
��: ;)
XmlDsigMoreHMACRIPEMD160Url
��; V
;
��V W
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U:
+Cryptography_Xml_SignatureMethodKeyMismatch��U �
)��� �
;��� �
}
�� 
GetC14NDigest
�� 
(
�� 
new
�� 
MacHashWrapper
�� ,
(
��, -
macAlg
��- 3
)
��3 4
)
��4 5
;
��5 6
byte
�� 
[
�� 
]
�� 
	hashValue
�� 
=
�� 
new
�� "
byte
��# '
[
��' (
macAlg
��( .
.
��. /

GetMacSize
��/ 9
(
��9 :
)
��: ;
]
��; <
;
��< =
macAlg
�� 
.
�� 
DoFinal
�� 
(
�� 
	hashValue
�� $
,
��$ %
$num
��& '
)
��' (
;
��( )
SignedXmlDebugLog
�� 
.
�� 

LogSigning
�� (
(
��( )
this
��) -
,
��- .
macAlg
��/ 5
)
��5 6
;
��6 7
m_signature
�� 
.
�� 
SignatureValue
�� &
=
��' (
new
��) ,
byte
��- 1
[
��1 2
signatureLength
��2 A
/
��B C
$num
��D E
]
��E F
;
��F G
Buffer
�� 
.
�� 
	BlockCopy
�� 
(
�� 
	hashValue
�� &
,
��& '
$num
��( )
,
��) *
m_signature
��+ 6
.
��6 7
SignatureValue
��7 E
,
��E F
$num
��G H
,
��H I
signatureLength
��J Y
/
��Z [
$num
��\ ]
)
��] ^
;
��^ _
}
�� 	
	protected
�� 
virtual
�� $
AsymmetricKeyParameter
�� 0
GetPublicKey
��1 =
(
��= >
)
��> ?
{
�� 	
if
�� 
(
�� 
KeyInfo
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q.
 Cryptography_Xml_KeyInfoRequired
��Q q
)
��q r
;
��r s
if
�� 
(
�� 
	_x509Enum
�� 
!=
�� 
null
�� !
)
��! "
{
�� $
AsymmetricKeyParameter
�� &
key
��' *
=
��+ ,)
GetNextCertificatePublicKey
��- H
(
��H I
)
��I J
;
��J K
if
�� 
(
�� 
key
�� 
!=
�� 
null
�� 
)
��  
return
�� 
key
�� 
;
�� 
}
�� 
if
�� 
(
�� 
_keyInfoEnum
�� 
==
�� 
null
��  $
)
��$ %
_keyInfoEnum
�� 
=
�� 
KeyInfo
�� &
.
��& '
GetEnumerator
��' 4
(
��4 5
)
��5 6
;
��6 7
while
�� 
(
�� 
_keyInfoEnum
�� 
.
��  
MoveNext
��  (
(
��( )
)
��) *
)
��* +
{
�� 
RSAKeyValue
�� 
rsaKeyValue
�� '
=
��( )
_keyInfoEnum
��* 6
.
��6 7
Current
��7 >
as
��? A
RSAKeyValue
��B M
;
��M N
if
�� 
(
�� 
rsaKeyValue
�� 
!=
��  "
null
��# '
)
��' (
return
�� 
rsaKeyValue
�� &
.
��& '
Key
��' *
;
��* +
DSAKeyValue
�� 
dsaKeyValue
�� '
=
��( )
_keyInfoEnum
��* 6
.
��6 7
Current
��7 >
as
��? A
DSAKeyValue
��B M
;
��M N
if
�� 
(
�� 
dsaKeyValue
�� 
!=
��  "
null
��# '
)
��' (
return
�� 
dsaKeyValue
�� &
.
��& '
Key
��' *
;
��* +
KeyInfoX509Data
�� 
x509Data
��  (
=
��) *
_keyInfoEnum
��+ 7
.
��7 8
Current
��8 ?
as
��@ B
KeyInfoX509Data
��C R
;
��R S
if
�� 
(
�� 
x509Data
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
_x509Collection
�� #
=
��$ %
Utils
��& +
.
��+ ,
BuildBagOfCerts
��, ;
(
��; <
x509Data
��< D
,
��D E
CertUsageType
��F S
.
��S T
Verification
��T `
)
��` a
;
��a b
if
�� 
(
�� 
_x509Collection
�� '
.
��' (
Count
��( -
>
��. /
$num
��0 1
)
��1 2
{
�� 
	_x509Enum
�� !
=
��" #
_x509Collection
��$ 3
.
��3 4
GetEnumerator
��4 A
(
��A B
)
��B C
;
��C D$
AsymmetricKeyParameter
�� .
key
��/ 2
=
��3 4)
GetNextCertificatePublicKey
��5 P
(
��P Q
)
��Q R
;
��R S
if
�� 
(
�� 
key
�� 
!=
��  "
null
��# '
)
��' (
return
�� "
key
��# &
;
��& '
}
�� 
}
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
IList
�� 
<
�� 
X509Certificate
�� %
>
��% &
BuildBagOfCerts
��' 6
(
��6 7
)
��7 8
{
�� 	
var
�� 

collection
�� 
=
�� 
new
��  
List
��! %
<
��% &
X509Certificate
��& 5
>
��5 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
KeyInfo
�� 
!=
�� 
null
�� 
)
��  
{
�� 
foreach
�� 
(
�� 
KeyInfoClause
�� &
clause
��' -
in
��. 0
KeyInfo
��1 8
)
��8 9
{
�� 
KeyInfoX509Data
�� #
x509Data
��$ ,
=
��- .
clause
��/ 5
as
��6 8
KeyInfoX509Data
��9 H
;
��H I
if
�� 
(
�� 
x509Data
��  
!=
��! #
null
��$ (
)
��( )

collection
�� "
.
��" #
AddRange
��# +
(
��+ ,
Utils
��, 1
.
��1 2
BuildBagOfCerts
��2 A
(
��A B
x509Data
��B J
,
��J K
CertUsageType
��L Y
.
��Y Z
Verification
��Z f
)
��f g
)
��g h
;
��h i
}
�� 
}
�� 
return
�� 

collection
�� 
;
�� 
}
�� 	
private
�� $
AsymmetricKeyParameter
�� &)
GetNextCertificatePublicKey
��' B
(
��B C
)
��C D
{
�� 	
while
�� 
(
�� 
	_x509Enum
�� 
.
�� 
MoveNext
�� %
(
��% &
)
��& '
)
��' (
{
�� 
X509Certificate
�� 
certificate
��  +
=
��, -
(
��. /
X509Certificate
��/ >
)
��> ?
	_x509Enum
��? H
.
��H I
Current
��I P
;
��P Q
if
�� 
(
�� 
certificate
�� 
!=
��  "
null
��# '
)
��' (
return
�� 
certificate
�� &
.
��& '
GetPublicKey
��' 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 

XmlElement
�� !
GetIdElement
��" .
(
��. /
XmlDocument
��/ :
document
��; C
,
��C D
string
��E K
idValue
��L S
)
��S T
{
�� 	
return
�� !
DefaultGetIdElement
�� &
(
��& '
document
��' /
,
��/ 0
idValue
��1 8
)
��8 9
;
��9 :
}
�� 	
internal
�� 
static
�� 

XmlElement
�� "!
DefaultGetIdElement
��# 6
(
��6 7
XmlDocument
��7 B
document
��C K
,
��K L
string
��M S
idValue
��T [
)
��[ \
{
�� 	
if
�� 
(
�� 
document
�� 
==
�� 
null
��  
)
��  !
return
�� 
null
�� 
;
�� 
try
�� 
{
�� 

XmlConvert
�� 
.
�� 
VerifyNCName
�� '
(
��' (
idValue
��( /
)
��/ 0
;
��0 1
}
�� 
catch
�� 
(
�� 
XmlException
�� 
)
��  
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 

XmlElement
�� 
elem
�� 
=
�� 
document
�� &
.
��& '
GetElementById
��' 5
(
��5 6
idValue
��6 =
)
��= >
;
��> ?
if
�� 
(
�� 
elem
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
XmlDocument
�� 
docClone
�� $
=
��% &
(
��' (
XmlDocument
��( 3
)
��3 4
document
��4 <
.
��< =
	CloneNode
��= F
(
��F G
true
��G K
)
��K L
;
��L M

XmlElement
�� 
	cloneElem
�� $
=
��% &
docClone
��' /
.
��/ 0
GetElementById
��0 >
(
��> ?
idValue
��? F
)
��F G
;
��G H
System
�� 
.
�� 
Diagnostics
�� "
.
��" #
Debug
��# (
.
��( )
Assert
��) /
(
��/ 0
	cloneElem
��0 9
!=
��: <
null
��= A
)
��A B
;
��B C
if
�� 
(
�� 
	cloneElem
�� 
!=
��  
null
��! %
)
��% &
{
�� 
	cloneElem
�� 
.
�� 

Attributes
�� (
.
��( )
	RemoveAll
��) 2
(
��2 3
)
��3 4
;
��4 5

XmlElement
�� 

cloneElem2
�� )
=
��* +
docClone
��, 4
.
��4 5
GetElementById
��5 C
(
��C D
idValue
��D K
)
��K L
;
��L M
if
�� 
(
�� 

cloneElem2
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
�� 
.
�� /
!Cryptography_Xml_InvalidReference
�� @
)
��@ A
;
��A B
}
�� 
}
�� 
return
�� 
elem
�� 
;
�� 
}
�� 
elem
�� 
=
�� &
GetSingleReferenceTarget
�� +
(
��+ ,
document
��, 4
,
��4 5
$str
��6 :
,
��: ;
idValue
��< C
)
��C D
;
��D E
if
�� 
(
�� 
elem
�� 
!=
�� 
null
�� 
)
�� 
return
�� 
elem
�� 
;
�� 
elem
�� 
=
�� &
GetSingleReferenceTarget
�� +
(
��+ ,
document
��, 4
,
��4 5
$str
��6 :
,
��: ;
idValue
��< C
)
��C D
;
��D E
if
�� 
(
�� 
elem
�� 
!=
�� 
null
�� 
)
�� 
return
�� 
elem
�� 
;
�� 
elem
�� 
=
�� &
GetSingleReferenceTarget
�� +
(
��+ ,
document
��, 4
,
��4 5
$str
��6 :
,
��: ;
idValue
��< C
)
��C D
;
��D E
return
�� 
elem
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
_bCacheValid
�� !
=
��" #
false
��$ )
;
��) *
private
�� 
static
�� 
bool
�� -
DefaultSignatureFormatValidator
�� ;
(
��; <
	SignedXml
��< E
	signedXml
��F O
)
��O P
{
�� 	
if
�� 
(
�� 
	signedXml
�� 
.
�� +
DoesSignatureUseTruncatedHmac
�� 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
	signedXml
�� 
.
�� 8
*DoesSignatureUseSafeCanonicalizationMethod
�� E
(
��E F
)
��F G
)
��G H
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
bool
�� +
DoesSignatureUseTruncatedHmac
�� 2
(
��2 3
)
��3 4
{
�� 	
if
�� 
(
�� 

SignedInfo
�� 
.
�� 
SignatureLength
�� *
==
��+ -
null
��. 2
)
��2 3
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
IMac
�� 
hmac
�� 
=
�� 
CryptoHelpers
�� %
.
��% &
CreateFromName
��& 4
<
��4 5
IMac
��5 9
>
��9 :
(
��: ;
SignatureMethod
��; J
)
��J K
;
��K L
if
�� 
(
�� 
hmac
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
int
�� !
actualSignatureSize
�� #
=
��$ %
$num
��& '
;
��' (
if
�� 
(
�� 
!
�� 
int
�� 
.
�� 
TryParse
�� 
(
�� 

SignedInfo
�� (
.
��( )
SignatureLength
��) 8
,
��8 9
out
��: =!
actualSignatureSize
��> Q
)
��Q R
)
��R S
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� !
actualSignatureSize
�� &
!=
��' )
hmac
��* .
.
��. /

GetMacSize
��/ 9
(
��9 :
)
��: ;
;
��; <
}
�� 	
private
�� 
bool
�� 8
*DoesSignatureUseSafeCanonicalizationMethod
�� ?
(
��? @
)
��@ A
{
�� 	
foreach
�� 
(
�� 
string
�� 
safeAlgorithm
�� )
in
��* ,)
SafeCanonicalizationMethods
��- H
)
��H I
{
�� 
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� !
(
��! "
safeAlgorithm
��" /
,
��/ 0

SignedInfo
��1 ;
.
��; <$
CanonicalizationMethod
��< R
,
��R S
StringComparison
��T d
.
��d e
OrdinalIgnoreCase
��e v
)
��v w
)
��w x
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� -
LogUnsafeCanonicalizationMethod
�� =
(
��= >
this
��> B
,
��B C

SignedInfo
��D N
.
��N O$
CanonicalizationMethod
��O e
,
��e f*
SafeCanonicalizationMethods��g �
)��� �
;��� �
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
bool
�� /
!ReferenceUsesSafeTransformMethods
�� 6
(
��6 7
	Reference
��7 @
	reference
��A J
)
��J K
{
�� 	
TransformChain
�� 
transformChain
�� )
=
��* +
	reference
��, 5
.
��5 6
TransformChain
��6 D
;
��D E
int
�� 
transformCount
�� 
=
��  
transformChain
��! /
.
��/ 0
Count
��0 5
;
��5 6
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
transformCount
��  .
;
��. /
i
��0 1
++
��1 3
)
��3 4
{
�� 
	Transform
�� 
	transform
�� #
=
��$ %
transformChain
��& 4
[
��4 5
i
��5 6
]
��6 7
;
��7 8
if
�� 
(
�� 
!
�� 
IsSafeTransform
�� $
(
��$ %
	transform
��% .
.
��. /
	Algorithm
��/ 8
)
��8 9
)
��9 :
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
IsSafeTransform
�� $
(
��$ %
string
��% + 
transformAlgorithm
��, >
)
��> ?
{
�� 	
foreach
�� 
(
�� 
string
�� 
safeAlgorithm
�� )
in
��* ,)
SafeCanonicalizationMethods
��- H
)
��H I
{
�� 
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� !
(
��! "
safeAlgorithm
��" /
,
��/ 0 
transformAlgorithm
��1 C
,
��C D
StringComparison
��E U
.
��U V
OrdinalIgnoreCase
��V g
)
��g h
)
��h i
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
foreach
�� 
(
�� 
string
�� 
safeAlgorithm
�� )
in
��* ,)
DefaultSafeTransformMethods
��- H
)
��H I
{
�� 
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� !
(
��! "
safeAlgorithm
��" /
,
��/ 0 
transformAlgorithm
��1 C
,
��C D
StringComparison
��E U
.
��U V
OrdinalIgnoreCase
��V g
)
��g h
)
��h i
{
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� &
LogUnsafeTransformMethod
�� 6
(
��6 7
this
�� 
,
��  
transformAlgorithm
�� "
,
��" #)
SafeCanonicalizationMethods
�� +
,
��+ ,)
DefaultSafeTransformMethods
�� +
)
��+ ,
;
��, -
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
IList
�� 
<
�� 
string
�� #
>
��# $*
KnownCanonicalizationMethods
��% A
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� ,
s_knownCanonicalizationMethods
�� 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
List
�� 
<
�� 
string
�� 
>
��  
safeAlgorithms
��! /
=
��0 1
new
��2 5
List
��6 :
<
��: ;
string
��; A
>
��A B
(
��B C
)
��C D
;
��D E
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '%
XmlDsigC14NTransformUrl
��' >
)
��> ?
;
��? @
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '1
#XmlDsigC14NWithCommentsTransformUrl
��' J
)
��J K
;
��K L
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '(
XmlDsigExcC14NTransformUrl
��' A
)
��A B
;
��B C
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '4
&XmlDsigExcC14NWithCommentsTransformUrl
��' M
)
��M N
;
��N O,
s_knownCanonicalizationMethods
�� 2
=
��3 4
safeAlgorithms
��5 C
;
��C D
}
�� 
return
�� ,
s_knownCanonicalizationMethods
�� 5
;
��5 6
}
�� 
}
�� 	
private
�� 
static
�� 
IList
�� 
<
�� 
string
�� #
>
��# $)
DefaultSafeTransformMethods
��% @
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� +
s_defaultSafeTransformMethods
�� 1
==
��2 4
null
��5 9
)
��9 :
{
�� 
List
�� 
<
�� 
string
�� 
>
��  
safeAlgorithms
��! /
=
��0 1
new
��2 5
List
��6 :
<
��: ;
string
��; A
>
��A B
(
��B C
)
��C D
;
��D E
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '3
%XmlDsigEnvelopedSignatureTransformUrl
��' L
)
��L M
;
��M N
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& ''
XmlDsigBase64TransformUrl
��' @
)
��@ A
;
��A B
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& '$
XmlLicenseTransformUrl
��' =
)
��= >
;
��> ?
safeAlgorithms
�� "
.
��" #
Add
��# &
(
��& ''
XmlDecryptionTransformUrl
��' @
)
��@ A
;
��A B+
s_defaultSafeTransformMethods
�� 1
=
��2 3
safeAlgorithms
��4 B
;
��B C
}
�� 
return
�� +
s_defaultSafeTransformMethods
�� 4
;
��4 5
}
�� 
}
�� 	
private
�� 
void
�� 
GetC14NDigest
�� "
(
��" #
IHash
��# (
hash
��) -
)
��- .
{
�� 	
bool
�� "
isKeyedHashAlgorithm
�� %
=
��& '
hash
��( ,
is
��- /
MacHashWrapper
��0 >
;
��> ?
if
�� 
(
�� "
isKeyedHashAlgorithm
�� $
||
��% '
!
��( )
_bCacheValid
��) 5
||
��6 8
!
��9 :

SignedInfo
��: D
.
��D E

CacheValid
��E O
)
��O P
{
�� 
string
�� 
baseUri
�� 
=
��  
(
��! "!
_containingDocument
��" 5
==
��6 8
null
��9 =
?
��> ?
null
��@ D
:
��E F!
_containingDocument
��G Z
.
��Z [
BaseURI
��[ b
)
��b c
;
��c d
XmlResolver
�� 
resolver
�� $
=
��% &
(
��' (
_bResolverSet
��( 5
?
��6 7
_xmlResolver
��8 D
:
��E F
new
��G J
XmlSecureResolver
��K \
(
��\ ]
new
��] `
XmlUrlResolver
��a o
(
��o p
)
��p q
,
��q r
baseUri
��s z
)
��z {
)
��{ |
;
��| }
XmlDocument
�� 
doc
�� 
=
��  !
Utils
��" '
.
��' ($
PreProcessElementInput
��( >
(
��> ?

SignedInfo
��? I
.
��I J
GetXml
��J P
(
��P Q
)
��Q R
,
��R S
resolver
��T \
,
��\ ]
baseUri
��^ e
)
��e f
;
��f g"
CanonicalXmlNodeList
�� $

namespaces
��% /
=
��0 1
(
��2 3
_context
��3 ;
==
��< >
null
��? C
?
��D E
null
��F J
:
��K L
Utils
��M R
.
��R S%
GetPropagatedAttributes
��S j
(
��j k
_context
��k s
)
��s t
)
��t u
;
��u v
SignedXmlDebugLog
�� !
.
��! "%
LogNamespacePropagation
��" 9
(
��9 :
this
��: >
,
��> ?

namespaces
��@ J
)
��J K
;
��K L
Utils
�� 
.
�� 
AddNamespaces
�� #
(
��# $
doc
��$ '
.
��' (
DocumentElement
��( 7
,
��7 8

namespaces
��9 C
)
��C D
;
��D E
	Transform
�� !
c14nMethodTransform
�� -
=
��. /

SignedInfo
��0 :
.
��: ;*
CanonicalizationMethodObject
��; W
;
��W X!
c14nMethodTransform
�� #
.
��# $
Resolver
��$ ,
=
��- .
resolver
��/ 7
;
��7 8!
c14nMethodTransform
�� #
.
��# $
BaseURI
��$ +
=
��, -
baseUri
��. 5
;
��5 6
SignedXmlDebugLog
�� !
.
��! "&
LogBeginCanonicalization
��" :
(
��: ;
this
��; ?
,
��? @!
c14nMethodTransform
��A T
)
��T U
;
��U V!
c14nMethodTransform
�� #
.
��# $
	LoadInput
��$ -
(
��- .
doc
��. 1
)
��1 2
;
��2 3
SignedXmlDebugLog
�� !
.
��! "$
LogCanonicalizedOutput
��" 8
(
��8 9
this
��9 =
,
��= >!
c14nMethodTransform
��? R
)
��R S
;
��S T!
c14nMethodTransform
�� #
.
��# $
GetDigestedOutput
��$ 5
(
��5 6
hash
��6 :
)
��: ;
;
��; <
_bCacheValid
�� 
=
�� 
!
��  "
isKeyedHashAlgorithm
��  4
;
��4 5
}
�� 
}
�� 	
private
�� 
int
�� 
GetReferenceLevel
�� %
(
��% &
int
��& )
index
��* /
,
��/ 0
	ArrayList
��1 :

references
��; E
)
��E F
{
�� 	
if
�� 
(
�� 
_refProcessed
�� 
[
�� 
index
�� #
]
��# $
)
��$ %
return
��& ,
_refLevelCache
��- ;
[
��; <
index
��< A
]
��A B
;
��B C
_refProcessed
�� 
[
�� 
index
�� 
]
��  
=
��! "
true
��# '
;
��' (
	Reference
�� 
	reference
�� 
=
��  !
(
��" #
	Reference
��# ,
)
��, -

references
��- 7
[
��7 8
index
��8 =
]
��= >
;
��> ?
if
�� 
(
�� 
	reference
�� 
.
�� 
Uri
�� 
==
��  
null
��! %
||
��& (
	reference
��) 2
.
��2 3
Uri
��3 6
.
��6 7
Length
��7 =
==
��> @
$num
��A B
||
��C E
(
��F G
	reference
��G P
.
��P Q
Uri
��Q T
.
��T U
Length
��U [
>
��\ ]
$num
��^ _
&&
��` b
	reference
��c l
.
��l m
Uri
��m p
[
��p q
$num
��q r
]
��r s
!=
��t v
$char
��w z
)
��z {
)
��{ |
{
�� 
_refLevelCache
�� 
[
�� 
index
�� $
]
��$ %
=
��& '
$num
��( )
;
��) *
return
�� 
$num
�� 
;
�� 
}
�� 
if
�� 
(
�� 
	reference
�� 
.
�� 
Uri
�� 
.
�� 
Length
�� $
>
��% &
$num
��' (
&&
��) +
	reference
��, 5
.
��5 6
Uri
��6 9
[
��9 :
$num
��: ;
]
��; <
==
��= ?
$char
��@ C
)
��C D
{
�� 
string
�� 
idref
�� 
=
�� 
Utils
�� $
.
��$ %#
ExtractIdFromLocalUri
��% :
(
��: ;
	reference
��; D
.
��D E
Uri
��E H
)
��H I
;
��I J
if
�� 
(
�� 
idref
�� 
==
�� 
$str
�� *
)
��* +
{
�� 
_refLevelCache
�� "
[
��" #
index
��# (
]
��( )
=
��* +
$num
��, -
;
��- .
return
�� 
$num
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
j
�� 
=
�� 
$num
�� 
;
�� 
j
��  !
<
��" #

references
��$ .
.
��. /
Count
��/ 4
;
��4 5
++
��6 8
j
��8 9
)
��9 :
{
�� 
if
�� 
(
�� 
(
�� 
(
�� 
	Reference
�� #
)
��# $

references
��$ .
[
��. /
j
��/ 0
]
��0 1
)
��1 2
.
��2 3
Id
��3 5
==
��6 8
idref
��9 >
)
��> ?
{
�� 
_refLevelCache
�� &
[
��& '
index
��' ,
]
��, -
=
��. /
GetReferenceLevel
��0 A
(
��A B
j
��B C
,
��C D

references
��E O
)
��O P
+
��Q R
$num
��S T
;
��T U
return
�� 
(
��  
_refLevelCache
��  .
[
��. /
index
��/ 4
]
��4 5
)
��5 6
;
��6 7
}
�� 
}
�� 
_refLevelCache
�� 
[
�� 
index
�� $
]
��$ %
=
��& '
$num
��( )
;
��) *
return
�� 
$num
�� 
;
�� 
}
�� 
throw
�� 
new
�� 
System
�� 
.
�� 
Security
�� %
.
��% &
Cryptography
��& 2
.
��2 3$
CryptographicException
��3 I
(
��I J
SR
��J L
.
��L M/
!Cryptography_Xml_InvalidReference
��M n
)
��n o
;
��o p
}
�� 	
private
�� 
class
�� %
ReferenceLevelSortOrder
�� -
:
��. /
	IComparer
��0 9
{
�� 	
private
�� 
	ArrayList
�� 
_references
�� )
=
��* +
null
��, 0
;
��0 1
public
�� %
ReferenceLevelSortOrder
�� *
(
��* +
)
��+ ,
{
��- .
}
��/ 0
public
�� 
	ArrayList
�� 

References
�� '
{
�� 
get
�� 
{
�� 
return
�� 
_references
�� (
;
��( )
}
��* +
set
�� 
{
�� 
_references
�� !
=
��" #
value
��$ )
;
��) *
}
��+ ,
}
�� 
public
�� 
int
�� 
Compare
�� 
(
�� 
object
�� %
a
��& '
,
��' (
object
��) /
b
��0 1
)
��1 2
{
�� 
	Reference
�� 

referenceA
�� $
=
��% &
a
��' (
as
��) +
	Reference
��, 5
;
��5 6
	Reference
�� 

referenceB
�� $
=
��% &
b
��' (
as
��) +
	Reference
��, 5
;
��5 6
int
�� 
iIndexA
�� 
=
�� 
$num
�� 
;
��  
int
�� 
iIndexB
�� 
=
�� 
$num
�� 
;
��  
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
foreach
�� 
(
�� 
	Reference
�� "
	reference
��# ,
in
��- /

References
��0 :
)
��: ;
{
�� 
if
�� 
(
�� 
	reference
�� !
==
��" $

referenceA
��% /
)
��/ 0
iIndexA
��1 8
=
��9 :
i
��; <
;
��< =
if
�� 
(
�� 
	reference
�� !
==
��" $

referenceB
��% /
)
��/ 0
iIndexB
��1 8
=
��9 :
i
��; <
;
��< =
i
�� 
++
�� 
;
�� 
}
�� 
int
�� 
iLevelA
�� 
=
�� 

referenceA
�� (
.
��( )
	SignedXml
��) 2
.
��2 3
GetReferenceLevel
��3 D
(
��D E
iIndexA
��E L
,
��L M

References
��N X
)
��X Y
;
��Y Z
int
�� 
iLevelB
�� 
=
�� 

referenceB
�� (
.
��( )
	SignedXml
��) 2
.
��2 3
GetReferenceLevel
��3 D
(
��D E
iIndexB
��E L
,
��L M

References
��N X
)
��X Y
;
��Y Z
return
�� 
iLevelA
�� 
.
�� 
	CompareTo
�� (
(
��( )
iLevelB
��) 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
private
�� 
void
�� %
BuildDigestedReferences
�� ,
(
��, -
)
��- .
{
�� 	
	ArrayList
�� 

references
��  
=
��! "

SignedInfo
��# -
.
��- .

References
��. 8
;
��8 9
_refProcessed
�� 
=
�� 
new
�� 
bool
��  $
[
��$ %

references
��% /
.
��/ 0
Count
��0 5
]
��5 6
;
��6 7
_refLevelCache
�� 
=
�� 
new
��  
int
��! $
[
��$ %

references
��% /
.
��/ 0
Count
��0 5
]
��5 6
;
��6 7%
ReferenceLevelSortOrder
�� #
	sortOrder
��$ -
=
��. /
new
��0 3%
ReferenceLevelSortOrder
��4 K
(
��K L
)
��L M
;
��M N
	sortOrder
�� 
.
�� 

References
��  
=
��! "

references
��# -
;
��- .
	ArrayList
�� 
sortedReferences
�� &
=
��' (
new
��) ,
	ArrayList
��- 6
(
��6 7
)
��7 8
;
��8 9
foreach
�� 
(
�� 
	Reference
�� 
	reference
�� (
in
��) +

references
��, 6
)
��6 7
{
�� 
sortedReferences
��  
.
��  !
Add
��! $
(
��$ %
	reference
��% .
)
��. /
;
��/ 0
}
�� 
sortedReferences
�� 
.
�� 
Sort
�� !
(
��! "
	sortOrder
��" +
)
��+ ,
;
��, -"
CanonicalXmlNodeList
��  
nodeList
��! )
=
��* +
new
��, /"
CanonicalXmlNodeList
��0 D
(
��D E
)
��E F
;
��F G
foreach
�� 
(
�� 

DataObject
�� 
obj
��  #
in
��$ &
m_signature
��' 2
.
��2 3

ObjectList
��3 =
)
��= >
{
�� 
nodeList
�� 
.
�� 
Add
�� 
(
�� 
obj
��  
.
��  !
GetXml
��! '
(
��' (
)
��( )
)
��) *
;
��* +
}
�� 
foreach
�� 
(
�� 
	Reference
�� 
	reference
�� (
in
��) +
sortedReferences
��, <
)
��< =
{
�� 
if
�� 
(
�� 
	reference
�� 
.
�� 
DigestMethod
�� *
==
��+ -
null
��. 2
)
��2 3
	reference
�� 
.
�� 
DigestMethod
�� *
=
��+ ,
	Reference
��- 6
.
��6 7!
DefaultDigestMethod
��7 J
;
��J K
SignedXmlDebugLog
�� !
.
��! "!
LogSigningReference
��" 5
(
��5 6
this
��6 :
,
��: ;
	reference
��< E
)
��E F
;
��F G
	reference
�� 
.
�� 
UpdateHashValue
�� )
(
��) *!
_containingDocument
��* =
,
��= >
nodeList
��? G
)
��G H
;
��H I
if
�� 
(
�� 
	reference
�� 
.
�� 
Id
��  
!=
��! #
null
��$ (
)
��( )
nodeList
�� 
.
�� 
Add
��  
(
��  !
	reference
��! *
.
��* +
GetXml
��+ 1
(
��1 2
)
��2 3
)
��3 4
;
��4 5
}
�� 
}
�� 	
private
�� 
bool
�� %
CheckDigestedReferences
�� ,
(
��, -
)
��- .
{
�� 	
	ArrayList
�� 

references
��  
=
��! "
m_signature
��# .
.
��. /

SignedInfo
��/ 9
.
��9 :

References
��: D
;
��D E
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 

references
��  *
.
��* +
Count
��+ 0
;
��0 1
++
��2 4
i
��4 5
)
��5 6
{
�� 
	Reference
�� 
digestedReference
�� +
=
��, -
(
��. /
	Reference
��/ 8
)
��8 9

references
��9 C
[
��C D
i
��D E
]
��E F
;
��F G
if
�� 
(
�� 
!
�� /
!ReferenceUsesSafeTransformMethods
�� 6
(
��6 7
digestedReference
��7 H
)
��H I
)
��I J
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
SignedXmlDebugLog
�� !
.
��! " 
LogVerifyReference
��" 4
(
��4 5
this
��5 9
,
��9 :
digestedReference
��; L
)
��L M
;
��M N
byte
�� 
[
�� 
]
�� 
calculatedHash
�� %
=
��& '
null
��( ,
;
��, -
try
�� 
{
�� 
calculatedHash
�� "
=
��# $
digestedReference
��% 6
.
��6 7 
CalculateHashValue
��7 I
(
��I J!
_containingDocument
��J ]
,
��] ^
m_signature
��_ j
.
��j k
ReferencedItems
��k z
)
��z {
;
��{ |
}
�� 
catch
�� 
(
�� /
!CryptoSignedXmlRecursionException
�� 8
)
��8 9
{
�� 
SignedXmlDebugLog
�� %
.
��% &(
LogSignedXmlRecursionLimit
��& @
(
��@ A
this
��A E
,
��E F
digestedReference
��G X
)
��X Y
;
��Y Z
return
�� 
false
��  
;
��  !
}
�� 
SignedXmlDebugLog
�� !
.
��! "$
LogVerifyReferenceHash
��" 8
(
��8 9
this
��9 =
,
��= >
digestedReference
��? P
,
��P Q
calculatedHash
��R `
,
��` a
digestedReference
��b s
.
��s t
DigestValue
��t 
)�� �
;��� �
if
�� 
(
�� 
!
�� !
CryptographicEquals
�� (
(
��( )
calculatedHash
��) 7
,
��7 8
digestedReference
��9 J
.
��J K
DigestValue
��K V
)
��V W
)
��W X
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
[
�� 	

MethodImpl
��	 
(
�� 
MethodImplOptions
�� %
.
��% &

NoInlining
��& 0
|
��1 2
MethodImplOptions
��3 D
.
��D E
NoOptimization
��E S
)
��S T
]
��T U
private
�� 
static
�� 
bool
�� !
CryptographicEquals
�� /
(
��/ 0
byte
��0 4
[
��4 5
]
��5 6
a
��7 8
,
��8 9
byte
��: >
[
��> ?
]
��? @
b
��A B
)
��B C
{
�� 	
System
�� 
.
�� 
Diagnostics
�� 
.
�� 
Debug
�� $
.
��$ %
Assert
��% +
(
��+ ,
a
��, -
!=
��. 0
null
��1 5
)
��5 6
;
��6 7
System
�� 
.
�� 
Diagnostics
�� 
.
�� 
Debug
�� $
.
��$ %
Assert
��% +
(
��+ ,
b
��, -
!=
��. 0
null
��1 5
)
��5 6
;
��6 7
int
�� 
result
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
a
�� 
.
�� 
Length
�� 
!=
�� 
b
�� 
.
�� 
Length
�� $
)
��$ %
return
�� 
false
�� 
;
�� 
	unchecked
�� 
{
�� 
int
�� 
aLength
�� 
=
�� 
a
�� 
.
��  
Length
��  &
;
��& '
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #
aLength
��$ +
;
��+ ,
i
��- .
++
��. 0
)
��0 1
result
�� 
=
�� 
result
�� #
|
��$ %
(
��& '
a
��' (
[
��( )
i
��) *
]
��* +
-
��, -
b
��. /
[
��/ 0
i
��0 1
]
��1 2
)
��2 3
;
��3 4
}
�� 
return
�� 
(
�� 
$num
�� 
==
�� 
result
�� 
)
��  
;
��  !
}
�� 	
private
�� 
bool
�� "
CheckSignatureFormat
�� )
(
��) *
)
��* +
{
�� 	
if
�� 
(
�� '
_signatureFormatValidator
�� )
==
��* ,
null
��- 1
)
��1 2
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
SignedXmlDebugLog
�� 
.
�� *
LogBeginCheckSignatureFormat
�� :
(
��: ;
this
��; ?
,
��? @'
_signatureFormatValidator
��A Z
)
��Z [
;
��[ \
bool
�� 
formatValid
�� 
=
�� '
_signatureFormatValidator
�� 8
(
��8 9
this
��9 =
)
��= >
;
��> ?
SignedXmlDebugLog
�� 
.
�� '
LogFormatValidationResult
�� 7
(
��7 8
this
��8 <
,
��< =
formatValid
��> I
)
��I J
;
��J K
return
�� 
formatValid
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
CheckSignedInfo
�� $
(
��$ %$
AsymmetricKeyParameter
��% ;
key
��< ?
)
��? @
{
�� 	
if
�� 
(
�� 
key
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
key
��7 :
)
��: ;
)
��; <
;
��< =
SignedXmlDebugLog
�� 
.
�� %
LogBeginCheckSignedInfo
�� 5
(
��5 6
this
��6 :
,
��: ;
m_signature
��< G
.
��G H

SignedInfo
��H R
)
��R S
;
��S T
ISigner
�� "
signatureDescription
�� (
=
��) *
CryptoHelpers
��+ 8
.
��8 9
CreateFromName
��9 G
<
��G H
ISigner
��H O
>
��O P
(
��P Q
SignatureMethod
��Q `
)
��` a
;
��a b
if
�� 
(
�� "
signatureDescription
�� $
==
��% '
null
��( ,
)
��, -
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q>
/Cryptography_Xml_SignatureDescriptionNotCreated��Q �
)��� �
;��� �
try
�� 
{
�� "
signatureDescription
�� $
.
��$ %
Init
��% )
(
��) *
false
��* /
,
��/ 0
key
��1 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
��  !
return
�� 
false
�� 
;
�� 
}
�� 
GetC14NDigest
�� 
(
�� 
new
�� 
SignerHashWrapper
�� /
(
��/ 0"
signatureDescription
��0 D
)
��D E
)
��E F
;
��F G
return
�� "
signatureDescription
�� '
.
��' (
VerifySignature
��( 7
(
��7 8
m_signature
��8 C
.
��C D
SignatureValue
��D R
)
��R S
;
��S T
}
�� 	
private
�� 
bool
�� 
CheckSignedInfo
�� $
(
��$ %
IMac
��% )
macAlg
��* 0
)
��0 1
{
�� 	
if
�� 
(
�� 
macAlg
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
macAlg
��7 =
)
��= >
)
��> ?
;
��? @
SignedXmlDebugLog
�� 
.
�� %
LogBeginCheckSignedInfo
�� 5
(
��5 6
this
��6 :
,
��: ;
m_signature
��< G
.
��G H

SignedInfo
��H R
)
��R S
;
��S T
int
�� 
signatureLength
�� 
;
��  
if
�� 
(
�� 
m_signature
�� 
.
�� 

SignedInfo
�� &
.
��& '
SignatureLength
��' 6
==
��7 9
null
��: >
)
��> ?
signatureLength
�� 
=
��  !
macAlg
��" (
.
��( )

GetMacSize
��) 3
(
��3 4
)
��4 5
*
��6 7
$num
��8 9
;
��9 :
else
�� 
signatureLength
�� 
=
��  !
Convert
��" )
.
��) *
ToInt32
��* 1
(
��1 2
m_signature
��2 =
.
��= >

SignedInfo
��> H
.
��H I
SignatureLength
��I X
,
��X Y
null
��Z ^
)
��^ _
;
��_ `
if
�� 
(
�� 
signatureLength
�� 
<
��  !
$num
��" #
||
��$ &
signatureLength
��' 6
>
��7 8
macAlg
��9 ?
.
��? @

GetMacSize
��@ J
(
��J K
)
��K L
*
��M N
$num
��O P
)
��P Q
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q5
'Cryptography_Xml_InvalidSignatureLength
��Q x
)
��x y
;
��y z
if
�� 
(
�� 
signatureLength
�� 
%
��  !
$num
��" #
!=
��$ &
$num
��' (
)
��( )
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q6
(Cryptography_Xml_InvalidSignatureLength2
��Q y
)
��y z
;
��z {
if
�� 
(
�� 
m_signature
�� 
.
�� 
SignatureValue
�� *
==
��+ -
null
��. 2
)
��2 3
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q5
'Cryptography_Xml_SignatureValueRequired
��Q x
)
��x y
;
��y z
if
�� 
(
�� 
m_signature
�� 
.
�� 
SignatureValue
�� *
.
��* +
Length
��+ 1
!=
��2 4
signatureLength
��5 D
/
��E F
$num
��G H
)
��H I
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q5
'Cryptography_Xml_InvalidSignatureLength
��Q x
)
��x y
;
��y z
GetC14NDigest
�� 
(
�� 
new
�� 
MacHashWrapper
�� ,
(
��, -
macAlg
��- 3
)
��3 4
)
��4 5
;
��5 6
byte
�� 
[
�� 
]
�� 
	hashValue
�� 
=
�� 
new
�� "
byte
��# '
[
��' (
macAlg
��( .
.
��. /

GetMacSize
��/ 9
(
��9 :
)
��: ;
]
��; <
;
��< =
macAlg
�� 
.
�� 
DoFinal
�� 
(
�� 
	hashValue
�� $
,
��$ %
$num
��& '
)
��' (
;
��( )
SignedXmlDebugLog
�� 
.
�� !
LogVerifySignedInfo
�� 1
(
��1 2
this
��2 6
,
��6 7
macAlg
��8 >
,
��> ?
	hashValue
��@ I
,
��I J
m_signature
��K V
.
��V W
SignatureValue
��W e
)
��e f
;
��f g
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
m_signature
��  +
.
��+ ,
SignatureValue
��, :
.
��: ;
Length
��; A
;
��A B
i
��C D
++
��D F
)
��F G
{
��H I
if
�� 
(
�� 
m_signature
�� 
.
��  
SignatureValue
��  .
[
��. /
i
��/ 0
]
��0 1
!=
��2 4
	hashValue
��5 >
[
��> ?
i
��? @
]
��@ A
)
��A B
return
��C I
false
��J O
;
��O P
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
static
�� 

XmlElement
�� !&
GetSingleReferenceTarget
��" :
(
��: ;
XmlDocument
��; F
document
��G O
,
��O P
string
��Q W
idAttributeName
��X g
,
��g h
string
��i o
idValue
��p w
)
��w x
{
�� 	
string
�� 
xPath
�� 
=
�� 
$str
�� "
+
��# $
idAttributeName
��% 4
+
��5 6
$str
��7 <
+
��= >
idValue
��? F
+
��G H
$str
��I N
;
��N O
XmlNodeList
�� 
nodeList
��  
=
��! "
document
��# +
.
��+ ,
SelectNodes
��, 7
(
��7 8
xPath
��8 =
)
��= >
;
��> ?
if
�� 
(
�� 
nodeList
�� 
==
�� 
null
��  
||
��! #
nodeList
��$ ,
.
��, -
Count
��- 2
==
��3 5
$num
��6 7
)
��7 8
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
if
�� 
(
�� 
nodeList
�� 
.
�� 
Count
�� 
==
�� !
$num
��" #
)
��# $
{
�� 
return
�� 
nodeList
�� 
[
��  
$num
��  !
]
��! "
as
��# %

XmlElement
��& 0
;
��0 1
}
�� 
throw
�� 
new
�� 
System
�� 
.
�� 
Security
�� %
.
��% &
Cryptography
��& 2
.
��2 3$
CryptographicException
��3 I
(
��I J
SR
��J L
.
��L M/
!Cryptography_Xml_InvalidReference
��M n
)
��n o
;
��o p
}
�� 	
private
�� 
static
�� 
bool
�� &
IsKeyTheCorrectAlgorithm
�� 4
(
��4 5$
AsymmetricKeyParameter
��5 K
key
��L O
,
��O P
ISigner
��Q X
expectedType
��Y e
)
��e f
{
�� 	
try
�� 
{
�� 
expectedType
�� 
.
�� 
Init
�� !
(
��! "
false
��" '
,
��' (
key
��) ,
)
��, -
;
��- .
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
��  !
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
�� 
,
��  
VerifyReference
�� 
,
�� 
VerifySignedInfo
�� 
,
�� 
X509Verification
�� 
,
�� *
UnsafeCanonicalizationMethod
�� (
,
��( )#
UnsafeTransformMethod
�� !
,
��! "
}
�� 	
private
�� 
static
�� 
bool
�� '
InformationLoggingEnabled
�� 5
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� &
s_haveInformationLogging
�� -
)
��- .
{
�� "
s_informationLogging
�� (
=
��) *
s_traceSource
��+ 8
.
��8 9
Switch
��9 ?
.
��? @
ShouldTrace
��@ K
(
��K L
TraceEventType
��L Z
.
��Z [
Information
��[ f
)
��f g
;
��g h&
s_haveInformationLogging
�� ,
=
��- .
true
��/ 3
;
��3 4
}
�� 
return
�� "
s_informationLogging
�� +
;
��+ ,
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� #
VerboseLoggingEnabled
�� 1
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
!
�� "
s_haveVerboseLogging
�� )
)
��) *
{
�� 
s_verboseLogging
�� $
=
��% &
s_traceSource
��' 4
.
��4 5
Switch
��5 ;
.
��; <
ShouldTrace
��< G
(
��G H
TraceEventType
��H V
.
��V W
Verbose
��W ^
)
��^ _
;
��_ `"
s_haveVerboseLogging
�� (
=
��) *
true
��+ /
;
��/ 0
}
�� 
return
�� 
s_verboseLogging
�� '
;
��' (
}
�� 
}
�� 	
private
�� 
static
�� 
string
�� 
FormatBytes
�� )
(
��) *
byte
��* .
[
��. /
]
��/ 0
bytes
��1 6
)
��6 7
{
�� 	
if
�� 
(
�� 
bytes
�� 
==
�� 
null
�� 
)
�� 
return
�� 

NullString
�� !
;
��! "
StringBuilder
�� 
builder
�� !
=
��" #
new
��$ '
StringBuilder
��( 5
(
��5 6
bytes
��6 ;
.
��; <
Length
��< B
*
��C D
$num
��E F
)
��F G
;
��G H
foreach
�� 
(
�� 
byte
�� 
b
�� 
in
�� 
bytes
�� $
)
��$ %
{
�� 
builder
�� 
.
�� 
Append
�� 
(
�� 
b
��  
.
��  !
ToString
��! )
(
��) *
$str
��* .
,
��. /
CultureInfo
��0 ;
.
��; <
InvariantCulture
��< L
)
��L M
)
��M N
;
��N O
}
�� 
return
�� 
builder
�� 
.
�� 
ToString
�� #
(
��# $
)
��$ %
;
��% &
}
�� 	
private
�� 
static
�� 
string
�� 

GetKeyName
�� (
(
��( )
object
��) /
key
��0 3
)
��3 4
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
key
�� 
!=
�� 
null
��  $
,
��$ %
$str
��& 3
)
��3 4
;
��4 5$
AsymmetricKeyParameter
�� "
cspKey
��# )
=
��* +
key
��, /
as
��0 2$
AsymmetricKeyParameter
��3 I
;
��I J
X509Certificate
�� 
certificate
�� '
=
��( )
key
��* -
as
��. 0
X509Certificate
��1 @
;
��@ A
string
�� 
keyName
�� 
=
�� 
null
�� !
;
��! "
if
�� 
(
�� 
cspKey
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
keyName
�� 
=
�� 
string
��  
.
��  !
Format
��! '
(
��' (
CultureInfo
��( 3
.
��3 4
InvariantCulture
��4 D
,
��D E
$str
��( 1
,
��1 2
cspKey
��( .
.
��. /
GetType
��/ 6
(
��6 7
)
��7 8
.
��8 9
Name
��9 =
)
��= >
;
��> ?
}
�� 
else
�� 
if
�� 
(
�� 
certificate
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
keyName
�� 
=
�� 
string
��  
.
��  !
Format
��! '
(
��' (
CultureInfo
��( 3
.
��3 4
InvariantCulture
��4 D
,
��D E
$str
��( 1
,
��1 2
certificate
��( 3
.
��3 4
	SubjectDN
��4 =
)
��= >
;
��> ?
}
�� 
else
�� 
{
�� 
keyName
�� 
=
�� 
key
�� 
.
�� 
GetHashCode
�� )
(
��) *
)
��* +
.
��+ ,
ToString
��, 4
(
��4 5
$str
��5 9
,
��9 :
CultureInfo
��; F
.
��F G
InvariantCulture
��G W
)
��W X
;
��X Y
}
�� 
return
�� 
string
�� 
.
�� 
Format
��  
(
��  !
CultureInfo
��! ,
.
��, -
InvariantCulture
��- =
,
��= >
$str
��? H
,
��H I
key
��J M
.
��M N
GetType
��N U
(
��U V
)
��V W
.
��W X
Name
��X \
,
��\ ]
keyName
��^ e
)
��e f
;
��f g
}
�� 	
private
�� 
static
�� 
string
�� 
GetObjectId
�� )
(
��) *
object
��* 0
o
��1 2
)
��2 3
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
o
�� 
!=
�� 
null
�� "
,
��" #
$str
��$ /
)
��/ 0
;
��0 1
return
�� 
string
�� 
.
�� 
Format
��  
(
��  !
CultureInfo
��! ,
.
��, -
InvariantCulture
��- =
,
��= >
$str
��! *
,
��* +
o
��, -
.
��- .
GetType
��. 5
(
��5 6
)
��6 7
.
��7 8
Name
��8 <
,
��< =
o
��! "
.
��" #
GetHashCode
��# .
(
��. /
)
��/ 0
.
��0 1
ToString
��1 9
(
��9 :
$str
��: >
,
��> ?
CultureInfo
��@ K
.
��K L
InvariantCulture
��L \
)
��\ ]
)
��] ^
;
��^ _
}
�� 	
internal
�� 
static
�� 
void
�� &
LogBeginCanonicalization
�� 5
(
��5 6
	SignedXml
��6 ?
	signedXml
��@ I
,
��I J
	Transform
��K T'
canonicalizationTransform
��U n
)
��n o
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� '
canonicalizationTransform
�� 2
!=
��3 5
null
��6 :
,
��: ;
$str
��< _
)
��_ `
;
��` a
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5'
Log_BeginCanonicalization
��5 N
,
��N O'
canonicalizationTransform
��2 K
.
��K L
	Algorithm
��L U
,
��U V'
canonicalizationTransform
��2 K
.
��K L
GetType
��L S
(
��S T
)
��T U
.
��U V
Name
��V Z
)
��Z [
;
��[ \
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .#
BeginCanonicalization
��. C
,
��C D

logMessage
�� $
)
��$ %
;
��% &
}
�� 
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� &
canonicalizationSettings
�� /
=
��0 1
string
��2 8
.
��8 9
Format
��9 ?
(
��? @
CultureInfo
��@ K
.
��K L
InvariantCulture
��L \
,
��\ ]
SR
��@ B
.
��B C*
Log_CanonicalizationSettings
��C _
,
��_ `'
canonicalizationTransform
��@ Y
.
��Y Z
Resolver
��Z b
.
��b c
GetType
��c j
(
��j k
)
��k l
,
��l m'
canonicalizationTransform
��@ Y
.
��Y Z
BaseURI
��Z a
)
��a b
;
��b c
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .#
BeginCanonicalization
��. C
,
��C D&
canonicalizationSettings
�� 2
)
��2 3
;
��3 4
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� *
LogBeginCheckSignatureFormat
�� 9
(
��9 :
	SignedXml
��: C
	signedXml
��D M
,
��M N
Func
��O S
<
��S T
	SignedXml
��T ]
,
��] ^
bool
��_ c
>
��c d
formatValidator
��e t
)
��t u
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
formatValidator
�� (
!=
��) +
null
��, 0
,
��0 1
$str
��2 K
)
��K L
;
��L M
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 

MethodInfo
�� 
validationMethod
�� +
=
��, -
formatValidator
��. =
.
��= >
Method
��> D
;
��D E
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5&
Log_CheckSignatureFormat
��5 M
,
��M N
validationMethod
��2 B
.
��B C
Module
��C I
.
��I J
Assembly
��J R
.
��R S
FullName
��S [
,
��[ \
validationMethod
��2 B
.
��B C
DeclaringType
��C P
.
��P Q
FullName
��Q Y
,
��Y Z
validationMethod
��2 B
.
��B C
Name
��C G
)
��G H
;
��H I
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Information
��4 ?
,
��? @!
SignedXmlDebugEvent
��A T
.
��T U'
BeginCheckSignatureFormat
��U n
,
��n o

logMessage
��p z
)
��z {
;
��{ |
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� %
LogBeginCheckSignedInfo
�� 4
(
��4 5
	SignedXml
��5 >
	signedXml
��? H
,
��H I

SignedInfo
��J T

signedInfo
��U _
)
��_ `
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 

signedInfo
�� #
!=
��$ &
null
��' +
,
��+ ,
$str
��- B
)
��B C
;
��C D
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5!
Log_CheckSignedInfo
��5 H
,
��H I

signedInfo
��2 <
.
��< =
Id
��= ?
!=
��@ B
null
��C G
?
��H I

signedInfo
��J T
.
��T U
Id
��U W
:
��X Y

NullString
��Z d
)
��d e
;
��e f
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Information
��4 ?
,
��? @!
SignedXmlDebugEvent
��A T
.
��T U"
BeginCheckSignedInfo
��U i
,
��i j

logMessage
��k u
)
��u v
;
��v w
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� *
LogBeginSignatureComputation
�� 9
(
��9 :
	SignedXml
��: C
	signedXml
��D M
,
��M N

XmlElement
��O Y
context
��Z a
)
��a b
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .'
BeginSignatureComputation
��. G
,
��G H
SR
�� 
.
�� +
Log_BeginSignatureComputation
�� :
)
��: ;
;
��; <
}
�� 
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 
contextData
�� "
=
��# $
string
��% +
.
��+ ,
Format
��, 2
(
��2 3
CultureInfo
��3 >
.
��> ?
InvariantCulture
��? O
,
��O P
SR
��3 5
.
��5 6
Log_XmlContext
��6 D
,
��D E
context
��3 :
!=
��; =
null
��> B
?
��C D
context
��E L
.
��L M
OuterXml
��M U
:
��V W

NullString
��X b
)
��b c
;
��c d
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .'
BeginSignatureComputation
��. G
,
��G H
contextData
�� %
)
��% &
;
��& '
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� +
LogBeginSignatureVerification
�� :
(
��: ;
	SignedXml
��; D
	signedXml
��E N
,
��N O

XmlElement
��P Z
context
��[ b
)
��b c
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .(
BeginSignatureVerification
��. H
,
��H I
SR
�� 
.
�� ,
Log_BeginSignatureVerification
�� ;
)
��; <
;
��< =
}
�� 
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 
contextData
�� "
=
��# $
string
��% +
.
��+ ,
Format
��, 2
(
��2 3
CultureInfo
��3 >
.
��> ?
InvariantCulture
��? O
,
��O P
SR
��3 5
.
��5 6
Log_XmlContext
��6 D
,
��D E
context
��3 :
!=
��; =
null
��> B
?
��C D
context
��E L
.
��L M
OuterXml
��M U
:
��V W

NullString
��X b
)
��b c
;
��c d
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .(
BeginSignatureVerification
��. H
,
��H I
contextData
�� %
)
��% &
;
��& '
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� $
LogCanonicalizedOutput
�� 3
(
��3 4
	SignedXml
��4 =
	signedXml
��> G
,
��G H
	Transform
��I R'
canonicalizationTransform
��S l
)
��l m
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� '
canonicalizationTransform
�� 2
!=
��3 5
null
��6 :
,
��: ;
$str
��< _
)
��_ `
;
��` a
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
using
�� 
(
�� 
StreamReader
�� #
reader
��$ *
=
��+ ,
new
��- 0
StreamReader
��1 =
(
��= >'
canonicalizationTransform
��> W
.
��W X
	GetOutput
��X a
(
��a b
typeof
��b h
(
��h i
Stream
��i o
)
��o p
)
��p q
as
��r t
Stream
��u {
)
��{ |
)
��| }
{
�� 
string
�� 

logMessage
�� %
=
��& '
string
��( .
.
��. /
Format
��/ 5
(
��5 6
CultureInfo
��6 A
.
��A B
InvariantCulture
��B R
,
��R S
SR
��6 8
.
��8 9%
Log_CanonicalizedOutput
��9 P
,
��P Q
reader
��6 <
.
��< =
	ReadToEnd
��= F
(
��F G
)
��G H
)
��H I
;
��I J
	WriteLine
�� 
(
�� 
	signedXml
�� '
,
��' (
TraceEventType
�� ,
.
��, -
Verbose
��- 4
,
��4 5!
SignedXmlDebugEvent
�� 1
.
��1 2
CanonicalizedData
��2 C
,
��C D

logMessage
�� (
)
��( )
;
��) *
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� '
LogFormatValidationResult
�� 6
(
��6 7
	SignedXml
��7 @
	signedXml
��A J
,
��J K
bool
��L P
result
��Q W
)
��W X
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
result
��$ *
?
��+ ,
SR
��- /
.
��/ 0,
Log_FormatValidationSuccessful
��0 N
:
��O P
SR
��- /
.
��/ 0/
!Log_FormatValidationNotSuccessful
��0 Q
;
��Q R
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Information
��4 ?
,
��? @!
SignedXmlDebugEvent
��A T
.
��T U$
FormatValidationResult
��U k
,
��k l

logMessage
��m w
)
��w x
;
��x y
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� -
LogUnsafeCanonicalizationMethod
�� <
(
��< =
	SignedXml
��= F
	signedXml
��G P
,
��P Q
string
��R X
	algorithm
��Y b
,
��b c
IEnumerable
��d o
<
��o p
string
��p v
>
��v w
validAlgorithms��x �
)��� �
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
validAlgorithms
�� (
!=
��) +
null
��, 0
,
��0 1
$str
��2 K
)
��K L
;
��L M
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
StringBuilder
�� #
validAlgorithmBuilder
�� 3
=
��4 5
new
��6 9
StringBuilder
��: G
(
��G H
)
��H I
;
��I J
foreach
�� 
(
�� 
string
�� 
validAlgorithm
��  .
in
��/ 1
validAlgorithms
��2 A
)
��A B
{
�� 
if
�� 
(
�� #
validAlgorithmBuilder
�� -
.
��- .
Length
��. 4
!=
��5 7
$num
��8 9
)
��9 :
{
�� #
validAlgorithmBuilder
�� -
.
��- .
Append
��. 4
(
��4 5
$str
��5 9
)
��9 :
;
��: ;
}
�� #
validAlgorithmBuilder
�� )
.
��) *
AppendFormat
��* 6
(
��6 7
$str
��7 @
,
��@ A
validAlgorithm
��B P
)
��P Q
;
��Q R
}
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5.
 Log_UnsafeCanonicalizationMethod
��5 U
,
��U V
	algorithm
��2 ;
,
��; <#
validAlgorithmBuilder
��2 G
.
��G H
ToString
��H P
(
��P Q
)
��Q R
)
��R S
;
��S T
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Information
��4 ?
,
��? @!
SignedXmlDebugEvent
��A T
.
��T U*
UnsafeCanonicalizationMethod
��U q
,
��q r

logMessage
��s }
)
��} ~
;
��~ 
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� &
LogUnsafeTransformMethod
�� 5
(
��5 6
	SignedXml
�� 
	signedXml
�� 
,
��  
string
�� 
	algorithm
�� 
,
�� 
IEnumerable
�� 
<
�� 
string
�� 
>
�� !
validC14nAlgorithms
��  3
,
��3 4
IEnumerable
�� 
<
�� 
string
�� 
>
�� &
validTransformAlgorithms
��  8
)
��8 9
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� !
validC14nAlgorithms
�� ,
!=
��- /
null
��0 4
,
��4 5
$str
��6 S
)
��S T
;
��T U
Debug
�� 
.
�� 
Assert
�� 
(
�� &
validTransformAlgorithms
�� 1
!=
��2 4
null
��5 9
,
��9 :
$str
��; ]
)
��] ^
;
��^ _
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
StringBuilder
�� #
validAlgorithmBuilder
�� 3
=
��4 5
new
��6 9
StringBuilder
��: G
(
��G H
)
��H I
;
��I J
foreach
�� 
(
�� 
string
�� 
validAlgorithm
��  .
in
��/ 1!
validC14nAlgorithms
��2 E
)
��E F
{
�� 
if
�� 
(
�� #
validAlgorithmBuilder
�� -
.
��- .
Length
��. 4
!=
��5 7
$num
��8 9
)
��9 :
{
�� #
validAlgorithmBuilder
�� -
.
��- .
Append
��. 4
(
��4 5
$str
��5 9
)
��9 :
;
��: ;
}
�� #
validAlgorithmBuilder
�� )
.
��) *
AppendFormat
��* 6
(
��6 7
$str
��7 @
,
��@ A
validAlgorithm
��B P
)
��P Q
;
��Q R
}
�� 
foreach
�� 
(
�� 
string
�� 
validAlgorithm
��  .
in
��/ 1&
validTransformAlgorithms
��2 J
)
��J K
{
�� 
if
�� 
(
�� #
validAlgorithmBuilder
�� -
.
��- .
Length
��. 4
!=
��5 7
$num
��8 9
)
��9 :
{
�� #
validAlgorithmBuilder
�� -
.
��- .
Append
��. 4
(
��4 5
$str
��5 9
)
��9 :
;
��: ;
}
�� #
validAlgorithmBuilder
�� )
.
��) *
AppendFormat
��* 6
(
��6 7
$str
��7 @
,
��@ A
validAlgorithm
��B P
)
��P Q
;
��Q R
}
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5'
Log_UnsafeTransformMethod
��5 N
,
��N O
	algorithm
��2 ;
,
��; <#
validAlgorithmBuilder
��2 G
.
��G H
ToString
��H P
(
��P Q
)
��Q R
)
��R S
;
��S T
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Information
��4 ?
,
��? @!
SignedXmlDebugEvent
��A T
.
��T U#
UnsafeTransformMethod
��U j
,
��j k

logMessage
��l v
)
��v w
;
��w x
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� %
LogNamespacePropagation
�� 4
(
��4 5
	SignedXml
��5 >
	signedXml
��? H
,
��H I
XmlNodeList
��J U

namespaces
��V `
)
��` a
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
if
�� 
(
�� 

namespaces
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
foreach
�� 
(
�� 
XmlAttribute
�� )!
propagatedNamespace
��* =
in
��> @

namespaces
��A K
)
��K L
{
�� 
string
��  
propagationMessage
�� 1
=
��2 3
string
��4 :
.
��: ;
Format
��; A
(
��A B
CultureInfo
��B M
.
��M N
InvariantCulture
��N ^
,
��^ _
SR
��B D
.
��D E&
Log_PropagatingNamespace
��E ]
,
��] ^!
propagatedNamespace
��B U
.
��U V
Name
��V Z
,
��Z [!
propagatedNamespace
��B U
.
��U V
Value
��V [
)
��[ \
;
��\ ]
	WriteLine
�� !
(
��! "
	signedXml
��" +
,
��+ ,
TraceEventType
��" 0
.
��0 1
Information
��1 <
,
��< =!
SignedXmlDebugEvent
��" 5
.
��5 6"
NamespacePropagation
��6 J
,
��J K 
propagationMessage
��" 4
)
��4 5
;
��5 6
}
�� 
}
�� 
else
�� 
{
�� 
	WriteLine
�� 
(
�� 
	signedXml
�� '
,
��' (
TraceEventType
�� ,
.
��, -
Information
��- 8
,
��8 9!
SignedXmlDebugEvent
�� 1
.
��1 2"
NamespacePropagation
��2 F
,
��F G
SR
��  
.
��  !(
Log_NoNamespacesPropagated
��! ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
Stream
�� 
LogReferenceData
�� /
(
��/ 0
	Reference
��0 9
	reference
��: C
,
��C D
Stream
��E K
data
��L P
)
��P Q
{
�� 	
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
MemoryStream
�� 
ms
�� 
=
��  !
new
��" %
MemoryStream
��& 2
(
��2 3
)
��3 4
;
��4 5
byte
�� 
[
�� 
]
�� 
buffer
�� 
=
�� 
new
��  #
byte
��$ (
[
��( )
$num
��) -
]
��- .
;
��. /
int
�� 
	readBytes
�� 
=
�� 
$num
��  !
;
��! "
do
�� 
{
�� 
	readBytes
�� 
=
�� 
data
��  $
.
��$ %
Read
��% )
(
��) *
buffer
��* 0
,
��0 1
$num
��2 3
,
��3 4
buffer
��5 ;
.
��; <
Length
��< B
)
��B C
;
��C D
ms
�� 
.
�� 
Write
�� 
(
�� 
buffer
�� #
,
��# $
$num
��% &
,
��& '
	readBytes
��( 1
)
��1 2
;
��2 3
}
�� 
while
�� 
(
�� 
	readBytes
�� "
==
��# %
buffer
��& ,
.
��, -
Length
��- 3
)
��3 4
;
��4 5
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5.
 Log_TransformedReferenceContents
��5 U
,
��U V
Encoding
��2 :
.
��: ;
UTF8
��; ?
.
��? @
	GetString
��@ I
(
��I J
ms
��J L
.
��L M
ToArray
��M T
(
��T U
)
��U V
)
��V W
)
��W X
;
��X Y
	WriteLine
�� 
(
�� 
	reference
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .
ReferenceData
��. ;
,
��; <

logMessage
�� $
)
��$ %
;
��% &
ms
�� 
.
�� 
Seek
�� 
(
�� 
$num
�� 
,
�� 

SeekOrigin
�� %
.
��% &
Begin
��& +
)
��+ ,
;
��, -
return
�� 
ms
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
data
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 

LogSigning
�� '
(
��' (
	SignedXml
��( 1
	signedXml
��2 ;
,
��; <
object
��( .
key
��/ 2
,
��2 3
ISigner
��( /"
signatureDescription
��0 D
)
��D E
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� "
signatureDescription
�� -
!=
��. 0
null
��1 5
,
��5 6
$str
��7 U
)
��U V
;
��V W
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5#
Log_SigningAsymmetric
��5 J
,
��J K

GetKeyName
��2 <
(
��< =
key
��= @
)
��@ A
,
��A B"
signatureDescription
��2 F
.
��F G
GetType
��G N
(
��N O
)
��O P
.
��P Q
Name
��Q U
,
��U V"
signatureDescription
��2 F
.
��F G
AlgorithmName
��G T
,
��T U
$str
��2 4
)
��4 5
;
��5 6
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .
Signing
��. 5
,
��5 6

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 

LogSigning
�� '
(
��' (
	SignedXml
��( 1
	signedXml
��2 ;
,
��; <
IMac
��= A
key
��B E
)
��E F
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
key
�� 
!=
�� 
null
��  $
,
��$ %
$str
��& 3
)
��3 4
;
��4 5
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5
Log_SigningHmac
��5 D
,
��D E
key
��2 5
.
��5 6
GetType
��6 =
(
��= >
)
��> ?
.
��? @
Name
��@ D
)
��D E
;
��E F
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .
Signing
��. 5
,
��5 6

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� !
LogSigningReference
�� 0
(
��0 1
	SignedXml
��1 :
	signedXml
��; D
,
��D E
	Reference
��F O
	reference
��P Y
)
��Y Z
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	reference
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5"
Log_SigningReference
��5 I
,
��I J
GetObjectId
��2 =
(
��= >
	reference
��> G
)
��G H
,
��H I
	reference
��2 ;
.
��; <
Uri
��< ?
,
��? @
	reference
��2 ;
.
��; <
Id
��< >
,
��> ?
	reference
��2 ;
.
��; <
Type
��< @
,
��@ A
	reference
��2 ;
.
��; <
DigestMethod
��< H
,
��H I
CryptoHelpers
��2 ?
.
��? @!
CreateFromKnownName
��@ S
(
��S T
	reference
��T ]
.
��] ^
DigestMethod
��^ j
)
��j k
.
��k l
GetType
��l s
(
��s t
)
��t u
.
��u v
Name
��v z
)
��z {
;
��{ |
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .
SigningReference
��. >
,
��> ?

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� $
LogVerificationFailure
�� 3
(
��3 4
	SignedXml
��4 =
	signedXml
��> G
,
��G H
string
��I O
failureLocation
��P _
)
��_ `
{
�� 	
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5$
Log_VerificationFailed
��5 K
,
��K L
failureLocation
��2 A
)
��A B
;
��B C
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .!
VerificationFailure
��. A
,
��A B

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� #
LogVerificationResult
�� 2
(
��2 3
	SignedXml
��3 <
	signedXml
��= F
,
��F G
object
��H N
key
��O R
,
��R S
bool
��T X
verified
��Y a
)
��a b
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
key
�� 
!=
�� 
null
��  $
,
��$ %
$str
��& 3
)
��3 4
;
��4 5
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 
resource
�� 
=
��  !
verified
��" *
?
��+ ,
SR
��- /
.
��/ 0/
!Log_VerificationWithKeySuccessful
��0 Q
:
��R S
SR
��- /
.
��/ 02
$Log_VerificationWithKeyNotSuccessful
��0 T
;
��T U
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
resource
��2 :
,
��: ;

GetKeyName
��2 <
(
��< =
key
��= @
)
��@ A
)
��A B
;
��B C
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .)
SignatureVerificationResult
��. I
,
��I J

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 
LogVerifyKeyUsage
�� .
(
��. /
	SignedXml
��/ 8
	signedXml
��9 B
,
��B C
X509Certificate
��D S
certificate
��T _
)��� �
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
certificate
�� $
!=
��% '
null
��( ,
,
��, -
$str
��. C
)
��C D
;
��D E
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5
Log_KeyUsages
��5 B
,
��B C
$str
��J L
,
��L M
$str
��P R
,
��R S

GetKeyName
��2 <
(
��< =
certificate
��= H
)
��H I
)
��I J
;
��J K
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .
X509Verification
��. >
,
��> ?

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
��  
LogVerifyReference
�� /
(
��/ 0
	SignedXml
��0 9
	signedXml
��: C
,
��C D
	Reference
��E N
	reference
��O X
)
��X Y
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	reference
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5!
Log_VerifyReference
��5 H
,
��H I
GetObjectId
��2 =
(
��= >
	reference
��> G
)
��G H
,
��H I
	reference
��2 ;
.
��; <
Uri
��< ?
,
��? @
	reference
��2 ;
.
��; <
Id
��< >
,
��> ?
	reference
��2 ;
.
��; <
Type
��< @
)
��@ A
;
��A B
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .
VerifyReference
��. =
,
��= >

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� $
LogVerifyReferenceHash
�� 3
(
��3 4
	SignedXml
��4 =
	signedXml
��> G
,
��G H
	Reference
��4 =
	reference
��> G
,
��G H
byte
��4 8
[
��8 9
]
��9 :

actualHash
��; E
,
��E F
byte
��4 8
[
��8 9
]
��9 :
expectedHash
��; G
)
��G H
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	reference
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 

actualHash
�� #
!=
��$ &
null
��' +
,
��+ ,
$str
��- A
)
��A B
;
��B C
Debug
�� 
.
�� 
Assert
�� 
(
�� 
expectedHash
�� %
!=
��& (
null
��) -
,
��- .
$str
��/ E
)
��E F
;
��F G
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5
Log_ReferenceHash
��5 F
,
��F G
GetObjectId
��2 =
(
��= >
	reference
��> G
)
��G H
,
��H I
	reference
��2 ;
.
��; <
DigestMethod
��< H
,
��H I
CryptoHelpers
��2 ?
.
��? @!
CreateFromKnownName
��@ S
(
��S T
	reference
��T ]
.
��] ^
DigestMethod
��^ j
)
��j k
.
��k l
GetType
��l s
(
��s t
)
��t u
.
��u v
Name
��v z
,
��z {
FormatBytes
��2 =
(
��= >

actualHash
��> H
)
��H I
,
��I J
FormatBytes
��2 =
(
��= >
expectedHash
��> J
)
��J K
)
��K L
;
��L M
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Verbose
��) 0
,
��0 1!
SignedXmlDebugEvent
�� -
.
��- .
VerifyReference
��. =
,
��= >

logMessage
�� $
)
��$ %
;
��% &
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� !
LogVerifySignedInfo
�� 0
(
��0 1
	SignedXml
��1 :
	signedXml
��; D
,
��D E$
AsymmetricKeyParameter
��1 G
key
��H K
,
��K L
ISigner
��1 8"
signatureDescription
��9 M
,
��M N
byte
��1 5
[
��5 6
]
��6 7
actualHashValue
��8 G
,
��G H
byte
��1 5
[
��5 6
]
��6 7
signatureValue
��8 F
)
��F G
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� "
signatureDescription
�� -
!=
��. 0
null
��1 5
,
��5 6
$str
��7 U
)
��U V
;
��V W
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5,
Log_VerifySignedInfoAsymmetric
��5 S
,
��S T

GetKeyName
��2 <
(
��< =
key
��= @
)
��@ A
,
��A B"
signatureDescription
��2 F
.
��F G
GetType
��G N
(
��N O
)
��O P
.
��P Q
Name
��Q U
,
��U V"
signatureDescription
��2 F
.
��F G
AlgorithmName
��G T
,
��T U
$str
��2 4
)
��4 5
;
��5 6
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .
VerifySignedInfo
��. >
,
��> ?

logMessage
�� $
)
��$ %
;
��% &
}
�� 
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 
hashLog
�� 
=
��  
string
��! '
.
��' (
Format
��( .
(
��. /
CultureInfo
��/ :
.
��: ;
InvariantCulture
��; K
,
��K L
SR
��/ 1
.
��1 2!
Log_ActualHashValue
��2 E
,
��E F
FormatBytes
��/ :
(
��: ;
actualHashValue
��; J
)
��J K
)
��K L
;
��L M
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Verbose
��4 ;
,
��; <!
SignedXmlDebugEvent
��= P
.
��P Q
VerifySignedInfo
��Q a
,
��a b
hashLog
��c j
)
��j k
;
��k l
string
�� 
signatureLog
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
CultureInfo
��4 ?
.
��? @
InvariantCulture
��@ P
,
��P Q
SR
��4 6
.
��6 7#
Log_RawSignatureValue
��7 L
,
��L M
FormatBytes
��4 ?
(
��? @
signatureValue
��@ N
)
��N O
)
��O P
;
��P Q
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Verbose
��4 ;
,
��; <!
SignedXmlDebugEvent
��= P
.
��P Q
VerifySignedInfo
��Q a
,
��a b
signatureLog
��c o
)
��o p
;
��p q
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� !
LogVerifySignedInfo
�� 0
(
��0 1
	SignedXml
��1 :
	signedXml
��; D
,
��D E
IMac
��1 5
mac
��6 9
,
��9 :
byte
��1 5
[
��5 6
]
��6 7
actualHashValue
��8 G
,
��G H
byte
��1 5
[
��5 6
]
��6 7
signatureValue
��8 F
)
��F G
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
mac
�� 
!=
�� 
null
��  $
,
��$ %
$str
��& 3
)
��3 4
;
��4 5
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��2 4
.
��4 5&
Log_VerifySignedInfoHmac
��5 M
,
��M N
mac
��2 5
.
��5 6
GetType
��6 =
(
��= >
)
��> ?
.
��? @
Name
��@ D
)
��D E
;
��E F
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� (
.
��( )
Information
��) 4
,
��4 5!
SignedXmlDebugEvent
�� -
.
��- .
VerifySignedInfo
��. >
,
��> ?

logMessage
�� $
)
��$ %
;
��% &
}
�� 
if
�� 
(
�� #
VerboseLoggingEnabled
�� %
)
��% &
{
�� 
string
�� 
hashLog
�� 
=
��  
string
��! '
.
��' (
Format
��( .
(
��. /
CultureInfo
��/ :
.
��: ;
InvariantCulture
��; K
,
��K L
SR
��/ 1
.
��1 2!
Log_ActualHashValue
��2 E
,
��E F
FormatBytes
��/ :
(
��: ;
actualHashValue
��; J
)
��J K
)
��K L
;
��L M
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Verbose
��4 ;
,
��; <!
SignedXmlDebugEvent
��= P
.
��P Q
VerifySignedInfo
��Q a
,
��a b
hashLog
��c j
)
��j k
;
��k l
string
�� 
signatureLog
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
CultureInfo
��4 ?
.
��? @
InvariantCulture
��@ P
,
��P Q
SR
��4 6
.
��6 7#
Log_RawSignatureValue
��7 L
,
��L M
FormatBytes
��4 ?
(
��? @
signatureValue
��@ N
)
��N O
)
��O P
;
��P Q
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
��% 3
.
��3 4
Verbose
��4 ;
,
��; <!
SignedXmlDebugEvent
��= P
.
��P Q
VerifySignedInfo
��Q a
,
��a b
signatureLog
��c o
)
��o p
;
��p q
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� (
LogSignedXmlRecursionLimit
�� 7
(
��7 8
	SignedXml
��8 A
	signedXml
��B K
,
��K L
	Reference
��8 A
	reference
��B K
)
��K L
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	signedXml
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
Debug
�� 
.
�� 
Assert
�� 
(
�� 
	reference
�� "
!=
��# %
null
��& *
,
��* +
$str
��, ?
)
��? @
;
��@ A
if
�� 
(
�� '
InformationLoggingEnabled
�� )
)
��) *
{
�� 
string
�� 

logMessage
�� !
=
��" #
string
��$ *
.
��* +
Format
��+ 1
(
��1 2
CultureInfo
��2 =
.
��= >
InvariantCulture
��> N
,
��N O
SR
��4 6
.
��6 7)
Log_SignedXmlRecursionLimit
��7 R
,
��R S
GetObjectId
��4 ?
(
��? @
	reference
��@ I
)
��I J
,
��J K
	reference
��4 =
.
��= >
DigestMethod
��> J
,
��J K
CryptoHelpers
��4 A
.
��A B!
CreateFromKnownName
��B U
(
��U V
	reference
��V _
.
��_ `
DigestMethod
��` l
)
��l m
.
��m n
GetType
��n u
(
��u v
)
��v w
.
��w x
Name
��x |
)
��| }
;
��} ~
	WriteLine
�� 
(
�� 
	signedXml
�� #
,
��# $
TraceEventType
�� *
.
��* +
Information
��+ 6
,
��6 7!
SignedXmlDebugEvent
�� /
.
��/ 0
VerifySignedInfo
��0 @
,
��@ A

logMessage
�� &
)
��& '
;
��' (
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
	WriteLine
�� %
(
��% &
object
��& ,
source
��- 3
,
��3 4
TraceEventType
��5 C
	eventType
��D M
,
��M N!
SignedXmlDebugEvent
��O b
eventId
��c j
,
��j k
string
��l r
data
��s w
)
��w x
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
source
�� 
!=
��  "
null
��# '
,
��' (
$str
��) 9
)
��9 :
;
��: ;
Debug
�� 
.
�� 
Assert
�� 
(
�� 
!
�� 
string
��  
.
��  !
IsNullOrEmpty
��! .
(
��. /
data
��/ 3
)
��3 4
,
��4 5
$str
��6 S
)
��S T
;
��T U
Debug
�� 
.
�� 
Assert
�� 
(
�� '
InformationLoggingEnabled
�� 2
,
��2 3
$str
��4 O
)
��O P
;
��P Q
s_traceSource
�� 
.
�� 

TraceEvent
�� $
(
��$ %
	eventType
��% .
,
��. /
(
��$ %
int
��% (
)
��( )
eventId
��) 0
,
��0 1
$str
��$ 4
,
��4 5
GetObjectId
��$ /
(
��/ 0
source
��0 6
)
��6 7
,
��7 8
eventId
��$ +
,
��+ ,
data
��$ (
)
��( )
;
��) *
}
�� 	
}
�� 
}�� ��
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
�� 
{
�� 
enc
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$str
��0 C
)
��C D
;
��D E
enc
�� 
.
�� 
Init
�� 
(
�� 
true
�� 
,
�� 
new
�� "
KeyParameter
��# /
(
��/ 0
rgbKey
��0 6
)
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
N
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
byte
�� 
[
�� 
]
�� 
temp
�� 
=
��  !
new
��" %
byte
��& *
[
��* +
s_rgbAES_KW_IV
��+ 9
.
��9 :
Length
��: @
+
��A B
rgbWrappedKeyData
��C T
.
��T U
Length
��U [
]
��[ \
;
��\ ]
Buffer
�� 
.
�� 
	BlockCopy
�� $
(
��$ %
s_rgbAES_KW_IV
��% 3
,
��3 4
$num
��5 6
,
��6 7
temp
��8 <
,
��< =
$num
��> ?
,
��? @
s_rgbAES_KW_IV
��A O
.
��O P
Length
��P V
)
��V W
;
��W X
Buffer
�� 
.
�� 
	BlockCopy
�� $
(
��$ %
rgbWrappedKeyData
��% 6
,
��6 7
$num
��8 9
,
��9 :
temp
��; ?
,
��? @
s_rgbAES_KW_IV
��A O
.
��O P
Length
��P V
,
��V W
rgbWrappedKeyData
��X i
.
��i j
Length
��j p
)
��p q
;
��q r
return
�� 
enc
�� 
.
�� 
DoFinal
�� &
(
��& '
temp
��' +
)
��+ ,
;
��, -
}
�� 
long
�� 
t
�� 
=
�� 
$num
�� 
;
�� 
byte
�� 
[
�� 
]
�� 
	rgbOutput
��  
=
��! "
new
��# &
byte
��' +
[
��+ ,
(
��, -
N
��- .
+
��/ 0
$num
��1 2
)
��2 3
<<
��4 6
$num
��7 8
]
��8 9
;
��9 :
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !
rgbWrappedKeyData
��! 2
,
��2 3
$num
��4 5
,
��5 6
	rgbOutput
��7 @
,
��@ A
$num
��B C
,
��C D
rgbWrappedKeyData
��E V
.
��V W
Length
��W ]
)
��] ^
;
��^ _
byte
�� 
[
�� 
]
�� 
rgbA
�� 
=
�� 
new
�� !
byte
��" &
[
��& '
$num
��' (
]
��( )
;
��) *
byte
�� 
[
�� 
]
�� 
rgbBlock
�� 
=
��  !
new
��" %
byte
��& *
[
��* +
$num
��+ -
]
��- .
;
��. /
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !
s_rgbAES_KW_IV
��! /
,
��/ 0
$num
��1 2
,
��2 3
rgbA
��4 8
,
��8 9
$num
��: ;
,
��; <
$num
��= >
)
��> ?
;
��? @
for
�� 
(
�� 
int
�� 
j
�� 
=
�� 
$num
�� 
;
�� 
j
��  !
<=
��" $
$num
��% &
;
��& '
j
��( )
++
��) +
)
��+ ,
{
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
��  
$num
��! "
;
��" #
i
��$ %
<=
��& (
N
��) *
;
��* +
i
��, -
++
��- /
)
��/ 0
{
�� 
t
�� 
=
�� 
i
�� 
+
�� 
j
��  !
*
��" #
N
��$ %
;
��% &
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
rgbA
��) -
,
��- .
$num
��/ 0
,
��0 1
rgbBlock
��2 :
,
��: ;
$num
��< =
,
��= >
$num
��? @
)
��@ A
;
��A B
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
	rgbOutput
��) 2
,
��2 3
$num
��4 5
*
��6 7
i
��8 9
,
��9 :
rgbBlock
��; C
,
��C D
$num
��E F
,
��F G
$num
��H I
)
��I J
;
��J K
byte
�� 
[
�� 
]
�� 
rgbB
�� #
=
��$ %
enc
��& )
.
��) *
DoFinal
��* 1
(
��1 2
rgbBlock
��2 :
)
��: ;
;
��; <
for
�� 
(
�� 
int
��  
k
��! "
=
��# $
$num
��% &
;
��& '
k
��( )
<
��* +
$num
��, -
;
��- .
k
��/ 0
++
��0 2
)
��2 3
{
�� 
byte
��  
tmp
��! $
=
��% &
(
��' (
byte
��( ,
)
��, -
(
��- .
(
��. /
t
��/ 0
>>
��1 3
(
��4 5
$num
��5 6
*
��7 8
(
��9 :
$num
��: ;
-
��< =
k
��> ?
)
��? @
)
��@ A
)
��A B
&
��C D
$num
��E I
)
��I J
;
��J K
rgbA
��  
[
��  !
k
��! "
]
��" #
=
��$ %
(
��& '
byte
��' +
)
��+ ,
(
��, -
tmp
��- 0
^
��1 2
rgbB
��3 7
[
��7 8
k
��8 9
]
��9 :
)
��: ;
;
��; <
}
�� 
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
rgbB
��) -
,
��- .
$num
��/ 0
,
��0 1
	rgbOutput
��2 ;
,
��; <
$num
��= >
*
��? @
i
��A B
,
��B C
$num
��D E
)
��E F
;
��F G
}
�� 
}
�� 
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !
rgbA
��! %
,
��% &
$num
��' (
,
��( )
	rgbOutput
��* 3
,
��3 4
$num
��5 6
,
��6 7
$num
��8 9
)
��9 :
;
��: ;
return
�� 
	rgbOutput
��  
;
��  !
}
�� 
finally
�� 
{
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
AESKeyWrapDecrypt
�� 0
(
��0 1
byte
��1 5
[
��5 6
]
��6 7
rgbKey
��8 >
,
��> ?
byte
��@ D
[
��D E
]
��E F(
rgbEncryptedWrappedKeyData
��G a
)
��a b
{
�� 	
int
�� 
N
�� 
=
�� 
(
�� (
rgbEncryptedWrappedKeyData
�� /
.
��/ 0
Length
��0 6
>>
��7 9
$num
��: ;
)
��; <
-
��= >
$num
��? @
;
��@ A
if
�� 
(
�� 
(
�� (
rgbEncryptedWrappedKeyData
�� +
.
��+ ,
Length
��, 2
%
��3 4
$num
��5 6
!=
��7 9
$num
��: ;
)
��; <
||
��= ?
N
��@ A
<=
��B D
$num
��E F
)
��F G
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q,
Cryptography_Xml_KW_BadKeySize
��Q o
)
��o p
;
��p q
byte
�� 
[
�� 
]
�� 
	rgbOutput
�� 
=
�� 
new
�� "
byte
��# '
[
��' (
N
��( )
<<
��* ,
$num
��- .
]
��. /
;
��/ 0
IBufferedCipher
�� 
dec
�� 
=
��  !
null
��" &
;
��& '
try
�� 
{
�� 
dec
�� 
=
�� 
CipherUtilities
�� %
.
��% &
	GetCipher
��& /
(
��/ 0
$str
��0 C
)
��C D
;
��D E
dec
�� 
.
�� 
Init
�� 
(
�� 
false
�� 
,
�� 
new
��  #
KeyParameter
��$ 0
(
��0 1
rgbKey
��1 7
)
��7 8
)
��8 9
;
��9 :
if
�� 
(
�� 
N
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
byte
�� 
[
�� 
]
�� 
temp
�� 
=
��  !
dec
��" %
.
��% &
DoFinal
��& -
(
��- .(
rgbEncryptedWrappedKeyData
��. H
)
��H I
;
��I J
for
�� 
(
�� 
int
�� 
index
�� "
=
��# $
$num
��% &
;
��& '
index
��( -
<
��. /
$num
��0 1
;
��1 2
index
��3 8
++
��8 :
)
��: ;
if
�� 
(
�� 
temp
��  
[
��  !
index
��! &
]
��& '
!=
��( *
s_rgbAES_KW_IV
��+ 9
[
��9 :
index
��: ?
]
��? @
)
��@ A
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ]0
"Cryptography_Xml_BadWrappedKeySize
��] 
)�� �
;��� �
Buffer
�� 
.
�� 
	BlockCopy
�� $
(
��$ %
temp
��% )
,
��) *
$num
��+ ,
,
��, -
	rgbOutput
��. 7
,
��7 8
$num
��9 :
,
��: ;
$num
��< =
)
��= >
;
��> ?
return
�� 
	rgbOutput
�� $
;
��$ %
}
�� 
long
�� 
t
�� 
=
�� 
$num
�� 
;
�� 
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !(
rgbEncryptedWrappedKeyData
��! ;
,
��; <
$num
��= >
,
��> ?
	rgbOutput
��@ I
,
��I J
$num
��K L
,
��L M
	rgbOutput
��N W
.
��W X
Length
��X ^
)
��^ _
;
��_ `
byte
�� 
[
�� 
]
�� 
rgbA
�� 
=
�� 
new
�� !
byte
��" &
[
��& '
$num
��' (
]
��( )
;
��) *
byte
�� 
[
�� 
]
�� 
rgbBlock
�� 
=
��  !
new
��" %
byte
��& *
[
��* +
$num
��+ -
]
��- .
;
��. /
Buffer
�� 
.
�� 
	BlockCopy
��  
(
��  !(
rgbEncryptedWrappedKeyData
��! ;
,
��; <
$num
��= >
,
��> ?
rgbA
��@ D
,
��D E
$num
��F G
,
��G H
$num
��I J
)
��J K
;
��K L
for
�� 
(
�� 
int
�� 
j
�� 
=
�� 
$num
�� 
;
�� 
j
��  !
>=
��" $
$num
��% &
;
��& '
j
��( )
--
��) +
)
��+ ,
{
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
��  
N
��! "
;
��" #
i
��$ %
>=
��& (
$num
��) *
;
��* +
i
��, -
--
��- /
)
��/ 0
{
�� 
t
�� 
=
�� 
i
�� 
+
�� 
j
��  !
*
��" #
N
��$ %
;
��% &
for
�� 
(
�� 
int
��  
k
��! "
=
��# $
$num
��% &
;
��& '
k
��( )
<
��* +
$num
��, -
;
��- .
k
��/ 0
++
��0 2
)
��2 3
{
�� 
byte
��  
tmp
��! $
=
��% &
(
��' (
byte
��( ,
)
��, -
(
��- .
(
��. /
t
��/ 0
>>
��1 3
(
��4 5
$num
��5 6
*
��7 8
(
��9 :
$num
��: ;
-
��< =
k
��> ?
)
��? @
)
��@ A
)
��A B
&
��C D
$num
��E I
)
��I J
;
��J K
rgbA
��  
[
��  !
k
��! "
]
��" #
^=
��$ &
tmp
��' *
;
��* +
}
�� 
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
rgbA
��) -
,
��- .
$num
��/ 0
,
��0 1
rgbBlock
��2 :
,
��: ;
$num
��< =
,
��= >
$num
��? @
)
��@ A
;
��A B
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
	rgbOutput
��) 2
,
��2 3
$num
��4 5
*
��6 7
(
��8 9
i
��9 :
-
��; <
$num
��= >
)
��> ?
,
��? @
rgbBlock
��A I
,
��I J
$num
��K L
,
��L M
$num
��N O
)
��O P
;
��P Q
byte
�� 
[
�� 
]
�� 
rgbB
�� #
=
��$ %
dec
��& )
.
��) *
DoFinal
��* 1
(
��1 2
rgbBlock
��2 :
)
��: ;
;
��; <
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
rgbB
��) -
,
��- .
$num
��/ 0
,
��0 1
	rgbOutput
��2 ;
,
��; <
$num
��= >
*
��? @
(
��A B
i
��B C
-
��D E
$num
��F G
)
��G H
,
��H I
$num
��J K
)
��K L
;
��L M
Buffer
�� 
.
�� 
	BlockCopy
�� (
(
��( )
rgbB
��) -
,
��- .
$num
��/ 0
,
��0 1
rgbA
��2 6
,
��6 7
$num
��8 9
,
��9 :
$num
��; <
)
��< =
;
��= >
}
�� 
}
�� 
for
�� 
(
�� 
int
�� 
index
�� 
=
��  
$num
��! "
;
��" #
index
��$ )
<
��* +
$num
��, -
;
��- .
index
��/ 4
++
��4 6
)
��6 7
if
�� 
(
�� 
rgbA
�� 
[
�� 
index
�� "
]
��" #
!=
��$ &
s_rgbAES_KW_IV
��' 5
[
��5 6
index
��6 ;
]
��; <
)
��< =
throw
�� 
new
�� !
System
��" (
.
��( )
Security
��) 1
.
��1 2
Cryptography
��2 >
.
��> ?$
CryptographicException
��? U
(
��U V
SR
��V X
.
��X Y0
"Cryptography_Xml_BadWrappedKeySize
��Y {
)
��{ |
;
��| }
return
�� 
	rgbOutput
��  
;
��  !
}
�� 
finally
�� 
{
�� 
}
�� 
}
�� 	
}
�� 
}�� �w
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
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
)
��7 8
{
�� 	
return
�� 
GetXml
�� 
(
�� 
document
�� "
,
��" #
$str
��$ /
)
��/ 0
;
��0 1
}
�� 	
internal
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
,
��7 8
string
��9 ?
name
��@ D
)
��D E
{
�� 	

XmlElement
�� 
transformElement
�� '
=
��( )
document
��* 2
.
��2 3
CreateElement
��3 @
(
��@ A
name
��A E
,
��E F
	SignedXml
��G P
.
��P Q!
XmlDsigNamespaceUrl
��Q d
)
��d e
;
��e f
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
	Algorithm
��& /
)
��/ 0
)
��0 1
transformElement
��  
.
��  !
SetAttribute
��! -
(
��- .
$str
��. 9
,
��9 :
	Algorithm
��; D
)
��D E
;
��E F
XmlNodeList
�� 
children
��  
=
��! "
GetInnerXml
��# .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
children
�� 
!=
�� 
null
��  
)
��  !
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
children
��) 1
)
��1 2
{
�� 
transformElement
�� $
.
��$ %
AppendChild
��% 0
(
��0 1
document
��1 9
.
��9 :

ImportNode
��: D
(
��D E
node
��E I
,
��I J
true
��K O
)
��O P
)
��P Q
;
��Q R
}
�� 
}
�� 
return
�� 
transformElement
�� #
;
��# $
}
�� 	
public
�� 
abstract
�� 
void
�� 
LoadInnerXml
�� )
(
��) *
XmlNodeList
��* 5
nodeList
��6 >
)
��> ?
;
��? @
	protected
�� 
abstract
�� 
XmlNodeList
�� &
GetInnerXml
��' 2
(
��2 3
)
��3 4
;
��4 5
public
�� 
abstract
�� 
void
�� 
	LoadInput
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
;
��2 3
public
�� 
abstract
�� 
object
�� 
	GetOutput
�� (
(
��( )
)
��) *
;
��* +
public
�� 
abstract
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
;
��3 4
public
�� 
virtual
�� 
void
�� 
GetDigestedOutput
�� -
(
��- .
IHash
��. 3
hash
��4 8
)
��8 9
{
�� 	
byte
�� 
[
�� 
]
�� 
buffer
�� 
=
�� 
new
�� 
byte
��  $
[
��$ %
$num
��% )
]
��) *
;
��* +
int
�� 
	bytesRead
�� 
;
�� 
var
�� 
inputStream
�� 
=
�� 
(
�� 
Stream
�� %
)
��% &
	GetOutput
��& /
(
��/ 0
typeof
��0 6
(
��6 7
Stream
��7 =
)
��= >
)
��> ?
;
��? @
hash
�� 
.
�� 
Reset
�� 
(
�� 
)
�� 
;
�� 
while
�� 
(
�� 
(
�� 
	bytesRead
�� 
=
�� 
inputStream
��  +
.
��+ ,
Read
��, 0
(
��0 1
buffer
��1 7
,
��7 8
$num
��9 :
,
��: ;
buffer
��< B
.
��B C
Length
��C I
)
��I J
)
��J K
>
��L M
$num
��N O
)
��O P
{
��Q R
hash
�� 
.
�� 
BlockUpdate
��  
(
��  !
buffer
��! '
,
��' (
$num
��) *
,
��* +
	bytesRead
��, 5
)
��5 6
;
��6 7
}
�� 
}
�� 	
public
�� 

XmlElement
�� 
Context
�� !
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_context
�� 
!=
�� 
null
��  $
)
��$ %
return
�� 
_context
�� #
;
��# $
	Reference
�� 
	reference
�� #
=
��$ %
	Reference
��& /
;
��/ 0
	SignedXml
�� 
	signedXml
�� #
=
��$ %
(
��& '
	reference
��' 0
==
��1 3
null
��4 8
?
��9 :
	SignedXml
��; D
:
��E F
	reference
��G P
.
��P Q
	SignedXml
��Q Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	signedXml
�� 
==
��  
null
��! %
)
��% &
return
�� 
null
�� 
;
��  
return
�� 
	signedXml
��  
.
��  !
_context
��! )
;
��) *
}
�� 
set
�� 
{
�� 
_context
�� 
=
�� 
value
��  
;
��  !
}
�� 
}
�� 	
public
�� 
	Hashtable
�� "
PropagatedNamespaces
�� -
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� #
_propagatedNamespaces
�� )
!=
��* ,
null
��- 1
)
��1 2
return
�� #
_propagatedNamespaces
�� 0
;
��0 1
	Reference
�� 
	reference
�� #
=
��$ %
	Reference
��& /
;
��/ 0
	SignedXml
�� 
	signedXml
�� #
=
��$ %
(
��& '
	reference
��' 0
==
��1 3
null
��4 8
?
��9 :
	SignedXml
��; D
:
��E F
	reference
��G P
.
��P Q
	SignedXml
��Q Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	reference
�� 
!=
��  
null
��! %
&&
��& (
(
�� 
(
�� 
	reference
�� 
.
��  !
ReferenceTargetType
��  3
!=
��4 6!
ReferenceTargetType
��7 J
.
��J K
UriReference
��K W
)
��W X
||
��Y [
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� *
(
��* +
	reference
��+ 4
.
��4 5
Uri
��5 8
)
��8 9
||
��: <
	reference
��= F
.
��F G
Uri
��G J
[
��J K
$num
��K L
]
��L M
!=
��N P
$char
��Q T
)
��T U
)
��U V
)
��V W
{
�� #
_propagatedNamespaces
�� )
=
��* +
new
��, /
	Hashtable
��0 9
(
��9 :
$num
��: ;
)
��; <
;
��< =
return
�� #
_propagatedNamespaces
�� 0
;
��0 1
}
�� "
CanonicalXmlNodeList
�� $

namespaces
��% /
=
��0 1
null
��2 6
;
��6 7
if
�� 
(
�� 
	reference
�� 
!=
��  
null
��! %
)
��% &

namespaces
�� 
=
��  
	reference
��! *
.
��* +
_namespaces
��+ 6
;
��6 7
else
�� 
if
�� 
(
�� 
	signedXml
�� "
?
��" #
.
��# $
_context
��$ ,
!=
��- /
null
��0 4
)
��4 5

namespaces
�� 
=
��  
Utils
��! &
.
��& '%
GetPropagatedAttributes
��' >
(
��> ?
	signedXml
��? H
.
��H I
_context
��I Q
)
��Q R
;
��R S
if
�� 
(
�� 

namespaces
�� 
==
�� !
null
��" &
)
��& '
{
�� #
_propagatedNamespaces
�� )
=
��* +
new
��, /
	Hashtable
��0 9
(
��9 :
$num
��: ;
)
��; <
;
��< =
return
�� #
_propagatedNamespaces
�� 0
;
��0 1
}
�� #
_propagatedNamespaces
�� %
=
��& '
new
��( +
	Hashtable
��, 5
(
��5 6

namespaces
��6 @
.
��@ A
Count
��A F
)
��F G
;
��G H
foreach
�� 
(
�� 
XmlNode
��  
attrib
��! '
in
��( *

namespaces
��+ 5
)
��5 6
{
�� 
string
�� 
key
�� 
=
��  
(
��! "
(
��" #
attrib
��# )
.
��) *
Prefix
��* 0
.
��0 1
Length
��1 7
>
��8 9
$num
��: ;
)
��; <
?
��= >
attrib
��? E
.
��E F
Prefix
��F L
+
��M N
$str
��O R
+
��S T
attrib
��U [
.
��[ \
	LocalName
��\ e
:
��f g
attrib
��h n
.
��n o
	LocalName
��o x
)
��x y
;
��y z
if
�� 
(
�� 
!
�� #
_propagatedNamespaces
�� .
.
��. /
Contains
��/ 7
(
��7 8
key
��8 ;
)
��; <
)
��< =#
_propagatedNamespaces
�� -
.
��- .
Add
��. 1
(
��1 2
key
��2 5
,
��5 6
attrib
��7 =
.
��= >
Value
��> C
)
��C D
;
��D E
}
�� 
return
�� #
_propagatedNamespaces
�� ,
;
��, -
}
�� 
}
�� 	
}
�� 
}�� ��
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
,Cryptography_Xml_TransformIncorrectInputType	ee] �
)
ee� �
;
ee� �
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
,Cryptography_Xml_TransformIncorrectInputType	uu] �
)
uu� �
;
uu� �
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
�� 
.
�� 
Close
�� $
(
��$ %
)
��% &
;
��& '
continue
�� $
;
��$ %
}
�� 
else
�� 
{
�� 
throw
�� !
new
��" %
System
��& ,
.
��, -
Security
��- 5
.
��5 6
Cryptography
��6 B
.
��B C$
CryptographicException
��C Y
(
��Y Z
SR
��Z \
.
��\ ];
,Cryptography_Xml_TransformIncorrectInputType��] �
)��� �
;��� �
}
�� 
}
�� 
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U;
,Cryptography_Xml_TransformIncorrectInputType��U �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
currentInput
�� 
is
�� 
Stream
��  &
)
��& '
{
�� 
return
�� 
currentInput
�� #
as
��$ &
Stream
��' -
;
��- .
}
�� 
if
�� 
(
�� 
currentInput
�� 
is
�� 
XmlNodeList
��  +
)
��+ ,
{
�� 
CanonicalXml
�� 
c14n
�� !
=
��" #
new
��$ '
CanonicalXml
��( 4
(
��4 5
(
��5 6
XmlNodeList
��6 A
)
��A B
currentInput
��B N
,
��N O
resolver
��P X
,
��X Y
false
��Z _
)
��_ `
;
��` a
MemoryStream
�� 
ms
�� 
=
��  !
new
��" %
MemoryStream
��& 2
(
��2 3
c14n
��3 7
.
��7 8
GetBytes
��8 @
(
��@ A
)
��A B
)
��B C
;
��C D
return
�� 
ms
�� 
;
�� 
}
�� 
if
�� 
(
�� 
currentInput
�� 
is
�� 
XmlDocument
��  +
)
��+ ,
{
�� 
CanonicalXml
�� 
c14n
�� !
=
��" #
new
��$ '
CanonicalXml
��( 4
(
��4 5
(
��5 6
XmlDocument
��6 A
)
��A B
currentInput
��B N
,
��N O
resolver
��P X
)
��X Y
;
��Y Z
MemoryStream
�� 
ms
�� 
=
��  !
new
��" %
MemoryStream
��& 2
(
��2 3
c14n
��3 7
.
��7 8
GetBytes
��8 @
(
��@ A
)
��A B
)
��B C
;
��C D
return
�� 
ms
�� 
;
�� 
}
�� 
throw
�� 
new
�� 
System
�� 
.
�� 
Security
�� %
.
��% &
Cryptography
��& 2
.
��2 3$
CryptographicException
��3 I
(
��I J
SR
��J L
.
��L M:
,Cryptography_Xml_TransformIncorrectInputType
��M y
)
��y z
;
��z {
}
�� 	
internal
�� 
Stream
�� $
TransformToOctetStream
�� .
(
��. /
Stream
��/ 5
input
��6 ;
,
��; <
XmlResolver
��= H
resolver
��I Q
,
��Q R
string
��S Y
baseUri
��Z a
)
��a b
{
�� 	
return
�� $
TransformToOctetStream
�� )
(
��) *
input
��* /
,
��/ 0
typeof
��1 7
(
��7 8
Stream
��8 >
)
��> ?
,
��? @
resolver
��A I
,
��I J
baseUri
��K R
)
��R S
;
��S T
}
�� 	
internal
�� 
Stream
�� $
TransformToOctetStream
�� .
(
��. /
XmlDocument
��/ :
document
��; C
,
��C D
XmlResolver
��E P
resolver
��Q Y
,
��Y Z
string
��[ a
baseUri
��b i
)
��i j
{
�� 	
return
�� $
TransformToOctetStream
�� )
(
��) *
document
��* 2
,
��2 3
typeof
��4 :
(
��: ;
XmlDocument
��; F
)
��F G
,
��G H
resolver
��I Q
,
��Q R
baseUri
��S Z
)
��Z [
;
��[ \
}
�� 	
internal
�� 

XmlElement
�� 
GetXml
�� "
(
��" #
XmlDocument
��# .
document
��/ 7
,
��7 8
string
��9 ?
ns
��@ B
)
��B C
{
�� 	

XmlElement
�� 
transformsElement
�� (
=
��) *
document
��+ 3
.
��3 4
CreateElement
��4 A
(
��A B
$str
��B N
,
��N O
ns
��P R
)
��R S
;
��S T
foreach
�� 
(
�� 
	Transform
�� 
	transform
�� (
in
��) +
_transforms
��, 7
)
��7 8
{
�� 
if
�� 
(
�� 
	transform
�� 
!=
��  
null
��! %
)
��% &
{
�� 

XmlElement
�� 
transformElement
�� /
=
��0 1
	transform
��2 ;
.
��; <
GetXml
��< B
(
��B C
document
��C K
)
��K L
;
��L M
if
�� 
(
�� 
transformElement
�� (
!=
��) +
null
��, 0
)
��0 1
transformsElement
�� )
.
��) *
AppendChild
��* 5
(
��5 6
transformElement
��6 F
)
��F G
;
��G H
}
�� 
}
�� 
return
�� 
transformsElement
�� $
;
��$ %
}
�� 	
internal
�� 
void
�� 
LoadXml
�� 
(
�� 

XmlElement
�� (
value
��) .
)
��. /
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
value
��7 <
)
��< =
)
��= >
;
��> ?!
XmlNamespaceManager
�� 
nsm
��  #
=
��$ %
new
��& )!
XmlNamespaceManager
��* =
(
��= >
value
��> C
.
��C D
OwnerDocument
��D Q
.
��Q R
	NameTable
��R [
)
��[ \
;
��\ ]
nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� !
,
��! "
	SignedXml
��# ,
.
��, -!
XmlDsigNamespaceUrl
��- @
)
��@ A
;
��A B
XmlNodeList
�� 
transformNodes
�� &
=
��' (
value
��) .
.
��. /
SelectNodes
��/ :
(
��: ;
$str
��; I
,
��I J
nsm
��K N
)
��N O
;
��O P
if
�� 
(
�� 
transformNodes
�� 
.
�� 
Count
�� $
==
��% '
$num
��( )
)
��) *
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q-
Cryptography_Xml_InvalidElement
��Q p
,
��p q
$str
��r ~
)
��~ 
;�� �
_transforms
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
��  
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
transformNodes
��  .
.
��. /
Count
��/ 4
;
��4 5
++
��6 8
i
��8 9
)
��9 :
{
�� 

XmlElement
�� 
transformElement
�� +
=
��, -
(
��. /

XmlElement
��/ 9
)
��9 :
transformNodes
��: H
.
��H I
Item
��I M
(
��M N
i
��N O
)
��O P
;
��P Q
string
�� 
	algorithm
��  
=
��! "
Utils
��# (
.
��( )
GetAttribute
��) 5
(
��5 6
transformElement
��6 F
,
��F G
$str
��H S
,
��S T
	SignedXml
��U ^
.
��^ _!
XmlDsigNamespaceUrl
��_ r
)
��r s
;
��s t
	Transform
�� 
	transform
�� #
=
��$ %
CryptoHelpers
��& 3
.
��3 4
CreateFromName
��4 B
<
��B C
	Transform
��C L
>
��L M
(
��M N
	algorithm
��N W
)
��W X
;
��X Y
if
�� 
(
�� 
	transform
�� 
==
��  
null
��! %
)
��% &
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_UnknownTransform
��U v
)
��v w
;
��w x
	transform
�� 
.
�� 
LoadInnerXml
�� &
(
��& '
transformElement
��' 7
.
��7 8

ChildNodes
��8 B
)
��B C
;
��C D
_transforms
�� 
.
�� 
Add
�� 
(
��  
	transform
��  )
)
��) *
;
��* +
}
�� 
}
�� 	
}
�� 
}�� �
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
} ��
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
.	ee �
Name
ee� �
==
ee� �
$str
ee� �
||
ee� �
attr
ee� �
.
ee� �
Name
ee� �
==
ee� �
$str
ee� �
;
ee� �
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
Equals	tt| �
(
tt� �
$str
tt� �
)
tt� �
)
tt� �
)
tt� �
;
tt� �
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
�� 
b2
�� 
=
��  
IsXmlNamespaceNode
�� (
(
��( )
n
��) *
)
��* +
;
��+ ,
return
�� 
b1
�� 
||
�� 
b2
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� )
IsEmptyDefaultNamespaceNode
�� 8
(
��8 9
XmlNode
��9 @
n
��A B
)
��B C
{
�� 	
return
�� $
IsDefaultNamespaceNode
�� )
(
��) *
n
��* +
)
��+ ,
&&
��- /
n
��0 1
.
��1 2
Value
��2 7
.
��7 8
Length
��8 >
==
��? A
$num
��B C
;
��C D
}
�� 	
internal
�� 
static
�� 
string
��  
GetNamespacePrefix
�� 1
(
��1 2
XmlAttribute
��2 >
a
��? @
)
��@ A
{
�� 	
Debug
�� 
.
�� 
Assert
�� 
(
�� 
IsNamespaceNode
�� (
(
��( )
a
��) *
)
��* +
||
��, . 
IsXmlNamespaceNode
��/ A
(
��A B
a
��B C
)
��C D
)
��D E
;
��E F
return
�� 
a
�� 
.
�� 
Prefix
�� 
.
�� 
Length
�� "
==
��# %
$num
��& '
?
��( )
string
��* 0
.
��0 1
Empty
��1 6
:
��7 8
a
��9 :
.
��: ;
	LocalName
��; D
;
��D E
}
�� 	
internal
�� 
static
�� 
bool
��  
HasNamespacePrefix
�� /
(
��/ 0
XmlAttribute
��0 <
a
��= >
,
��> ?
string
��@ F
nsPrefix
��G O
)
��O P
{
�� 	
return
��  
GetNamespacePrefix
�� %
(
��% &
a
��& '
)
��' (
.
��( )
Equals
��) /
(
��/ 0
nsPrefix
��0 8
)
��8 9
;
��9 :
}
�� 	
internal
�� 
static
�� 
bool
�� )
IsNonRedundantNamespaceDecl
�� 8
(
��8 9
XmlAttribute
��9 E
a
��F G
,
��G H
XmlAttribute
��I U+
nearestAncestorWithSamePrefix
��V s
)
��s t
{
�� 	
if
�� 
(
�� +
nearestAncestorWithSamePrefix
�� -
==
��. 0
null
��1 5
)
��5 6
return
�� 
!
�� )
IsEmptyDefaultNamespaceNode
�� 3
(
��3 4
a
��4 5
)
��5 6
;
��6 7
else
�� 
return
�� 
!
�� +
nearestAncestorWithSamePrefix
�� 5
.
��5 6
Value
��6 ;
.
��; <
Equals
��< B
(
��B C
a
��C D
.
��D E
Value
��E J
)
��J K
;
��K L
}
�� 	
internal
�� 
static
�� 
bool
�� '
IsXmlPrefixDefinitionNode
�� 6
(
��6 7
XmlAttribute
��7 C
a
��D E
)
��E F
{
�� 	
return
�� 
false
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
string
��  
DiscardWhiteSpaces
�� 1
(
��1 2
string
��2 8
inputBuffer
��9 D
)
��D E
{
�� 	
return
��  
DiscardWhiteSpaces
�� %
(
��% &
inputBuffer
��& 1
,
��1 2
$num
��3 4
,
��4 5
inputBuffer
��6 A
.
��A B
Length
��B H
)
��H I
;
��I J
}
�� 	
internal
�� 
static
�� 
string
��  
DiscardWhiteSpaces
�� 1
(
��1 2
string
��2 8
inputBuffer
��9 D
,
��D E
int
��F I
inputOffset
��J U
,
��U V
int
��W Z

inputCount
��[ e
)
��e f
{
�� 	
int
�� 
i
�� 
,
�� 
iCount
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 

inputCount
�� &
;
��& '
i
��( )
++
��) +
)
��+ ,
if
�� 
(
�� 
char
�� 
.
�� 
IsWhiteSpace
�� %
(
��% &
inputBuffer
��& 1
[
��1 2
inputOffset
��2 =
+
��> ?
i
��@ A
]
��A B
)
��B C
)
��C D
iCount
��E K
++
��K M
;
��M N
char
�� 
[
�� 
]
�� 
rgbOut
�� 
=
�� 
new
�� 
char
��  $
[
��$ %

inputCount
��% /
-
��0 1
iCount
��2 8
]
��8 9
;
��9 :
iCount
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 

inputCount
�� &
;
��& '
i
��( )
++
��) +
)
��+ ,
if
�� 
(
�� 
!
�� 
char
�� 
.
�� 
IsWhiteSpace
�� &
(
��& '
inputBuffer
��' 2
[
��2 3
inputOffset
��3 >
+
��? @
i
��A B
]
��B C
)
��C D
)
��D E
{
�� 
rgbOut
�� 
[
�� 
iCount
�� !
++
��! #
]
��# $
=
��% &
inputBuffer
��' 2
[
��2 3
inputOffset
��3 >
+
��? @
i
��A B
]
��B C
;
��C D
}
�� 
return
�� 
new
�� 
string
�� 
(
�� 
rgbOut
�� $
)
��$ %
;
��% &
}
�� 	
internal
�� 
static
�� 
void
�� %
SBReplaceCharWithString
�� 4
(
��4 5
StringBuilder
��5 B
sb
��C E
,
��E F
char
��G K
oldChar
��L S
,
��S T
string
��U [
	newString
��\ e
)
��e f
{
�� 	
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
int
�� 
newStringLength
�� 
=
��  !
	newString
��" +
.
��+ ,
Length
��, 2
;
��2 3
while
�� 
(
�� 
i
�� 
<
�� 
sb
�� 
.
�� 
Length
��  
)
��  !
{
�� 
if
�� 
(
�� 
sb
�� 
[
�� 
i
�� 
]
�� 
==
�� 
oldChar
�� $
)
��$ %
{
�� 
sb
�� 
.
�� 
Remove
�� 
(
�� 
i
�� 
,
��  
$num
��! "
)
��" #
;
��# $
sb
�� 
.
�� 
Insert
�� 
(
�� 
i
�� 
,
��  
	newString
��! *
)
��* +
;
��+ ,
i
�� 
+=
�� 
newStringLength
�� (
;
��( )
}
�� 
else
�� 
i
�� 
++
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
	XmlReader
�� !#
PreProcessStreamInput
��" 7
(
��7 8
Stream
��8 >
inputStream
��? J
,
��J K
XmlResolver
��L W
xmlResolver
��X c
,
��c d
string
��e k
baseUri
��l s
)
��s t
{
�� 	
XmlReaderSettings
�� 
settings
�� &
=
��' ((
GetSecureXmlReaderSettings
��) C
(
��C D
xmlResolver
��D O
)
��O P
;
��P Q
	XmlReader
�� 
reader
�� 
=
�� 
	XmlReader
�� (
.
��( )
Create
��) /
(
��/ 0
inputStream
��0 ;
,
��; <
settings
��= E
,
��E F
baseUri
��G N
)
��N O
;
��O P
return
�� 
reader
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
XmlReaderSettings
�� )(
GetSecureXmlReaderSettings
��* D
(
��D E
XmlResolver
��E P
xmlResolver
��Q \
)
��\ ]
{
�� 	
XmlReaderSettings
�� 
settings
�� &
=
��' (
new
��) ,
XmlReaderSettings
��- >
(
��> ?
)
��? @
;
��@ A
settings
�� 
.
�� 
XmlResolver
��  
=
��! "
xmlResolver
��# .
;
��. /
settings
�� 
.
�� 
DtdProcessing
�� "
=
��# $
DtdProcessing
��% 2
.
��2 3
Parse
��3 8
;
��8 9
settings
�� 
.
�� '
MaxCharactersFromEntities
�� .
=
��/ 0'
MaxCharactersFromEntities
��1 J
;
��J K
settings
�� 
.
�� %
MaxCharactersInDocument
�� ,
=
��- .%
MaxCharactersInDocument
��/ F
;
��F G
return
�� 
settings
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
XmlDocument
�� #%
PreProcessDocumentInput
��$ ;
(
��; <
XmlDocument
��< G
document
��H P
,
��P Q
XmlResolver
��R ]
xmlResolver
��^ i
,
��i j
string
��k q
baseUri
��r y
)
��y z
{
�� 	
if
�� 
(
�� 
document
�� 
==
�� 
null
��  
)
��  !
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
document
��7 ?
)
��? @
)
��@ A
;
��A B
MyXmlDocument
�� 
doc
�� 
=
�� 
new
��  #
MyXmlDocument
��$ 1
(
��1 2
)
��2 3
;
��3 4
doc
�� 
.
��  
PreserveWhitespace
�� "
=
��# $
document
��% -
.
��- . 
PreserveWhitespace
��. @
;
��@ A
using
�� 
(
�� 

TextReader
�� 
stringReader
�� *
=
��+ ,
new
��- 0
StringReader
��1 =
(
��= >
document
��> F
.
��F G
OuterXml
��G O
)
��O P
)
��P Q
{
�� 
XmlReaderSettings
�� !
settings
��" *
=
��+ ,
new
��- 0
XmlReaderSettings
��1 B
(
��B C
)
��C D
;
��D E
settings
�� 
.
�� 
XmlResolver
�� $
=
��% &
xmlResolver
��' 2
;
��2 3
settings
�� 
.
�� 
DtdProcessing
�� &
=
��' (
DtdProcessing
��) 6
.
��6 7
Parse
��7 <
;
��< =
settings
�� 
.
�� '
MaxCharactersFromEntities
�� 2
=
��3 4'
MaxCharactersFromEntities
��5 N
;
��N O
settings
�� 
.
�� %
MaxCharactersInDocument
�� 0
=
��1 2%
MaxCharactersInDocument
��3 J
;
��J K
	XmlReader
�� 
reader
��  
=
��! "
	XmlReader
��# ,
.
��, -
Create
��- 3
(
��3 4
stringReader
��4 @
,
��@ A
settings
��B J
,
��J K
baseUri
��L S
)
��S T
;
��T U
doc
�� 
.
�� 
Load
�� 
(
�� 
reader
�� 
)
��  
;
��  !
}
�� 
return
�� 
doc
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
XmlDocument
�� #$
PreProcessElementInput
��$ :
(
��: ;

XmlElement
��; E
elem
��F J
,
��J K
XmlResolver
��L W
xmlResolver
��X c
,
��c d
string
��e k
baseUri
��l s
)
��s t
{
�� 	
if
�� 
(
�� 
elem
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
elem
��7 ;
)
��; <
)
��< =
;
��= >
MyXmlDocument
�� 
doc
�� 
=
�� 
new
��  #
MyXmlDocument
��$ 1
(
��1 2
)
��2 3
;
��3 4
doc
�� 
.
��  
PreserveWhitespace
�� "
=
��# $
true
��% )
;
��) *
using
�� 
(
�� 

TextReader
�� 
stringReader
�� *
=
��+ ,
new
��- 0
StringReader
��1 =
(
��= >
elem
��> B
.
��B C
OuterXml
��C K
)
��K L
)
��L M
{
�� 
XmlReaderSettings
�� !
settings
��" *
=
��+ ,
new
��- 0
XmlReaderSettings
��1 B
(
��B C
)
��C D
;
��D E
settings
�� 
.
�� 
XmlResolver
�� $
=
��% &
xmlResolver
��' 2
;
��2 3
settings
�� 
.
�� 
DtdProcessing
�� &
=
��' (
DtdProcessing
��) 6
.
��6 7
Parse
��7 <
;
��< =
settings
�� 
.
�� '
MaxCharactersFromEntities
�� 2
=
��3 4'
MaxCharactersFromEntities
��5 N
;
��N O
settings
�� 
.
�� %
MaxCharactersInDocument
�� 0
=
��1 2%
MaxCharactersInDocument
��3 J
;
��J K
	XmlReader
�� 
reader
��  
=
��! "
	XmlReader
��# ,
.
��, -
Create
��- 3
(
��3 4
stringReader
��4 @
,
��@ A
settings
��B J
,
��J K
baseUri
��L S
)
��S T
;
��T U
doc
�� 
.
�� 
Load
�� 
(
�� 
reader
�� 
)
��  
;
��  !
}
�� 
return
�� 
doc
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
XmlDocument
�� #
DiscardComments
��$ 3
(
��3 4
XmlDocument
��4 ?
document
��@ H
)
��H I
{
�� 	
XmlNodeList
�� 
nodeList
��  
=
��! "
document
��# +
.
��+ ,
SelectNodes
��, 7
(
��7 8
$str
��8 E
)
��E F
;
��F G
if
�� 
(
�� 
nodeList
�� 
!=
�� 
null
��  
)
��  !
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
node1
��! &
in
��' )
nodeList
��* 2
)
��2 3
{
�� 
node1
�� 
.
�� 

ParentNode
�� $
.
��$ %
RemoveChild
��% 0
(
��0 1
node1
��1 6
)
��6 7
;
��7 8
}
�� 
}
�� 
return
�� 
document
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
XmlNodeList
�� # 
AllDescendantNodes
��$ 6
(
��6 7
XmlNode
��7 >
node
��? C
,
��C D
bool
��E I
includeComments
��J Y
)
��Y Z
{
�� 	"
CanonicalXmlNodeList
��  
nodeList
��! )
=
��* +
new
��, /"
CanonicalXmlNodeList
��0 D
(
��D E
)
��E F
;
��F G"
CanonicalXmlNodeList
��  
elementList
��! ,
=
��- .
new
��/ 2"
CanonicalXmlNodeList
��3 G
(
��G H
)
��H I
;
��I J"
CanonicalXmlNodeList
��  

attribList
��! +
=
��, -
new
��. 1"
CanonicalXmlNodeList
��2 F
(
��F G
)
��G H
;
��H I"
CanonicalXmlNodeList
��  
namespaceList
��! .
=
��/ 0
new
��1 4"
CanonicalXmlNodeList
��5 I
(
��I J
)
��J K
;
��K L
int
�� 
index
�� 
=
�� 
$num
�� 
;
�� 
elementList
�� 
.
�� 
Add
�� 
(
�� 
node
��  
)
��  !
;
��! "
do
�� 
{
�� 
XmlNode
�� 
rootNode
��  
=
��! "
(
��# $
XmlNode
��$ +
)
��+ ,
elementList
��, 7
[
��7 8
index
��8 =
]
��= >
;
��> ?
XmlNodeList
�� 

childNodes
�� &
=
��' (
rootNode
��) 1
.
��1 2

ChildNodes
��2 <
;
��< =
if
�� 
(
�� 

childNodes
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
foreach
�� 
(
�� 
XmlNode
�� $
node1
��% *
in
��+ -

childNodes
��. 8
)
��8 9
{
�� 
if
�� 
(
�� 
includeComments
�� +
||
��, .
(
��/ 0
!
��0 1
(
��1 2
node1
��2 7
is
��8 :

XmlComment
��; E
)
��E F
)
��F G
)
��G H
{
�� 
elementList
�� '
.
��' (
Add
��( +
(
��+ ,
node1
��, 1
)
��1 2
;
��2 3
}
�� 
}
�� 
}
�� $
XmlAttributeCollection
�� &
attribNodes
��' 2
=
��3 4
rootNode
��5 =
.
��= >

Attributes
��> H
;
��H I
if
�� 
(
�� 
attribNodes
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
foreach
�� 
(
�� 
XmlNode
�� $

attribNode
��% /
in
��0 2
rootNode
��3 ;
.
��; <

Attributes
��< F
)
��F G
{
�� 
if
�� 
(
�� 

attribNode
�� &
.
��& '
	LocalName
��' 0
==
��1 3
$str
��4 ;
||
��< >

attribNode
��? I
.
��I J
Prefix
��J P
==
��Q S
$str
��T [
)
��[ \
namespaceList
�� )
.
��) *
Add
��* -
(
��- .

attribNode
��. 8
)
��8 9
;
��9 :
else
�� 

attribList
�� &
.
��& '
Add
��' *
(
��* +

attribNode
��+ 5
)
��5 6
;
��6 7
}
�� 
}
�� 
index
�� 
++
�� 
;
�� 
}
�� 
while
�� 
(
�� 
index
�� 
<
�� 
elementList
�� (
.
��( )
Count
��) .
)
��. /
;
��/ 0
foreach
�� 
(
�� 
XmlNode
�� 
elementNode
�� (
in
��) +
elementList
��, 7
)
��7 8
{
�� 
nodeList
�� 
.
�� 
Add
�� 
(
�� 
elementNode
�� (
)
��( )
;
��) *
}
�� 
foreach
�� 
(
�� 
XmlNode
�� 

attribNode
�� '
in
��( *

attribList
��+ 5
)
��5 6
{
�� 
nodeList
�� 
.
�� 
Add
�� 
(
�� 

attribNode
�� '
)
��' (
;
��( )
}
�� 
foreach
�� 
(
�� 
XmlNode
�� 
namespaceNode
�� *
in
��+ -
namespaceList
��. ;
)
��; <
{
�� 
nodeList
�� 
.
�� 
Add
�� 
(
�� 
namespaceNode
�� *
)
��* +
;
��+ ,
}
�� 
return
�� 
nodeList
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 

NodeInList
�� '
(
��' (
XmlNode
��( /
node
��0 4
,
��4 5
XmlNodeList
��6 A
nodeList
��B J
)
��J K
{
�� 	
foreach
�� 
(
�� 
XmlNode
�� 
nodeElem
�� %
in
��& (
nodeList
��) 1
)
��1 2
{
�� 
if
�� 
(
�� 
nodeElem
�� 
==
�� 
node
��  $
)
��$ %
return
��& ,
true
��- 1
;
��1 2
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
string
�� 
GetIdFromLocalUri
�� 0
(
��0 1
string
��1 7
uri
��8 ;
,
��; <
out
��= @
bool
��A E
discardComments
��F U
)
��U V
{
�� 	
string
�� 
idref
�� 
=
�� 
uri
�� 
.
�� 
	Substring
�� (
(
��( )
$num
��) *
)
��* +
;
��+ ,
discardComments
�� 
=
�� 
true
�� "
;
��" #
if
�� 
(
�� 
idref
�� 
.
�� 

StartsWith
��  
(
��  !
$str
��! /
,
��/ 0
StringComparison
��1 A
.
��A B
Ordinal
��B I
)
��I J
)
��J K
{
�� 
int
�� 
startId
�� 
=
�� 
idref
�� #
.
��# $
IndexOf
��$ +
(
��+ ,
$str
��, 1
,
��1 2
StringComparison
��3 C
.
��C D
Ordinal
��D K
)
��K L
;
��L M
int
�� 
endId
�� 
=
�� 
idref
�� !
.
��! "
IndexOf
��" )
(
��) *
$str
��* -
,
��- .
StringComparison
��/ ?
.
��? @
Ordinal
��@ G
)
��G H
;
��H I
if
�� 
(
�� 
endId
�� 
<
�� 
$num
�� 
||
��  
endId
��! &
<
��' (
startId
��) 0
+
��1 2
$num
��3 4
)
��4 5
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_InvalidReference
��U v
)
��v w
;
��w x
idref
�� 
=
�� 
idref
�� 
.
�� 
	Substring
�� '
(
��' (
startId
��( /
+
��0 1
$num
��2 3
,
��3 4
endId
��5 :
-
��; <
startId
��= D
-
��E F
$num
��G H
)
��H I
;
��I J
idref
�� 
=
�� 
idref
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& *
,
��* +
$str
��, .
)
��. /
;
��/ 0
idref
�� 
=
�� 
idref
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& *
,
��* +
$str
��, .
)
��. /
;
��/ 0
discardComments
�� 
=
��  !
false
��" '
;
��' (
}
�� 
return
�� 
idref
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
string
�� #
ExtractIdFromLocalUri
�� 4
(
��4 5
string
��5 ;
uri
��< ?
)
��? @
{
�� 	
string
�� 
idref
�� 
=
�� 
uri
�� 
.
�� 
	Substring
�� (
(
��( )
$num
��) *
)
��* +
;
��+ ,
if
�� 
(
�� 
idref
�� 
.
�� 

StartsWith
��  
(
��  !
$str
��! /
,
��/ 0
StringComparison
��1 A
.
��A B
Ordinal
��B I
)
��I J
)
��J K
{
�� 
int
�� 
startId
�� 
=
�� 
idref
�� #
.
��# $
IndexOf
��$ +
(
��+ ,
$str
��, 1
,
��1 2
StringComparison
��3 C
.
��C D
Ordinal
��D K
)
��K L
;
��L M
int
�� 
endId
�� 
=
�� 
idref
�� !
.
��! "
IndexOf
��" )
(
��) *
$str
��* -
,
��- .
StringComparison
��/ ?
.
��? @
Ordinal
��@ G
)
��G H
;
��H I
if
�� 
(
�� 
endId
�� 
<
�� 
$num
�� 
||
��  
endId
��! &
<
��' (
startId
��) 0
+
��1 2
$num
��3 4
)
��4 5
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U/
!Cryptography_Xml_InvalidReference
��U v
)
��v w
;
��w x
idref
�� 
=
�� 
idref
�� 
.
�� 
	Substring
�� '
(
��' (
startId
��( /
+
��0 1
$num
��2 3
,
��3 4
endId
��5 :
-
��; <
startId
��= D
-
��E F
$num
��G H
)
��H I
;
��I J
idref
�� 
=
�� 
idref
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& *
,
��* +
$str
��, .
)
��. /
;
��/ 0
idref
�� 
=
�� 
idref
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& *
,
��* +
$str
��, .
)
��. /
;
��/ 0
}
�� 
return
�� 
idref
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 
RemoveAllChildren
�� .
(
��. /

XmlElement
��/ 9
inputElement
��: F
)
��F G
{
�� 	
XmlNode
�� 
child
�� 
=
�� 
inputElement
�� (
.
��( )

FirstChild
��) 3
;
��3 4
XmlNode
�� 
sibling
�� 
=
�� 
null
�� "
;
��" #
while
�� 
(
�� 
child
�� 
!=
�� 
null
��  
)
��  !
{
�� 
sibling
�� 
=
�� 
child
�� 
.
��  
NextSibling
��  +
;
��+ ,
inputElement
�� 
.
�� 
RemoveChild
�� (
(
��( )
child
��) .
)
��. /
;
��/ 0
child
�� 
=
�� 
sibling
�� 
;
��  
}
�� 
}
�� 	
internal
�� 
static
�� 
long
�� 
Pump
�� !
(
��! "
Stream
��" (
input
��) .
,
��. /
Stream
��0 6
output
��7 =
)
��= >
{
�� 	
MemoryStream
�� 
inputMS
��  
=
��! "
input
��# (
as
��) +
MemoryStream
��, 8
;
��8 9
if
�� 
(
�� 
inputMS
�� 
!=
�� 
null
�� 
&&
��  "
inputMS
��# *
.
��* +
Position
��+ 3
==
��4 6
$num
��7 8
)
��8 9
{
�� 
inputMS
�� 
.
�� 
WriteTo
�� 
(
��  
output
��  &
)
��& '
;
��' (
return
�� 
inputMS
�� 
.
�� 
Length
�� %
;
��% &
}
�� 
const
�� 
int
�� 
count
�� 
=
�� 
$num
�� "
;
��" #
byte
�� 
[
�� 
]
�� 
bytes
�� 
=
�� 
new
�� 
byte
�� #
[
��# $
count
��$ )
]
��) *
;
��* +
int
�� 
numBytes
�� 
;
�� 
long
�� 

totalBytes
�� 
=
�� 
$num
�� 
;
��  
while
�� 
(
�� 
(
�� 
numBytes
�� 
=
�� 
input
�� $
.
��$ %
Read
��% )
(
��) *
bytes
��* /
,
��/ 0
$num
��1 2
,
��2 3
count
��4 9
)
��9 :
)
��: ;
>
��< =
$num
��> ?
)
��? @
{
�� 
output
�� 
.
�� 
Write
�� 
(
�� 
bytes
�� "
,
��" #
$num
��$ %
,
��% &
numBytes
��' /
)
��/ 0
;
��0 1

totalBytes
�� 
+=
�� 
numBytes
�� &
;
��& '
}
�� 
return
�� 

totalBytes
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
	Hashtable
�� !&
TokenizePrefixListString
��" :
(
��: ;
string
��; A
s
��B C
)
��C D
{
�� 	
	Hashtable
�� 
set
�� 
=
�� 
new
�� 
	Hashtable
��  )
(
��) *
)
��* +
;
��+ ,
if
�� 
(
�� 
s
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
string
�� 
[
�� 
]
�� 
prefixes
�� !
=
��" #
s
��$ %
.
��% &
Split
��& +
(
��+ ,
null
��, 0
)
��0 1
;
��1 2
foreach
�� 
(
�� 
string
�� 
prefix
��  &
in
��' )
prefixes
��* 2
)
��2 3
{
�� 
if
�� 
(
�� 
prefix
�� 
.
�� 
Equals
�� %
(
��% &
$str
��& 0
)
��0 1
)
��1 2
{
�� 
set
�� 
.
�� 
Add
�� 
(
��  
string
��  &
.
��& '
Empty
��' ,
,
��, -
true
��. 2
)
��2 3
;
��3 4
}
�� 
else
�� 
if
�� 
(
�� 
prefix
�� #
.
��# $
Length
��$ *
>
��+ ,
$num
��- .
)
��. /
{
�� 
set
�� 
.
�� 
Add
�� 
(
��  
prefix
��  &
,
��& '
true
��( ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 
return
�� 
set
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
string
�� "
EscapeWhitespaceData
�� 3
(
��3 4
string
��4 :
data
��; ?
)
��? @
{
�� 	
StringBuilder
�� 
sb
�� 
=
�� 
new
�� "
StringBuilder
��# 0
(
��0 1
)
��1 2
;
��2 3
sb
�� 
.
�� 
Append
�� 
(
�� 
data
�� 
)
�� 
;
�� 
Utils
�� 
.
�� %
SBReplaceCharWithString
�� )
(
��) *
sb
��* ,
,
��, -
(
��. /
char
��/ 3
)
��3 4
$num
��4 6
,
��6 7
$str
��8 ?
)
��? @
;
��@ A
return
�� 
sb
�� 
.
�� 
ToString
�� 
(
�� 
)
��  
;
��  !
;
��" #
}
�� 	
internal
�� 
static
�� 
string
�� 
EscapeTextData
�� -
(
��- .
string
��. 4
data
��5 9
)
��9 :
{
�� 	
StringBuilder
�� 
sb
�� 
=
�� 
new
�� "
StringBuilder
��# 0
(
��0 1
)
��1 2
;
��2 3
sb
�� 
.
�� 
Append
�� 
(
�� 
data
�� 
)
�� 
;
�� 
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� #
)
��# $
;
��$ %
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� "
)
��" #
;
��# $
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� "
)
��" #
;
��# $%
SBReplaceCharWithString
�� #
(
��# $
sb
��$ &
,
��& '
(
��( )
char
��) -
)
��- .
$num
��. 0
,
��0 1
$str
��2 9
)
��9 :
;
��: ;
return
�� 
sb
�� 
.
�� 
ToString
�� 
(
�� 
)
��  
;
��  !
;
��" #
}
�� 	
internal
�� 
static
�� 
string
�� 
EscapeCData
�� *
(
��* +
string
��+ 1
data
��2 6
)
��6 7
{
�� 	
return
�� 
EscapeTextData
�� !
(
��! "
data
��" &
)
��& '
;
��' (
}
�� 	
internal
�� 
static
�� 
string
�� "
EscapeAttributeValue
�� 3
(
��3 4
string
��4 :
value
��; @
)
��@ A
{
�� 	
StringBuilder
�� 
sb
�� 
=
�� 
new
�� "
StringBuilder
��# 0
(
��0 1
)
��1 2
;
��2 3
sb
�� 
.
�� 
Append
�� 
(
�� 
value
�� 
)
�� 
;
�� 
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� #
)
��# $
;
��$ %
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� "
)
��" #
;
��# $
sb
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� 
,
�� 
$str
�� %
)
��% &
;
��& '%
SBReplaceCharWithString
�� #
(
��# $
sb
��$ &
,
��& '
(
��( )
char
��) -
)
��- .
$num
��. /
,
��/ 0
$str
��1 8
)
��8 9
;
��9 :%
SBReplaceCharWithString
�� #
(
��# $
sb
��$ &
,
��& '
(
��( )
char
��) -
)
��- .
$num
��. 0
,
��0 1
$str
��2 9
)
��9 :
;
��: ;%
SBReplaceCharWithString
�� #
(
��# $
sb
��$ &
,
��& '
(
��( )
char
��) -
)
��- .
$num
��. 0
,
��0 1
$str
��2 9
)
��9 :
;
��: ;
return
�� 
sb
�� 
.
�� 
ToString
�� 
(
�� 
)
��  
;
��  !
}
�� 	
internal
�� 
static
�� 
XmlDocument
�� #
GetOwnerDocument
��$ 4
(
��4 5
XmlNodeList
��5 @
nodeList
��A I
)
��I J
{
�� 	
foreach
�� 
(
�� 
XmlNode
�� 
node
�� !
in
��" $
nodeList
��% -
)
��- .
{
�� 
if
�� 
(
�� 
node
�� 
.
�� 
OwnerDocument
�� &
!=
��' )
null
��* .
)
��. /
return
�� 
node
�� 
.
��  
OwnerDocument
��  -
;
��- .
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 
AddNamespaces
�� *
(
��* +

XmlElement
��+ 5
elem
��6 :
,
��: ;"
CanonicalXmlNodeList
��< P

namespaces
��Q [
)
��[ \
{
�� 	
if
�� 
(
�� 

namespaces
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
foreach
�� 
(
�� 
XmlNode
��  
attrib
��! '
in
��( *

namespaces
��+ 5
)
��5 6
{
�� 
string
�� 
name
�� 
=
��  !
(
��" #
(
��# $
attrib
��$ *
.
��* +
Prefix
��+ 1
.
��1 2
Length
��2 8
>
��9 :
$num
��; <
)
��< =
?
��> ?
attrib
��@ F
.
��F G
Prefix
��G M
+
��N O
$str
��P S
+
��T U
attrib
��V \
.
��\ ]
	LocalName
��] f
:
��g h
attrib
��i o
.
��o p
	LocalName
��p y
)
��y z
;
��z {
if
�� 
(
�� 
elem
�� 
.
�� 
HasAttribute
�� )
(
��) *
name
��* .
)
��. /
||
��0 2
(
��3 4
name
��4 8
.
��8 9
Equals
��9 ?
(
��? @
$str
��@ G
)
��G H
&&
��I K
elem
��L P
.
��P Q
Prefix
��Q W
.
��W X
Length
��X ^
==
��_ a
$num
��b c
)
��c d
)
��d e
continue
��f n
;
��n o
XmlAttribute
��  
nsattrib
��! )
=
��* +
(
��, -
XmlAttribute
��- 9
)
��9 :
elem
��: >
.
��> ?
OwnerDocument
��? L
.
��L M
CreateAttribute
��M \
(
��\ ]
name
��] a
)
��a b
;
��b c
nsattrib
�� 
.
�� 
Value
�� "
=
��# $
attrib
��% +
.
��+ ,
Value
��, 1
;
��1 2
elem
�� 
.
�� 
SetAttributeNode
�� )
(
��) *
nsattrib
��* 2
)
��2 3
;
��3 4
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
void
�� 
AddNamespaces
�� *
(
��* +

XmlElement
��+ 5
elem
��6 :
,
��: ;
	Hashtable
��< E

namespaces
��F P
)
��P Q
{
�� 	
if
�� 
(
�� 

namespaces
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
foreach
�� 
(
�� 
string
�� 
key
��  #
in
��$ &

namespaces
��' 1
.
��1 2
Keys
��2 6
)
��6 7
{
�� 
if
�� 
(
�� 
elem
�� 
.
�� 
HasAttribute
�� )
(
��) *
key
��* -
)
��- .
)
��. /
continue
��0 8
;
��8 9
XmlAttribute
��  
nsattrib
��! )
=
��* +
(
��, -
XmlAttribute
��- 9
)
��9 :
elem
��: >
.
��> ?
OwnerDocument
��? L
.
��L M
CreateAttribute
��M \
(
��\ ]
key
��] `
)
��` a
;
��a b
nsattrib
�� 
.
�� 
Value
�� "
=
��# $

namespaces
��% /
[
��/ 0
key
��0 3
]
��3 4
as
��5 7
string
��8 >
;
��> ?
elem
�� 
.
�� 
SetAttributeNode
�� )
(
��) *
nsattrib
��* 2
)
��2 3
;
��3 4
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� "
CanonicalXmlNodeList
�� ,%
GetPropagatedAttributes
��- D
(
��D E

XmlElement
��E O
elem
��P T
)
��T U
{
�� 	
if
�� 
(
�� 
elem
�� 
==
�� 
null
�� 
)
�� 
return
�� 
null
�� 
;
�� "
CanonicalXmlNodeList
��  

namespaces
��! +
=
��, -
new
��. 1"
CanonicalXmlNodeList
��2 F
(
��F G
)
��G H
;
��H I
XmlNode
�� 
ancestorNode
��  
=
��! "
elem
��# '
;
��' (
bool
��  
bDefNamespaceToAdd
�� #
=
��$ %
true
��& *
;
��* +
while
�� 
(
�� 
ancestorNode
�� 
!=
��  "
null
��# '
)
��' (
{
�� 

XmlElement
�� 
ancestorElement
�� *
=
��+ ,
ancestorNode
��- 9
as
��: <

XmlElement
��= G
;
��G H
if
�� 
(
�� 
ancestorElement
�� #
==
��$ &
null
��' +
)
��+ ,
{
�� 
ancestorNode
��  
=
��! "
ancestorNode
��# /
.
��/ 0

ParentNode
��0 :
;
��: ;
continue
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� "
IsCommittedNamespace
�� /
(
��/ 0
ancestorElement
��0 ?
,
��? @
ancestorElement
��A P
.
��P Q
Prefix
��Q W
,
��W X
ancestorElement
��Y h
.
��h i
NamespaceURI
��i u
)
��u v
)
��v w
{
�� 
if
�� 
(
�� 
!
�� 
Utils
�� 
.
�� "
IsRedundantNamespace
�� 3
(
��3 4
ancestorElement
��4 C
,
��C D
ancestorElement
��E T
.
��T U
Prefix
��U [
,
��[ \
ancestorElement
��] l
.
��l m
NamespaceURI
��m y
)
��y z
)
��z {
{
�� 
string
�� 
name
�� #
=
��$ %
(
��& '
(
��' (
ancestorElement
��( 7
.
��7 8
Prefix
��8 >
.
��> ?
Length
��? E
>
��F G
$num
��H I
)
��I J
?
��K L
$str
��M U
+
��V W
ancestorElement
��X g
.
��g h
Prefix
��h n
:
��o p
$str
��q x
)
��x y
;
��y z
XmlAttribute
�� $
nsattrib
��% -
=
��. /
elem
��0 4
.
��4 5
OwnerDocument
��5 B
.
��B C
CreateAttribute
��C R
(
��R S
name
��S W
)
��W X
;
��X Y
nsattrib
��  
.
��  !
Value
��! &
=
��' (
ancestorElement
��) 8
.
��8 9
NamespaceURI
��9 E
;
��E F

namespaces
�� "
.
��" #
Add
��# &
(
��& '
nsattrib
��' /
)
��/ 0
;
��0 1
}
�� 
}
�� 
if
�� 
(
�� 
ancestorElement
�� #
.
��# $
HasAttributes
��$ 1
)
��1 2
{
�� $
XmlAttributeCollection
�� *
attribs
��+ 2
=
��3 4
ancestorElement
��5 D
.
��D E

Attributes
��E O
;
��O P
foreach
�� 
(
�� 
XmlAttribute
�� )
attrib
��* 0
in
��1 3
attribs
��4 ;
)
��; <
{
�� 
if
�� 
(
��  
bDefNamespaceToAdd
�� .
&&
��/ 1
attrib
��2 8
.
��8 9
	LocalName
��9 B
==
��C E
$str
��F M
)
��M N
{
�� 
XmlAttribute
�� (
nsattrib
��) 1
=
��2 3
elem
��4 8
.
��8 9
OwnerDocument
��9 F
.
��F G
CreateAttribute
��G V
(
��V W
$str
��W ^
)
��^ _
;
��_ `
nsattrib
�� $
.
��$ %
Value
��% *
=
��+ ,
attrib
��- 3
.
��3 4
Value
��4 9
;
��9 :

namespaces
�� &
.
��& '
Add
��' *
(
��* +
nsattrib
��+ 3
)
��3 4
;
��4 5 
bDefNamespaceToAdd
�� .
=
��/ 0
false
��1 6
;
��6 7
continue
�� $
;
��$ %
}
�� 
if
�� 
(
�� 
attrib
�� "
.
��" #
Prefix
��# )
==
��* ,
$str
��- 4
||
��5 7
attrib
��8 >
.
��> ?
Prefix
��? E
==
��F H
$str
��I N
)
��N O
{
�� 

namespaces
�� &
.
��& '
Add
��' *
(
��* +
attrib
��+ 1
)
��1 2
;
��2 3
continue
�� $
;
��$ %
}
�� 
if
�� 
(
�� 
attrib
�� "
.
��" #
NamespaceURI
��# /
.
��/ 0
Length
��0 6
>
��7 8
$num
��9 :
)
��: ;
{
�� 
if
�� 
(
��  
!
��  !
Utils
��! &
.
��& '"
IsCommittedNamespace
��' ;
(
��; <
ancestorElement
��< K
,
��K L
attrib
��M S
.
��S T
Prefix
��T Z
,
��Z [
attrib
��\ b
.
��b c
NamespaceURI
��c o
)
��o p
)
��p q
{
�� 
if
��  "
(
��# $
!
��$ %
Utils
��% *
.
��* +"
IsRedundantNamespace
��+ ?
(
��? @
ancestorElement
��@ O
,
��O P
attrib
��Q W
.
��W X
Prefix
��X ^
,
��^ _
attrib
��` f
.
��f g
NamespaceURI
��g s
)
��s t
)
��t u
{
��  !
string
��$ *
name
��+ /
=
��0 1
(
��2 3
(
��3 4
attrib
��4 :
.
��: ;
Prefix
��; A
.
��A B
Length
��B H
>
��I J
$num
��K L
)
��L M
?
��N O
$str
��P X
+
��Y Z
attrib
��[ a
.
��a b
Prefix
��b h
:
��i j
$str
��k r
)
��r s
;
��s t
XmlAttribute
��$ 0
nsattrib
��1 9
=
��: ;
elem
��< @
.
��@ A
OwnerDocument
��A N
.
��N O
CreateAttribute
��O ^
(
��^ _
name
��_ c
)
��c d
;
��d e
nsattrib
��$ ,
.
��, -
Value
��- 2
=
��3 4
attrib
��5 ;
.
��; <
NamespaceURI
��< H
;
��H I

namespaces
��$ .
.
��. /
Add
��/ 2
(
��2 3
nsattrib
��3 ;
)
��; <
;
��< =
}
��  !
}
�� 
}
�� 
}
�� 
}
�� 
ancestorNode
�� 
=
�� 
ancestorNode
�� +
.
��+ ,

ParentNode
��, 6
;
��6 7
}
�� 
return
�� 

namespaces
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� #
ConvertIntToByteArray
�� 4
(
��4 5
int
��5 8
dwInput
��9 @
)
��@ A
{
�� 	
byte
�� 
[
�� 
]
�� 
rgbTemp
�� 
=
�� 
new
��  
byte
��! %
[
��% &
$num
��& '
]
��' (
;
��( )
int
�� 
t1
�� 
;
�� 
int
�� 
t2
�� 
;
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
dwInput
�� 
==
�� 
$num
�� 
)
�� 
return
�� $
new
��% (
byte
��) -
[
��- .
$num
��. /
]
��/ 0
;
��0 1
t1
�� 
=
�� 
dwInput
�� 
;
�� 
while
�� 
(
�� 
t1
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
t2
�� 
=
�� 
t1
�� 
%
�� 
$num
�� 
;
�� 
rgbTemp
�� 
[
�� 
i
�� 
]
�� 
=
�� 
(
�� 
byte
�� "
)
��" #
t2
��# %
;
��% &
t1
�� 
=
�� 
(
�� 
t1
�� 
-
�� 
t2
�� 
)
�� 
/
��  
$num
��! $
;
��$ %
i
�� 
++
�� 
;
�� 
}
�� 
byte
�� 
[
�� 
]
�� 
	rgbOutput
�� 
=
�� 
new
�� "
byte
��# '
[
��' (
i
��( )
]
��) *
;
��* +
for
�� 
(
�� 
int
�� 
j
�� 
=
�� 
$num
�� 
;
�� 
j
�� 
<
�� 
i
��  !
;
��! "
j
��# $
++
��$ &
)
��& '
{
�� 
	rgbOutput
�� 
[
�� 
j
�� 
]
�� 
=
�� 
rgbTemp
�� &
[
��& '
i
��' (
-
��) *
j
��+ ,
-
��- .
$num
��/ 0
]
��0 1
;
��1 2
}
�� 
return
�� 
	rgbOutput
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
int
�� #
ConvertByteArrayToInt
�� 1
(
��1 2
byte
��2 6
[
��6 7
]
��7 8
input
��9 >
)
��> ?
{
�� 	
int
�� 
dwOutput
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
input
��  %
.
��% &
Length
��& ,
;
��, -
i
��. /
++
��/ 1
)
��1 2
{
�� 
dwOutput
�� 
*=
�� 
$num
�� 
;
��  
dwOutput
�� 
+=
�� 
input
�� !
[
��! "
i
��" #
]
��# $
;
��$ %
}
�� 
return
�� 
(
�� 
dwOutput
�� 
)
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
int
�� 
GetHexArraySize
�� +
(
��+ ,
byte
��, 0
[
��0 1
]
��1 2
hex
��3 6
)
��6 7
{
�� 	
int
�� 
index
�� 
=
�� 
hex
�� 
.
�� 
Length
�� "
;
��" #
while
�� 
(
�� 
index
�� 
--
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
if
�� 
(
�� 
hex
�� 
[
�� 
index
�� 
]
�� 
!=
�� !
$num
��" #
)
��# $
break
�� 
;
�� 
}
�� 
return
�� 
index
�� 
+
�� 
$num
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
X509IssuerSerial
�� ($
CreateX509IssuerSerial
��) ?
(
��? @
string
��@ F

issuerName
��G Q
,
��Q R
string
��S Y
serialNumber
��Z f
)
��f g
{
�� 	
if
�� 
(
�� 

issuerName
�� 
==
�� 
null
�� "
||
��# %

issuerName
��& 0
.
��0 1
Length
��1 7
==
��8 :
$num
��; <
)
��< =
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /#
Arg_EmptyOrNullString
��/ D
,
��D E
nameof
��F L
(
��L M

issuerName
��M W
)
��W X
)
��X Y
;
��Y Z
if
�� 
(
�� 
serialNumber
�� 
==
�� 
null
��  $
||
��% '
serialNumber
��( 4
.
��4 5
Length
��5 ;
==
��< >
$num
��? @
)
��@ A
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /#
Arg_EmptyOrNullString
��/ D
,
��D E
nameof
��F L
(
��L M
serialNumber
��M Y
)
��Y Z
)
��Z [
;
��[ \
return
�� 
new
�� 
X509IssuerSerial
�� '
(
��' (
)
��( )
{
�� 

IssuerName
�� 
=
�� 

issuerName
�� '
,
��' (
SerialNumber
�� 
=
�� 
serialNumber
�� +
}
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
IList
�� 
<
�� 
X509Certificate
�� -
>
��- .
BuildBagOfCerts
��/ >
(
��> ?
KeyInfoX509Data
��? N
keyInfoX509Data
��O ^
,
��^ _
CertUsageType
��` m
certUsageType
��n {
)
��{ |
{
�� 	
var
�� 

collection
�� 
=
�� 
new
��  
List
��! %
<
��% &
X509Certificate
��& 5
>
��5 6
(
��6 7
)
��7 8
;
��8 9
	ArrayList
�� %
decryptionIssuerSerials
�� -
=
��. /
(
��0 1
certUsageType
��1 >
==
��? A
CertUsageType
��B O
.
��O P

Decryption
��P Z
?
��[ \
new
��] `
	ArrayList
��a j
(
��j k
)
��k l
:
��m n
null
��o s
)
��s t
;
��t u
if
�� 
(
�� 
keyInfoX509Data
�� 
.
��  
Certificates
��  ,
!=
��- /
null
��0 4
)
��4 5
{
�� 
foreach
�� 
(
�� 
X509Certificate
�� (
certificate
��) 4
in
��5 7
keyInfoX509Data
��8 G
.
��G H
Certificates
��H T
)
��T U
{
�� 
switch
�� 
(
�� 
certUsageType
�� )
)
��) *
{
�� 
case
�� 
CertUsageType
�� *
.
��* +
Verification
��+ 7
:
��7 8

collection
�� &
.
��& '
Add
��' *
(
��* +
certificate
��+ 6
)
��6 7
;
��7 8
break
�� !
;
��! "
case
�� 
CertUsageType
�� *
.
��* +

Decryption
��+ 5
:
��5 6%
decryptionIssuerSerials
�� 3
.
��3 4
Add
��4 7
(
��7 8
Utils
��8 =
.
��= >$
CreateX509IssuerSerial
��> T
(
��T U
certificate
��U `
.
��` a
IssuerDN
��a i
.
��i j
ToString
��j r
(
��r s
)
��s t
,
��t u
certificate��v �
.��� �
SerialNumber��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
)��� �
;��� �
break
�� !
;
��! "
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 
keyInfoX509Data
�� 
.
��  
SubjectNames
��  ,
==
��- /
null
��0 4
&&
��5 7
keyInfoX509Data
��8 G
.
��G H
IssuerSerials
��H U
==
��V X
null
��Y ]
&&
��^ `
keyInfoX509Data
�� 
.
��  
SubjectKeyIds
��  -
==
��. 0
null
��1 5
&&
��6 8%
decryptionIssuerSerials
��9 P
==
��Q S
null
��T X
)
��X Y
return
�� 

collection
�� !
;
��! "
return
�� 

collection
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
readonly
�� 
char
��  $
[
��$ %
]
��% &
s_hexValues
��' 2
=
��3 4
{
��5 6
$char
��6 9
,
��9 :
$char
��; >
,
��> ?
$char
��@ C
,
��C D
$char
��E H
,
��H I
$char
��J M
,
��M N
$char
��O R
,
��R S
$char
��T W
,
��W X
$char
��Y \
,
��\ ]
$char
��^ a
,
��a b
$char
��c f
,
��f g
$char
��h k
,
��k l
$char
��m p
,
��p q
$char
��r u
,
��u v
$char
��w z
,
��z {
$char
��| 
,�� �
$char��� �
}��� �
;��� �
internal
�� 
static
�� 
string
�� 
EncodeHexString
�� .
(
��. /
byte
��/ 3
[
��3 4
]
��4 5
sArray
��6 <
)
��< =
{
�� 	
return
�� 
EncodeHexString
�� "
(
��" #
sArray
��# )
,
��) *
$num
��+ ,
,
��, -
(
��. /
uint
��/ 3
)
��3 4
sArray
��4 :
.
��: ;
Length
��; A
)
��A B
;
��B C
}
�� 	
internal
�� 
static
�� 
string
�� 
EncodeHexString
�� .
(
��. /
byte
��/ 3
[
��3 4
]
��4 5
sArray
��6 <
,
��< =
uint
��> B
start
��C H
,
��H I
uint
��J N
end
��O R
)
��R S
{
�� 	
string
�� 
result
�� 
=
�� 
null
��  
;
��  !
if
�� 
(
�� 
sArray
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
char
�� 
[
�� 
]
�� 
hexOrder
�� 
=
��  !
new
��" %
char
��& *
[
��* +
(
��+ ,
end
��, /
-
��0 1
start
��2 7
)
��7 8
*
��9 :
$num
��; <
]
��< =
;
��= >
uint
�� 
digit
�� 
;
�� 
for
�� 
(
�� 
uint
�� 
i
�� 
=
�� 
start
�� #
,
��# $
j
��% &
=
��' (
$num
��) *
;
��* +
i
��, -
<
��. /
end
��0 3
;
��3 4
i
��5 6
++
��6 8
)
��8 9
{
�� 
digit
�� 
=
�� 
(
�� 
uint
�� !
)
��! "
(
��" #
(
��# $
sArray
��$ *
[
��* +
i
��+ ,
]
��, -
&
��. /
$num
��0 4
)
��4 5
>>
��6 8
$num
��9 :
)
��: ;
;
��; <
hexOrder
�� 
[
�� 
j
�� 
++
��  
]
��  !
=
��" #
s_hexValues
��$ /
[
��/ 0
digit
��0 5
]
��5 6
;
��6 7
digit
�� 
=
�� 
(
�� 
uint
�� !
)
��! "
(
��" #
sArray
��# )
[
��) *
i
��* +
]
��+ ,
&
��- .
$num
��/ 3
)
��3 4
;
��4 5
hexOrder
�� 
[
�� 
j
�� 
++
��  
]
��  !
=
��" #
s_hexValues
��$ /
[
��/ 0
digit
��0 5
]
��5 6
;
��6 7
}
�� 
result
�� 
=
�� 
new
�� 
string
�� #
(
��# $
hexOrder
��$ ,
)
��, -
;
��- .
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� 
DecodeHexString
�� .
(
��. /
string
��/ 5
s
��6 7
)
��7 8
{
�� 	
string
�� 
	hexString
�� 
=
�� 
Utils
�� $
.
��$ % 
DiscardWhiteSpaces
��% 7
(
��7 8
s
��8 9
)
��9 :
;
��: ;
uint
�� 
cbHex
�� 
=
�� 
(
�� 
uint
�� 
)
�� 
	hexString
�� (
.
��( )
Length
��) /
/
��0 1
$num
��2 3
;
��3 4
byte
�� 
[
�� 
]
�� 
hex
�� 
=
�� 
new
�� 
byte
�� !
[
��! "
cbHex
��" '
]
��' (
;
��( )
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
for
�� 
(
�� 
int
�� 
index
�� 
=
�� 
$num
�� 
;
�� 
index
��  %
<
��& '
cbHex
��( -
;
��- .
index
��/ 4
++
��4 6
)
��6 7
{
�� 
hex
�� 
[
�� 
index
�� 
]
�� 
=
�� 
(
�� 
byte
�� "
)
��" #
(
��# $
(
��$ %
	HexToByte
��% .
(
��. /
	hexString
��/ 8
[
��8 9
i
��9 :
]
��: ;
)
��; <
<<
��= ?
$num
��@ A
)
��A B
|
��C D
	HexToByte
��E N
(
��N O
	hexString
��O X
[
��X Y
i
��Y Z
+
��[ \
$num
��] ^
]
��^ _
)
��_ `
)
��` a
;
��a b
i
�� 
+=
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
hex
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
byte
�� 
	HexToByte
�� &
(
��& '
char
��' +
val
��, /
)
��/ 0
{
�� 	
if
�� 
(
�� 
val
�� 
<=
�� 
$char
�� 
&&
�� 
val
�� !
>=
��" $
$char
��% (
)
��( )
return
�� 
(
�� 
byte
�� 
)
�� 
(
�� 
val
�� !
-
��" #
$char
��$ '
)
��' (
;
��( )
else
�� 
if
�� 
(
�� 
val
�� 
>=
�� 
$char
�� 
&&
��  "
val
��# &
<=
��' )
$char
��* -
)
��- .
return
�� 
(
�� 
byte
�� 
)
�� 
(
�� 
(
�� 
val
�� "
-
��# $
$char
��% (
)
��( )
+
��* +
$num
��, .
)
��. /
;
��/ 0
else
�� 
if
�� 
(
�� 
val
�� 
>=
�� 
$char
�� 
&&
��  "
val
��# &
<=
��' )
$char
��* -
)
��- .
return
�� 
(
�� 
byte
�� 
)
�� 
(
�� 
(
�� 
val
�� "
-
��# $
$char
��% (
)
��( )
+
��* +
$num
��, .
)
��. /
;
��/ 0
else
�� 
return
�� 
$num
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
IsSelfSigned
�� )
(
��) *
IList
��* /
<
��/ 0
X509Certificate
��0 ?
>
��? @
chain
��A F
)
��F G
{
�� 	
if
�� 
(
�� 
chain
�� 
.
�� 
Count
�� 
!=
�� 
$num
��  
)
��  !
return
�� 
false
�� 
;
�� 
X509Certificate
�� 
certificate
�� '
=
��( )
chain
��* /
[
��/ 0
$num
��0 1
]
��1 2
;
��2 3
if
�� 
(
�� 
String
�� 
.
�� 
Compare
�� 
(
�� 
certificate
�� *
.
��* +
	SubjectDN
��+ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
certificate
��A L
.
��L M
IssuerDN
��M U
.
��U V
ToString
��V ^
(
��^ _
)
��_ `
,
��` a
StringComparison
��b r
.
��r s 
OrdinalIgnoreCase��s �
)��� �
==��� �
$num��� �
)��� �
return
�� 
true
�� 
;
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
IList
�� 
<
�� 
X509Certificate
�� -
>
��- .#
BuildCertificateChain
��/ D
(
��D E
X509Certificate
��E T 
primaryCertificate
��U g
,
��g h
IEnumerable
��i t
<
��t u
X509Certificate��u �
>��� �&
additionalCertificates��� �
)��� �
{
�� 	
var
�� 
parser
�� 
=
�� 
new
�� #
X509CertificateParser
�� 2
(
��2 3
)
��3 4
;
��4 5
var
�� 
builder
�� 
=
�� 
new
�� !
PkixCertPathBuilder
�� 1
(
��1 2
)
��2 3
;
��3 4
var
�� 
intermediateCerts
�� !
=
��" #
new
��$ '
List
��( ,
<
��, -
X509Certificate
��- <
>
��< =
(
��= >
)
��> ?
;
��? @
var
�� 
	rootCerts
�� 
=
�� 
new
�� 
BouncyCastle
��  ,
.
��, -
	Utilities
��- 6
.
��6 7
Collections
��7 B
.
��B C
HashSet
��C J
(
��J K
)
��K L
;
��L M
foreach
�� 
(
�� 
var
�� 
cert
�� 
in
��  $
additionalCertificates
��! 7
)
��7 8
{
��9 :
if
�� 
(
�� 
cert
�� 
.
�� 
IssuerDN
�� !
.
��! "

Equivalent
��" ,
(
��, -
cert
��- 1
.
��1 2
	SubjectDN
��2 ;
)
��; <
)
��< =
	rootCerts
�� 
.
�� 
Add
�� !
(
��! "
new
��" %
TrustAnchor
��& 1
(
��1 2
cert
��2 6
,
��6 7
null
��8 <
)
��< =
)
��= >
;
��> ?
else
�� 
intermediateCerts
�� %
.
��% &
Add
��& )
(
��) *
cert
��* .
)
��. /
;
��/ 0
}
�� 
var
�� 
holder
�� 
=
�� 
new
�� #
X509CertStoreSelector
�� 2
(
��2 3
)
��3 4
;
��4 5
holder
�� 
.
�� 
Certificate
�� 
=
��   
primaryCertificate
��! 3
;
��3 4
intermediateCerts
�� 
.
�� 
Add
�� !
(
��! "
holder
��" (
.
��( )
Certificate
��) 4
)
��4 5
;
��5 6#
PkixBuilderParameters
�� !
builderParams
��" /
=
��0 1
new
��2 5#
PkixBuilderParameters
��6 K
(
��K L
	rootCerts
��L U
,
��U V
holder
��W ]
)
��] ^
;
��^ _
builderParams
�� 
.
�� !
IsRevocationEnabled
�� -
=
��. /
false
��0 5
;
��5 6+
X509CollectionStoreParameters
�� ))
intermediateStoreParameters
��* E
=
��F G
new
�� +
X509CollectionStoreParameters
�� 1
(
��1 2
intermediateCerts
��2 C
)
��C D
;
��D E
builderParams
�� 
.
�� 
AddStore
�� "
(
��" #
X509StoreFactory
��# 3
.
��3 4
Create
��4 :
(
��: ;
$str
�� (
,
��( ))
intermediateStoreParameters
��* E
)
��E F
)
��F G
;
��G H'
PkixCertPathBuilderResult
�� %
result
��& ,
=
��- .
builder
��/ 6
.
��6 7
Build
��7 <
(
��< =
builderParams
��= J
)
��J K
;
��K L
return
�� 
result
�� 
.
�� 
CertPath
�� "
.
��" #
Certificates
��# /
.
��/ 0
Cast
��0 4
<
��4 5
X509Certificate
��5 D
>
��D E
(
��E F
)
��F G
.
��G H
ToList
��H N
(
��N O
)
��O P
;
��P Q
}
�� 	
internal
�� 
static
�� $
AsymmetricKeyParameter
�� .
GetAnyPublicKey
��/ >
(
��> ?
X509Certificate
��? N
certificate
��O Z
)
��Z [
{
�� 	
return
�� 
certificate
�� 
.
�� 
GetPublicKey
�� +
(
��+ ,
)
��, -
;
��- .
}
�� 	
internal
�� 
const
�� 
int
�� '
MaxTransformsPerReference
�� 4
=
��5 6
$num
��7 9
;
��9 :
internal
�� 
const
�� 
int
�� (
MaxReferencesPerSignedInfo
�� 5
=
��6 7
$num
��8 ;
;
��; <
internal
�� 
static
�� 
IDigest
�� 
GetSignerDigest
��  /
(
��/ 0
ISigner
��0 7
signer
��8 >
)
��> ?
{
�� 	
var
�� 
fields
�� 
=
�� 
signer
�� 
.
��  
GetType
��  '
(
��' (
)
��( )
.
��) *
	GetFields
��* 3
(
��3 4
BindingFlags
��4 @
.
��@ A
Instance
��A I
|
��J K
BindingFlags
��L X
.
��X Y
	NonPublic
��Y b
)
��b c
;
��c d
var
�� 

digestType
�� 
=
�� 
typeof
�� #
(
��# $
IDigest
��$ +
)
��+ ,
;
��, -
foreach
�� 
(
�� 
var
�� 
field
�� 
in
�� !
fields
��" (
)
��( )
{
��* +
if
�� 
(
�� 

digestType
�� 
.
�� 
IsAssignableFrom
�� /
(
��/ 0
field
��0 5
.
��5 6
	FieldType
��6 ?
)
��? @
)
��@ A
{
��B C
return
�� 
(
�� 
IDigest
�� #
)
��# $
field
��$ )
.
��) *
GetValue
��* 2
(
��2 3
signer
��3 9
)
��9 :
;
��: ;
}
�� 
}
�� 
throw
�� 
new
�� '
InvalidOperationException
�� /
(
��/ 0
)
��0 1
;
��1 2
}
�� 	
internal
�� 
static
�� 
X509Certificate
�� '
CloneCertificate
��( 8
(
��8 9
X509Certificate
��9 H
cert
��I M
)
��M N
{
�� 	
cert
�� 
=
�� 
cert
�� 
??
�� 
throw
��  
new
��! $#
ArgumentNullException
��% :
(
��: ;
nameof
��; A
(
��A B
cert
��B F
)
��F G
)
��G H
;
��H I
var
�� 
parser
�� 
=
�� 
new
�� #
X509CertificateParser
�� 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
parser
�� 
.
�� 
ReadCertificate
�� )
(
��) *
cert
��* .
.
��. /

GetEncoded
��/ 9
(
��9 :
)
��: ;
)
��; <
;
��< =
}
�� 	
internal
�� 
static
�� %
AsymmetricCipherKeyPair
�� / 
DSAGenerateKeyPair
��0 B
(
��B C
)
��C D
{
�� 	
var
�� 
keyGen
�� 
=
��  
GeneratorUtilities
�� +
.
��+ ,!
GetKeyPairGenerator
��, ?
(
��? @
$str
��@ E
)
��E F
;
��F G
var
�� 
rand
�� 
=
�� 
new
�� 
SecureRandom
�� '
(
��' (
)
��( )
;
��) *
var
�� 
pGen
�� 
=
�� 
new
�� $
DsaParametersGenerator
�� 1
(
��1 2
)
��2 3
;
��3 4
pGen
�� 
.
�� 
Init
�� 
(
�� 
$num
�� 
,
�� 
$num
�� 
,
�� 
rand
�� #
)
��# $
;
��$ %
keyGen
�� 
.
�� 
Init
�� 
(
�� 
new
�� (
DsaKeyGenerationParameters
�� 6
(
��6 7
rand
��7 ;
,
��; <
pGen
��= A
.
��A B 
GenerateParameters
��B T
(
��T U
)
��U V
)
��V W
)
��W X
;
��X Y
return
�� 
keyGen
�� 
.
�� 
GenerateKeyPair
�� )
(
��) *
)
��* +
;
��+ ,
}
�� 	
internal
�� 
static
�� %
AsymmetricCipherKeyPair
�� / 
RSAGenerateKeyPair
��0 B
(
��B C
)
��C D
{
�� 	
var
�� 
keyGen
�� 
=
��  
GeneratorUtilities
�� +
.
��+ ,!
GetKeyPairGenerator
��, ?
(
��? @
$str
��@ E
)
��E F
;
��F G
keyGen
�� 
.
�� 
Init
�� 
(
�� 
new
�� %
KeyGenerationParameters
�� 3
(
��3 4
new
��4 7
SecureRandom
��8 D
(
��D E
)
��E F
,
��F G
$num
��H L
)
��L M
)
��M N
;
��N O
return
�� 
keyGen
�� 
.
�� 
GenerateKeyPair
�� )
(
��) *
)
��* +
;
��+ ,
}
�� 	
internal
�� 
static
�� 
byte
�� 
[
�� 
]
�� !
GenerateRandomBlock
�� 2
(
��2 3
int
��3 6
sizeInBytes
��7 B
)
��B C
{
�� 	
SecureRandom
�� 
random
�� 
=
��  !
new
��" %
SecureRandom
��& 2
(
��2 3
)
��3 4
;
��4 5
byte
�� 
[
�� 
]
�� 
keyBytes
�� 
=
�� 
new
�� !
byte
��" &
[
��& '
sizeInBytes
��' 2
]
��2 3
;
��3 4
random
�� 
.
�� 
	NextBytes
�� 
(
�� 
keyBytes
�� %
)
��% &
;
��& '
return
�� 
keyBytes
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
} �
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
}66 ��
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
;	pp �
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
�� 
null
�� 
;
�� 
XmlDocument
�� 
document
��  
=
��! "
new
��# &
XmlDocument
��' 2
(
��2 3
)
��3 4
;
��4 5

XmlElement
�� 
element
�� 
=
��  
document
��! )
.
��) *
CreateElement
��* 7
(
��7 8
$str
��8 C
,
��C D
	SignedXml
��E N
.
��N O!
XmlDsigNamespaceUrl
��O b
)
��b c
;
��c d
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
	Algorithm
��& /
)
��/ 0
)
��0 1
element
�� 
.
�� 
SetAttribute
�� $
(
��$ %
$str
��% 0
,
��0 1
	Algorithm
��2 ;
)
��; <
;
��< =
foreach
�� 
(
�� 
string
�� 
uri
�� 
in
��  "

ExceptUris
��# -
)
��- .
{
�� 

XmlElement
�� 
exceptUriElement
�� +
=
��, -
document
��. 6
.
��6 7
CreateElement
��7 D
(
��D E
$str
��E M
,
��M N0
"XmlDecryptionTransformNamespaceUrl
��O q
)
��q r
;
��r s
exceptUriElement
��  
.
��  !
SetAttribute
��! -
(
��- .
$str
��. 3
,
��3 4
uri
��5 8
)
��8 9
;
��9 :
element
�� 
.
�� 
AppendChild
�� #
(
��# $
exceptUriElement
��$ 4
)
��4 5
;
��5 6
}
�� 
return
�� 
element
�� 
.
�� 

ChildNodes
�� %
;
��% &
}
�� 	
public
�� 
override
�� 
void
�� 
	LoadInput
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
if
�� 
(
�� 
obj
�� 
is
�� 
Stream
�� 
)
�� 
{
�� 
LoadStreamInput
�� 
(
��  
(
��  !
Stream
��! '
)
��' (
obj
��( +
)
��+ ,
;
��, -
}
�� 
else
�� 
if
�� 
(
�� 
obj
�� 
is
�� 
XmlDocument
�� '
)
��' (
{
�� "
LoadXmlDocumentInput
�� $
(
��$ %
(
��% &
XmlDocument
��& 1
)
��1 2
obj
��2 5
)
��5 6
;
��6 7
}
�� 
}
�� 	
private
�� 
void
�� 
LoadStreamInput
�� $
(
��$ %
Stream
��% +
stream
��, 2
)
��2 3
{
�� 	
XmlDocument
�� 
document
��  
=
��! "
new
��# &
XmlDocument
��' 2
(
��2 3
)
��3 4
;
��4 5
document
�� 
.
��  
PreserveWhitespace
�� '
=
��( )
true
��* .
;
��. /
XmlResolver
�� 
resolver
��  
=
��! "
(
��# $
ResolverSet
��$ /
?
��0 1
_xmlResolver
��2 >
:
��? @
new
��A D
XmlSecureResolver
��E V
(
��V W
new
��W Z
XmlUrlResolver
��[ i
(
��i j
)
��j k
,
��k l
BaseURI
��m t
)
��t u
)
��u v
;
��v w
	XmlReader
�� 
	xmlReader
�� 
=
��  !
Utils
��" '
.
��' (#
PreProcessStreamInput
��( =
(
��= >
stream
��> D
,
��D E
resolver
��F N
,
��N O
BaseURI
��P W
)
��W X
;
��X Y
document
�� 
.
�� 
Load
�� 
(
�� 
	xmlReader
�� #
)
��# $
;
��$ %!
_containingDocument
�� 
=
��  !
document
��" *
;
��* +
_nsm
�� 
=
�� 
new
�� !
XmlNamespaceManager
�� *
(
��* +!
_containingDocument
��+ >
.
��> ?
	NameTable
��? H
)
��H I
;
��I J
_nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� #
,
��# $
EncryptedXml
��% 1
.
��1 2 
XmlEncNamespaceUrl
��2 D
)
��D E
;
��E F 
_encryptedDataList
�� 
=
��  
document
��! )
.
��) *
SelectNodes
��* 5
(
��5 6
$str
��6 K
,
��K L
_nsm
��M Q
)
��Q R
;
��R S
}
�� 	
private
�� 
void
�� "
LoadXmlDocumentInput
�� )
(
��) *
XmlDocument
��* 5
document
��6 >
)
��> ?
{
�� 	
if
�� 
(
�� 
document
�� 
==
�� 
null
��  
)
��  !
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
document
��7 ?
)
��? @
)
��@ A
;
��A B!
_containingDocument
�� 
=
��  !
document
��" *
;
��* +
_nsm
�� 
=
�� 
new
�� !
XmlNamespaceManager
�� *
(
��* +
document
��+ 3
.
��3 4
	NameTable
��4 =
)
��= >
;
��> ?
_nsm
�� 
.
�� 
AddNamespace
�� 
(
�� 
$str
�� #
,
��# $
EncryptedXml
��% 1
.
��1 2 
XmlEncNamespaceUrl
��2 D
)
��D E
;
��E F 
_encryptedDataList
�� 
=
��  
document
��! )
.
��) *
SelectNodes
��* 5
(
��5 6
$str
��6 K
,
��K L
_nsm
��M Q
)
��Q R
;
��R S
}
�� 	
private
�� 
void
�� "
ReplaceEncryptedData
�� )
(
��) *

XmlElement
��* 4"
encryptedDataElement
��5 I
,
��I J
byte
��K O
[
��O P
]
��P Q
	decrypted
��R [
)
��[ \
{
�� 	
XmlNode
�� 
parent
�� 
=
�� "
encryptedDataElement
�� 1
.
��1 2

ParentNode
��2 <
;
��< =
if
�� 
(
�� 
parent
�� 
.
�� 
NodeType
�� 
==
��  "
XmlNodeType
��# .
.
��. /
Document
��/ 7
)
��7 8
{
�� 
parent
�� 
.
�� 
InnerXml
�� 
=
��  !
EncryptedXml
��" .
.
��. /
Encoding
��/ 7
.
��7 8
	GetString
��8 A
(
��A B
	decrypted
��B K
)
��K L
;
��L M
}
�� 
else
�� 
{
�� 
EncryptedXml
�� 
.
�� 
ReplaceData
�� (
(
��( )"
encryptedDataElement
��) =
,
��= >
	decrypted
��? H
)
��H I
;
��I J
}
�� 
}
�� 	
private
�� 
bool
�� &
ProcessEncryptedDataItem
�� -
(
��- .

XmlElement
��. 8"
encryptedDataElement
��9 M
)
��M N
{
�� 	
if
�� 
(
�� 

ExceptUris
�� 
.
�� 
Count
��  
>
��! "
$num
��# $
)
��$ %
{
�� 
for
�� 
(
�� 
int
�� 
index
�� 
=
��  
$num
��! "
;
��" #
index
��$ )
<
��* +

ExceptUris
��, 6
.
��6 7
Count
��7 <
;
��< =
index
��> C
++
��C E
)
��E F
{
�� 
if
�� 
(
�� 
IsTargetElement
�� '
(
��' ("
encryptedDataElement
��( <
,
��< =
(
��> ?
string
��? E
)
��E F

ExceptUris
��F P
[
��P Q
index
��Q V
]
��V W
)
��W X
)
��X Y
return
�� 
false
�� $
;
��$ %
}
�� 
}
�� 
EncryptedData
�� 
ed
�� 
=
�� 
new
�� "
EncryptedData
��# 0
(
��0 1
)
��1 2
;
��2 3
ed
�� 
.
�� 
LoadXml
�� 
(
�� "
encryptedDataElement
�� +
)
��+ ,
;
��, -
ICipherParameters
�� 
symAlg
�� $
=
��% &
EncryptedXml
��' 3
.
��3 4
GetDecryptionKey
��4 D
(
��D E
ed
��E G
,
��G H
null
��I M
)
��M N
;
��N O
if
�� 
(
�� 
symAlg
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q3
%Cryptography_Xml_MissingDecryptionKey
��Q v
)
��v w
;
��w x
byte
�� 
[
�� 
]
�� 
	decrypted
�� 
=
�� 
EncryptedXml
�� +
.
��+ ,
DecryptData
��, 7
(
��7 8
ed
��8 :
,
��: ;
symAlg
��< B
)
��B C
;
��C D"
ReplaceEncryptedData
��  
(
��  !"
encryptedDataElement
��! 5
,
��5 6
	decrypted
��7 @
)
��@ A
;
��A B
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
void
�� '
ProcessElementRecursively
�� .
(
��. /
XmlNodeList
��/ :
encryptedDatas
��; I
)
��I J
{
�� 	
if
�� 
(
�� 
encryptedDatas
�� 
==
�� !
null
��" &
||
��' )
encryptedDatas
��* 8
.
��8 9
Count
��9 >
==
��? A
$num
��B C
)
��C D
return
�� 
;
�� 
Queue
�� !
encryptedDatasQueue
�� %
=
��& '
new
��( +
Queue
��, 1
(
��1 2
)
��2 3
;
��3 4
foreach
�� 
(
�� 
XmlNode
�� 
value
�� "
in
��# %
encryptedDatas
��& 4
)
��4 5
{
�� !
encryptedDatasQueue
�� #
.
��# $
Enqueue
��$ +
(
��+ ,
value
��, 1
)
��1 2
;
��2 3
}
�� 
XmlNode
�� 
node
�� 
=
�� !
encryptedDatasQueue
�� .
.
��. /
Dequeue
��/ 6
(
��6 7
)
��7 8
as
��9 ;
XmlNode
��< C
;
��C D
while
�� 
(
�� 
node
�� 
!=
�� 
null
�� 
)
��  
{
�� 

XmlElement
�� "
encryptedDataElement
�� /
=
��0 1
node
��2 6
as
��7 9

XmlElement
��: D
;
��D E
if
�� 
(
�� "
encryptedDataElement
�� (
!=
��) +
null
��, 0
&&
��1 3"
encryptedDataElement
��4 H
.
��H I
	LocalName
��I R
==
��S U
$str
��V e
&&
��f h"
encryptedDataElement
�� (
.
��( )
NamespaceURI
��) 5
==
��6 8
EncryptedXml
��9 E
.
��E F 
XmlEncNamespaceUrl
��F X
)
��X Y
{
�� 
XmlNode
�� 
sibling
�� #
=
��$ %"
encryptedDataElement
��& :
.
��: ;
NextSibling
��; F
;
��F G
XmlNode
�� 
parent
�� "
=
��# $"
encryptedDataElement
��% 9
.
��9 :

ParentNode
��: D
;
��D E
if
�� 
(
�� &
ProcessEncryptedDataItem
�� 0
(
��0 1"
encryptedDataElement
��1 E
)
��E F
)
��F G
{
�� 
XmlNode
�� 
child
��  %
=
��& '
parent
��( .
.
��. /

FirstChild
��/ 9
;
��9 :
while
�� 
(
�� 
child
�� $
!=
��% '
null
��( ,
&&
��- /
child
��0 5
.
��5 6
NextSibling
��6 A
!=
��B D
sibling
��E L
)
��L M
child
�� !
=
��" #
child
��$ )
.
��) *
NextSibling
��* 5
;
��5 6
if
�� 
(
�� 
child
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
XmlNodeList
�� '
nodes
��( -
=
��. /
child
��0 5
.
��5 6
SelectNodes
��6 A
(
��A B
$str
��B W
,
��W X
_nsm
��Y ]
)
��] ^
;
��^ _
if
�� 
(
��  
nodes
��  %
.
��% &
Count
��& +
>
��, -
$num
��. /
)
��/ 0
{
�� 
foreach
��  '
(
��( )
XmlNode
��) 0
value
��1 6
in
��7 9
nodes
��: ?
)
��? @
{
��  !!
encryptedDatasQueue
��$ 7
.
��7 8
Enqueue
��8 ?
(
��? @
value
��@ E
)
��E F
;
��F G
}
��  !
}
�� 
}
�� 
}
�� 
}
�� 
if
�� 
(
�� !
encryptedDatasQueue
�� '
.
��' (
Count
��( -
==
��. 0
$num
��1 2
)
��2 3
break
�� 
;
�� 
node
�� 
=
�� !
encryptedDatasQueue
�� *
.
��* +
Dequeue
��+ 2
(
��2 3
)
��3 4
as
��5 7
XmlNode
��8 ?
;
��? @
}
�� 
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
)
��) *
{
�� 	
if
�� 
(
��  
_encryptedDataList
�� "
!=
��# %
null
��& *
)
��* +'
ProcessElementRecursively
�� )
(
��) * 
_encryptedDataList
��* <
)
��< =
;
��= >
Utils
�� 
.
�� 
AddNamespaces
�� 
(
��  !
_containingDocument
��  3
.
��3 4
DocumentElement
��4 C
,
��C D"
PropagatedNamespaces
��E Y
)
��Y Z
;
��Z [
return
�� !
_containingDocument
�� &
;
��& '
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 	
if
�� 
(
�� 
type
�� 
==
�� 
typeof
�� 
(
�� 
XmlDocument
�� *
)
��* +
)
��+ ,
return
�� 
(
�� 
XmlDocument
�� #
)
��# $
	GetOutput
��$ -
(
��- .
)
��. /
;
��/ 0
else
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
}
�� 	
}
�� 
}�� �X
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
�� 	
return
�� 
_cs
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 	
if
�� 
(
�� 
type
�� 
!=
�� 
typeof
�� 
(
�� 
Stream
�� %
)
��% &
&&
��' )
!
��* +
type
��+ /
.
��/ 0
IsSubclassOf
��0 <
(
��< =
typeof
��= C
(
��C D
Stream
��D J
)
��J K
)
��K L
)
��L M
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
return
�� 
_cs
�� 
;
�� 
}
�� 	
}
�� 
}�� �8
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
}`` �
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
} ��
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
2Cryptography_Xml_EnvelopedSignatureRequiresContext	__Q �
)
__� �
;
__� �
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
2Cryptography_Xml_EnvelopedSignatureRequiresContext	kkQ �
)
kk� �
;
kk� �
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
2Cryptography_Xml_EnvelopedSignatureRequiresContext	~~Q �
)
~~� �
;
~~� �
if
�� 
(
�� 
_inputNodeList
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
if
�� 
(
��  
_signaturePosition
�� &
==
��' )
$num
��* +
)
��+ ,
return
��- 3
_inputNodeList
��4 B
;
��B C
XmlNodeList
�� 
signatureList
�� )
=
��* +!
_containingDocument
��, ?
.
��? @
SelectNodes
��@ K
(
��K L
$str
��L ^
,
��^ _
_nsm
��` d
)
��d e
;
��e f
if
�� 
(
�� 
signatureList
�� !
==
��" $
null
��% )
)
��) *
return
��+ 1
_inputNodeList
��2 @
;
��@ A"
CanonicalXmlNodeList
�� $
resultNodeList
��% 3
=
��4 5
new
��6 9"
CanonicalXmlNodeList
��: N
(
��N O
)
��O P
;
��P Q
foreach
�� 
(
�� 
XmlNode
��  
node
��! %
in
��& (
_inputNodeList
��) 7
)
��7 8
{
�� 
if
�� 
(
�� 
node
�� 
==
�� 
null
��  $
)
��$ %
continue
��& .
;
��. /
if
�� 
(
�� 
Utils
�� 
.
��  
IsXmlNamespaceNode
�� 0
(
��0 1
node
��1 5
)
��5 6
||
��7 9
Utils
��: ?
.
��? @
IsNamespaceNode
��@ O
(
��O P
node
��P T
)
��T U
)
��U V
{
�� 
resultNodeList
�� &
.
��& '
Add
��' *
(
��* +
node
��+ /
)
��/ 0
;
��0 1
}
�� 
else
�� 
{
�� 
try
�� 
{
�� 
XmlNode
�� #
result
��$ *
=
��+ ,
node
��- 1
.
��1 2
SelectSingleNode
��2 B
(
��B C
$str
��C h
,
��h i
_nsm
��j n
)
��n o
;
��o p
int
�� 
position
��  (
=
��) *
$num
��+ ,
;
��, -
foreach
�� #
(
��$ %
XmlNode
��% ,
node1
��- 2
in
��3 5
signatureList
��6 C
)
��C D
{
�� 
position
��  (
++
��( *
;
��* +
if
��  "
(
��# $
node1
��$ )
==
��* ,
result
��- 3
)
��3 4
break
��5 :
;
��: ;
}
�� 
if
�� 
(
��  
result
��  &
==
��' )
null
��* .
||
��/ 1
position
��2 :
!=
��; = 
_signaturePosition
��> P
)
��P Q
{
�� 
resultNodeList
��  .
.
��. /
Add
��/ 2
(
��2 3
node
��3 7
)
��7 8
;
��8 9
}
�� 
}
�� 
catch
�� 
{
�� 
}
��  !
}
�� 
}
�� 
return
�� 
resultNodeList
�� %
;
��% &
}
�� 
else
�� 
{
�� 
XmlNodeList
�� 
signatureList
�� )
=
��* +!
_containingDocument
��, ?
.
��? @
SelectNodes
��@ K
(
��K L
$str
��L ^
,
��^ _
_nsm
��` d
)
��d e
;
��e f
if
�� 
(
�� 
signatureList
�� !
==
��" $
null
��% )
)
��) *
return
��+ 1!
_containingDocument
��2 E
;
��E F
if
�� 
(
�� 
signatureList
�� !
.
��! "
Count
��" '
<
��( ) 
_signaturePosition
��* <
||
��= ? 
_signaturePosition
��@ R
<=
��S U
$num
��V W
)
��W X
return
��Y _!
_containingDocument
��` s
;
��s t
signatureList
�� 
[
��  
_signaturePosition
�� 0
-
��1 2
$num
��3 4
]
��4 5
.
��5 6

ParentNode
��6 @
.
��@ A
RemoveChild
��A L
(
��L M
signatureList
��M Z
[
��Z [ 
_signaturePosition
��[ m
-
��n o
$num
��p q
]
��q r
)
��r s
;
��s t
return
�� !
_containingDocument
�� *
;
��* +
}
�� 
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 	
if
�� 
(
�� 
type
�� 
==
�� 
typeof
�� 
(
�� 
XmlNodeList
�� *
)
��* +
||
��, .
type
��/ 3
.
��3 4
IsSubclassOf
��4 @
(
��@ A
typeof
��A G
(
��G H
XmlNodeList
��H S
)
��S T
)
��T U
)
��U V
{
�� 
if
�� 
(
�� 
_inputNodeList
�� "
==
��# %
null
��& *
)
��* +
{
�� 
_inputNodeList
�� "
=
��# $
Utils
��% *
.
��* + 
AllDescendantNodes
��+ =
(
��= >!
_containingDocument
��> Q
,
��Q R
true
��S W
)
��W X
;
��X Y
}
�� 
return
�� 
(
�� 
XmlNodeList
�� #
)
��# $
	GetOutput
��$ -
(
��- .
)
��. /
;
��/ 0
}
�� 
else
�� 
if
�� 
(
�� 
type
�� 
==
�� 
typeof
�� #
(
��# $
XmlDocument
��$ /
)
��/ 0
||
��1 3
type
��4 8
.
��8 9
IsSubclassOf
��9 E
(
��E F
typeof
��F L
(
��L M
XmlDocument
��M X
)
��X Y
)
��Y Z
)
��Z [
{
�� 
if
�� 
(
�� 
_inputNodeList
�� "
!=
��# %
null
��& *
)
��* +
throw
��, 1
new
��2 5
ArgumentException
��6 G
(
��G H
SR
��H J
.
��J K:
,Cryptography_Xml_TransformIncorrectInputType
��K w
,
��w x
nameof
��y 
(�� �
type��� �
)��� �
)��� �
;��� �
return
�� 
(
�� 
XmlDocument
�� #
)
��# $
	GetOutput
��$ -
(
��- .
)
��. /
;
��/ 0
}
�� 
else
�� 
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
}
�� 
}
�� 	
}
�� 
}�� �`
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
XmlDsigExcC14NTransformUrl	##h �
)
##� �
;
##� �
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
!Cryptography_Xml_UnknownTransform	EEa �
)
EE� �
;
EE� �
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
XmlDsigNamespaceUrl	GGo �
)
GG� �
;
GG� �
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
;	LL �
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
XX� �
)
XX� �
;
XX� �
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
resolver	\\{ �
)
\\� �
;
\\� �
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
resolver	``{ �
)
``� �
;
``� �
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
�� 
override
�� 
void
�� 
GetDigestedOutput
�� .
(
��. /
IHash
��/ 4
signer
��5 ;
)
��; <
{
�� 	
_excCanonicalXml
�� 
.
�� 
GetDigestedBytes
�� -
(
��- .
signer
��. 4
)
��4 5
;
��5 6
}
�� 	
}
�� 
}�� �	
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
inclusiveNamespacesPrefixList	f �
)
� �
{ 	
	Algorithm 
= 
	SignedXml !
.! "2
&XmlDsigExcC14NWithCommentsTransformUrl" H
;H I
} 	
}   
}!! ф
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
;	?? �
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
�� 
LoadStreamInput
�� 
(
��  
(
��  !
Stream
��! '
)
��' (
obj
��( +
)
��+ ,
;
��, -
}
�� 
else
�� 
if
�� 
(
�� 
obj
�� 
is
�� 
XmlNodeList
�� '
)
��' (
{
�� "
LoadXmlNodeListInput
�� $
(
��$ %
(
��% &
XmlNodeList
��& 1
)
��1 2
obj
��2 5
)
��5 6
;
��6 7
}
�� 
else
�� 
if
�� 
(
�� 
obj
�� 
is
�� 
XmlDocument
�� '
)
��' (
{
�� "
LoadXmlDocumentInput
�� $
(
��$ %
(
��% &
XmlDocument
��& 1
)
��1 2
obj
��2 5
)
��5 6
;
��6 7
}
�� 
}
�� 	
private
�� 
void
�� 
LoadStreamInput
�� $
(
��$ %
Stream
��% +
stream
��, 2
)
��2 3
{
�� 	
XmlResolver
�� 
resolver
��  
=
��! "
(
��# $
ResolverSet
��$ /
?
��0 1
_xmlResolver
��2 >
:
��? @
new
��A D
XmlSecureResolver
��E V
(
��V W
new
��W Z
XmlUrlResolver
��[ i
(
��i j
)
��j k
,
��k l
BaseURI
��m t
)
��t u
)
��u v
;
��v w
	XmlReader
�� 
	valReader
�� 
=
��  !
Utils
��" '
.
��' (#
PreProcessStreamInput
��( =
(
��= >
stream
��> D
,
��D E
resolver
��F N
,
��N O
BaseURI
��P W
)
��W X
;
��X Y
	_document
�� 
=
�� 
new
�� 
XmlDocument
�� '
(
��' (
)
��( )
;
��) *
	_document
�� 
.
��  
PreserveWhitespace
�� (
=
��) *
true
��+ /
;
��/ 0
	_document
�� 
.
�� 
Load
�� 
(
�� 
	valReader
�� $
)
��$ %
;
��% &
}
�� 	
private
�� 
void
�� "
LoadXmlNodeListInput
�� )
(
��) *
XmlNodeList
��* 5
nodeList
��6 >
)
��> ?
{
�� 	
XmlResolver
�� 
resolver
��  
=
��! "
(
��# $
ResolverSet
��$ /
?
��0 1
_xmlResolver
��2 >
:
��? @
new
��A D
XmlSecureResolver
��E V
(
��V W
new
��W Z
XmlUrlResolver
��[ i
(
��i j
)
��j k
,
��k l
BaseURI
��m t
)
��t u
)
��u v
;
��v w
CanonicalXml
�� 
c14n
�� 
=
�� 
new
��  #
CanonicalXml
��$ 0
(
��0 1
(
��1 2
XmlNodeList
��2 =
)
��= >
nodeList
��> F
,
��F G
resolver
��H P
,
��P Q
true
��R V
)
��V W
;
��W X
using
�� 
(
�� 
MemoryStream
�� 
ms
��  "
=
��# $
new
��% (
MemoryStream
��) 5
(
��5 6
c14n
��6 :
.
��: ;
GetBytes
��; C
(
��C D
)
��D E
)
��E F
)
��F G
{
�� 
LoadStreamInput
�� 
(
��  
ms
��  "
)
��" #
;
��# $
}
�� 
}
�� 	
private
�� 
void
�� "
LoadXmlDocumentInput
�� )
(
��) *
XmlDocument
��* 5
doc
��6 9
)
��9 :
{
�� 	
	_document
�� 
=
�� 
doc
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
)
��) *
{
�� 	"
CanonicalXmlNodeList
��  
resultNodeList
��! /
=
��0 1
new
��2 5"
CanonicalXmlNodeList
��6 J
(
��J K
)
��K L
;
��L M
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &

_xpathexpr
��& 0
)
��0 1
)
��1 2
{
�� 
XPathNavigator
�� 
	navigator
�� (
=
��) *
	_document
��+ 4
.
��4 5
CreateNavigator
��5 D
(
��D E
)
��E F
;
��F G
XPathNodeIterator
�� !
it
��" $
=
��% &
	navigator
��' 0
.
��0 1
Select
��1 7
(
��7 8
$str
��8 D
)
��D E
;
��E F
XPathExpression
�� 
	xpathExpr
��  )
=
��* +
	navigator
��, 5
.
��5 6
Compile
��6 =
(
��= >
$str
��> H
+
��I J

_xpathexpr
��K U
+
��V W
$str
��X [
)
��[ \
;
��\ ]
	xpathExpr
�� 
.
�� 

SetContext
�� $
(
��$ %
_nsm
��% )
)
��) *
;
��* +
while
�� 
(
�� 
it
�� 
.
�� 
MoveNext
�� "
(
��" #
)
��# $
)
��$ %
{
�� 
XmlNode
�� 
node
��  
=
��! "
(
��# $
(
��$ %
IHasXmlNode
��% 0
)
��0 1
it
��1 3
.
��3 4
Current
��4 ;
)
��; <
.
��< =
GetNode
��= D
(
��D E
)
��E F
;
��F G
bool
�� 
include
��  
=
��! "
(
��# $
bool
��$ (
)
��( )
it
��) +
.
��+ ,
Current
��, 3
.
��3 4
Evaluate
��4 <
(
��< =
	xpathExpr
��= F
)
��F G
;
��G H
if
�� 
(
�� 
include
�� 
==
��  "
true
��# '
)
��' (
resultNodeList
�� &
.
��& '
Add
��' *
(
��* +
node
��+ /
)
��/ 0
;
��0 1
}
�� 
it
�� 
=
�� 
	navigator
�� 
.
�� 
Select
�� %
(
��% &
$str
��& 6
)
��6 7
;
��7 8
while
�� 
(
�� 
it
�� 
.
�� 
MoveNext
�� "
(
��" #
)
��# $
)
��$ %
{
�� 
XmlNode
�� 
node
��  
=
��! "
(
��# $
(
��$ %
IHasXmlNode
��% 0
)
��0 1
it
��1 3
.
��3 4
Current
��4 ;
)
��; <
.
��< =
GetNode
��= D
(
��D E
)
��E F
;
��F G
resultNodeList
�� "
.
��" #
Add
��# &
(
��& '
node
��' +
)
��+ ,
;
��, -
}
�� 
}
�� 
return
�� 
resultNodeList
�� !
;
��! "
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 	
if
�� 
(
�� 
type
�� 
!=
�� 
typeof
�� 
(
�� 
XmlNodeList
�� *
)
��* +
&&
��, .
!
��/ 0
type
��0 4
.
��4 5
IsSubclassOf
��5 A
(
��A B
typeof
��B H
(
��H I
XmlNodeList
��I T
)
��T U
)
��U V
)
��V W
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
return
�� 
(
�� 
XmlNodeList
�� 
)
��  
	GetOutput
��  )
(
��) *
)
��* +
;
��+ ,
}
�� 	
}
�� 
}�� �c
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
�� 
(
�� 
StringReader
�� 
sr
��  "
=
��# $
new
��% (
StringReader
��) 5
(
��5 6
_xslFragment
��6 B
)
��B C
)
��C D
{
�� 
	XmlReader
�� 
	readerXsl
�� #
=
��$ %
	XmlReader
��& /
.
��/ 0
Create
��0 6
(
��6 7
sr
��7 9
,
��9 :
settings
��; C
,
��C D
(
��E F
string
��F L
)
��L M
null
��M Q
)
��Q R
;
��R S
xslt
�� 
.
�� 
Load
�� 
(
�� 
	readerXsl
�� #
,
��# $
XsltSettings
��% 1
.
��1 2
Default
��2 9
,
��9 :
null
��; ?
)
��? @
;
��@ A
	XmlReader
�� 
reader
��  
=
��! "
	XmlReader
��# ,
.
��, -
Create
��- 3
(
��3 4
_inputStream
��4 @
,
��@ A
settings
��B J
,
��J K
BaseURI
��L S
)
��S T
;
��T U
XPathDocument
�� 
	inputData
�� '
=
��( )
new
��* -
XPathDocument
��. ;
(
��; <
reader
��< B
,
��B C
XmlSpace
��D L
.
��L M
Preserve
��M U
)
��U V
;
��V W
MemoryStream
�� 
ms
�� 
=
��  !
new
��" %
MemoryStream
��& 2
(
��2 3
)
��3 4
;
��4 5
	XmlWriter
�� 
writer
��  
=
��! "
new
��# &
XmlTextWriter
��' 4
(
��4 5
ms
��5 7
,
��7 8
null
��9 =
)
��= >
;
��> ?
xslt
�� 
.
�� 
	Transform
�� 
(
�� 
	inputData
�� (
,
��( )
null
��* .
,
��. /
writer
��0 6
)
��6 7
;
��7 8
ms
�� 
.
�� 
Position
�� 
=
�� 
$num
�� 
;
��  
return
�� 
ms
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
override
�� 
object
�� 
	GetOutput
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 	
if
�� 
(
�� 
type
�� 
!=
�� 
typeof
�� 
(
�� 
Stream
�� %
)
��% &
&&
��' )
!
��* +
type
��+ /
.
��/ 0
IsSubclassOf
��0 <
(
��< =
typeof
��= C
(
��C D
Stream
��D J
)
��J K
)
��K L
)
��L M
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
return
�� 
(
�� 
Stream
�� 
)
�� 
	GetOutput
�� $
(
��$ %
)
��% &
;
��& '
}
�� 	
}
�� 
}�� ��
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
_namespaceManager	;;u �
)
;;� �
as
;;� �

XmlElement
;;� �
;
;;� �
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

XmlElement	<<z �
;
<<� �

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

XmlElement	== �
;
==� �
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
)Cryptography_Xml_XrmlUnableToDecryptGrant	UU] �
)
UU� �
;
UU� �
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
�� 
(
�� 
(
�� 
type
�� 
!=
�� 
typeof
�� 
(
��  
XmlDocument
��  +
)
��+ ,
)
��, -
&&
��. 0
(
��1 2
!
��2 3
type
��3 7
.
��7 8
IsSubclassOf
��8 D
(
��D E
typeof
��E K
(
��K L
XmlDocument
��L W
)
��W X
)
��X Y
)
��Y Z
)
��Z [
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
SR
��, .
.
��. /:
,Cryptography_Xml_TransformIncorrectInputType
��/ [
,
��[ \
nameof
��] c
(
��c d
type
��d h
)
��h i
)
��i j
;
��j k
return
�� 
	GetOutput
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
void
�� 
LoadInnerXml
�� )
(
��) *
XmlNodeList
��* 5
nodeList
��6 >
)
��> ?
{
�� 	
if
�� 
(
�� 
nodeList
�� 
!=
�� 
null
��  
&&
��! #
nodeList
��$ ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
)
��6 7
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q/
!Cryptography_Xml_UnknownTransform
��Q r
)
��r s
;
��s t
}
�� 	
public
�� 
override
�� 
void
�� 
	LoadInput
�� &
(
��& '
object
��' -
obj
��. 1
)
��1 2
{
�� 	
if
�� 
(
�� 
Context
�� 
==
�� 
null
�� 
)
��  
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q1
#Cryptography_Xml_XrmlMissingContext
��Q t
)
��t u
;
��u v
_license
�� 
=
�� 
new
�� 
XmlDocument
�� &
(
��& '
)
��' (
;
��( )
_license
�� 
.
��  
PreserveWhitespace
�� '
=
��( )
true
��* .
;
��. /
_namespaceManager
�� 
=
�� 
new
��  #!
XmlNamespaceManager
��$ 7
(
��7 8
_license
��8 @
.
��@ A
	NameTable
��A J
)
��J K
;
��K L
_namespaceManager
�� 
.
�� 
AddNamespace
�� *
(
��* +
$str
��+ 1
,
��1 2
	SignedXml
��3 <
.
��< =!
XmlDsigNamespaceUrl
��= P
)
��P Q
;
��Q R
_namespaceManager
�� 
.
�� 
AddNamespace
�� *
(
��* +
$str
��+ 0
,
��0 1
EncryptedXml
��2 >
.
��> ? 
XmlEncNamespaceUrl
��? Q
)
��Q R
;
��R S
_namespaceManager
�� 
.
�� 
AddNamespace
�� *
(
��* +
$str
��+ .
,
��. /
NamespaceUriCore
��0 @
)
��@ A
;
��A B

XmlElement
�� "
currentIssuerContext
�� +
=
��, -
null
��. 2
;
��2 3

XmlElement
�� #
currentLicenseContext
�� ,
=
��- .
null
��/ 3
;
��3 4
XmlNode
�� 
signatureNode
�� !
=
��" #
null
��$ (
;
��( )"
currentIssuerContext
��  
=
��! "
Context
��# *
.
��* +
SelectSingleNode
��+ ;
(
��; <
$str
��< [
,
��[ \
_namespaceManager
��] n
)
��n o
as
��p r

XmlElement
��s }
;
��} ~
if
�� 
(
�� "
currentIssuerContext
�� $
==
��% '
null
��( ,
)
��, -
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q0
"Cryptography_Xml_XrmlMissingIssuer
��Q s
)
��s t
;
��t u
signatureNode
�� 
=
�� "
currentIssuerContext
�� 0
.
��0 1
SelectSingleNode
��1 A
(
��A B
$str
��B i
,
��i j
_namespaceManager
��k |
)
��| }
as��~ �

XmlElement��� �
;��� �
if
�� 
(
�� 
signatureNode
�� 
!=
��  
null
��! %
)
��% &
signatureNode
�� 
.
�� 

ParentNode
�� (
.
��( )
RemoveChild
��) 4
(
��4 5
signatureNode
��5 B
)
��B C
;
��C D#
currentLicenseContext
�� !
=
��" #"
currentIssuerContext
��$ 8
.
��8 9
SelectSingleNode
��9 I
(
��I J
$str
��J j
,
��j k
_namespaceManager
��l }
)
��} ~
as�� �

XmlElement��� �
;��� �
if
�� 
(
�� #
currentLicenseContext
�� %
==
��& (
null
��) -
)
��- .
throw
�� 
new
�� 
System
��  
.
��  !
Security
��! )
.
��) *
Cryptography
��* 6
.
��6 7$
CryptographicException
��7 M
(
��M N
SR
��N P
.
��P Q1
#Cryptography_Xml_XrmlMissingLicence
��Q t
)
��t u
;
��u v
XmlNodeList
�� 

issuerList
�� "
=
��# $#
currentLicenseContext
��% :
.
��: ;
SelectNodes
��; F
(
��F G
$str
��G r
,
��r s 
_namespaceManager��t �
)��� �
;��� �
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
,
�� 
count
�� !
=
��" #

issuerList
��$ .
.
��. /
Count
��/ 4
;
��4 5
i
��6 7
<
��8 9
count
��: ?
;
��? @
i
��A B
++
��B D
)
��D E
{
�� 
if
�� 
(
�� 

issuerList
�� 
[
�� 
i
��  
]
��  !
==
��" $"
currentIssuerContext
��% 9
)
��9 :
continue
�� 
;
�� 
if
�� 
(
�� 
(
�� 

issuerList
�� 
[
��  
i
��  !
]
��! "
.
��" #
	LocalName
��# ,
==
��- /
ElementIssuer
��0 =
)
��= >
&&
��? A
(
�� 

issuerList
�� 
[
��  
i
��  !
]
��! "
.
��" #
NamespaceURI
��# /
==
��0 2
NamespaceUriCore
��3 C
)
��C D
)
��D E

issuerList
�� 
[
�� 
i
��  
]
��  !
.
��! "

ParentNode
��" ,
.
��, -
RemoveChild
��- 8
(
��8 9

issuerList
��9 C
[
��C D
i
��D E
]
��E F
)
��F G
;
��G H
}
�� 
XmlNodeList
��  
encryptedGrantList
�� *
=
��+ ,#
currentLicenseContext
��- B
.
��B C
SelectNodes
��C N
(
��N O
$str
��O t
,
��t u 
_namespaceManager��v �
)��� �
;��� �
if
�� 
(
��  
encryptedGrantList
�� "
.
��" #
Count
��# (
>
��) *
$num
��+ ,
)
��, -
{
�� 
if
�� 
(
�� 
_relDecryptor
�� !
==
��" $
null
��% )
)
��) *
throw
�� 
new
�� 
System
�� $
.
��$ %
Security
��% -
.
��- .
Cryptography
��. :
.
��: ;$
CryptographicException
��; Q
(
��Q R
SR
��R T
.
��T U7
)Cryptography_Xml_XrmlMissingIRelDecryptor
��U ~
)
��~ 
;�� �$
DecryptEncryptedGrants
�� &
(
��& ' 
encryptedGrantList
��' 9
,
��9 :
_relDecryptor
��; H
)
��H I
;
��I J
}
�� 
_license
�� 
.
�� 
InnerXml
�� 
=
�� #
currentLicenseContext
��  5
.
��5 6
OuterXml
��6 >
;
��> ?
}
�� 	
}
�� 
}�� 
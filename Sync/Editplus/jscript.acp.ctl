#TITLE=JScript
#INFO
EditPlus JScript auto completion file.
Author: W. Jordan (Zuo Weiming)
Date: 2005-12-2
Contact: wmjordan@163.com

Please read "http://www.editplus.info/wiki/%22Typed_Notation%22_for_%22Weakly-Typed%22_languages" for more information about the "Typed Notation" in this file.

#SORT=n

#T=_________________
#T=  JScript commands
#T=case
case ^!:
#T=BEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEGIN



#T=fl
false
#T=tr
true
#T=api
var  = function (){
	var ap = ajaxProxy;
	ap.addParm(1,);
	ap.invokeProc("APPUSER2017.").then(function(resp){
		if(resp.status == 200 && resp.data.PN_RET*1 == 0){

		}else{
			layer.alert(""+resp.data.PC_MSG,{icon:7});
		}
});}
#T=sf
var ^! =function () {
}
#T=cl
console.log(^!);
#T=al
assert.log(^!);
#T=anguuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuular



#T=sp
scope.
#T=EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEND





#T=catch
catch (^!) {
}
#T=default
default:^!
#T=do
do {
} while (^!);
#T=else
else {
	^!
}
#T=elseif
else if (^!) {
}
#T=eval
eval (^!)
#T=finally
finally {
	^!
}
#T=for
for (var i=0; i<^!; i++) {
}
#T=forl
for (var i=0, l = ^!.length; i < l; ++i) {
}
#T=forin
for (var i in ^!) {
}
#T=afunc
function (^!) {
}
#T=func
function ^! () {
}
#T=function
function ^! () {
}
#T=if
if (^!) {
}
#T=switch
switch (^!) {
case :

}
#T=try
try {
	^!
}
catch () {
}
#T=typeof
typeof (^!)
#T=while
while (^!) {
}
#T=with
with (^!) {
}
#T=_________________
#T=  Convenient Expressions
#T=and
&& ^!
#T=br
break;
#T=cont
continue;
#T=efalse
= false;
#T=enull
= null;
#T=eqfalse
= false;
#T=eqnull
= null;
#T=eqtrue
= true;
#T=etrue
= true;
#T=ge
>= 
#T=gt
> 
#T=is
== ^!
#T=isfalse
== false
#T=isnull
== null
#T=iss
== "^!"
#T=istrue
== true
#T=le
<= 
#T=lt
< 
#T=ne
!= ^!
#T=nefalse
!= false
#T=nenull
!= null
#T=nes
!= "^!"
#T=netrue
!= true
#T=nofalse
!= false
#T=nonull
!= null
#T=notrue
!= true
#T=or
|| ^!
#T=rt
return ^!;
#T=ret
return ^!;
#T=_________________
#T=  Typed Notation
#T=tarray
/*Array*/ 
#T=varray
var /*Array */ ^! = new Array ();
#T=tbool
/*bool*/ 
#T=bool
var /*bool*/ 
#T=tchar
/*char*/ 
#T=char
var /*char*/ 
#T=tconst
/*const*/ 
#T=const
var /*const*/ 
#T=tdate
/*Date*/ 
#T=vdate
var /*Date*/ 
#T=tdic
/*Dictionary*/ 
#T=vdic
var /*Dictionary*/ ^! = new Dictionary ();
#T=tfloat
/*float*/ 
#T=float
var /*float*/ 
#T=tint
/*int*/ 
#T=int
var /*int*/ 
#T=tobject
/*object*/ 
#T=vobject
var /*object*/ ^! = new Object ();
#T=tregexp
/*RegExp*/ 
#T=vregexp
var /*RegExp*/ ^! = new RegExp ();
#T=tstring
/*string*/ 
#T=string
var /*string*/ ^!
#T=tvoid
/*void*/ 
#T=tclass
/* class */ 
#T=class
function /* class */ ^! {
}
#T=public
/*public*/ 
#T=pub
/*public*/ 
#T=private
/*private*/ 
#T=pri
/*private*/ 
#T=tt
/*^!*/ 
#T=_________________
#T=  Prototype Utitliy Methods
#T=$
$(^!)
#T=dd
$(^!)
#T=$$
$$(^!)
#T=ddd
$$(^!)
#T=$A
$A(^!)
#T=da
$A(^!)
#T=$F
$F(^!)
#T=df
$F(^!)
#T=$H
$H(^!)
#T=dh
$H(^!)
#T=$R
$R(^!)
#T=dr
$R(^!!)
#T=$w
$w(^!)
#T=dw
$w(^!)
#T=getbyclass
getElementsByClassName (^!)
#T=addclass
addClassName ("^!")
#T=delclass
removeClassName ("^!")
#T=removeclass
removeClassName ("^!")
#T=toggleclass
toggleClassName ("^!")
#T=doc
document.
#T=db
document.body
#T=readatt
readAttribute ("^!")
#T=setatt
setAttribute (^!)
#T=hasatt
hasAttribute ("^!")
#T=trythese
Try.these (
	function () { return ^!; },
	function () { return null; }
)
#
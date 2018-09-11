
var date = new Date();
var a = date.getDate();
console.log("===getDate===:"+a);
var b = date.getDay();
console.log("===getDay===:"+b);
var c = date.getFullYear();
console.log("===getFullYear===:"+c);
var d = date.getHours();
console.log("===getHours===:"+d);
var e = date.getMilliseconds();
console.log("===getMilliseconds===:"+e);
var f = date.getMinutes();
console.log("===getMinutes===:"+f);
var g = date.getMonth();
console.log("===getMonth===:"+g);
var h = date.getSeconds();
console.log("===getSeconds===:"+h);
var i = date.getTime();
console.log("===getTime===:"+i);
var j = date.getTimezoneOffset();
console.log("===getTimezoneOffset===:"+j);
var k = date.getUTCDate();
console.log("===getUTCDate===:"+k);
var l = date.getUTCDay();
console.log("===getUTCDay===:"+l);
var m = date.getUTCFullYear();
console.log("===getUTCFullYear===:"+m);
var n = date.getYear();
console.log("===getYear===:"+n);
var o = date.toDateString();
console.log("===toDateString===:"+o);
var p = date.toISOString();
console.log("===toISOString===:"+p);
var q = date.toJSON();
console.log("===toJSON===:"+q);
var r = date.toLocaleDateString();
console.log("===toLocaleDateString===:"+r);
var s = date.toLocaleString();
console.log("===toLocaleString===:"+s);
var t = date.toLocaleTimeString();
console.log("===toLocaleTimeString===:"+t);
var u = date.toTimeString();
console.log("===toTimeString===:"+u);
打印结果：
===getDate-------------------:10
===getDay--------------------:2
===getFullYear---------------:2017
===getHours------------------:22
===getMilliseconds-----------:79
===getMinutes----------------:52
===getMonth------------------:0
===getSeconds----------------:37
===getTime-------------------:1484059957079
===getTimezoneOffset---------:-480
===getUTCDate----------------:10
===getUTCDay-----------------:2
===getUTCFullYear------------:2017
===getYear-------------------:117
===toDateString--------------:Tue Jan 10 2017
===toISOString---------------:2017-01-10T14:52:37.079Z
===toJSON--------------------:2017-01-10T14:52:37.079Z
===toLocaleDateString--------:2017-01-10
===toLocaleString------------:2017-01-10 22:52:37
===toLocaleTimeString--------:22:52:37
===toTimeString--------------:22:52:37 GMT+0800 (中国标准时间)

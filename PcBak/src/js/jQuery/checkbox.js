//根据name获取所有checkbox的value
var slXMList = [];
$('input:checkbox[name=mycheckbox]:checked').each(function(){
    // alert("s");
 //由于复选框一般选中的是多个,所以可以循环输出 
 slXMList.push($(this).val());
}); 
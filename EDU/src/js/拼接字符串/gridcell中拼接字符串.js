//CheckBox
"<input type='checkbox' name='mycheckbox' value='"+value变量+"' id='"+id变量+"''>" + text变量 + "</input>",
//获取所有选中的checkbox
slXMList = [];
$('input:checkbox[name=mycheckbox]:checked').each(function(){
    // alert("s");
 //由于复选框一般选中的是多个,所以可以循环输出 
 slXMList.push($(this).val());
});

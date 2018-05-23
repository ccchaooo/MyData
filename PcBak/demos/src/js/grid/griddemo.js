//对象
zxmList = {"rows":
		         [{"id":"_1","data":["项目名称1111","","","",""]},
	              {"id":"_2","data":["项目名称2222","","","",""]}]};
var myGrid = new dhtmlXGridObject('zxmGrid');
myGrid.setImagePath("../script/dhtmlx/skins/web/imgs/");
myGrid.setHeader("子项目名称,子项目中标规模,子项目中标规模单位,子项目中标价（万元）,子项目中标单方价（万元）");
myGrid.setInitWidthsP("*,20,12,13,13");
myGrid.setColAlign("left,left,left,left,left");
myGrid.setColTypes("ro,ed,ed,ed,ed");
myGrid.enableAutoWidth(true);
myGrid.init();
myGrid.parse(zxmList,"json");

//setColAlign和setColTypes 与 data.length匹配

//为cell添加checkbox

myGrid.attachEvent("onRowSelect", function(id,ind){
  //获取所有的checkbox的id
    slXMList = [];
    $('input:checkbox[name=mycheckbox]:checked').each(function(){
     //由于复选框一般选中的是多个,所以可以循环输出 
     slXMList.push($(this).val());
    }); 
    console.log(slXMList);
});


//添加自动选中,并且触发点击事件
grid4subp.selectRow(0,true);



// 设置颜色

for(var i=0;i<cnt;i++){

 var rowId = myGrid.getRowId(i);

 var C_BJBZ = myGrid.getRowAttribute(rowId,'C_BJBZ');
 var C_YWCBZ = myGrid.getRowAttribute(rowId,'C_YWCBZ');

 if(C_BJBZ  == "1"){
   myGrid.setRowTextStyle(rowId, "color:#FF8040");
 }
 if(C_YWCBZ == "1"){
   myGrid.setRowTextStyle(rowId, "color:red");
 }
}

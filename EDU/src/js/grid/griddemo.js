//对象
zxmList = {
  "rows": [{
    "id": "_1",
    "data": ["项目名称1111", "", "", "", ""]
  }, {
    "id": "_2",
    "data": ["项目名称2222", "", "", "", ""]
  }]
};
var myGrid = new dhtmlXGridObject('zxmGrid');
myGrid.setImagePath("../script/dhtmlx/skins/web/imgs/");
myGrid.setHeader("子项目名称,子项目中标规模,子项目中标规模单位,子项目中标价（万元）,子项目中标单方价（万元）");
myGrid.setInitWidthsP("*,20,12,13,13");
myGrid.setColAlign("left,left,left,left,left");
myGrid.setColTypes("ro,ed,ed,ed,ed");
myGrid.enableAutoWidth(true);
myGrid.init();
myGrid.parse(zxmList, "json");

myGrid.attachEvent("onRowDblClicked", function(rId, cInd) {
  scope.f_verify();
});

//setColAlign和setColTypes 与 data.length匹配

//为cell添加checkbox

myGrid.attachEvent("onRowSelect", function(id, ind) {
  //获取所有的checkbox的id
  slXMList = [];
  $('input:checkbox[name=mycheckbox]:checked').each(function() {
    //由于复选框一般选中的是多个,所以可以循环输出 
    slXMList.push($(this).val());
  });
  console.log(slXMList);
});


//添加自动选中,并且触发点击事件
grid4subp.selectRow(0, true);



// 设置颜色

for (var i = 0; i < cnt; i++) {

  var rowId = myGrid.getRowId(i);

  var C_BJBZ = myGrid.getRowAttribute(rowId, 'C_BJBZ');
  var C_YWCBZ = myGrid.getRowAttribute(rowId, 'C_YWCBZ');

  if (C_BJBZ == "1") {
    myGrid.setRowTextStyle(rowId, "color:#FF8040");
  }
  if (C_YWCBZ == "1") {
    myGrid.setRowTextStyle(rowId, "color:red");
  }
}


//审批
scope.f_verify = function() {
  //预留申报名称,以备二次查询
  tempC_SBMC = scope.C_SBMC;
  var title = "设计文件审查";
  var rId = myGrid.getSelectedRowId();
  // console.log("rId",rId);
  if (!rId) {
    layer.alert("请选中，或者双击一行记录。", {
      icon: 8,
      zIndex: layer.zIndex
    });
    return;
  }
  var rowColumns = ("N_SPJLID,C_SPBH,N_XMID,C_SBMC,D_SPYWCSJ,D_SYYWCBJSJ,C_DQZT").split(",");
  var row = {};
  for (var i = 0; i < rowColumns.length; i++) {
    var k = rowColumns[i];
    row[k] = myGrid.getRowAttribute(rId, k);
  }
  var args = {
    "row": row
  };

  //console.log("审批所需参数",args);
  var win = top.$.MdiWindow(window, 1024, 550, 0, 0, true);
  win.setTitle(title, "font-family:微软雅黑;font-size:14px");
  win.setWindowArguments(args);
  win.btnClose(true);
  win.btnMax(false);
  win.btnMin(false);
  win.isResize(false);
  win.onCancel(function(winindex) {
    win.close(winindex);
    return false;
  });
  win.onClose(function() {
    scope.f_query();
  });
  win.load("sjwjVerifying.jsp", window, function(obj) {});
};

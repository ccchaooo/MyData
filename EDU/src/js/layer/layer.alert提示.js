if(scope.input.C_BABH == undefined){
  layer.alert(tempvalue.C_GCMC+"的备案编号未填写",{icon: 8, zIndex: layer.zIndex});
  return;
}

//设置zIndex layer.zIndex 使其显示在最顶层
layer.alert("加载网页基础信息出错："+resp.data.PC_MSG,{icon:7,zIndex:layer.zIndex});

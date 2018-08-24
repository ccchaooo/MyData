if (scope.input.C_BABH == undefined) {
  layer.alert(tempvalue.C_GCMC + "的备案编号未填写", {
    icon: 8,
    zIndex: layer.zIndex
  });
  return;
}

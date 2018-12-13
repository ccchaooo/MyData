//父窗口定义回调事件
win.onClose(function (obj) {
  if (obj == "1") {
      $scope.f_search();
  }
});

//子窗口传递参数
layer = top.layer || layer;
var close = function (v) {
  parentWindow.returnValue = v;
  layer.close(layerIdx);
};
close(1);

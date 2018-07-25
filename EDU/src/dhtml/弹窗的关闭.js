// 父窗口
var win = top.$.MdiWindow(window, 1280, 600, 0, 0, true);

win.setTitle("综合查询", "font-family:微软雅黑;font-size:14px");
win.setWindowArguments(arg);
win.btnClose(true);
win.btnMax(false);
win.btnMin(false);
win.isResize(false);
win.onCancel(function(winindex) {
  win.close(winindex);

});

// MDI窗口关闭事件
win.onClose(function(obj) {

  if (obj !== null && typeof obj !== "undefined") {

    if (obj.retflag === "0") {

      queryData(-1);

    }

  }

});

// 弹出的子窗口
// 初始化事件
function initEvent() {

  // 返回
  $("#btnCancel").click(function() {
    var retarg = {
      retflag: "-1"
    };

    var pindex = parent.layer.getFrameIndex(window.name);
    parentWindow.returnValue = retarg;
    parent.layer.close(pindex);
  });

}

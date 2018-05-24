
var inputPramas = {
    N_SPJLID : row.N_SPJLID,
    C_SPBH   : row.C_SPBH,
    C_SBMC   : row.C_SBMC,
    C_YWLX   : "2",
    C_ZGBZ   : ""
};
// console.log("inputPramasinputPramasinputPramas",inputPramas);

var args = {
    row   :inputPramas,
    win    : window
};

var win = top.$.MdiWindow(window, 1000, 600, 0, 0, true);
win.setTitle("整改退回", "font-family:微软雅黑;font-size:14px");
win.setWindowArguments(args);
win.btnClose(true);
win.btnMax(false);
win.btnMin(false);
win.isResize(false);
win.onCancel(function(winindex){
    win.close(winindex);
    return false;
});
win.onClose(function(ret){
    if(ret = 1){
        scope.f_close(1);
    }
})
win.load("../sgxksc/sgxksc_zgth_detail.jsp?t=" + (+new Date().getTime()), window,function(obj){
});
          

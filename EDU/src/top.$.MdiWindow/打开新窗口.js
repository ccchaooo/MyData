//父页面
//分发
$scope.f_ff = function() {
    var rId = myGrid.getSelectedRowId();
    var userdata = angular.fromJson(myGrid.getUserData(rId, "row-data"));

    // console.log("rId",rId);
    if (!rId) {
        layer.alert("请选中，或者双击一行记录。", {
            icon: 8,
            zIndex: layer.zIndex
        });
        return;
    }
    var rowColumns = ("RM,C_TITLE,C_SENDUSERMC,D_SENDSJ,D_SENDSJ,C_YWJLBH,D_SENDSJ,N_LCJLBH").split(",");
    var row = {};
    for (var i = 0; i < rowColumns.length; i++) {
        var k = rowColumns[i];
        row[k] = userdata[k];
    }
    var args = {
        "row": row
    };
    //console.log("审批所需参数",args);
    var win = top.$.MdiWindow(window, 1024, 550, 0, 0, true);
    win.setTitle("招标控制价分发", "font-family:微软雅黑;font-size:14px");
    win.setWindowArguments(args);
    win.btnClose(true);
    win.btnMax(false);
    win.btnMin(false);
    win.isResize(false);
    win.onCancel(function(winindex) {
        win.close(winindex);
        return false;
    });
    win.onClose(function(winindex) {
        win.close(winindex);
        return false;
    });
    win.onClose(function() {
        // $scope.f_query();
    });
    win.load("zbkzj_ff.jsp", window, function(obj) {});
}

//子窗口
layer = top.layer || layer;

function _init(args, mdi, layerIdx, parentWindow) {
    var loginUserId = parentWindow["__userId"];
    var loginUserName = parentWindow["__userName"];

    var parentWin = windowArguments.window;
    //传入参数
    var row = args.row;


    initPage();
}

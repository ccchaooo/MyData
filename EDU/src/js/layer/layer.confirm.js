layer.confirm("确认备案通过申报名称为【" + row.C_SBMC + "】的设计文件审查信息？\n\n" +
    "注意：一旦备案通过将无法再修改设计文件审查信息！",{icon:  3, zIndex:layer.zIndex},function(idx){});

//同步
scope.f_tb = function(pra){
    if(selxmid==-1){
        layer.alert("请先选中一行" , {icon: 8, zIndex: layer.zIndex});
    }
    layer.confirm("确认同步数据：一旦同步则无法恢复！",{icon:3, zIndex:layer.zIndex},function(idx){
        //关闭确认按钮
        layer.close(idx);
        //转圈圈
        var index = layer.load(1, {shade: [0.1, "#FFFFFF"]});
        ajaxProxy.addParm("PN_XMID",selxmid);
        ajaxProxy.invokeProc("APPUSER2017.JW2017_TBXX.P_JCSJ_TO_NEW_SYSTEM").then(function(resp){
            //停止转圈圈
            layer.close(index);
            // console.log("status",resp.status);
            // console.log( "resp",resp);
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                    layer.alert("同步成功!" + resp.data.PC_MSG, {icon: 1, zIndex: layer.zIndex}
                      // ,function(idx){
                      // }
                  );
            }else{
                    layer.alert("同步项目信息失败" + resp.data.PC_MSG, {icon: 8, zIndex: layer.zIndex});
            }
        });
     });

};

var jsonInfo = angular.toJson(scope.bdInfo);
ajaxProxy.addParm(1,jsonInfo);
		ajaxProxy.addParm(2,0);
    var ap = AjaxProxy();
    ap.invokeProc("APPUSER2017.JW2017_SGXK.PK_CU_ZBBA").then(function(resp){
          console.log(resp);
          if(resp.status == 200 && resp.data.PN_RET*1 == 0){
            layer.alert("保存成功"+resp.data.PC_MSG,{icon:1},
                  function(){
                        location.href="/cdjwztyypt/sgxk/sgxksb_zbba.jsp";
                        });
          }else{
            layer.alert("保存失败"+resp.data.PC_MSG,{icon:7});
          }
      });


layer.alert("保存成功，跳转下一步。",{icon:1},function(idx){
                    layer.close(idx);
                    $.f_submit_post("sgxksb_ajxx.jsp",{"spjlid":__spjlid, "bdid":__bdid,"xmid":__xmid});
               });
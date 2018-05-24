  $.ajax({
    type: 'post',
    url: 'qybainfo.do',
    data: {dataInfo:data},
    success: function (ret) {
      var ret=JSON.parse(ret);
         if(ret.PN_RET==0){
           layer.alert("查询成功",{icon:1},function (idx) {
                layer.close(idx);
           });
         }else{
            layer.alert("查询失败",{icon:5},function (ids) {
                layer.close(ids);
            });
         }
    }
  });

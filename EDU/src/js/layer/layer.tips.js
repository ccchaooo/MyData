//js判断必填项是否被完善
$("#btn_next").click(function(){
var C_STBH = $.trim($("#C_STBH").val());
    if(C_STBH == ""){
      $("#C_STBH").focus();
      layer.tips('请输入审图编号！',$("#C_STBH"), {
               tips: [3, '#3595CC'],
               time: 3000
              });
       return ;
    }
  }
}

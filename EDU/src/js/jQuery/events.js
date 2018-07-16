//默认事件
$("#btn_details").click(function() {});
//监控某个值
$("#C_XZQH").bind('change', function() {
  $scope.f_query();
});

/**监控多个ID**/
$("#N_JZCS_DS,#N_JZCS_DX").keyup(function() {
  $("#N_JZCS").val($("#N_JZCS_DS").val() * 1 + $("#N_JZCS_DX").val() * 1);
});



/** 验证提示 **/
var f_tips = function(ele, msg) {
  $(ele).focus();
  layer.tips(msg, $(ele), {
    tips: [3, '#3595CC'],
    time: 3000,
    zIndex: layer.zIndex
  });
}
f_tips("#zxm_form input[name='C_ZXMMC']", "子项目名称不能为空！");

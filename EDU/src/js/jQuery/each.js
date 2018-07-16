ng - model = "initInfo.C_ZBR_SELECT"

scope.bdInfo.zbrGuidAndName = [];
$("select[ng-model='bdInfo.C_ZBR_SELECT']").find("option:checked").each(function() {
  scope.bdInfo.zbrGuidAndName.push({
    "value": $(this).val(),
    "text": $(this).text()
  });
});

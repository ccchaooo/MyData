//监视值变化-自动加载
        scope.$watch("C_SBMC",function(n){
            scope.f_query();
        },true);

scope.$watch("zbbaInfo.C_ZBRMC",function(n,o){
    scope.selectedzbr = [];
    $("select[ng-model='zbbaInfo.C_ZBRMC']").find("option:checked").each(function(){
        console.log($(this).val(),$(this).text());
        scope.selectedzbr.push({"value":$(this).val(),"text":$(this).text()});
    })
},true);
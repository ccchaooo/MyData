var app = angular.module("xgxxApp",["AjaxProxy","ui.select2","DHTMLXGrid"]);
// 指令创建 - 用于2个输入框值相等判断
app.directive('equals',function(){
    return{
        require:'ngModel',
        link:function(scope,elm,attrs,ngModelCtrl){
            function validateEqual(myValue){
                var valid = (myValue === scope.$eval(attrs.equals));
                ngModelCtrl.$setValidity('equal',valid);
                return valid ? myValue : undefined;
            }
            ngModelCtrl.$parsers.push(validateEqual);
            ngModelCtrl.$formatters.push(validateEqual);
            scope.$watch(attrs.equals,function(){
                ngModelCtrl.$setViewValue(ngModelCtrl.$viewValue);
            })
        }
    }
});

angular.module('select2.cdmcs', []).directive("select2Cdmcs",["$timeout",function($timeout){
    return{
        require: 'ngModel',
        restrict: 'A',
        scope:false,
        link:function(scope, element, attrs,ngModelController){
            // 初始化select2
            var s2 = element.select2({
                data : [],
                theme: "bootstrap"
            });
            var ngModelName = attrs["ngModel"];
            var initDataName = attrs["select2Cdmcs"];
            if("" != initDataName){
                initDataName = initDataName.split(".");
                scope.$watch(initDataName.join("."),function(n){
                    if(angular.isArray(n) && n.length > 0){
                        // select赋值
                        var ngModelValue = [];
                        // 先清空
                        element.empty();
                        angular.forEach(n,function(v,k){
                            var option = new Option(v.text, v.value,false,false);
                            option.selected = v["selected"];

                            if(option.selected){
                                ngModelValue.push(v.value);
                            }
                            element.append(option);
                        });

                        if(ngModelValue.length == 0){
                            //s2.val(null).trigger("change");
                            return ;
                        }else if(attrs.multiple){
                            var _t = $timeout(function(){
                                $timeout.cancel(_t);
                                var evalStr = "scope."+ngModelName+ "=" +angular.toJson(ngModelValue)+"";
                                // console.log(evalStr);
                                eval(evalStr);
                                s2.val(ngModelValue).trigger("change");
                            },100);
                        }else{
                            var _t = $timeout(function(){
                                $timeout.cancel(_t);
                                var evalStr = "scope."+ngModelName+"=\"" +ngModelValue[0]+"\"";
                                eval(evalStr);
                                s2.val(ngModelValue[0]).trigger("change");
                            },100);
                        }
                    }
                },true);
            }

            //
            scope.$watch(ngModelName,function(n){
                element.val(n);
            },true);
        }
    }
}]);
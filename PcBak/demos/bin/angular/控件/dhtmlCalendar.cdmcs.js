angular.module('calendar.cdmcs', []).directive("calendarCdmcs",["$timeout",function($timeout){
    return{
        require: 'ngModel',
        restrict: 'A',
        scope:false,
        link:function(scope, element, attrs,ngModelController){
            var myCalendar = new dhtmlXCalendarObject([element.get(0)]);
            myCalendar.setDateFormat(attrs["dateFormat"]||"%Y-%m-%d");
            // 如果有时分秒，则显示时间选项
            if(attrs["dateFormat"] && (attrs["dateFormat"].indexOf("%H")>=0 ||
                                       attrs["dateFormat"].indexOf("%i") ||
                                       attrs["dateFormat"].indexOf("%s") )
            ){
                myCalendar.showTime();
            }else{
                myCalendar.hideTime();
            }
            myCalendar.showToday();
            myCalendar.setInsensitiveRange(attrs["dateFrom"]||null,attrs["dateTo"]||null);

            //设置默认时间
            if(attrs["defaultDate"]){
                var evalStr = "scope."+attrs["ngModel"]+"=\""+attrs["defaultDate"]+"\"";
                eval(evalStr);
            }

            // 处理日历控件事件
            myCalendar.attachEvent("onButtonClick", function(d){
                d = myCalendar.getDate(true);
                if (d == null) {
                    var evalStr = "delete scope."+attrs["ngModel"];
                    eval(evalStr);
                }else{
                    scope.$apply(function(){
                        var evalStr = "scope."+attrs["ngModel"]+"=\""+d+"\"";
                        eval(evalStr);
                    });
                }
                this.hide();
            });
            myCalendar.attachEvent("onClick", function(d){
                d = myCalendar.getDate(true);
                scope.$apply(function(){
                    var evalStr = "scope."+attrs["ngModel"]+"=\""+d+"\"";
                    eval(evalStr);
                });
            });
        }
    }
}]);
app.controller("ajClController",["$scope","$timeout",function($scope,$timeout){
var timeout;
var is_first = true;
//监视值变化-自动加载
$scope.$watch("queryFilter",function(n){
    //检查是否为第一次加载 由于数据量较大,所以不采用加载后立即查询的方案
    if (is_first) {is_first = false;return;} 
    if (timeout) {$timeout.cancel(timeout)};
    timeout = $timeout(function() {
        $scope.f_query();
    }, 800);
},true);
}]);

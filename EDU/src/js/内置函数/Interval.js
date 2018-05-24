$scope.mobiletest = "";
var second = null,timePromise = undefined;
timePromise = $interval(function(){
  if(second<=0){
    $interval.cancel(timePromise);
    timePromise = undefined;
    second = null;
  }else{
    second--;
  }
},1000,100);

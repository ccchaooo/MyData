什么时候用$apply()
还是那个问题，那我们到底什么时候需要去调用方法呢？情况非常少，实际上几乎我们所有的代码都包在 
scope.里面，像，的初始化， http的回调函数等。在这些情况下，我们不需要自己调用，实际上我们也不能自己调用，否则在方法里面再调用 apply()方法会抛出错误。如果我们需要在一个新的执行序列中运行代码时才真正需要用到它，而且当且仅当这个新的执行序列不是被angular JS的库的方法创建的，这个时候我们需要将代码用 apply()包起来。
@https://www.cnblogs.com/penghongwei/p/3398361.html
$scope.$apply(function () {
     　　$scope.message ="Timeout called!";
      });
myGrid.attachEvent("onRowSelect", function(id,ind){
    $scope.$apply(function () {
        $scope.rowData = angular.fromJson(myGrid.getUserData(id,"row-data"));
    });
});

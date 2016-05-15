App.controller('MunicipalitiesController', function($scope, $http) {

    $http.get('municipalities.json')
        .success(function (data) {
            $scope.municipalities = data;
        });

});

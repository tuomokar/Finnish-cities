App.controller('PlacesController', function($scope, $http) {

    $http.get('places.json')
        .success(function (data) {
            $scope.places = data;
        });

});

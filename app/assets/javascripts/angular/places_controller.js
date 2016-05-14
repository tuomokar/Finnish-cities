App.controller('PlacesController', function($scope, $http, $location) {

    $http.get($location.path() + ".json")
        .then(function (response) {
            $scope.places = response.data;
        });
});
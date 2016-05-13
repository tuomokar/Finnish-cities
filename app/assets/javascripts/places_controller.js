App.controller('PlacesController', function($scope,
                                            $http,
                                            $location,
                                            $resource,
                                            $routeParams,
                                            $route) {

    path = $location.path();

    $http.get(path + ".json")
        .then(function (response) {
            $scope.places = response.data;
            console.log($scope.places)
        });
});
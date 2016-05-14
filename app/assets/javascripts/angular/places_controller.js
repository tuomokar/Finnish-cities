App.controller('PlacesController', function($scope, $http, $location) {

    setLocale();

    $http.get('places.json')
        .success(function (data) {
            $scope.places = data;
        });

    function setLocale() {
        var locale = $location.path().split("/")[1];
        if (locale === 'fi' || locale === 'en') {
            $scope.locale = locale
        } else {
            $scope.locale = 'en'
        }
    }

});


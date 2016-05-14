var App = angular.module('FinnishMunicipalities', ['ngRoute', 'ngTurbolinks']);

App.config(['$locationProvider', function($locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
}]);
var App = angular.module('FinnishMunicipalities', []);

App.config(function($locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});

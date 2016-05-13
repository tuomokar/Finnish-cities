var App = angular.module('FinnishMunicipalities', ['ngResource', 'ngRoute']);

App.config(function($locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});

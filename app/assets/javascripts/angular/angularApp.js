var App = angular.module('FinnishMunicipalities', ['ngRoute', 'ngTurbolinks']);

App.config(function($locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});
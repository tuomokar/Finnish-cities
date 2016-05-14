var App = angular.module('FinnishMunicipalities', []);

App.$inject = ['$locationProvider'];
App.config(

    function useLocationInHtml5Mode($locationProvider) {
        $locationProvider.html5Mode({
            enabled: true,
            requireBase: false
        });

});

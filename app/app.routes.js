'use strict';

angular.module('app')
.config(function($routeProvider, $locationProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'partials/homeView.html',
      }).
      when('/compone/', {
        templateUrl: 'partials/componeView.html',
        controller: 'componeCtrl',
        controllerAs: 'compone'
      }).
      when('/comptwo/', {
        templateUrl: 'partials/comptwoView.html',
        controller: 'comptwoCtrl',
        controllerAs: 'comptwo'
      }).
      otherwise({
        redirectTo: '/'
      });

      $locationProvider.html5Mode(true);
});

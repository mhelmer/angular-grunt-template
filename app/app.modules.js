'use strict';

/* App Module */

angular.module('controllers', []);
angular.module('services', []);
angular.module('directives', []);

var app = angular.module('app', [
  'ngRoute',
  'ngMessages',
  'restangular',
  'controllers',
  'services',
  'directives'
]);

app.config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.xsrfCookieName = 'csrftoken';
  $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);

app.config(['RestangularProvider', function(RestangularProvider) {
  RestangularProvider.setBaseUrl('/api');
  RestangularProvider.setRequestSuffix('/');
}]);


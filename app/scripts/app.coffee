'use strict'

###*
 # @ngdoc overview
 # @name dashboardApp
 # @description
 # # dashboardApp
 #
 # Main module of the application.
###
angular
.module('dashboardApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'smart-table'
  ])
.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'main',
      url: '/main'
      templateUrl: 'views/main.html'
      controller: 'MainCtrl'
    .state 'about',
      url: '/about'
      templateUrl: 'views/about.html'
      controller: 'AboutCtrl'
    .state 'dashboard',
      url: '/dashboard'
      controller: 'dashBoardCtrl'
      views:
        http_record:
          templateUrl: 'views/http_record.html'
          controller: 'dashBoardCtrl'
        search:
          templateUrl: 'views/search.html'
          controller: 'searchCtrl'
        profile:
          templateUrl: 'views/profile.html'
          controller: 'profilesCtrl'

  $urlRouterProvider
    .otherwise '/main'


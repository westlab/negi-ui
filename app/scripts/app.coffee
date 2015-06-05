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
    'ui.grid',
    'ui.grid.edit',
    'ngTouch',
    'ui.router'
  ])
.config ($stateProvider, $urlRouterProvider,  $locationProvider) ->
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
        detail:
          templateUrl: 'views/detail.html'
          controller: 'detailCtrl'
        liveStream:
          templateUrl: 'views/live-stream.html'
          controller: 'liveStreamCtrl'
        overview:
          templateUrl: 'views/overview.html'
          controller: 'overviewCtrl'

  $urlRouterProvider
    .otherwise '/dashboard'

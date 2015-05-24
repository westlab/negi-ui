'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
  .controller 'dashBoardCtrl', ['$scope',
                                '$filter',
                                'negiService',
                               (scope,
                                filter,
                                negiService) ->
    scope.rowCollection = negiService.browsings

  ]

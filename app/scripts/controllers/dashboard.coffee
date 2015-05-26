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
                                'negiAPI',
                                '$interval'
                               (scope,
                                filter,
                                negiAPI,
                                $interval) ->

    scope.isHttpRecordLoading = true
    update_browsings = ()->
      negiAPI.resource('http_record').get().$promise.then(
        (data)->
          scope.isHttpRecordLoading = false
          scope.rowCollection = data

        (error)->
          console.log error
      )
    $interval(update_browsings, 10000)

  ]

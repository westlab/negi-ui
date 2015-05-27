'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
  .controller 'liveStreamCtrl', ['$scope',
                                '$filter',
                                'negiAPI',
                                '$interval'
                               (scope,
                                filter,
                                negiAPI,
                                $interval) ->

    scope.isHttpRecordLoading = true

    browsingTimePriority = (browsingTime)->
      browsingTime = parseInt browsingTime
      switch
        when browsingTime < 10 then 0
        when browsingTime < 20 then 1
        when browsingTime < 30 then 2
        when browsingTime < 90 then 3
        when browsingTime < 200 then 4
        else 5

    update_browsings = ()->
      negiAPI.resource('http_record').get().$promise.then(
        (data)->
          browsings = data.map((d)->
            d.priority = browsingTimePriority(d.browsing_time)
            d
          )
          scope.isHttpRecordLoading = false
          scope.rowCollection = browsings

        (error)->
          console.log error
      )
    $interval(update_browsings, 10000)

  ]

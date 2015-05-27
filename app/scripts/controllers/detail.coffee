'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
.controller 'detailCtrl', ['$scope',
                           '$filter',
                           'profileService',
                           'negiService',
                          (scope,
                           filter,
                           profileService,
                           negiService) ->
  scope.rowCollection = negiService.browsings

  scope.getters =
    firstName: (value) ->
      value.firstName.length

  scope.displayRowInProfile  = (row) ->
    profileService.srcIP = row.srcIP

  scope.predicates = ['id', 'srcIP', 'dstIP', 'title', 'url', 'browsingTime']

  scope.selectedPredicate = scope.predicates[0]
]

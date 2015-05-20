'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
.controller 'searchCtrl', ['$scope',
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
    profileService.id = row.id
    profileService.srcIP = row.srcIP
    profileService.title = row.title

  scope.predicates = ['id', 'srcIP', 'dstIP', 'title', 'url', 'browsingTime']

  scope.selectedPredicate = scope.predicates[0]
]

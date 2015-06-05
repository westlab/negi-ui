'use strict'


angular.module 'dashboardApp'
  .controller 'overviewCtrl', ($scope, profileService) ->
    $scope.profile = profileService

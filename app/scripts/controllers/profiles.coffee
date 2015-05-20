'use strict'


angular.module 'dashboardApp'
  .controller 'profilesCtrl', ($scope, profileService) ->
    $scope.profile = profileService

    $scope.total_count = 111111

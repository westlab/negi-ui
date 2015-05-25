'use strict'


angular.module 'dashboardApp'
  .controller 'profileCtrl', ($scope, profileService) ->
    $scope.profile = profileService

    $scope.total_count = 111111

'use strict'


angular.module 'dashboardApp'
  .controller 'overviewCtrl', ($scope, profileService) ->
    $scope.profile = profileService

    $scope.total_count = 111111

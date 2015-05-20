'use strict'


angular.module 'dashboardApp'
  .controller 'profilesCtrl', ($scope, profileService) ->
    $scope.profile = profileService

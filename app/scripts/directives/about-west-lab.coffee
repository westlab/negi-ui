'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'aboutWestLab',(westLabService) ->
  link = (scope, ele, attr) ->
    scope.aboutWestLab = westLabService.about

  {
    link: link
    templateUrl: 'views/about-west-lab.html'
    restrict: 'E'
  }

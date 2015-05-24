'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'srcIpRanking',(negiService) ->
  {
    link: (scope, ele, attr) ->
      scope.srcIpRanking = negiService.srcIpRanking
    templateUrl: 'views/src-ip-ranking.html'
    restrict: 'E'
  }

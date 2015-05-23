'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'domainRanking',(negiService) ->
  {
    link: (scope, ele, attr) ->
      scope.domainRanking = negiService.domainRanking
    templateUrl: 'views/rankingtable.html'
    restrict: 'E'
  }

'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'searchBrowsingHistory',(negiAPI, $resource, $interval) ->
  link = (scope, ele, attr) ->


  {
    link: link
    templateUrl: 'views/search-browsing-history.html'
    restrict: 'EA'
  }

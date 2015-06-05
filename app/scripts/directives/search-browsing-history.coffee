'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'searchBrowsingHistory',(negiAPI) ->
  link = (scope, ele, attr) ->
    scope.gridOptions =
      enableSorting: true
      columnDefs: [
        { name: 'sourceIP', field: 'src_ip' }
        { name: 'title', field: 'title' }
        { name: 'URL', field: 'url' }
        { name: 'browsingTime', field: 'browsing_time' }
      ],
      data: []

    searchBrowsingHistory = (keyword)->
      negiAPI.resource('searchBrowsingHistory').search(
        keyword: keyword
      ).$promise.then(
        (data)->
          scope.searchResults = data
          scope.gridOptions.data = data

        (error)->
          console.log error
      )

    scope.keyPress = (e)->
      if e.keyCode == 13
        searchBrowsingHistory(scope.searchBrowsingHistoryKeyword)

  {
    link: link
    templateUrl: 'views/search-browsing-history.html'
    restrict: 'EA'
  }

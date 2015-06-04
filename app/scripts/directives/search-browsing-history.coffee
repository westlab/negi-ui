'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'searchBrowsingHistory',(negiAPI) ->
  link = (scope, ele, attr) ->
    searchBrowsingHistory = (keyword)->
      negiAPI.resource('searchBrowsingHistory').search(
        keyword: keyword
      ).$promise.then(
        (data, header)->
          console.log header
          scope.searchResults = data

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

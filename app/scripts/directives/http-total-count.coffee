dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'httpTotalCount',(negiAPI, $interval) ->
  link = (scope, ele, atr)->
    updateHttpTotalCount = ()->
      negiAPI.resource('http_record').count(
        {},
        (data, headers)->
          scope.total_count = headers('x-data-count')
          console.log scope.total_count
      )
    $interval(updateHttpTotalCount, 5000)

  {
    link: link
    templateUrl: 'views/http-total-count.html'
    restrict: 'E'
  }

'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'srcIpRanking',(negiAPI, $resource, $interval) ->
  link = (scope, ele, attr) ->
    scope.isSrcIpLoading = true

    update_src_ip_rank = ()->
      negiAPI.resource('ranking').srcIp().$promise.then(
        (data)->
          console.log negiAPI.resource('ranking').srcIP
          scope.isSrcIpLoading = false
          scope.srcIpRanking = data

        (error)->
          console.log error
      )
    $interval(update_src_ip_rank, 10000)

  {
    link: link
    templateUrl: 'views/src-ip-ranking.html'
    restrict: 'E'
  }

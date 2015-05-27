'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'domainRanking',(negiAPI, $resource, $interval) ->
  link = (scope, ele, atr)->
    scope.isDomainLoading = true

    update_domain_rank = ()->
      negiAPI.resource('ranking').domain().$promise.then(
        (data)->
          scope.isDomainLoading = false
          scope.domainRanking = data

        (error)->
          console.log error
      )
    $interval(update_domain_rank, 10000)

  {
    link: link
    templateUrl: 'views/domain-ranking.html'
    restrict: 'E'
  }

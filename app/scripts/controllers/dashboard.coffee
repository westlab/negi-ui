'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
  .controller 'dashBoardCtrl', ['$scope', '$filter', (scope, filter) ->
    scope.rowCollection = [
      {id: 1, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'hoge', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 2, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'hoge', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 3, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'hoge', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 4, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'hoge', url: 'http://west.sd.keio.ac.jp', browsingTime: 10}
    ]

  ]

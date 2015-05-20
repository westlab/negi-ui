'use strict'

###*
 # @ngdoc function
 # @name dashboardApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the dashboardApp
###
angular.module 'dashboardApp'
.controller 'searchCtrl', ['$scope', '$filter', (scope, filter) ->
  scope.rowCollection = [
      {id: 1, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'kuma', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 2, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'buta', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 3, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'penguin', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 4, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'karasu', url: 'http://west.sd.keio.ac.jp', browsingTime: 10}

  ]
  scope.url = "hoge"
  scope.title = "hoge"

  scope.getters =
    firstName: (value) ->
      value.firstName.length

  scope.clickedRowValue  = (row) ->
    id = document.getElementById('selected-row-id')
    id.textContent = row.id
    url = document.getElementById('selected-row-srcIP')
    url.textContent = row.srcIP
    
  
  scope.predicates = ['id', 'srcIP', 'dstIP', 'title', 'url', 'browsingTime'];

  scope.selectedPredicate = scope.predicates[0];

  scope.total_count = 111111

]

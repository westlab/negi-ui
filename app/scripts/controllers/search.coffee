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
    {firstName: 'Laurent', lastName: 'Renard', birthDate: new Date('1987-05-21'), balance: 102, email: 'whatever@gmail.com'},
    {firstName: 'Blandine', lastName: 'Faivre', birthDate: new Date('1987-04-25'), balance: -2323.22, email: 'oufblandou@gmail.com'},
    {firstName: 'Francoise', lastName: 'Frere', birthDate: new Date('1955-08-27'), balance: 42343, email: 'raymondef@gmail.com'}
  ]

  scope.getters =
    firstName: (value) ->
      value.firstName.length

  scope.predicates = ['firstName', 'lastName', 'birthDate', 'balance', 'email'];
  scope.selectedPredicate = scope.predicates[0];

  scope.url = 'http://west.sd.keio.ac.jp/'
  scope.title = 'Westlab HomePage'

  scope.total_count = 242424
]

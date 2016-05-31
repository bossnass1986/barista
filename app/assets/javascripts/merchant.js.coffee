merchant = angular.module('CupTown', ['ngResource'])
#Factory
merchant.factory 'Merchants', [
  '$resource'
  ($resource) ->
    $resource '/shopping/merchants.json', {},
      query:
        method: 'GET'
        isArray: true
      create:
        method: 'POST'
]
merchant.factory 'Merchant', [
  '$resource'
  ($resource) ->
    $resource '/shopping/merchants/:id.json', {},
      show:
        method: 'GET'
      update:
        method: 'PUT'
        params:
          id: '@id'
      delete:
        method: 'DELETE'
        params:
          id: '@id'
]
#Controller
merchant.controller 'MerchantCtrl', [
  '$scope'
  '$http'
  '$resource'
  'Merchants'
  'Merchant'
  '$location'
  ($scope, $http, $resource, Merchants, Merchant, $location) ->
    $scope.merchants = Merchants.query()

    $scope.deleteMerchant = (merchantId) ->
      if confirm('Are you sure you want to delete this merchant?')
        Merchant.delete {id: merchantId}, ->
          $scope.merchants = Merchants.query()
          $location.path '/merchants'


]


#Routes
#merchant.config [
#  '$routeProvider'
#  '$locationProvider'
#  ($routeProvider, $locationProvider) ->
#    $routeProvider.when '/merchants',
#      templateUrl: '/templates/merchants/index.html'
#      controller: 'MerchantCtrl'
#    $routeProvider.when '/merchants/new',
#      templateUrl: '/templates/users/new.html'
#      controller: 'UserAddCtr'
#    $routeProvider.when '/users/:id/edit',
#      templateUrl: '/templates/users/edit.html'
#      controller: 'UserUpdateCtr'
#    $routeProvider.otherwise redirectTo: '/merchants'
#    return
#]


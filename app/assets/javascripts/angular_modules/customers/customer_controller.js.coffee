angular.module('ye').controller('CustomerController', [ '$scope', 'Restangular', ($scope, Restangular) ->
  $scope.customer         = gon.customer
  $scope.customerContacts = gon.customer_contacts
  $scope.customerCreated  = false

  $scope.updateCustomerProfile = (attributes) ->
    customer = Restangular.one('customers', gon.customer.id)
    customer.name = attributes.name
    customer.address = attributes.address
    customer.put()

  $scope.createCustomerProfile = (attributes) ->
    customer = Restangular.all('customers').post({name: attributes.name, address: attributes.address })

    .then((customer) ->
      $scope.customer        = customer
      $scope.customerCreated = true
    )
])


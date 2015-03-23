angular.module('ye').controller('CustomerController', ['$scope', 'Restangular', 'toaster', ($scope, Restangular, toaster) ->
  $scope.customer         = gon.customer
  $scope.customerContacts = gon.customer_contacts
  $scope.customerCreated  = false

  $scope.updateCustomerProfile = (attributes) ->
    customer = Restangular.one('customers', gon.customer.id)
    customer.name = attributes.name
    customer.address = attributes.address
    customer.put()

    .then(
      (customer) ->
        toaster.pop('success', "success:", "Customer has been updated.")
      (err) ->
        errors = err.data.errors
        toaster.pop('error', "error:", errors.join(' ,'))
    )

  $scope.createCustomerProfile = (attributes) ->
    customer = Restangular.all('customers').post({name: attributes.name, address: attributes.address })

    .then(
      (customer) ->
        $scope.customer        = customer
        $scope.customerCreated = true
        toaster.pop('success', "success:", "Customer has been created.")
      (err) ->
        errors = err.data.errors
        toaster.pop('error', "error:", errors.join(' ,'))

    )
])


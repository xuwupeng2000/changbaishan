angular.module('ye').controller("CustomerContactController", [ '$scope', 'CustomerContact', ($scope, CustomerContact) ->
  #$scope.customer         = gon.customer
  #$scope.customerContacts = gon.customer_contacts

  #$scope.updateCustomerProfile = (attributes) ->
    #Customer.get(gon.customer.id).then((customer) ->
      #customer.name = attributes.name
      #customer.address = attributes.address
      #customer.update()
    #)
])


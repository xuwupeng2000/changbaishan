angular.module('ye').controller("CustomerContactController", [ '$scope', 'Restangular', ($scope, Restangular) ->
  $scope.updateCustomerContact = (attributes, id) ->
    contact = Restangular.all('customer').one('contacts', id)
    contact.name = attributes.name
    contact.detail = attributes.detail
    contact.put()

  $scope.destroyCustomerContact = (id) ->
    contact = Restangular.all('customer').one('contacts', id)
    contact.remove().then((response) ->
      $scope.customerContacts= response
    )

])


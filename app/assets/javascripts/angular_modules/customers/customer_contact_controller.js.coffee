angular.module('ye').controller("CustomerContactController", [ '$scope', 'Restangular', 'toaster', ($scope, Restangular, toaster) ->

  $scope.updateCustomerContact = (attributes, id) ->
    contact = Restangular.one('contacts', id)
    contact.detail = attributes.detail
    contact.put()
    toaster.pop('success', "success:", "Contact has been updated.")

  $scope.destroyCustomerContact = (id) ->
    contact = Restangular.one('contacts', id)
    contact.remove().then((response) ->
      $scope.customerContacts= response
      toaster.pop('success', "success:", "Contact has been removed.")
  )

])


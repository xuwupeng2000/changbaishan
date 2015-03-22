angular.module('ye').controller("CustomerContactController", [ '$scope', 'Restangular', 'toaster', ($scope, Restangular, toaster) ->

  $scope.updateCustomerContact = (attributes, id) ->
    contact = Restangular.one('contacts', id)
    contact.name = attributes.name
    contact.detail = attributes.detail
    contact.put()
    toaster.pop('success', "success:", "Contact has been updated.")

  $scope.destroyCustomerContact = (id) ->
    contact = Restangular.one('contacts', id)
    contact.remove().then((response) ->
      $scope.customerContacts= response
      toaster.pop('success', "success:", "Contact has been removed.")
  )

  $scope.createContact = (attributes) ->
    newContact = Restangular.one('customers', $scope.$parent.customer.id).all('contacts').post(attributes)
      .then(
        (contact) ->
          $scope.$parent.customerContacts.push( contact )
          modal = $('#modal-new-customer-contact')
          modal.fadeOut()
          toaster.pop('success', "success:", "Contact has been added.")
        (err) ->
          errors = err.data.errors
          toaster.pop('error', "error:", errors.join(' ,'))
      )

])


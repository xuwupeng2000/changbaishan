angular.module('ye').controller("CustomerContactController", [ '$scope', 'Restangular', ($scope, Restangular) ->
  $scope.customer = gon.customer

  $scope.updateCustomerContact = (attributes, id) ->
    contact = Restangular.one('contacts', id)
    contact.name = attributes.name
    contact.detail = attributes.detail
    contact.put()

  $scope.destroyCustomerContact = (id) ->
    contact = Restangular.one('contacts', id)
    contact.remove().then((response) ->
      $scope.customerContacts= response
  )

  $scope.createContact = (attributes) ->
    newContact = Restangular.one('customers', gon.customer.id).all('contacts').post(attributes)
      .then((contact) ->
        $scope.$parent.customerContacts.push( contact )
        modal = $('#modal-new-customer-contact')
        modal.fadeOut()
      )

])


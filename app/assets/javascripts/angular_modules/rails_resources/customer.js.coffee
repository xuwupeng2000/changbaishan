angular.module('ye').factory('Customer', ['railsResourceFactory',
  (railsResourceFactory) ->
    factory =  railsResourceFactory({ url: '/customers', name: 'customer' })
    return factory
])

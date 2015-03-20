angular.module('ye').factory('CustomerContact', ['railsResourceFactory',
  (railsResourceFactory) ->
    factory =  railsResourceFactory({ url: '/customers', name: 'customer' })
    return factory
])

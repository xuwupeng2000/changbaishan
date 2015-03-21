angular.module('ye').directive('ngReallyClick', [() ->
  return {
    restrict: 'A',
    link: (scope, element, attrs) ->
      element.bind('click', (evt) ->
        message = attrs.ngReallyMessage
        scope.$apply(attrs.ngReallyClick) if (message && confirm(message))
      )
  }
])


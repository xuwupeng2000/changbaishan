angular.module('ye').directive('jwAction', [() ->
  return {
    restrict: 'AE',
    templateUrl: 'angular_modules/templates/jw_action.html',
    link: (scope, element, attrs) ->
      scope.actionActive = false

      scope.showurl   = attrs.showurl
      scope.editurl   = attrs.editurl
      scope.deleteurl = attrs.deleteurl

      scope.toggleActionCollection = (nextState) ->
        scope.actionActive = nextState
  }
])


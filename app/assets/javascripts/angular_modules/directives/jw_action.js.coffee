angular.module('ye').directive('jwAction', [() ->
  return {
    restrict: 'AE',
    templateUrl: 'angular_modules/templates/jw_action.html',
    link: (scope, element, attrs) ->
      console.log(attrs.showurl)
  }
])


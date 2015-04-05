angular.module('ye').directive('backstretch', [->
		return {
			restrict: 'A'
			link: (scope, element, attr) ->
				$(element).backstretch( attr.url )
		}
])

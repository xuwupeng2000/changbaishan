angular.module('ye').directive("outsideClick", ['$document','$parse', ( $document, $parse ) ->
    return {
      link: ( $scope, $element, $attributes ) ->
        scopeExpression = $attributes.outsideClick
        onDocumentClick = (event) ->
          $scope.$apply(scopeExpression) if(!$element.find(event.target).length > 0)

        $document.on("click", onDocumentClick)

        $element.on('$destroy', ->
            $document.off("click", onDocumentClick)
        )
}])

application = angular.module("ye", ['ui.router', 'templates', 'xeditable', 'rails'])

application.run((editableOptions) ->
  editableOptions.theme = 'bs3'
)


application = angular.module("ye", ['toaster', 'ui.router', 'templates', 'xeditable', 'rails'])

application.run((editableOptions, editableThemes) ->
  editableOptions.theme = 'bs3'
  editableThemes['bs3'].submitTpl = '<button class="btn btn-default" type="submit"><i class="fa fa-check"></i></button>'
  editableThemes['bs3'].cancelTpl = '<button class="btn btn-default"><i class="fa fa-times-circle-o"></i></button>'
)


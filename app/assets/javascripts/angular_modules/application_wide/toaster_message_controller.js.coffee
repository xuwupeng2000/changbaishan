angular.module('ye').controller("ToasterMessageController", [ '$scope', 'toaster', ($scope, toaster) ->
  toaster.pop('success', "Big deal", "I have been working on implementing AngularJS into my Rails app based on the Railscast as a starting point. My question is similiar to this question: Angular JS ngResource with nested resources, however I have not found a solution to my problem.")
  console.log(toaster)
])


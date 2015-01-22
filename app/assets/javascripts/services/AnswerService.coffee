angular.module('ujSurvey').factory 'Answer', ->
  new: (order = 0) ->
    order: order
    text: ''

angular.module('ujSurvey').factory 'Question', [
  'Answer', (Answer) ->
    new: (order = 0) ->
      order: order
      kind: ''
      text: ''
      answers: [Answer.new()]
]

angular.module('ujSurvey').factory 'Question', [
  'Answer', (Answer) ->
    new: (order = 0) ->
      order: order
      kind: 'radio_button'
      text: ''
      answers: [Answer.new()]
]

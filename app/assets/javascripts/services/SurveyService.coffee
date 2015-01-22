angular.module('ujSurvey').factory 'Survey', [
  'Question', (Question) ->
    new: ->
      title: ''
      description: ''
      questions: [Question.new()]
]

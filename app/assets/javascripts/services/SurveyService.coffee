angular.module('ujSurvey').factory 'SurveyResource', [
  '$resource', ($resource) ->
    $resource '/api/surveys', {},
      create:
        method: 'POST'
        data:
          survey: '@survey'
]

angular.module('ujSurvey').factory 'Survey', [
  'Question', 'SurveyResource', (Question, SurveyResource) ->
    new: ->
      title: ''
      description: ''
      questions: [Question.new()]
    create: (params, callback) ->
      SurveyResource.create params, (result) ->
        callback(result) if callback
]

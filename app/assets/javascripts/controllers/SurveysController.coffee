angular.module('ujSurvey').controller 'SurveysController', [
  '$scope', 'Survey', 'Question', 'Answer', ($scope, Survey, Question, Answer) ->
    $scope.initialize = (survey = Survey.new()) ->
      $scope.survey = survey

    $scope.addQuestion = (questions) ->
      questions.push(Question.new(questions.length))

    $scope.removeQuestion = (questions) ->
      questions.pop() unless questions.length == 1

    $scope.addAnswer = (answers) ->
      answers.push(Answer.new(answers.length))

    $scope.removeAnswer = (answers) ->
      answers.pop() unless answers.length == 1
]

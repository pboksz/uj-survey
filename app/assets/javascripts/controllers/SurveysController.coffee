angular.module('ujSurvey').controller 'SurveysController', [
  '$scope', '$document', 'Survey', 'Question', 'Answer', ($scope, $document, Survey, Question, Answer) ->
    $scope.survey = Survey.new()

    $scope.addQuestion = (questions) ->
      questions.push(Question.new(questions.length))

    $scope.removeQuestion = (questions) ->
      questions.pop() unless questions.length == 1

    $scope.addAnswer = (answers) ->
      answers.push(Answer.new(answers.length))

    $scope.removeAnswer = (answers) ->
      answers.pop() unless answers.length == 1

    $scope.answerKeydown = ($event, answers) ->
      if !$event.shiftKey && $event.which == 9 # tab
        $scope.addAnswer(answers)
]

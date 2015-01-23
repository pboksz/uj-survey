class SurveysRepository < DefaultRepository
  def create(attributes)
    questions = attributes.delete(:questions)
    survey = new(attributes)
    process_questions(survey, questions)
    survey.save

    survey
  end

  private

  def process_questions(survey, questions)
    questions.each do |attributes|
      answers = attributes.delete(:answers)
      question = survey.questions.new(attributes)
      process_answers(question, answers)
    end
  end

  def process_answers(question, answers)
    answers.each do |attributes|
      question.answers.new(attributes)
    end
  end
end

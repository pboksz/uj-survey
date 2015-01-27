class SurveysRepository < DefaultRepository
  def create(attributes)
    questions_attribute = attributes.delete(:questions)
    survey = new(attributes)
    create_questions(survey.questions, questions_attribute)
    survey.save

    survey
  end

  def update(id, attributes)
    question_attributes = attributes.delete(:questions)
    survey = find(id)
    survey.update_attributes(attributes)
    update_questions(survey.questions, question_attributes)

    survey
  end

  private

  def new_submodel(submodels, attributes)
    submodels.new(attributes)
  end

  def create_questions(questions, questions_attributes)
    questions_attributes.each do |question_attributes|
      answers_attributes = question_attributes.delete(:answers)
      question = new_submodel(questions, question_attributes)
      create_answers(question.answers, answers_attributes)
    end
  end

  def create_answers(answers, answers_attributes)
    answers_attributes.each do |answer_attributes|
      new_submodel(answers, answer_attributes)
    end
  end

  def update_questions(questions, questions_attributes)
    questions_attributes.each do |question_attributes|
      answers_attributes = question_attributes.delete(:answers)
      question = edit_submodel(questions, question_attributes)
      update_answers(question.answers, answers_attributes)
    end
  end

  def update_answers(answers, answers_attributes)
    answers_attributes.each do |answer_attributes|
      edit_submodel(answers, answer_attributes)
    end
  end

  def edit_submodel(submodels, attributes)
    submodel = submodels.where(id: attributes[:id]).first
    submodel.update_attributes(attributes)

    submodel
  end
end

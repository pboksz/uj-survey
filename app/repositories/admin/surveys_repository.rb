class Admin::SurveysRepository < DefaultRepository
  def create(attributes)
    questions_attribute = attributes.delete(:questions)
    survey = new(attributes)
    create_questions(questions_repository(survey), questions_attribute)
    survey.save

    survey
  end

  def update(id, attributes)
    question_attributes = attributes.delete(:questions)
    survey = super(id, attributes)
    update_questions(questions_repository(survey), question_attributes)

    survey
  end

  def activate(id)
    klass.update_all(active: false)
    update(id, active: true)
  end

  private

  def edit_submodel(repository, attributes)
    repository.update(id, attributes)
    repository.find(id)
  end

  def create_questions(questions_repository, questions_attributes)
    questions_attributes.each do |question_attributes|
      answers_attributes = question_attributes.delete(:answers)
      question = questions_repository.new(question_attributes)
      create_answers(answers_repository(question), answers_attributes)
    end
  end

  def create_answers(answers_repository, answers_attributes)
    answers_attributes.each do |answer_attributes|
      answers_repository.new(answer_attributes)
    end
  end

  def update_questions(questions_repository, questions_attributes)
    questions_attributes.each do |question_attributes|
      answers_attributes = question_attributes.delete(:answers)
      question = questions_repository.update(question_attributes[:id], question_attributes)
      update_answers(answers_repository(question), answers_attributes)
    end
  end

  def update_answers(answers_repository, answers_attributes)
    answers_attributes.each do |answer_attributes|
      answers_repository.update(answer_attributes[:id], answer_attributes)
    end
  end

  def questions_repository(survey)
    DefaultRepository.new(survey.questions)
  end

  def answers_repository(question)
    DefaultRepository.new(question.answers)
  end
end

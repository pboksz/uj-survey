class SurveysRepository < DefaultRepository
  def active
    klass.where(active: true).first
  end

  def update(id, attributes)
    responses_attributes = attributes.delete(:responses)
    participant_attributes = attributes.delete(:participant)
    survey = find(id)
    update_responses(responses_repository(survey), responses_attributes) if responses_attributes
    update_participant(participants_repository(survey), participant_attributes) if participant_attributes
    survey.save

    survey
  end

  private

  def update_responses(responses_repository, responses_attributes)
    responses_attributes.each do |question_id, text|
      responses_repository.new(question_id: question_id, text: text)
    end
  end

  def update_participant(participants_repository, participant_attributes)
    participants_repository.new(participant_attributes)
  end

  def responses_repository(survey)
    DefaultRepository.new(survey.responses)
  end

  def participants_repository(survey)
    DefaultRepository.new(survey.participants)
  end
end

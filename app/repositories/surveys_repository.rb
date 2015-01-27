class SurveysRepository < DefaultRepository
  def active
    klass.where(active: true).first
  end

  def update(id, attributes)
    responses_attributes = attributes.delete(:responses)
    participant_attributes = attributes.delete(:participant)
    survey = find(id)
    update_responses(survey.responses, responses_attributes)
    update_participant(survey.participants, participant_attributes)
    survey.save

    survey
  end

  private

  def update_responses(responses, responses_attributes)
    responses_attributes.each do |question_id, text|
      responses.new(question_id: question_id, text: text)
    end
  end

  def update_participant(participants, participant_attributes)
    participants.new(participant_attributes)
  end
end

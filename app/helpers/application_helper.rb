module ApplicationHelper
  def answer_tag(question, answer)
    kind_tag = "#{question.kind}_tag"

    if respond_to?(kind_tag) # radio_button or check_box
      name = "survey[responses][#{question.id}][]"
      id = "survey_responses_#{question.id}_#{answer.id}"

      send(kind_tag, name, answer.id, false, id: id) + label_tag(id, answer.text)
    else
      answer.text
    end
  end

  def active_tag(survey)
    if survey.active
      'Active'
    else
      message = 'Activating this will de-activate the currently activated survey. Are you sure?'
      link_to 'Activate', activate_admin_survey_path(survey), data: { confirm: message }
    end
  end

  def destroy_tag(survey)
    message = 'Are you sure you want to delete this survey and all its associated responses?'
    link_to 'Delete', admin_survey_path(survey), method: :delete, data: { confirm: message }
  end

  def participants_tag(survey)
    content_tag :span, "Participants: #{survey.participants.map(&:name).join(', ')}"
  end

  def question_tag(question)
    content_tag :span, "Question: #{question.order + 1}", title: question.text
  end

  def response_tag(response)
    content_tag :span, response.answers_order, title: response.answers_text
  end
end

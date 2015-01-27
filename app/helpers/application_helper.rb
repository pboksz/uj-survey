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
end

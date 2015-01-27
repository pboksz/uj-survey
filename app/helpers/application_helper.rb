module ApplicationHelper
  def answer_tag(question, answer)
    case question.kind
      when 'radio_button'
        radio_button(question, answer)
      when 'check_box'
        check_box(question, answer)
      else
        answer.text
    end
  end

  private

  def radio_button(question, answer)
    name = "survey[responses][#{question.id}]"
    id = "survey_responses_#{question.id}_#{answer.id}"

    radio_button_tag(name, answer.id, false, id: id) + label_tag(id, answer.text)
  end

  def check_box(question, answer)
    name = "survey[responses][#{question.id}][]"
    id = "survey_responses_#{question.id}_#{answer.id}"

    check_box_tag(name, answer.id, false, id: id) + label_tag(id, answer.text)
  end
end

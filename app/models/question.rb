class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy

  def self.kind_options
    { radio_button: 'Single response', check_box: 'Multiple response', text_area: 'Text response' }
  end

  def as_json(options = {})
    super(options).merge(answers: answers.map(&:as_json))
  end
end

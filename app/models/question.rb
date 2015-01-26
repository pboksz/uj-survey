class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy

  def as_json(options = {})
    super(options).merge(answers: answers.map(&:as_json))
  end
end

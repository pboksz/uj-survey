class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy

  def as_json(options = {})
    super(options).merge(questions: questions.map(&:as_json))
  end
end

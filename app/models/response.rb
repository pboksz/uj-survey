class Response < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question

  serialize :text, Array

  validates :survey, :question, :text, presence: true

  def answers_order
    answers.map { |a| a.order + 1 }.join(', ')
  end

  def answers_text
    answers.map { |a| "#{a.order + 1}: #{a.text}" }.join(', ')
  end

  private

  def answers
    @answers ||= answers_repository.find_all(text)
  end

  def answers_repository
    DefaultRepository.new(question.answers)
  end
end

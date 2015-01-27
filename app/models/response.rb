class Response < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question

  serialize :text, Array

  validates :survey, :question, :text, presence: true
end

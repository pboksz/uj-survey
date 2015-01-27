class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question, :order, :text, presence: true
end

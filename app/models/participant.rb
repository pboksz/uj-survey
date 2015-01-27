class Participant < ActiveRecord::Base
  belongs_to :survey

  validates :survey, :name, presence: true
end

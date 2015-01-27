class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :participants, dependent: :destroy

  validates :title, :description, presence: true
end

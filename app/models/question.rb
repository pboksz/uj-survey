class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy

  def self.kind_options
    { radio_button: 'Single response', check_box: 'Multiple response' }
  end
end

class CsvGenerator
  require 'csv'

  attr_reader :survey

  def initialize(survey)
    @survey = survey
  end

  def generate
    CSV.generate do |csv|
      survey.questions.each do |question|
        csv << [question.text] + question.responses.map(&:answers_text)
      end
    end
  end
end

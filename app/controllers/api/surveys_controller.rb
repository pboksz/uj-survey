class Api::SurveysController < Api::BaseController
  def create

  end

  private

  def survey_repository
    @survey_repository ||= DefaultRepository.new(Survey)
  end
end

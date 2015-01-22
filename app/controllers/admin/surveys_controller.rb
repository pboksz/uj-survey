class Admin::SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: survey_repository.all }
  end

  private

  def survey_repository
    @survey_repository ||= DefaultRepository.new(Survey)
  end
end

class HomeController < ApplicationController
  def index
    if survey = surveys_repository.active
      render 'surveys/show', locals: { survey: survey }
    else
      render :index
    end
  end

  private

  def surveys_repository
    @surveys_repository ||= SurveysRepository.new(Survey)
  end
end

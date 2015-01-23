class Admin::SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: surveys_repository.all }
  end

  def new

  end

  private

  def surveys_repository
    @surveys_repository ||= DefaultRepository.new(Survey)
  end
end

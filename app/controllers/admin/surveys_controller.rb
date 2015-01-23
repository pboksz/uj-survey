class Admin::SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: surveys_repository.all }
  end

  def new

  end

  def create
    surveys_repository.create(create_params)
    redirect_to admin_surveys_path
  end

  private

  def surveys_repository
    @surveys_repository ||= SurveysRepository.new(Survey)
  end

  def create_params
    params.require(:survey).permit(:title, :description, questions: [:order, :kind, :text, answers: [:order, :text]])
  end
end

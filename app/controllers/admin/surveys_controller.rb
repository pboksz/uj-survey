class Admin::SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: surveys_repository.all }
  end

  def new

  end

  def create
    surveys_repository.create(survey_params)
    redirect_to admin_surveys_path
  end

  def edit
    render :edit, locals: { survey: surveys_repository.find(params[:id]) }
  end

  def update
    surveys_repository.update(params[:id], survey_params)
    redirect_to admin_surveys_path
  end

  def destroy
    surveys_repository.destroy(params[:id])
    redirect_to admin_surveys_path
  end

  private

  def surveys_repository
    @surveys_repository ||= SurveysRepository.new(Survey)
  end

  def survey_params
    params.require(:survey).permit(:title, :description, questions: [:id, :order, :kind, :text, answers: [:id, :order, :text]])
  end
end

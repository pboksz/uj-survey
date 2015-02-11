class Admin::SurveysController < AdminAuth::BaseController
  def index
    render :index, locals: { surveys: surveys_repository.all }
  end

  def new

  end

  def create
    surveys_repository.create(survey_params)
    redirect_to admin_surveys_path
  end

  def show
    survey = surveys_repository.find(params[:id])

    respond_to do |format|
      format.html { render :show, locals: { survey: survey } }
      format.csv { send_data csv_generator(survey).generate, filename: "UJsurvey_#{survey.title}.csv" }
    end
  end

  def edit
    render :edit, locals: { survey: surveys_repository.find(params[:id]) }
  end

  def update
    surveys_repository.update(params[:id], survey_params)
    redirect_to admin_surveys_path
  end

  def activate
    surveys_repository.activate(params[:id])
    redirect_to admin_surveys_path
  end

  def deactivate
    surveys_repository.deactivate(params[:id])
    redirect_to admin_surveys_path
  end

  def destroy
    surveys_repository.destroy(params[:id])
    redirect_to admin_surveys_path
  end

  private

  def surveys_repository
    @surveys_repository ||= Admin::SurveysRepository.new(Survey)
  end

  def survey_params
    params.require(:survey).permit(:title, :description, questions: [:id, :order, :kind, :text, answers: [:id, :order, :text]])
  end

  def csv_generator(survey)
    CsvGenerator.new(survey)
  end
end

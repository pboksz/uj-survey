class SurveysController < ApplicationController
  def show
    render :show, locals: { survey: surveys_repository.find(params[:id]) }
  end

  def update
    surveys_repository.update(params[:id], survey_params)
    redirect_to root_path # TODO thank you page?
  end

  private

  def surveys_repository
    @surveys_repository ||= SurveysRepository.new(Survey)
  end

  def survey_params
    params.require(:survey).permit(participant: [:name]).tap do |whitelisted|
      whitelisted[:responses] = params[:survey][:responses]
    end
  end
end

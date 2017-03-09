class AssessmentsController < ApplicationController
  def index
    @assessments = Assessment.all
    @number_of_assessments = Assessment.all.count
  end

  def new
    @assessment = Assessment.new
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def create
    Assessment.create(assessment_params)
    redirect_to assessments_path
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])
    @assessment.update(assessment_params)
    redirect_to '/assessments'
  end

  private

  def assessment_params
    params.require(:assessment).permit(:name, :description, :status, :due_date)
  end
end

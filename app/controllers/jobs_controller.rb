class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}."
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}."
      redirect_to company_job_path(@company, @job)
    else
      flash[:failure] = "This job was not updated due to an error."

      redirect_to edit_company_job_path(@company, @job)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash.notice = "#{@job.title} was deleted."

    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end

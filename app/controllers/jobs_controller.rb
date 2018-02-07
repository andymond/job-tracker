class JobsController < ApplicationController
  before_action :set_company, except: [:show]
  before_action :set_job, except: [:index, :new, :create]

  def index
    if !@company.nil?
      @jobs = @company.jobs
    elsif params[:sort] == "location"
      @jobs = Job.sort_by_location
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}."
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}."
      redirect_to company_job_path(@company, @job)
    else
      flash[:failure] = "This job was not updated due to an error."

      redirect_to edit_company_job_path(@company, @job)
    end
  end

  def destroy
    @job.destroy

    flash.notice = "#{@job.title} was deleted."

    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id]) unless params[:company_id].nil?
  end
end

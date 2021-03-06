class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :new, :create]

  def index
    if params[:sort] == "interest"
      @companies = Company.average_level_of_interest
    else
      @companies = Company.all
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def edit

  end

  def update

    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.jobs.each do |job|
      job.comments.each do |comment|
       comment.destroy
      end
      job.destroy
    end
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end

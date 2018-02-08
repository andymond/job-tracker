class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
    @jobs_by_interest = Job.group_by_LOI
    @jobs_per_location = Job.jobs_per_location
    @companies = Company.average_level_of_interest
  end

end

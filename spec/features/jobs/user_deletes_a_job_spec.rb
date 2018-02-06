require "rails_helper"

describe "User can delete a job" do
  it "allows user to delete a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Cool job", level_of_interest: 80, description: "Wahoo", city: "Denver")

    visit company_job_path(company, job)
    click_on "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("#{job.title} was deleted.")
  end
end

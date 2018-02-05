require "rails_helper"

describe "User navigates to edit job" do
  it "allows user to update job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Cool job", level_of_interest: 80, description: "Wahoo", city: "Denver")

    visit edit_company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("80")
    expect(page).to have_content("Wahoo")
    expect(page).to have_content("Denver")
  end
end

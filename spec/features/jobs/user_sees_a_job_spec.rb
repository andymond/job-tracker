require 'rails_helper'

describe "User sees a specific job" do
  it "displays a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
end

describe "User comments on specific job" do
  it "allows user to comment on job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    fill_in "comment[authorname]", with: "Dougie"
    fill_in "comment[body]", with: "Lemme teach ya how to"
    click_on "Submit"

    expect(page).to have_content("Lemme teach ya how to")
    expect(page).to have_content("Dougie")
    expect(current_path).to eq(company_job_path(company, job))
  end
end

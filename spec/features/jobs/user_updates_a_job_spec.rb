require "rails_helper"

describe "User navigates to edit job" do
  it "allows user to update job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_company_job_path(company, job)
    fill_in "job[title]", with: "Even cooler job"
    fill_in "job[level_of_interest]", with: 100
    fill_in "job[description]", with: "Do cool sports reporting stuff"
    fill_in "job[city]", with: "Brooklyn"
    click_on "Update Job"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Even cooler job")
    expect(page).to have_content(100)
    expect(page).to have_content("Do cool sports reporting stuff")
    expect(page).to have_content("Brooklyn")
  end

  it "doesn't allow user to omit title from job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_company_job_path(company, job)
    fill_in "job[title]", with: ""
    fill_in "job[level_of_interest]", with: 100
    fill_in "job[description]", with: "Do cool sports reporting stuff"
    fill_in "job[city]", with: "Brooklyn"
    click_on "Update Job"

    expect(page).to have_content("This job was not updated due to an error.")
  end
end

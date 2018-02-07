require "rails_helper"

describe "User sees all jobs in database" do
  it "allows user to view all jobs" do
    company = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ESPX")
    category = Category.create(title: "Much Sportnstuf")
    company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    company_2.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)

    visit "/jobs"

    expect(page).to have_content("Boston")
    expect(page).to have_content("Denver")
    expect(page).to have_content("New York City")
  end
end

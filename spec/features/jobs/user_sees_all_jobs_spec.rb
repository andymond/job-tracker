require "rails_helper"

describe "User sees all jobs in database" do
  it "allows user to view jobs sorted by location" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    company.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)

    visit "/jobs?sort=location"

    expect(page).to have_tag("ul:first-child", text: "Boston")
    expect(page).to have_tag("ul:last-child", text: "New York City")
  end
end

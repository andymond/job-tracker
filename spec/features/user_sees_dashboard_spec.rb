require "rails_helper"

describe "User visits dashboard" do
  it "displays a list of job count by level of interest" do
    company = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ESPX")
    category = Category.create(title: "Much Sportnstuf")
    company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    company_2.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)
    company_2.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)

    visit dashboard_path
    expect(page).to have_content("You are 80% interested in 2 jobs.")
    expect(page).to have_content("You are 70% interested in 1 jobs.")
    expect(page).to have_content("You are 60% interested in 1 jobs.")
  end
  it "displays a list of top 3 companies by avg interest" do
    company = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ESPX")
    company_3 = Company.create!(name: "ESPZ")
    company_4 = Company.create!(name: "ESPQ")
    category = Category.create(title: "Much Sportnstuf")
    company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    company_2.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)
    company_2.jobs.create!(title: "Intern", level_of_interest: 80, city: "Boston", category_id: category.id)
    company_3.jobs.create!(title: "Intern", level_of_interest: 10, city: "Boston", category_id: category.id)
    company_4.jobs.create!(title: "Intern", level_of_interest: 5, city: "Boston", category_id: category.id)

    visit dashboard_path

    expect(page).to have_content("ESPN is your #2 company! You are on average 65.0% interested in jobs here.")
    expect(page).to have_content("ESPX is your #1 company! You are on average 80.0% interested in jobs here.")
    expect(page).to have_content("ESPZ is your #3 company! You are on average 10.0% interested in jobs here.")
    expect(page).to_not have_content("You are on average 5.0% interested in jobs here.")
  end
end

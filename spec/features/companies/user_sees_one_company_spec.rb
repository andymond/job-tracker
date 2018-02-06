require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Very Nice Job")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
  it "allows user to add contact" do
    company = Company.create!(name: "ESPN")

    visit company_path(company)
    fill_in "contact[name]", with: "Seymore"
    fill_in "contact[title]", with: "Janitor"
    fill_in "contact[email]", with: "email@example.com"
    click_on "Submit"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Seymore")
    expect(page).to have_content("Janitor")
    expect(page).to have_content("email@example.com")
  end
end

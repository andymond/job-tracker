require 'rails_helper'

describe "User creates a new job" do
  it "allows user to create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Sportsy Job")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select(category.title, :from => "job[category_id]")

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Sportsy Job")
  end
  it "allows user to navigate to new category" do
    company = Company.create!(name: "ESPN")

    visit new_company_job_path(company)
    click_on "Create A New Category"

    expect(current_path).to eq(new_category_path)
  end
end

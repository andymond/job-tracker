require "rails_helper"

describe "User sees category show page" do
  it "displays all jobs in category" do
    category = Category.create(title: "Hella")
    company = Company.create(name: "ShakeShack")
    job_1 = Job.create(title: "Cool job", level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: category.id, company_id: company.id)
    job_2 = Job.create(title: "Entry level job", level_of_interest: 70, description: "not bad", city: "Denver", category_id: category.id, company_id: company.id)

    visit category_path(category)

    expect(page).to have_link(job_1.title)
    expect(page).to have_link(job_2.title)
  end
end

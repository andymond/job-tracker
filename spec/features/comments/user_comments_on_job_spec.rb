require "rails_helper"

describe "User sees job posting" do
  it "allows user to create comment on job posting" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Much Sportnstuf")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    comment_1 = job.comments.create(authorname: "Dog", body: "I don't really want any job")
    comment_2 = job.comments.create(authorname: "Human", body: "I do really want a job")

    visit company_job_path(company, job)

    expect(page).to have_content(comment_1.authorname)
    expect(page).to have_content(comment_2.authorname)
    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_2.body)
    expect(page).to have_content(comment_1.created_at.to_s(:rfc822).chomp("+0000"))
    expect(page).to have_content(comment_2.created_at.to_s(:rfc822).chomp("+0000"))
    expect(page).to have_content(comment_1.updated_at.to_s(:rfc822).chomp("+0000"))
    expect(page).to have_content(comment_2.updated_at.to_s(:rfc822).chomp("+0000"))
  end
end

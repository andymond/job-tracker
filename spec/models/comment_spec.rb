require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it "is valid with authorname, body & job" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "Much Sportnstuf")
      job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment_1 = job.comments.create(authorname: "Dog", body: "I don't really want any job")

      expect(comment_1).to be_valid
    end
    it "is invalid without authorname" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "Much Sportnstuf")
      job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment_1 = job.comments.create(body: "I job")

      expect(comment_1).to be_invalid
    end
    it "is invalid without body" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "Much Sportnstuf")
      job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment_1 = job.comments.create(authorname: "Dog")

      expect(comment_1).to be_invalid
    end
    it "is invalid without job" do
      comment_1 = Comment.create(authorname: "Dog", body: "I don't really want any job")

      expect(comment_1).to be_invalid
    end
  end
  describe "relationships" do
    it {should belong_to(:job)}
  end
end

require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new(title: "Fishy")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = Category.new(title: "Fishy")
        job = Job.new(title: "fisherman", description: "Wahoo", city: "Denver", category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = Category.new(title: "Fishy")
        job = Job.new(title: "fisherman", level_of_interest: 80, description: "Wahoo", category_id: category.id)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category" do
        company = Company.create!(name: "ESPN")
        category = Category.create(title: "Much Sportnstuf")
        job = company.jobs.create(title: "Cool job", level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: category.id)

        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it {should belong_to(:company)}
    it {should have_many(:comments)}
  end
end

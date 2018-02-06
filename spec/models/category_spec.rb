require "rails_helper"

describe Category, type: :model do
  context "Valid Attributes" do
    it "is valid with a title" do
      category = Category.create(title: "ChickenLittle")

      expect(category).to be_valid
    end
  end

  context "Invalid Attributes" do
    it "is invalid with no title" do
      category = Category.create(title: "")

      expect(category).to be_invalid
    end
    it "is invalid if title exists" do
      category = Category.create(title: "Hoohah")
      category = Category.create(title: "Hoohah")

      expect(category).to be_invalid
    end
  end

end

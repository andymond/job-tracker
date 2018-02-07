require "rails_helper"

describe Contact, type: :model do
  describe "validations" do
    context "valid attributes" do
      it "is valid with name, title, email and company" do
        company = Company.new(name: "CorpCorp")
        contact = company.contacts.new(name: "Mr. T", title: "HR person", email: "email@example.com")

        expect(contact).to be_valid
      end
    end
    context "invalid attributes" do
      it "is not valid without name" do
        company = Company.new(name: "CorpCorp")
        contact = company.contacts.new(title: "Mr. T", email: "email@example.com")

        expect(contact).to be_invalid
      end
      it "is not valid without title" do
        company = Company.new(name: "CorpCorp")
        contact = company.contacts.new(name: "Mr. T", email: "email@example.com")

        expect(contact).to be_invalid
      end
      it "is not valid without email" do
        company = Company.new(name: "CorpCorp")
        contact = company.contacts.new(name: "Mr. T", title: "HR person")

        expect(contact).to be_invalid
      end
      it "is not valid without company" do
        contact = Contact.new(name: "humfry", title: "HR person", email: "email@example.com")

        expect(contact).to be_invalid
      end
    end
  end
  describe "relationships" do
    it {should belong_to(:company)}
  end
end

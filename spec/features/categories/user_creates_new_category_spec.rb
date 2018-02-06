require "rails_helper"

describe "User can create new category" do
  it "Allows user to create category with title" do
    visit new_category_path

    fill_in "category[title]", with: "Cool Beans"
    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Cool Beans was created.")
  end

  it "Doesn't allow user to create category without title" do

  end

  it "Doesn't allow user to create category that exists" do

  end
end

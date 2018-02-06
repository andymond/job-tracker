require "rails_helper"

describe "User can edit category" do
  it "allows user to update with new title" do
    category = Category.create(title: "Best")

    visit edit_category_path(category)
    fill_in "category[title]", with: "Cool Beans"
    click_on "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Cool Beans")
    expect(page).to have_content("'Cool Beans' updated.")
  end

  it "doesn't allow user to update with no title" do
    category = Category.create(title: "Best")

    visit edit_category_path(category)
    fill_in "category[title]", with: ""
    click_on "Update Category"

    expect(current_path).to eq(edit_category_path(category))
    expect(page).to have_content(category.title)
    expect(page).to have_content("'#{category.title}' not updated due to an error.")
  end
end

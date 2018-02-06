require "rails_helper"

describe "User visits categories index" do
  it "displays all categories" do
    category_1 = Category.create(title: "Razzmatazzle")
    category_2 = Category.create(title: "Jazzmakrazzle")
    category_3 = Category.create(title: "Bazzmazazzle")

    visit categories_path

    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_2.title)
    expect(page).to have_content(category_3.title)
  end
  it "allows user to edit categories" do
    category_1 = Category.create(title: "Razzmatazzle")
    category_2 = Category.create(title: "Jazzmakrazzle")
    category_3 = Category.create(title: "Bazzmazazzle")

    visit categories_path
    click_on("edit_#{category_1.title}")

    expect(current_path).to eq(edit_category_path(category_1))
    expect(page).to have_content(category_1.title)
    expect(page).to_not have_content(category_2.title)
    expect(page).to_not have_content(category_3.title)
  end
  it "allows user to delete categories" do
    category_1 = Category.create(title: "Razzmatazzle")
    category_2 = Category.create(title: "Jazzmakrazzle")
    category_3 = Category.create(title: "Bazzmazazzle")

    visit categories_path
    click_on("delete_#{category_1.title}")

    expect(page).to_not have_content(category_1.title)
    expect(page).to have_content(category_2.title)
    expect(page).to have_content(category_3.title)
  end

end

require "rails_helper"

RSpec.feature "Ingredients CRUD", :type => :feature do

  scenario "user visits the index" do
    visit "/ingredients"

    expect(page).to have_text("No ingredients yet")
  end

  scenario "user visits the index with ingredients" do
    @ingredient = create(:ingredient, name: "Some Name")
    visit "/ingredients"
    expect(page).to have_text(@ingredient.name)
  end

  scenario "User creates a new ingredient" do
    visit "/ingredients/new"

    fill_in "Name", :with => "Onion"
    click_button "Create Ingredient"

    expect(page).to have_text("Ingredient was successfully created.")
  end

end
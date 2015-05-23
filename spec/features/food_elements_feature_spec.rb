require "rails_helper"

RSpec.feature "FoodElement CRUD", :type => :feature do

  scenario "user visits the index" do
    visit "/food_elements"

    expect(page).to have_text("No ingredients yet")
  end

  scenario "user visits the index with ingredients" do
    @ingredient = create(:food_element, name: "Some Name")
    visit "/food_elements"
    expect(page).to have_text(@ingredient.name)
  end

  scenario "User creates a new ingredient" do
    visit "/food_elements/new"

    fill_in "Name", :with => "Onion"
    click_button "Create Food Element"

    expect(page).to have_text("Element was successfully created.")
    expect(response).to redirect_to :edit
  end

end
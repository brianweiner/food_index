require "rails_helper"

RSpec.feature "FoodElement CRUD", :type => :feature do

  scenario "user visits the index" do
    visit "/food_elements"

    expect(page).to have_text("No ingredients yet")
  end

  scenario "User creates a new ingredient" do
    visit "/food_elements/new"

    fill_in "Name", :with => "Onion"
    click_button "Create Food Element"

    expect(page).to have_text("Element was successfully created.")
  end

  context "an ingredient exists" do
    before do
      @ingredient = create(:food_element, name: "Some Name")
    end

    scenario "user visits the index with ingredients" do
      visit "/food_elements"
      expect(page).to have_text(@ingredient.name.capitalize)
    end

    scenario "user uses the index search" do
      visit "/food_elements"
      fill_in "element_name", :with => "some"
      click_button "Search"

      expect(page).to have_text("Some name")

    end

    scenario "Editing an ingredient" do
      visit "/food_elements/#{@ingredient.id}/edit"

      fill_in "Name", :with => "Vidalia Onion"
      click_button "Update Food Element"

      expect(page).to have_text("Element was successfully updated.")
      expect(page).to have_text("Vidalia")
    end

    scenario "Adding a connection to an ingredient" do
      visit "/food_elements/#{@ingredient.id}/edit"

      fill_in "food_element[new_element_name]", :with => "Garlic"
      find('#food_element_new_type').find(:xpath, 'option[2]').select_option
      find('#food_element_connection_connection_type').find(:xpath, 'option[2]').select_option
      click_button "Add Connection"
      expect(page).to have_text("Garlic")
    end
  end

end
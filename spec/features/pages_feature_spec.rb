require "rails_helper"

RSpec.feature "Basic static pages", :type => :feature do
  scenario "home page routing" do
    visit "/"
    expect(page).to have_text("Welcome")
  end

end
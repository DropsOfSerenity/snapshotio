require 'rails_helper'

RSpec.feature "User Signs Up", type: :feature do
  scenario "with success" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome to snapshot.io!")
  end
end

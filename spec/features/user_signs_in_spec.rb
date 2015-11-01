require 'rails_helper'

RSpec.feature "User Signs In", type: :feature do
  before do
    @user = create(:user)
  end

  scenario "successfully" do
    visit "/"
    click_link "Sign In"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with bad information" do
    visit "/"
    click_link "Sign In"

    fill_in "Email", with: ""
    fill_in "Password", with: "invalidpassword"
    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end
end

require 'rails_helper'


RSpec.feature "User Signs Out", type: :feature do

  before do
    @user = create(:user)
    login_as(@user)
  end

  scenario "successfully" do
    visit "/"
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
  end
end

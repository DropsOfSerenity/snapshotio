require 'rails_helper'

RSpec.feature 'Archiving Users', type: :feature do

  before do
    @admin = create(:user, :admin)
    @user = create(:user)
    login_as(@admin)
  end

  scenario 'with success' do
    visit admin_user_path(@user)
    click_link 'Archive User'

    expect(page).to have_content 'User has been archived'
    expect(page).not_to have_content @user.email
  end

  scenario 'cannot archive self' do
    visit admin_user_path(@admin)
    click_link 'Archive User'

    expect(page).to have_content 'Cannot archive yourself'
  end

end

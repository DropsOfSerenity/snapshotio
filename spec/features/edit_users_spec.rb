require 'rails_helper'

RSpec.feature 'Admin can edit users information', type: :feature do

  before do
    @admin = create(:user, :admin)
    @user = create(:user, email: 'old@email.com')
    login_as(@admin)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
    click_link 'old@email.com'
    click_link 'Edit User'
  end

  scenario 'with valid information' do
    fill_in 'Email', with: 'new@email.com'
    click_button 'Update User'

    expect(page).to have_content('User Updated')
    expect(page).to have_content('new@email.com')
    expect(page).not_to have_content('old@email.com')
  end

  scenario 'elevating to admin' do
    check 'Is an admin?'
    click_button 'Update User'
    expect(page).to have_content('User Updated')
    expect(page).to have_content("#{@user.email} [Admin]")
  end

  scenario 'with invalid information' do
    fill_in 'Email', with: ''
    click_button 'Update User'

    expect(page).to have_content('User not Updated')
  end

end

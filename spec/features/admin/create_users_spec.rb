require 'rails_helper'

RSpec.feature 'Admins can create users', type: :feature do

  include Warden::Test::Helpers

  before do
    @admin = create(:user, :admin)
    login_as(@admin)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
    click_link 'New User'
  end

  scenario 'with valid credentials' do
    fill_in 'Email', with: 'client@project.com'
    fill_in 'Password', with: 'password'
    click_button 'Create User'
    expect(page).to have_content 'From the mighty fires you have forged a new user.'
  end

  scenario 'making an admin user' do
    fill_in 'Email', with: 'admin@project.com'
    fill_in 'Password', with: 'password'
    check 'Is an admin?'
    click_button 'Create User'
    expect(page).to have_content 'From the mighty fires you have forged a new user.'
    expect(page).to have_content 'admin@project.com [Admin]'
  end

end
require 'rails_helper'

RSpec.feature 'A Project can be created', type: :feature do

  include Warden::Test::Helpers

  before do
    login_as(create(:user, :admin))
  end

  scenario 'with valid attributes' do
    visit '/projects/new'

    fill_in 'Name', with: 'XYZ Widgets Inc'
    fill_in 'Description', with: 'Website redo for Futurecorp.'
    click_button 'Create Project'

    expect(page).to have_content 'Project Created'
  end

  scenario 'with invalid attributes' do
    visit '/projects/new'
    fill_in 'Description', with: 'New Website'
    click_button 'Create Project'

    expect(page).to have_content "Name can't be blank"
  end
end

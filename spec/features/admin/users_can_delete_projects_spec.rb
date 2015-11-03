require 'rails_helper'

RSpec.feature 'Users can delete a project', type: :feature do

  before do
    login_as(create(:user, :admin))
  end

  scenario 'with success' do
    create(:project, name: 'XYZ Widgets')

    visit '/projects'
    click_link 'XYZ Widgets'
    click_link 'Delete Project'

    expect(page).to have_content('Project Deleted')
    expect(page).not_to have_content('XYZ Widgets')
    expect(page.current_url).to eq(projects_url)
  end
end

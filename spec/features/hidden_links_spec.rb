require 'rails_helper'

RSpec.feature 'User can only see certain links', type: :feature do

  before do
    @project = create(:project)
  end

  context 'anonymous users' do
    scenario 'cannot see the New Project link' do
      visit '/'
      expect(page).not_to have_link 'New Project'
    end

    scenario 'cannot see the Delete Project link' do
      visit project_path(@project)
      expect(page).not_to have_link 'Delete Project'
    end

  end

  context 'regular users' do

    before { login_as(create(:user)) }

    scenario 'cannot see the New Project link' do
      visit '/'
      expect(page).not_to have_link 'New Project'
    end

    scenario 'cannot see the Delete Project link' do
      visit project_path(@project)
      expect(page).not_to have_link 'Delete Project'
    end
  end

  context 'admin users' do
    before { login_as(create(:user, :admin)) }

    scenario 'can see the New Project link' do
      visit '/'
      expect(page).to have_link 'New Project'
    end

    scenario 'cannot see the Delete Project link' do
      visit project_path(@project)
      expect(page).to have_link 'Delete Project'
    end
  end

end

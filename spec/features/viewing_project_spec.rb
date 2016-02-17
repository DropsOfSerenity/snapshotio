require 'rails_helper'

RSpec.feature "Projects can be viewed", type: :feature do

  before do
    user = create(:user)
    @project = create(:project, name: 'XYZ Widgets')

    login_as(user)
    assign_role!(user, :viewer, @project)
  end

  scenario "with a valid project" do
    visit "/projects"
    click_link("XYZ Widgets")
    expect(page.current_url).to eq(project_url(@project))
  end
end

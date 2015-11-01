require 'rails_helper'

RSpec.feature "Deleting a shot", type: :feature do
  before do
    @project = create(:project)
    @shot = create(:shot, project: @project)
    visit project_shot_path(@project, @shot)
  end

  scenario "with success" do
    click_link "Delete Shot"
    expect(page).to have_content "Shot deleted."
    expect(page.current_url).to eq(project_url(@project))
  end
end

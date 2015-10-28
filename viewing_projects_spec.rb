require 'rails_helper'

RSpec.feature "Projects can be viewed", type: :feature do
  scenario "with a valid project" do
    project = create(:project, name: "XYZ Widgets")

    visit "/projects"
    click_link("XYZ Widgets")
    expect(page.current_url).to eq(project_url(project))
  end
end

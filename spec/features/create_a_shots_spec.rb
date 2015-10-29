require 'rails_helper'

RSpec.feature "Creating a shot", type: :feature do
  before do
    project = create(:project, name: "XYZ Widgets")

    visit project_path(project)
    click_link "New Shot"
  end

  scenario "with valid info" do
    fill_in "Name", with: "Homepage Mockup v1.0.1"
    attach_file "Image", Rails.root + 'spec/fixtures/shot.jpg'
    click_button "Create Shot"
    expect(page).to have_content("Shot Created.")
  end

  scenario "with invalid info" do
    fill_in "Name", with: ""

    click_button "Create Shot"
    expect(page).to have_content("Shot not created.")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Image can't be blank")
  end
end

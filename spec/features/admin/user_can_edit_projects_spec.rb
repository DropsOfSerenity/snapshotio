require 'rails_helper'

RSpec.feature "User can edit projects", type: :feature do
  scenario "with valid information" do
    create(:project, name: "Mispeled Name")

    visit "/projects"
    click_link "Mispeled Name"
    click_link "Edit Project"
    fill_in "Name", with: "Misspelled Name v2"
    click_button "Update Project"

    expect(page).to have_content("Project Updated.")
    expect(page).to have_content("Misspelled Name v2")
  end

  scenario "with invalid information" do
    create(:project, name: "XYZ Widgets Factory")

    visit "/projects"
    click_link "XYZ Widgets Factory"
    click_link "Edit Project"
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Project not Updated.")
  end

end

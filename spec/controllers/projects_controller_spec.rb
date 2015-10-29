require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project gracefully" do
    get :show, id: "invalid-id"

    expect(response).to redirect_to(projects_path)
    expect(flash[:alert]).to eq "The project you were looking for doesn't exist"
  end
end

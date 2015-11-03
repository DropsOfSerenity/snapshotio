require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do

  before do
    @user = create(:user)
    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:authenticate_user!)
  end

  context 'non-admin users' do
    it 'cannot reach admin areas' do
      get :index

      expect(response).to redirect_to '/'
      expect(flash[:alert]).to eq 'Only admins allowed in there <3'
    end
  end

end

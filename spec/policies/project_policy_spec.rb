require 'rails_helper'

describe ProjectPolicy do

  subject { described_class }

  before do
    @user = create(:user)
    @project = create(:project)
  end

  permissions ".scope" do
  end

  permissions :show? do
    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, @project)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end

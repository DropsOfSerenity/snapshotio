require 'rails_helper'

RSpec.describe Shot, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :image }
  it { should belong_to :project }
end

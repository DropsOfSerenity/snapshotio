FactoryGirl.define do

  factory :shot do
    name "Shot #1"
    image { fixture_file_upload(Rails.root + 'spec/fixtures/shot.jpg', 'image/jpeg') }
    project nil
  end

  factory :project do
    name "Project"
  end

end

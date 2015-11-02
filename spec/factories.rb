FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password "password"
  end


  factory :shot do
    name "Shot #1"
    image { fixture_file_upload(Rails.root + 'spec/fixtures/shot.jpg', 'image/jpeg') }
    project
    association :owner, factory: :user
  end

  factory :project do
    name "Project"
  end

end

FactoryGirl.define do
  factory :subject do
    name Faker::Book.title
    description Faker::Lorem.paragraph
  end
end
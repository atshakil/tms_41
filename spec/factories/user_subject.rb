require "faker"

FactoryGirl.define do
  factory :user_subject do |f|
    user
    course_subject
    status 0
    
    factory :invalid_user_subject do
      user nil
    end
  end
end
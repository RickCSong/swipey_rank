# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    fullname Faker::Name.name
  end
end

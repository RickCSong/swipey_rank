# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    user
    score rand(100)
    duration rand(99999)
  end
end

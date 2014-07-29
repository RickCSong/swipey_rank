# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    user nil
    score 1
    time_played 1
  end
end

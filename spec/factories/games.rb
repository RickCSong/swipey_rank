# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    user
    score { rand(100) }
    backflips { rand(10) }
    duration { rand(99999) }
    verification_token { user.username.length * 3 + score * 42 }
  end
end

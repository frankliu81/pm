FactoryGirl.define do
  factory :discussion do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    body      { Faker::Hipster.paragraph       }
  end
end

FactoryGirl.define do
  factory :project do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    description      { Faker::Hipster.paragraph       }
  end
end

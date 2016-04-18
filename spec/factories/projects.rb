FactoryGirl.define do
  factory :project do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    description      { Faker::Hipster.paragraph       }
    # project due date has to be greater than the tasks due_date in factory
    due_date   { Time.now + 120.days + rand(10).days      }
  end
end

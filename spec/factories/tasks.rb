FactoryGirl.define do
  factory :task do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    body      { Faker::Hipster.paragraph       }
    due_date         { Time.now + rand(120).days      }
    status    'Not Done'
  end
end 

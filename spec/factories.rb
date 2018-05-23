FactoryBot.define do
  factory :comment do
    association :author, factory: :user
    association :message, factory: :message
    content "MyCommentText"
  end
  factory :activity do
    sequence(:name) { |n| "Activity#{n}" }
  end

  factory :message do
    content "MyMessageText"
    association :author, factory: :user
    association :team, factory: :team
  end

  factory :team do
    sequence(:name) { |n| "cool team name #{n}" }
    activity_id 1
    min_members 5
    association :captain, factory: :user
    
    after(:create) do |team| 
      team.members = [team.captain]
    end
  end

  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "cool#{n}@email.com" }
    password Faker::Internet.password(6)

    after(:create, &:confirm) end
end

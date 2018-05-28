FactoryBot.define do
  factory :finance do
    association :user, factory: :user
    association :team, factory: :team
  end
  factory :roster do
    association :team, factory: :team
  end
  factory :invitation do
    association :from, factory: :user
    association :to, factory: :user
    association :team, factory: :team

    after(:build) do |invitation|
      invitation.from = invitation.team.captain if invitation.team
    end

  end
  factory :comment do
    association :author, factory: :user
    association :message, factory: :message
    content 'MyCommentText'
  end
  factory :activity do
    sequence(:name) { |n| "Activity#{n}" }
  end

  factory :message do
    content 'MyMessageText'
    association :author, factory: :user
    association :team, factory: :team
  end

  factory :team do
    sequence(:name) { |n| "cool team name #{n}" }
    activity_id 1
    minimum_members_needed_for_an_event 5
    association :captain, factory: :user

    after(:build) do |team|
      team.members = [team.captain] if team.captain
      team.roster ||= FactoryBot.build(:roster, team: team)
    end

    after(:create) do |team|
      FactoryBot.create(:finance, user: team.captain, team: team)
    end

  end

  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "cool#{n}@email.com" }
    password Faker::Internet.password(6)
    after(:create, &:confirm)
  end
end

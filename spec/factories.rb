FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "cool team name #{n}" }
    association :activity, factory: :activity
    min_members 5
  end
  factory :activity do
    name "Baseball"
  end
  factory :user do
    name  Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password(6)

    after(:create, &:confirm)
  end
end

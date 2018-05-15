FactoryBot.define do
  factory :team do
    name "MyString"
    activity nil
  end
  factory :activity do
    name "MyString"
  end
  factory :user do
    name  Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password(6)

    after(:create, &:confirm)
  end
end

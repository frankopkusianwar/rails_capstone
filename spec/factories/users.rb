FactoryBot.define do
  factory :user do
    sequence(:fullname) { |n| "#{n}#{Faker::Name.name}" }
    sequence(:username) { |n| "#{n}#{Faker::Internet.username}" }
  end
end

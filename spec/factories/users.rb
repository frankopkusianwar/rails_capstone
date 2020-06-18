FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "#{n}#{Faker::Internet.username}" }
  end
end

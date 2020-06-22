FactoryBot.define do
  factory :user do
    sequence(:fullname) { |n| "#{n}#{Faker::Internet.fullname}" }
    sequence(:username) { |n| "#{n}#{Faker::Internet.username}" }
  end
end

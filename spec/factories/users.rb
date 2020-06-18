FactoryBot.define do
  factory :user do
    fullname { 'frank okiror' }
    sequence(:username) { |n| "#{n}#{Faker::Internet.username}" }
  end
end

FactoryBot.define do
  factory :customer, aliases: [:user, :father] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end

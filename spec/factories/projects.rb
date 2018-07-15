FactoryBot.define do
  factory :project do
    name { Faker::Lorem.characters(rand(4..30)) }
	association :user, factory: :user
  end
end

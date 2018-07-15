FactoryBot.define do
  factory :task do
	association :user
	association :project
	due_date { 2.hours.from_now }
	name { Faker::Lorem.words(3).join(' ') }
	description { Faker::Lorem.paragraph }
  end
end

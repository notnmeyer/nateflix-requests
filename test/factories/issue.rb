FactoryBot.define do
  factory :issue do
    user
    title { Faker::Lorem.sentence }
    notes { Faker::Lorem.paragraph }
    status { 'reported' }
  end
end

FactoryBot.define do
  factory :request do
    user
    title { Faker::Movie.title }
    media_type { 'movie' }
    notes { Faker::Movie.quote }
  end
end

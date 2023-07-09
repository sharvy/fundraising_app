# frozen_string_literal: true

require 'faker'

20.times do
  Campaign.create!(
    title: Faker::TvShows::BigBangTheory.quote,
    description: Faker::Lorem.paragraph(sentence_count: 50),
    goal: Faker::Number.within(range: 10..1000)
  )
end

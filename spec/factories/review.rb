FactoryBot.define do
  factory :review do
    spot
    reviewer_name { "John Doe" }
    comment { "This spot was great!" }
    star { 5 }
  end
end

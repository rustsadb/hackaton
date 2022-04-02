FactoryBot.define do
  factory :task do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    important { 1 }
    deadline { (Date.today + 1.day).iso8601 }
    stage
  end
end

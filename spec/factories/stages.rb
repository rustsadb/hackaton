FactoryBot.define do
  factory :stage do
    name { FFaker::Name.name  }
    project
  end
end

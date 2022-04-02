FactoryBot.define do
  factory :project do
    name { FFaker::Name.name  }
    random_documentation

    trait :random_documentation do
      password_digest { ('a'..'z').to_a.shuffle[0..Random.rand(8..20)].join }
    end
  end
end

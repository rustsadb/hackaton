FactoryBot.define do
  factory :user do
    random_phone_number
    random_password
    name { FFaker::Name.name  }
    gender { 'female' }
    email { FFaker::Internet.email }

    trait :random_password do
      password_digest { ('a'..'z').to_a.shuffle[0..Random.rand(8..20)].join }
    end

    trait :random_phone_number do
      phone_number { 10.times.map{ rand(10) }.join.to_i }
    end
  end
end

FactoryBot.define do
  factory :comment do
    association :account
    association :post

    comment { FFaker::Lorem.paragraph }
  end
end
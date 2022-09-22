FactoryBot.define do
  factory :post do
    association :account
    
    description { FFaker::Lorem.sentence }
    # image { remote_image_location_url Faker::Avatar.image }
  end
end
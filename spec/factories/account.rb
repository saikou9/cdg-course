FactoryBot.define do
  factory :account do
    email { FFaker::Internet.email }
    username { FFaker::Internet.user_name }
    first_name { FFaker::NameVN.first_name }
    last_name { FFaker::NameVN.last_name }
    # avatar { FFaker::Image.file }
    # description { FFaker::Lorem.sentance }
    password { "password" }
    password_confirmation { "password" }
  end
end
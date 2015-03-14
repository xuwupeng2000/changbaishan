FactoryGirl.define do

  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    password   { "Password#!1" }
  end

  factory :customer do
    name    { Faker::Name.name }
    address { Faker::Address.street_address }

    user
  end

end

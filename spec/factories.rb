FactoryGirl.define do

  factory :customer_contact, class: Customer::Contact do
    name {'Phone'}
    detail {Faker::PhoneNumber.phone_number }
  end

  factory :product do
    name {Faker::App.name}
    description {Faker::Lorem.paragraph}
    weight { 9 }
    is_public {false}

    product_category
    user
  end

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

    after(:create) do |customer|
      create_list(:customer_contact, 5, customer: customer)
    end
  end

  factory :product_category, class: Product::Category do
    name {'Other'}
  end

end

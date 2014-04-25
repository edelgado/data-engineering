require 'faker'
FactoryGirl.define do
  factory :transaction do
    item { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    quantity { Faker::Number.number(1) }
    association :client, factory: :client, strategy: :build
    association :merchant, factory: :merchant, strategy: :build
  end
end
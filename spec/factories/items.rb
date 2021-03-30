FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    info { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9999999) }
    category_id { 2 }
    sales_status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    association :user
  end
end
FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    city { '高崎市八島町' }
    block_number { '２２２' }
    building { '高崎駅' }
    phone_number { 12_345_678_901 }
    prefecture { 11 }
    token { 'pk_test_000000000000000000000000' }
  end
end

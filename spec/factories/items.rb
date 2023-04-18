FactoryBot.define do
  factory :item do
    name {Faker::String.random}
    info { 'サンプル商品の説明' }
    price { 1000 }
    category_id { 1 }
    sales_status_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    wada

    after(:build) do |i|
      i.images.attach(io: File.open('furima.png'), filename: 'furima.png')
    end
  end
end

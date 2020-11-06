FactoryBot.define do
  factory :item do
    price { '3000' }
    item_name { 'doll' }
    item_description { 'とても可愛らしい人形です。' }
    category_id { 2 }
    condition_id { 2 }
    prefecture_id { 2 }
    delivery_charge_id { 2 }
    delivery_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

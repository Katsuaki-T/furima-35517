FactoryBot.define do
  factory :item do
    name                   { 'a' }
    description            { 'a' }
    category_id             { 2 }
    status_id               { 2 }
    shipping_charge_id      { 2 }
    prefecture_id           { 2 }
    delivery_time_id        { 2 }
    price                   {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.png'), filename: 'test.png')
    end
  end
end
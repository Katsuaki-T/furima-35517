FactoryBot.define do
  factory :purchase_address do
    postal_code                   { '123-4567' }
    prefecture_id           { 2 }
    city             { 'city' }
    house_number                { '1-2' }
    phone_number      { '09012345678' }
    
  end
end

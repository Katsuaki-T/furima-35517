FactoryBot.define do
  factory :purchase_history do
    association :user
    association :item
  end
end

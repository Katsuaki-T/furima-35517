FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'1q1q1q'}
    password_confirmation {password}
  end
end
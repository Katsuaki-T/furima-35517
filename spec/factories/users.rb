FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
  end
end
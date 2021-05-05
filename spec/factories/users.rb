FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'1q1q1q'}
    password_confirmation {password}
    nickname              {"ai"}
    first_name            {"あい"}
    family_name           {"あいだ"}
    first_name_kana       {"アイ"}
    family_name_kana      {"アイダ"}
    birthday              {19300101}

  end
end
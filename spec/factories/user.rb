FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    first_name
    last_name
    first_name_kana
    last_name_kana
    birthday
  end
end
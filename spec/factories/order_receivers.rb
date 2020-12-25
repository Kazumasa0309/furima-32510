FactoryBot.define do
  factory :order_receiver do
    token         { "tok_abcdefghijk00000000000000000" }
    postal_code   { "120-0000" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality  { "Adachi-ku" }
    address       { "Ayase9-99-9" }
    building      { "AyaseBill" }
    phone_number  { "09012345678" }
  end
end

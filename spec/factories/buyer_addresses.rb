FactoryBot.define do
  factory :buyer_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌' }
    address { '1-1' }
    building_name { '札幌ドーム' }
    telephone_number { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end

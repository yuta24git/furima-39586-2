FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { generate_password }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birth_date { Date.new(1995, 8, 3) }
  end
end

def generate_password
  letters = Faker::Internet.password(min_length: 3, max_length: 3, mix_case: true)
  digits = Faker::Number.between(from: 100, to: 999)

  "#{letters}#{digits}"
end

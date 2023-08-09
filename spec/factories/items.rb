FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    explanation { Faker::Lorem.sentence }
    category_id { rand( 2 .. 11 ) }
    situation_id { rand( 2 .. 7 ) }
    responsibility_id { rand( 2 .. 3 ) }
    prefecture_id { rand( 2 .. 48 ) }
    number_of_day_id { rand( 2 .. 3 ) }
    price { rand( 300 .. 9999999 ) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end

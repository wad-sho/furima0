FactoryBot.define do
  factory :wada do
    nickname { Faker::Internet.username }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    email { Faker::Internet.email }
    birth_date { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    first_name { '佐々木' }
    last_name { 'メアリー' }
    first_name_kana { 'メアリー' }
    last_name_kana { 'タロウ' }
  end
end

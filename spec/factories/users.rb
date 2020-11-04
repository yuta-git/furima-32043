FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    family_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    family_name_kana {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    birthday {Faker::Date.between(from: '1950-01-01', to: '2010-01-01')}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
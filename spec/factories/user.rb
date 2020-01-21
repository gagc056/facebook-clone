FactoryBot.define do
  factory :user do
    first_name {'Jhon'}
    last_name {'Doe'}
    sequence(:email) { |n| "person#{n}@example.com" }
    password {'12345678'}
    password_confirmation {'12345678'}
    date_birth {'03/02/1989'}
    gender {'male'}
  end
end
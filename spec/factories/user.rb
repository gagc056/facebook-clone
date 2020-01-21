# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "jhon45556666#{n}@example.com" }
  factory :user do
    first_name { 'wwwwwww' }
    last_name { 'dass' }
    email
    password { '12345678' }
    password_confirmation { '12345678' }
    date_birth { '03/02/1989' }
    gender { 'male' }
  end
end

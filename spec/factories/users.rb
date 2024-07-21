# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    email { 'test@test.com' }
    date_of_birth { Date.new(2000, 0o1, 0o1) }
    tell_number { '01201111222' }
    password { 'password' }
    password_confirmation { 'password' }

    trait :sign_in do
      confirmed_at { DateTime.new(2000, 1, 1, 1, 1, 1) }
      confirmation_sent_at { DateTime.new(2000, 1, 1, 1, 1, 1) }
      confirmation_token { nil }
      unconfirmed_email { nil }
    end
  end
end

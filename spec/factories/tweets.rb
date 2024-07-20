# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    content { 'test' }
    association :user
  end
end

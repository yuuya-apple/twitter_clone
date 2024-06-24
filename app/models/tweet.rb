# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :children, class_name: 'Tweet',
                      foreign_key: 'reply_to_id', dependent: :nullify
  belongs_to :parent, class_name: 'Tweet', optional: true
end

# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :notifications, as: :notificationable, dependent: :destroy
end

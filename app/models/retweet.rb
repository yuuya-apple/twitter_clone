# frozen_string_literal: true

class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :notifications, as: :notificationable, dependent: :destroy
end

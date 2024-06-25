# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :replys, dependent: :destroy
  has_many :retweets, dependent: :destroy

  def self.profile_tweets(tab, user_id, page)
    case tab
    when :favorite
      Tweet.joins(:favorites).where(favorites: { user_id: }).order(created_at: :desc).page(page).eager_load(:user)
    when :retweet
      Tweet.joins(:retweets).where(retweets: { user_id: }).order(created_at: :desc).page(page).eager_load(:user)
    when :reply
      Tweet.joins(:replys).where(replys: { user_id: }).order(created_at: :desc).page(page).eager_load(:user)
    else
      Tweet.where(user_id:).order(created_at: :desc).page(page).eager_load(:user)
    end
  end
end

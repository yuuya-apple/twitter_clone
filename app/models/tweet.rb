# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :replys, dependent: :destroy
  has_many :retweets, dependent: :destroy

  def self.profile_tweets(tab, user_id, page)
    case tab
    when :favorite
      Tweet.joins(:favorites).where(favorites: { user_id: }).order(created_at: :desc).page(page)
           .eager_load(:user).includes(user: { icon_image_attachment: :blob })
    when :retweet
      Tweet.joins(:retweets).where(retweets: { user_id: }).order(created_at: :desc).page(page)
           .eager_load(:user).includes(user: { icon_image_attachment: :blob })
    when :reply
      Tweet.joins(:replys).where(replys: { user_id: }).order(created_at: :desc).page(page)
           .eager_load(:user).includes(user: { icon_image_attachment: :blob })
    else
      Tweet.where(user_id:).order(created_at: :desc).page(page)
           .eager_load(:user).includes(user: { icon_image_attachment: :blob })
    end
  end
end

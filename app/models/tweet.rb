# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :retweets, dependent: :destroy

  has_one_attached :image

  def self.profile_tweets(tab, user_id, page)
    resources = case tab
                when :favorite
                  Tweet.joins(:favorites).where(favorites: { user_id: }).order(created_at: :desc).page(page)
                when :retweet
                  Tweet.joins(:retweets).where(retweets: { user_id: }).order(created_at: :desc).page(page)

                when :comment
                  Tweet.joins(:comments).where(comments: { user_id: }).order(created_at: :desc).page(page)

                else
                  Tweet.where(user_id:).order(created_at: :desc).page(page)
                end
    resources.includes(image_attachment: :blob).eager_load(:user).includes(user: { icon_image_attachment: :blob })
             .eager_load(:favorites).eager_load(:retweets)
  end
end

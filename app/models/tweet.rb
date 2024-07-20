# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :book_marks, dependent: :destroy

  has_one_attached :image

  validates :content, length: { maximum: 140 }

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

  def retweet_by?(user_id)
    retweets.any? { |f| f.user_id == user_id }
  end

  def favorite_by?(user_id)
    favorites.any? { |f| f.user_id == user_id }
  end

  def book_mark_by?(user_id)
    book_marks.any? { |f| f.user_id == user_id }
  end
end

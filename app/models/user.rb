# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

  validates :tell_number, presence: true
  validates :date_of_birth, presence: true
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  has_one_attached :icon_image
  has_one_attached :header_image

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :book_marks, dependent: :destroy

  has_many :follows, class_name: 'Follow', foreign_key: 'follow_by', dependent: :destroy, inverse_of: :follow_to
  has_many :followers, class_name: 'Follow', foreign_key: 'follow_to', dependent: :destroy, inverse_of: :follow_by
  has_many :send_messages, class_name: 'Message', foreign_key: 'send_by', dependent: :destroy, inverse_of: :send_to
  has_many :receive_messages, class_name: 'Message', foreign_key: 'send_to', dependent: :destroy,
                              inverse_of: :send_by
  has_many :notifications, class_name: 'Notification', foreign_key: 'notifi_to', dependent: :destroy,
                           inverse_of: :notifi_by

  def followed_by?(user_id)
    followers.any? { |f| f.follow_by_id == user_id }
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email

      user.password = Devise.friendly_token[0, 20]
      user.display_name = auth.info.name
      user.tell_number = '00000000000'
      user.date_of_birth = '1997-01-01'

      if user.persisted? || auth.provider == 'github'
        user.skip_confirmation! if auth.provider == 'github'
        user.save
      end
    end
  end
end

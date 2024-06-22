# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

  validates :tell_number, presence: true
  validates :date_of_birth, presence: true
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  has_many :tweets, dependent: :destroy

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

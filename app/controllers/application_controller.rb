# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return if user_signed_in?

    redirect_to :new_user_registration
  end

  def create_notification(entity)
    return if entity.destroyed?

    notification = entity.notifications.new
    notification.notifi_by_id = current_user.id
    notification.notifi_to_id = entity.tweet.user.id
    notification.save
  end
end

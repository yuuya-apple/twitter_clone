# frozen_string_literal: true

module Notify
  extend ActiveSupport::Concern

  def create_notification(entity)
    return if entity.destroyed?

    notification = entity.notifications.new
    notification.notifi_by_id = current_user.id
    notification.notifi_to_id = entity.tweet.user.id
    notification.save
  end
end

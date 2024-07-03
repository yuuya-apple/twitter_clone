# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
                                 .includes(notificationable: { user: { icon_image_attachment: :blob }, tweet: {} })
  end
end

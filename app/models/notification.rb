# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :notificationable, polymorphic: true
  belongs_to :notifi_to, class_name: 'User'
  belongs_to :notifi_by, class_name: 'User'
end

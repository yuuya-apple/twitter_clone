# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :send_to, class_name: 'User'
  belongs_to :send_by, class_name: 'User'
end

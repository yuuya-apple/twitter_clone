# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follow_to, class_name: 'User'
  belongs_to :follow_by, class_name: 'User'
end

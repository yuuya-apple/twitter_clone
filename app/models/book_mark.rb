# frozen_string_literal: true

class BookMark < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end

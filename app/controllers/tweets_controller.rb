# frozen_string_literal: true

class TweetsController < ApplicationController
  skip_before_action :require_login
  def index
    @tweets = Tweet.all.page(params[:page]).order(created_at: :desc).eager_load(:user)
  end
end

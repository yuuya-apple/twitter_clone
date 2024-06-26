# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    id = params[:id]
    id ||= params[:user_id]
    @user = User.find(id)
    @tweets = Tweet.profile_tweets(params[:tab]&.to_sym, @user.id, params[:page])
  end
end

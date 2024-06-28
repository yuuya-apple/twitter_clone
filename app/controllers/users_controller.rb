# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :current_user?, only: %i[edit]

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.profile_tweets(params[:tab]&.to_sym, @user.id, params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to(user)
  end

  private

  def current_user?
    redirect_to request.referer if current_user.id != params[:id].to_i
  end

  def user_params
    params.require(:user).permit(User.column_names.map(&:to_sym), :icon_image, :header_image)
  end
end

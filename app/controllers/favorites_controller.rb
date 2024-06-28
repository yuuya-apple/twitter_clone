# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    favorite = Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if favorite.present?
      favorite.destroy
    else
      Favorite.new(user_id: current_user.id, tweet_id: params[:tweet_id]).save
    end
    redirect_to request.referer
  end
end

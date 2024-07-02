# frozen_string_literal: true

class FavoritesController < ApplicationController
  after_action -> { create_notification(@favorite) }, only: %i[create]

  def create
    @favorite = current_user.favorites.find_or_initialize_by(tweet_id: params[:tweet_id])
    if @favorite.new_record?
      @favorite.save
    else
      @favorite.destroy
    end
    redirect_to request.referer
  end
end

# frozen_string_literal: true

class RetweetsController < ApplicationController
  def create
    retweet = Retweet.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if retweet.present?
      retweet.destroy
    else
      Retweet.new(user_id: current_user.id, tweet_id: params[:tweet_id]).save
    end
    redirect_to request.referer
  end
end

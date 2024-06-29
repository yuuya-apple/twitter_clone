# frozen_string_literal: true

class RetweetsController < ApplicationController
  def create
    retweet = current_user.retweets.find_or_initialize_by(tweet_id: params[:tweet_id])
    if retweet.new_record?
      retweet.save
    else
      retweet.destroy
    end
    redirect_to request.referer
  end
end

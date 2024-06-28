# frozen_string_literal: true

class TweetsController < ApplicationController
  skip_before_action :require_login

  def index
    @tweets = Tweet.all.page(params[:page]).order(created_at: :desc).includes(image_attachment: :blob)
                   .eager_load(:user).includes(user: { icon_image_attachment: :blob })
  end

  def create
    current_user.tweets.new(tweet_params).save
    redirect_to request.referer
  end

  def update
    @tweet = Tweet.find(params[:id])

    request_params = tweet_params

    if request_params[:comments]
      comment = @tweet.comments.new(request_params[:comments])
      comment.user_id = current_user.id
      comment.save
    else
      @tweet.update(request_params)
    end

    redirect_to request.referer
  end

  def show
    @tweet = Tweet.includes(image_attachment: :blob).eager_load(:user).includes(user: { icon_image_attachment: :blob })
                  .find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(Tweet.column_names.map(&:to_sym), :image, comments: [:content])
  end
end

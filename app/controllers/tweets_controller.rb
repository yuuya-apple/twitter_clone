# frozen_string_literal: true

class TweetsController < ApplicationController
  skip_before_action :require_login

  def index
    @tweets = Tweet.all.page(params[:page]).order(created_at: :desc).includes(image_attachment: :blob)
                   .eager_load(:user).includes(user: { icon_image_attachment: :blob })
                   .eager_load(:favorites).eager_load(:retweets).eager_load(:book_marks)
  end

  def create
    current_user.tweets.create(tweet_params)
    redirect_to request.referer
  end

  def update
    @tweet = Tweet.find(params[:id])

    @tweet.update(tweet_params)

    redirect_to request.referer
  end

  def show
    @tweet = Tweet.includes(image_attachment: :blob)
                  .includes(comments: { user: { icon_image_attachment: :blob } })
                  .eager_load(user: { icon_image_attachment: :blob })
                  .eager_load(:favorites)
                  .eager_load(:retweets)
                  .eager_load(:book_marks)
                  .find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(Tweet.column_names.map(&:to_sym), :image)
  end
end

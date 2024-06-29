# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])

    return  redirect_to request.referer if tweet.nil?

    comment = tweet.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save

    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comments).permit(:content)
  end
end

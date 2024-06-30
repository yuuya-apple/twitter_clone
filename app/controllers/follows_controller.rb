# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = current_user.follows.find_or_initialize_by(follow_to_id: params[:follow_to])

    if follow.new_record?
      follow.save
    else
      follow.destroy
    end
    redirect_to request.referer
  end
end

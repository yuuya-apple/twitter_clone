# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @users = current_user.follows.includes(follow_by: { icon_image_attachment: :blob }).map(&:follow_to)
    return if @users.blank?

    return unless params[:user_id]

    @user = User.find(params[:user_id])
    @messages = Message.where(send_to_id: current_user.id,
                              send_by_id: @user.id).or(Message.where(
                                                         send_to_id: @user.id, send_by_id: current_user.id
                                                       )).order(created_at: :desc)
  end

  def create
    message = Message.new(message_params)
    message.send_by_id = current_user.id
    message.send_to_id = params[:user_id]
    message.save
    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(Message.column_names.map(&:to_sym))
  end
end

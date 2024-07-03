# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return if user_signed_in?

    redirect_to :new_user_registration
  end
end

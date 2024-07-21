# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /user' do
    it 'サインアップ成功' do
      user_params = FactoryBot.attributes_for(:user)

      post user_registration_path, params: { user: user_params }

      expect(response).to have_http_status '303'
    end

    it 'サインアップ失敗' do
      user_params = FactoryBot.attributes_for(:user, password_confirmation: 'pass')

      post user_registration_path, params: { user: user_params }

      expect(response).to have_http_status '422'
    end
  end

  describe 'POST /sign_in' do
    before do
      user = FactoryBot.create(:user)
      user.confirm
    end

    it 'ログイン成功' do
      user_params = FactoryBot.attributes_for(:user, :sign_in)
      post user_session_path, params: { user: user_params }

      expect(response).to have_http_status '303'
    end

    it 'ログイン失敗' do
      user_params = FactoryBot.attributes_for(:user, password: 'pass')
      post user_session_path, params: { user: user_params }

      expect(response).to have_http_status '422'
    end
  end
end

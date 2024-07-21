# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'POST /tweets' do
    before do
      user = FactoryBot.create(:user)
      user.confirm
      sign_in user
    end

    it '登録成功' do
      tweet_params = FactoryBot.attributes_for(:tweet)

      post tweets_path, params: { tweet: tweet_params }, headers: { 'HTTP_REFERER' => root_path }

      expect(response).to have_http_status '302'
    end

    it '登録失敗' do
      tweet_params = FactoryBot.attributes_for(:tweet, content: nil)

      expect do
        post tweets_path, params: { tweet: tweet_params },
                          headers: { 'HTTP_REFERER' => root_path }
      end.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end

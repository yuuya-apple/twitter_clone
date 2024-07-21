# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ツイート' do
    let(:user) { FactoryBot.create(:user) }

    before do
      user.confirm
      sign_in user
      visit root_path
    end

    it '成功' do
      expect do
        fill_in 'tweet[content]', with: 'test_tweet'
        click_button 'ツイートする'
      end.to change(user.tweets, :count).by(1)
    end

    it '失敗' do
      expect do
        fill_in 'tweet[content]',
                with: 'a' * 141
        click_button 'ツイートする'
      end.to change(user.tweets, :count).by(0)
    end
  end
end

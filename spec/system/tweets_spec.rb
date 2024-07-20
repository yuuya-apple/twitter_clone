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
                with: long_content
        click_button 'ツイートする'
      end.to change(user.tweets, :count).by(0)
    end
  end

  def long_content
    '111111111122222222223333333334444444444555555555566666666667777777777888888888899999999990000000000
    11111111112222222222333333333344444444445'
  end
end

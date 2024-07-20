# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'サインアップ' do
    before do
      visit new_user_registration_path
    end

    it '成功' do
      set_signup_params
      click_button 'Sign up'
      expect(page).not_to have_content "can't be blank"
    end

    it '失敗' do
      set_signup_params
      fill_in 'Email', with: nil
      click_button 'Sign up'
      expect(page).to have_content "can't be blank"
    end
  end

  describe 'ログイン' do
    before do
      visit new_user_session_path
    end

    it '成功' do
      set_login_params
      click_button 'Log in'
      expect(page).to have_current_path root_path, ignore_query: true
    end

    it '失敗' do
      set_login_params
      fill_in 'Password', with: nil
      click_button 'Log in'
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end
  end

  private

  def set_signup_params
    user = FactoryBot.build(:user)
    fill_in 'Email', with: user.email
    fill_in 'Tell number', with: user.tell_number
    fill_in 'Date of birth', with: user.date_of_birth
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
  end

  def set_login_params
    user = FactoryBot.create(:user)
    user.confirm
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end
end

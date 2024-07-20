# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'バリデーションチェック date_of_birth,tell_number,password' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'バリデーション date_of_birth' do
    user = FactoryBot.build(:user, date_of_birth: nil)
    user.valid?
    expect(user.errors[:date_of_birth]).to include("can't be blank")
  end

  it 'バリデーション tell_number' do
    user = FactoryBot.build(:user, tell_number: nil)
    user.valid?
    expect(user.errors[:tell_number]).to include("can't be blank")
  end

  it 'バリデーション password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it '重複排他 email' do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user, email: 'test@test.com')

    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end

# frozen_string_literal: true

class AddOmniauthUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users, bulk: true do |t|
      t.string :uid
      t.string :provider, null: false, default: ''
      t.index %i[uid provider], unique: true
    end
  end

  def down
    change_table :users, bulk: true do |t|
      t.remove :uid
      t.remove :provider, null: false, default: ''
      t.remove_index %i[uid provider], unique: true
    end
  end
end

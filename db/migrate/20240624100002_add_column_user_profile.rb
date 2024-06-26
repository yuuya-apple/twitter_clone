# frozen_string_literal: true

class AddColumnUserProfile < ActiveRecord::Migration[7.0]
  def up
    change_table :users, bulk: true do |t|
      t.string :introduction, default: '', null: false
      t.string :location, default: '', null: false
      t.string :own_site, default: '', null: false
    end
  end

  def down
    change_table :users, bulk: true do |t|
      t.remove :introduction
      t.remove :location
      t.remove :own_site
    end
  end
end

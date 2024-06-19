# frozen_string_literal: true

class AddColumnUserTellNumBod < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.integer :tell_number, null: false
      t.date :date_of_birth, null: false
    end
  end
end

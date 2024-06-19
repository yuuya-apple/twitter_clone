# frozen_string_literal: true

class AddColumnUserDispName < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_name, :string, default: '', null: false
  end
end

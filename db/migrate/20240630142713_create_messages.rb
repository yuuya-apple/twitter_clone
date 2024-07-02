# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def up
    create_table :messages do |t|
      t.references :send_to, foreign_key: { to_table: :users }
      t.references :send_by, foreign_key: { to_table: :users }
      t.string :content, default: '', null: false
      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end

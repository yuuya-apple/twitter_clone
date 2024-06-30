# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def up
    create_table :follows do |t|
      t.references :follow_by, foreign_key: { to_table: :users }
      t.references :follow_to, foreign_key: { to_table: :users }
      t.timestamps
    end
  end

  def down
    drop_table :follows
  end
end

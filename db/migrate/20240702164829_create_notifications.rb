# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def up
    create_table :notifications do |t|
      t.references :notifi_to, foreign_key: { to_table: :users }
      t.references :notifi_by, foreign_key: { to_table: :users }
      t.references :notificationable, polymorphic: true
      t.timestamps
    end
  end

  def down
    drop_table :notifications
  end
end

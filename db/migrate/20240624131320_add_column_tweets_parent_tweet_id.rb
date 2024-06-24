# frozen_string_literal: true

class AddColumnTweetsParentTweetId < ActiveRecord::Migration[7.0]
  def up
    change_table :tweets, bulk: true do |t|
      t.references :reply_to, foreign_key: { to_table: :tweets }
    end
  end

  def down
    remove_foreign_key :tweets, :tweets
    remove_reference :tweets, :reply_to, index: true
  end
end

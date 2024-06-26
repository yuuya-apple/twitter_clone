# frozen_string_literal: true

class CreateRetweets < ActiveRecord::Migration[7.0]
  def up
    create_table :retweets do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :retweets
  end
end

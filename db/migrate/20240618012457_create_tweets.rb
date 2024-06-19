# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.string :content, default: '', null: false
      t.timestamps
    end
  end
end

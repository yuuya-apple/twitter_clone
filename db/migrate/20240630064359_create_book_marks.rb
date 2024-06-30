# frozen_string_literal: true

class CreateBookMarks < ActiveRecord::Migration[7.0]
  def up
    create_table :book_marks do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :book_marks
  end
end

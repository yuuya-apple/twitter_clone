class CreateComments < ActiveRecord::Migration[7.0]
  def up
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.string :content, default: '', null: false
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end

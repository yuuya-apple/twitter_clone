# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(
  email: 'hoge@hoge.com',
  tell_number: 11_111,
  date_of_birth: '2024-06-23',
  display_name: 'ほげ太郎',
  password: 'password'
)

30.times do |n|
  Tweet.create!(
    user_id: user.id,
    content: "#{n}回目。これは本文になります。テスト用の本文です。意味のない本文です。文字数稼ぎの本文です。なかなか文字数稼げてない本文です。これは本文になります。テスト用の本文です。意味のない本文です"
  )
end

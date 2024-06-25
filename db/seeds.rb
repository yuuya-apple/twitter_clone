# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_tweet(user, num)
  Tweet.create!(
    user_id: user.id,
    content: "#{num}回目これは本文になります。テスト用の本文です。意味のない本文です。文字数稼ぎの本文です。なかなか文字数稼げてない本文です。これは本文になります。テスト用の本文です。意味のない本文です"
  )
end

user1 = User.find_by(email: 'hoge@hoge.com')
user1.destroy if user1.present?
user2 = User.find_by(email: 'hogehoge@hoge.com')
user2.destroy if user2.present?
user3 = User.find_by(email: 'hogehogehoge@hoge.com')
user3.destroy if user3.present?

user1 = User.create!(
  email: 'hoge@hoge.com',
  tell_number: 11_111,
  date_of_birth: '2024-06-23',
  display_name: 'ほげ太郎',
  password: 'password',
  introduction: '自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。',
  location: '東京都葛飾区亀有',
  own_site: 'https://qiita.com/yuuya-apple'
)
user1.icon_image.attach(io: File.open(Rails.root.join('app/assets/images/icon_business_man02.png')),
                        filename: 'icon_business_man02.png')
user1.header_image.attach(io: File.open(Rails.root.join('app/assets/images/bg_himawari_hatake.jpg')),
                          filename: 'bg_himawari_hatake.jpg')
user1.save

user2 = User.create!(
  email: 'hogehoge@hoge.com',
  tell_number: 11_111,
  date_of_birth: '2024-06-23',
  display_name: 'ほげ次郎',
  password: 'password',
  introduction: '自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。',
  own_site: 'https://qiita.com/yuuya-apple'
)
user2.icon_image.attach(io: File.open(Rails.root.join('app/assets/images/icon_business_man06.png')),
                        filename: 'icon_business_man06.png')
user2.save

user3 = User.create!(
  email: 'hogehogehoge@hoge.com',
  tell_number: 11_111,
  date_of_birth: '2024-06-23',
  display_name: 'ほげ三郎',
  password: 'password',
  introduction: '自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。自己紹介です。'
)
user3.icon_image.attach(io: File.open(Rails.root.join('app/assets/images/icon_business_man07.png')),
                        filename: 'icon_business_man07.png')
user3.save

30.times do |n|
  create_tweet(user1, n)
  create_tweet(user2, n)
  create_tweet(user3, n)
end

user2.tweets.limit(15).each do |t|
  Favorite.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
  Reply.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
  Retweet.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
end

user3.tweets.limit(15).each do |t|
  Favorite.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
  Reply.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
  Retweet.create!(
    user_id: user1.id,
    tweet_id: t.id
  )
end

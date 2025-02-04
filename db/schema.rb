# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_07_02_164829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "book_marks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_book_marks_on_tweet_id"
    t.index ["user_id"], name: "index_book_marks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.string "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_comments_on_tweet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_favorites_on_tweet_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "follow_by_id"
    t.bigint "follow_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_by_id"], name: "index_follows_on_follow_by_id"
    t.index ["follow_to_id"], name: "index_follows_on_follow_to_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "send_to_id"
    t.bigint "send_by_id"
    t.string "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["send_by_id"], name: "index_messages_on_send_by_id"
    t.index ["send_to_id"], name: "index_messages_on_send_to_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "notifi_to_id"
    t.bigint "notifi_by_id"
    t.string "notificationable_type"
    t.bigint "notificationable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notifi_by_id"], name: "index_notifications_on_notifi_by_id"
    t.index ["notifi_to_id"], name: "index_notifications_on_notifi_to_id"
    t.index ["notificationable_type", "notificationable_id"], name: "index_notifications_on_notificationable"
  end

  create_table "retweets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_retweets_on_tweet_id"
    t.index ["user_id"], name: "index_retweets_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tell_number", null: false
    t.date "date_of_birth", null: false
    t.string "display_name", default: "", null: false
    t.string "uid"
    t.string "provider", default: "", null: false
    t.string "introduction", default: "", null: false
    t.string "location", default: "", null: false
    t.string "own_site", default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_marks", "tweets"
  add_foreign_key "book_marks", "users"
  add_foreign_key "comments", "tweets"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "tweets"
  add_foreign_key "favorites", "users"
  add_foreign_key "follows", "users", column: "follow_by_id"
  add_foreign_key "follows", "users", column: "follow_to_id"
  add_foreign_key "messages", "users", column: "send_by_id"
  add_foreign_key "messages", "users", column: "send_to_id"
  add_foreign_key "notifications", "users", column: "notifi_by_id"
  add_foreign_key "notifications", "users", column: "notifi_to_id"
  add_foreign_key "retweets", "tweets"
  add_foreign_key "retweets", "users"
  add_foreign_key "tweets", "users"
end

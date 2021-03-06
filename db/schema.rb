# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_11_191740) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id"
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "requester_id"
    t.bigint "receiver_id"
    t.string "status", default: "Pending"
    t.index ["receiver_id"], name: "index_friends_on_receiver_id"
    t.index ["requester_id", "receiver_id"], name: "index_friends_on_requester_id_and_receiver_id", unique: true
    t.index ["requester_id"], name: "index_friends_on_requester_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at"
    t.integer "likes", default: 0
    t.integer "original_post_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "full_name"
    t.string "email"
    t.string "mobile"
    t.string "address"
    t.string "url"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
  add_foreign_key "friends", "users", column: "receiver_id"
  add_foreign_key "friends", "users", column: "requester_id"
  add_foreign_key "posts", "users"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170211170304) do

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.string   "link"
    t.integer  "state"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["image_id"], name: "index_games_on_image_id"

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.string   "hash_id"
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_subscriptions", force: :cascade do |t|
    t.string   "email",      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 128, default: "", null: false
    t.text     "description"
    t.date     "birthday"
    t.string   "favorite_game",          limit: 255
    t.string   "favorite_type",          limit: 255
    t.integer  "image_id"
    t.integer  "role",                               default: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "video_categories", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.integer  "category_type",              null: false
    t.string   "playlist_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.string   "link"
    t.integer  "image_id"
    t.integer  "video_category_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["image_id"], name: "index_videos_on_image_id"
  add_index "videos", ["video_category_id"], name: "index_videos_on_video_category_id"

end

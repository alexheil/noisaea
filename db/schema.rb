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

ActiveRecord::Schema.define(version: 20151213044338) do

  create_table "artist_micropost_comment_votes", force: true do |t|
    t.integer  "artist_micropost_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_micropost_comment_votes", ["artist_id", "artist_micropost_comment_id"], name: "index_artist_id_a_comment_votes", unique: true
  add_index "artist_micropost_comment_votes", ["artist_id"], name: "index_artist_micropost_comment_votes_on_artist_id"
  add_index "artist_micropost_comment_votes", ["artist_micropost_comment_id"], name: "index_a_comment_id_a_comment_votes"
  add_index "artist_micropost_comment_votes", ["fan_id", "artist_micropost_comment_id"], name: "index_fan_id_a_comment_votes", unique: true
  add_index "artist_micropost_comment_votes", ["fan_id"], name: "index_artist_micropost_comment_votes_on_fan_id"
  add_index "artist_micropost_comment_votes", ["producer_id", "artist_micropost_comment_id"], name: "index_producer_id_a_comment_votes", unique: true
  add_index "artist_micropost_comment_votes", ["producer_id"], name: "index_artist_micropost_comment_votes_on_producer_id"
  add_index "artist_micropost_comment_votes", ["record_label_id", "artist_micropost_comment_id"], name: "index_record_label_id_a_comment_votes", unique: true
  add_index "artist_micropost_comment_votes", ["record_label_id"], name: "index_artist_micropost_comment_votes_on_record_label_id"
  add_index "artist_micropost_comment_votes", ["venue_id", "artist_micropost_comment_id"], name: "index_venue_id_a_comment_votes", unique: true
  add_index "artist_micropost_comment_votes", ["venue_id"], name: "index_artist_micropost_comment_votes_on_venue_id"

  create_table "artist_micropost_comments", force: true do |t|
    t.integer  "artist_micropost_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_micropost_comments", ["artist_id"], name: "index_artist_micropost_comments_on_artist_id"
  add_index "artist_micropost_comments", ["artist_micropost_id"], name: "index_artist_micropost_comments_on_artist_micropost_id"
  add_index "artist_micropost_comments", ["fan_id"], name: "index_artist_micropost_comments_on_fan_id"
  add_index "artist_micropost_comments", ["producer_id"], name: "index_artist_micropost_comments_on_producer_id"
  add_index "artist_micropost_comments", ["record_label_id"], name: "index_artist_micropost_comments_on_record_label_id"
  add_index "artist_micropost_comments", ["venue_id"], name: "index_artist_micropost_comments_on_venue_id"

  create_table "artist_micropost_votes", force: true do |t|
    t.integer  "artist_micropost_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_micropost_votes", ["artist_id", "artist_micropost_id"], name: "index_artist_id_micropost_votes", unique: true
  add_index "artist_micropost_votes", ["artist_id"], name: "index_artist_micropost_votes_on_artist_id"
  add_index "artist_micropost_votes", ["artist_micropost_id"], name: "index_artist_micropost_votes_on_artist_micropost_id"
  add_index "artist_micropost_votes", ["fan_id", "artist_micropost_id"], name: "index_fan_id_micropost_votes", unique: true
  add_index "artist_micropost_votes", ["fan_id"], name: "index_artist_micropost_votes_on_fan_id"
  add_index "artist_micropost_votes", ["producer_id", "artist_micropost_id"], name: "index_producer_id_micropost_votes", unique: true
  add_index "artist_micropost_votes", ["producer_id"], name: "index_artist_micropost_votes_on_producer_id"
  add_index "artist_micropost_votes", ["record_label_id", "artist_micropost_id"], name: "index_record_label_id_micropost_votes", unique: true
  add_index "artist_micropost_votes", ["record_label_id"], name: "index_artist_micropost_votes_on_record_label_id"
  add_index "artist_micropost_votes", ["venue_id", "artist_micropost_id"], name: "index_venue_id_micropost_votes", unique: true
  add_index "artist_micropost_votes", ["venue_id"], name: "index_artist_micropost_votes_on_venue_id"

  create_table "artist_microposts", force: true do |t|
    t.integer  "artist_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_url",   default: ""
    t.string   "photo_url",  default: ""
  end

  add_index "artist_microposts", ["artist_id"], name: "index_artist_microposts_on_artist_id"

  create_table "artist_profiles", force: true do |t|
    t.integer  "artist_id"
    t.text     "biography",       default: ""
    t.string   "genre",           default: ""
    t.string   "location",        default: ""
    t.string   "members",         default: ""
    t.string   "facebook_url",    default: ""
    t.string   "twitter_url",     default: ""
    t.string   "youtube_url",     default: ""
    t.string   "itunes_url",      default: ""
    t.string   "amazon_url",      default: ""
    t.string   "google_play_url", default: ""
    t.string   "ticketfly_url",   default: ""
    t.string   "record_label",    default: ""
    t.string   "cover_image",     default: ""
    t.string   "profile_image",   default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website",         default: ""
  end

  add_index "artist_profiles", ["artist_id"], name: "index_artist_profiles_on_artist_id", unique: true

  create_table "artist_relationships", force: true do |t|
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_relationships", ["artist_id"], name: "index_artist_relationships_on_artist_id"
  add_index "artist_relationships", ["fan_id", "artist_id"], name: "index_artist_relationships_on_fan_id_and_artist_id", unique: true
  add_index "artist_relationships", ["fan_id"], name: "index_artist_relationships_on_fan_id"

  create_table "artist_shows", force: true do |t|
    t.integer  "artist_id"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.string   "venue"
    t.string   "location"
    t.text     "description"
    t.string   "ticket_url"
    t.string   "flyer_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_shows", ["artist_id"], name: "index_artist_shows_on_artist_id"

  create_table "artists", force: true do |t|
    t.string   "artist_name",            default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "artists", ["artist_name"], name: "index_artists_on_artist_name"
  add_index "artists", ["confirmation_token"], name: "index_artists_on_confirmation_token", unique: true
  add_index "artists", ["email"], name: "index_artists_on_email", unique: true
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true
  add_index "artists", ["unlock_token"], name: "index_artists_on_unlock_token", unique: true
  add_index "artists", ["username"], name: "index_artists_on_username", unique: true

  create_table "buffaloes", force: true do |t|
    t.string   "buffalo_name",           default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "wow_auth",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buffaloes", ["buffalo_name"], name: "index_buffaloes_on_buffalo_name", unique: true
  add_index "buffaloes", ["confirmation_token"], name: "index_buffaloes_on_confirmation_token", unique: true
  add_index "buffaloes", ["email"], name: "index_buffaloes_on_email", unique: true
  add_index "buffaloes", ["reset_password_token"], name: "index_buffaloes_on_reset_password_token", unique: true
  add_index "buffaloes", ["slug"], name: "index_buffaloes_on_slug", unique: true
  add_index "buffaloes", ["unlock_token"], name: "index_buffaloes_on_unlock_token", unique: true
  add_index "buffaloes", ["username"], name: "index_buffaloes_on_username", unique: true
  add_index "buffaloes", ["wow_auth"], name: "index_buffaloes_on_wow_auth", unique: true

  create_table "developer_comment_votes", force: true do |t|
    t.integer  "developer_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developer_comment_votes", ["artist_id", "developer_comment_id"], name: "index_artist_id_dev_comment_votes", unique: true
  add_index "developer_comment_votes", ["artist_id"], name: "index_developer_comment_votes_on_artist_id"
  add_index "developer_comment_votes", ["developer_comment_id"], name: "index_dev_comment_id_dev_comment_votes"
  add_index "developer_comment_votes", ["fan_id", "developer_comment_id"], name: "index_fan_id_dev_comment_votes", unique: true
  add_index "developer_comment_votes", ["fan_id"], name: "index_developer_comment_votes_on_fan_id"
  add_index "developer_comment_votes", ["producer_id", "developer_comment_id"], name: "index_producer_id_dev_comment_votes", unique: true
  add_index "developer_comment_votes", ["producer_id"], name: "index_developer_comment_votes_on_producer_id"
  add_index "developer_comment_votes", ["record_label_id", "developer_comment_id"], name: "index_record_label_id_dev_comment_votes", unique: true
  add_index "developer_comment_votes", ["record_label_id"], name: "index_developer_comment_votes_on_record_label_id"
  add_index "developer_comment_votes", ["venue_id", "developer_comment_id"], name: "index_venue_id_dev_comment_votes", unique: true
  add_index "developer_comment_votes", ["venue_id"], name: "index_developer_comment_votes_on_venue_id"

  create_table "developer_comments", force: true do |t|
    t.integer  "developer_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developer_comments", ["artist_id"], name: "index_developer_comments_on_artist_id"
  add_index "developer_comments", ["developer_id"], name: "index_developer_comments_on_developer_id"
  add_index "developer_comments", ["fan_id"], name: "index_developer_comments_on_fan_id"
  add_index "developer_comments", ["producer_id"], name: "index_developer_comments_on_producer_id"
  add_index "developer_comments", ["record_label_id"], name: "index_developer_comments_on_record_label_id"
  add_index "developer_comments", ["venue_id"], name: "index_developer_comments_on_venue_id"

  create_table "developers", force: true do |t|
    t.integer  "buffalo_id"
    t.string   "title"
    t.string   "category"
    t.string   "slug"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developers", ["buffalo_id"], name: "index_developers_on_buffalo_id"
  add_index "developers", ["slug"], name: "index_developers_on_slug"

  create_table "fan_profiles", force: true do |t|
    t.integer  "fan_id"
    t.text     "biography",     default: ""
    t.string   "location",      default: ""
    t.string   "website",       default: ""
    t.string   "cover_image",   default: ""
    t.string   "profile_image", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fan_profiles", ["fan_id"], name: "index_fan_profiles_on_fan_id", unique: true

  create_table "fans", force: true do |t|
    t.string   "fan_name",               default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "fans", ["confirmation_token"], name: "index_fans_on_confirmation_token", unique: true
  add_index "fans", ["email"], name: "index_fans_on_email", unique: true
  add_index "fans", ["reset_password_token"], name: "index_fans_on_reset_password_token", unique: true
  add_index "fans", ["slug"], name: "index_fans_on_slug", unique: true
  add_index "fans", ["unlock_token"], name: "index_fans_on_unlock_token", unique: true

  create_table "post_comment_votes", force: true do |t|
    t.integer  "post_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comment_votes", ["artist_id", "post_comment_id"], name: "index_artist_id_post_comment_votes", unique: true
  add_index "post_comment_votes", ["artist_id"], name: "index_post_comment_votes_on_artist_id"
  add_index "post_comment_votes", ["fan_id", "post_comment_id"], name: "index_fan_id_post_comment_votes", unique: true
  add_index "post_comment_votes", ["fan_id"], name: "index_post_comment_votes_on_fan_id"
  add_index "post_comment_votes", ["post_comment_id"], name: "index_post_comment_id_post_comment_votes"
  add_index "post_comment_votes", ["producer_id", "post_comment_id"], name: "index_producer_id_post_comment_votes", unique: true
  add_index "post_comment_votes", ["producer_id"], name: "index_post_comment_votes_on_producer_id"
  add_index "post_comment_votes", ["record_label_id", "post_comment_id"], name: "index_record_label_id_post_comment_votes", unique: true
  add_index "post_comment_votes", ["record_label_id"], name: "index_post_comment_votes_on_record_label_id"
  add_index "post_comment_votes", ["venue_id", "post_comment_id"], name: "index_venue_id_post_comment_votes", unique: true
  add_index "post_comment_votes", ["venue_id"], name: "index_post_comment_votes_on_venue_id"

  create_table "post_comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comments", ["artist_id"], name: "index_post_comments_on_artist_id"
  add_index "post_comments", ["fan_id"], name: "index_post_comments_on_fan_id"
  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id"
  add_index "post_comments", ["producer_id"], name: "index_post_comments_on_producer_id"
  add_index "post_comments", ["record_label_id"], name: "index_post_comments_on_record_label_id"
  add_index "post_comments", ["venue_id"], name: "index_post_comments_on_venue_id"

  create_table "posts", force: true do |t|
    t.integer  "buffalo_id"
    t.string   "title"
    t.string   "category"
    t.string   "slug"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["buffalo_id"], name: "index_posts_on_buffalo_id"
  add_index "posts", ["slug"], name: "index_posts_on_slug"

  create_table "producer_micropost_comment_votes", force: true do |t|
    t.integer  "producer_micropost_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producer_micropost_comment_votes", ["artist_id", "producer_micropost_comment_id"], name: "index_artist_id_p_comment_votes", unique: true
  add_index "producer_micropost_comment_votes", ["artist_id"], name: "index_producer_micropost_comment_votes_on_artist_id"
  add_index "producer_micropost_comment_votes", ["fan_id", "producer_micropost_comment_id"], name: "index_fan_id_p_comment_votes", unique: true
  add_index "producer_micropost_comment_votes", ["fan_id"], name: "index_producer_micropost_comment_votes_on_fan_id"
  add_index "producer_micropost_comment_votes", ["producer_id", "producer_micropost_comment_id"], name: "index_producer_id_p_comment_votes", unique: true
  add_index "producer_micropost_comment_votes", ["producer_id"], name: "index_producer_micropost_comment_votes_on_producer_id"
  add_index "producer_micropost_comment_votes", ["producer_micropost_comment_id"], name: "index_p_comment_id_p_comment_votes"
  add_index "producer_micropost_comment_votes", ["record_label_id", "producer_micropost_comment_id"], name: "index_record_label_id_p_comment_votes", unique: true
  add_index "producer_micropost_comment_votes", ["record_label_id"], name: "index_producer_micropost_comment_votes_on_record_label_id"
  add_index "producer_micropost_comment_votes", ["venue_id", "producer_micropost_comment_id"], name: "index_venue_id_p_comment_votes", unique: true
  add_index "producer_micropost_comment_votes", ["venue_id"], name: "index_producer_micropost_comment_votes_on_venue_id"

  create_table "producer_micropost_comments", force: true do |t|
    t.integer  "producer_micropost_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producer_micropost_comments", ["artist_id"], name: "index_producer_micropost_comments_on_artist_id"
  add_index "producer_micropost_comments", ["fan_id"], name: "index_producer_micropost_comments_on_fan_id"
  add_index "producer_micropost_comments", ["producer_id"], name: "index_producer_micropost_comments_on_producer_id"
  add_index "producer_micropost_comments", ["producer_micropost_id"], name: "index_producer_micropost_comments_on_producer_micropost_id"
  add_index "producer_micropost_comments", ["record_label_id"], name: "index_producer_micropost_comments_on_record_label_id"
  add_index "producer_micropost_comments", ["venue_id"], name: "index_producer_micropost_comments_on_venue_id"

  create_table "producer_micropost_votes", force: true do |t|
    t.integer  "producer_micropost_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producer_micropost_votes", ["artist_id", "producer_micropost_id"], name: "index_artist_id_p_micropost_votes", unique: true
  add_index "producer_micropost_votes", ["artist_id"], name: "index_producer_micropost_votes_on_artist_id"
  add_index "producer_micropost_votes", ["fan_id", "producer_micropost_id"], name: "index_fan_id_p_micropost_votes", unique: true
  add_index "producer_micropost_votes", ["fan_id"], name: "index_producer_micropost_votes_on_fan_id"
  add_index "producer_micropost_votes", ["producer_id", "producer_micropost_id"], name: "index_producer_id_p_micropost_votes", unique: true
  add_index "producer_micropost_votes", ["producer_id"], name: "index_producer_micropost_votes_on_producer_id"
  add_index "producer_micropost_votes", ["producer_micropost_id"], name: "index_producer_micropost_votes_on_producer_micropost_id"
  add_index "producer_micropost_votes", ["record_label_id", "producer_micropost_id"], name: "index_record_label_id_p_micropost_votes", unique: true
  add_index "producer_micropost_votes", ["record_label_id"], name: "index_producer_micropost_votes_on_record_label_id"
  add_index "producer_micropost_votes", ["venue_id", "producer_micropost_id"], name: "index_venue_id_p_micropost_votes", unique: true
  add_index "producer_micropost_votes", ["venue_id"], name: "index_producer_micropost_votes_on_venue_id"

  create_table "producer_microposts", force: true do |t|
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_url",    default: ""
    t.string   "photo_url",   default: ""
  end

  add_index "producer_microposts", ["producer_id"], name: "index_producer_microposts_on_producer_id"

  create_table "producer_profiles", force: true do |t|
    t.integer  "producer_id"
    t.text     "biography",     default: ""
    t.text     "artists",       default: ""
    t.string   "genre",         default: ""
    t.string   "location",      default: ""
    t.string   "founded",       default: ""
    t.string   "website",       default: ""
    t.string   "facebook_url",  default: ""
    t.string   "twitter_url",   default: ""
    t.string   "youtube_url",   default: ""
    t.string   "cover_image",   default: ""
    t.string   "profile_image", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producer_profiles", ["producer_id"], name: "index_producer_profiles_on_producer_id", unique: true

  create_table "producer_relationships", force: true do |t|
    t.integer  "fan_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producer_relationships", ["fan_id", "producer_id"], name: "index_producer_relationships_on_fan_id_and_producer_id", unique: true
  add_index "producer_relationships", ["fan_id"], name: "index_producer_relationships_on_fan_id"
  add_index "producer_relationships", ["producer_id"], name: "index_producer_relationships_on_producer_id"

  create_table "producers", force: true do |t|
    t.string   "producer_name",          default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "producers", ["confirmation_token"], name: "index_producers_on_confirmation_token", unique: true
  add_index "producers", ["email"], name: "index_producers_on_email", unique: true
  add_index "producers", ["producer_name"], name: "index_producers_on_producer_name"
  add_index "producers", ["reset_password_token"], name: "index_producers_on_reset_password_token", unique: true
  add_index "producers", ["slug"], name: "index_producers_on_slug", unique: true
  add_index "producers", ["unlock_token"], name: "index_producers_on_unlock_token", unique: true
  add_index "producers", ["username"], name: "index_producers_on_username", unique: true

  create_table "record_label_micropost_comment_votes", force: true do |t|
    t.integer  "record_label_micropost_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "record_label_micropost_comment_votes", ["artist_id", "record_label_micropost_comment_id"], name: "index_artist_id_rl_comment_votes", unique: true
  add_index "record_label_micropost_comment_votes", ["artist_id"], name: "index_record_label_micropost_comment_votes_on_artist_id"
  add_index "record_label_micropost_comment_votes", ["fan_id", "record_label_micropost_comment_id"], name: "index_fan_id_rl_comment_votes", unique: true
  add_index "record_label_micropost_comment_votes", ["fan_id"], name: "index_record_label_micropost_comment_votes_on_fan_id"
  add_index "record_label_micropost_comment_votes", ["producer_id", "record_label_micropost_comment_id"], name: "index_producer_id_rl_comment_votes", unique: true
  add_index "record_label_micropost_comment_votes", ["producer_id"], name: "index_record_label_micropost_comment_votes_on_producer_id"
  add_index "record_label_micropost_comment_votes", ["record_label_id", "record_label_micropost_comment_id"], name: "index_record_label_id_rl_comment_votes", unique: true
  add_index "record_label_micropost_comment_votes", ["record_label_id"], name: "index_record_label_micropost_comment_votes_on_record_label_id"
  add_index "record_label_micropost_comment_votes", ["record_label_micropost_comment_id"], name: "index_rl_comment_id_rl_comment_votes"
  add_index "record_label_micropost_comment_votes", ["venue_id", "record_label_micropost_comment_id"], name: "index_venue_id_rl_comment_votes", unique: true
  add_index "record_label_micropost_comment_votes", ["venue_id"], name: "index_record_label_micropost_comment_votes_on_venue_id"

  create_table "record_label_micropost_comments", force: true do |t|
    t.integer  "record_label_micropost_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "record_label_micropost_comments", ["artist_id"], name: "index_record_label_micropost_comments_on_artist_id"
  add_index "record_label_micropost_comments", ["fan_id"], name: "index_record_label_micropost_comments_on_fan_id"
  add_index "record_label_micropost_comments", ["producer_id"], name: "index_record_label_micropost_comments_on_producer_id"
  add_index "record_label_micropost_comments", ["record_label_id"], name: "index_record_label_micropost_comments_on_record_label_id"
  add_index "record_label_micropost_comments", ["record_label_micropost_id"], name: "index_record_label_micropost_id_for_comments"
  add_index "record_label_micropost_comments", ["venue_id"], name: "index_record_label_micropost_comments_on_venue_id"

  create_table "record_label_micropost_votes", force: true do |t|
    t.integer  "record_label_micropost_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "record_label_micropost_votes", ["artist_id", "record_label_micropost_id"], name: "index_artist_id_rl_micropost_votes", unique: true
  add_index "record_label_micropost_votes", ["artist_id"], name: "index_record_label_micropost_votes_on_artist_id"
  add_index "record_label_micropost_votes", ["fan_id", "record_label_micropost_id"], name: "index_fan_id_rl_micropost_votes", unique: true
  add_index "record_label_micropost_votes", ["fan_id"], name: "index_record_label_micropost_votes_on_fan_id"
  add_index "record_label_micropost_votes", ["producer_id", "record_label_micropost_id"], name: "index_producer_id_rl_micropost_votes", unique: true
  add_index "record_label_micropost_votes", ["producer_id"], name: "index_record_label_micropost_votes_on_producer_id"
  add_index "record_label_micropost_votes", ["record_label_id", "record_label_micropost_id"], name: "index_record_label_id_rl_micropost_votes", unique: true
  add_index "record_label_micropost_votes", ["record_label_id"], name: "index_record_label_micropost_votes_on_record_label_id"
  add_index "record_label_micropost_votes", ["record_label_micropost_id"], name: "index_record_label_micropost_id_rl_micropost_votes"
  add_index "record_label_micropost_votes", ["venue_id", "record_label_micropost_id"], name: "index_venue_id_rl_micropost_votes", unique: true
  add_index "record_label_micropost_votes", ["venue_id"], name: "index_record_label_micropost_votes_on_venue_id"

  create_table "record_label_microposts", force: true do |t|
    t.integer  "record_label_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_url",        default: ""
    t.string   "photo_url",       default: ""
  end

  add_index "record_label_microposts", ["record_label_id"], name: "index_record_label_microposts_on_record_label_id"

  create_table "record_label_profiles", force: true do |t|
    t.integer  "record_label_id"
    t.text     "biography",       default: ""
    t.text     "artists",         default: ""
    t.string   "genre",           default: ""
    t.string   "location",        default: ""
    t.string   "founded",         default: ""
    t.string   "facebook_url",    default: ""
    t.string   "twitter_url",     default: ""
    t.string   "youtube_url",     default: ""
    t.string   "itunes_url",      default: ""
    t.string   "amazon_url",      default: ""
    t.string   "google_play_url", default: ""
    t.string   "ticketfly_url",   default: ""
    t.string   "cover_image",     default: ""
    t.string   "profile_image",   default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website",         default: ""
  end

  add_index "record_label_profiles", ["record_label_id"], name: "index_record_label_profiles_on_record_label_id", unique: true

  create_table "record_label_relationships", force: true do |t|
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "record_label_relationships", ["fan_id", "record_label_id"], name: "index_record_label_relationships_on_fan_id_and_record_label_id", unique: true
  add_index "record_label_relationships", ["fan_id"], name: "index_record_label_relationships_on_fan_id"
  add_index "record_label_relationships", ["record_label_id"], name: "index_record_label_relationships_on_record_label_id"

  create_table "record_label_shows", force: true do |t|
    t.integer  "record_label_id"
    t.string   "artist"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.string   "venue"
    t.string   "location"
    t.text     "description"
    t.string   "ticket_url"
    t.string   "flyer_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "record_label_shows", ["record_label_id"], name: "index_record_label_shows_on_record_label_id"

  create_table "record_labels", force: true do |t|
    t.string   "label_name",             default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "record_labels", ["confirmation_token"], name: "index_record_labels_on_confirmation_token", unique: true
  add_index "record_labels", ["email"], name: "index_record_labels_on_email", unique: true
  add_index "record_labels", ["label_name"], name: "index_record_labels_on_label_name"
  add_index "record_labels", ["reset_password_token"], name: "index_record_labels_on_reset_password_token", unique: true
  add_index "record_labels", ["slug"], name: "index_record_labels_on_slug", unique: true
  add_index "record_labels", ["unlock_token"], name: "index_record_labels_on_unlock_token", unique: true
  add_index "record_labels", ["username"], name: "index_record_labels_on_username", unique: true

  create_table "venue_micropost_comment_votes", force: true do |t|
    t.integer  "venue_micropost_comment_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_micropost_comment_votes", ["artist_id", "venue_micropost_comment_id"], name: "index_artist_id_v_comment_votes", unique: true
  add_index "venue_micropost_comment_votes", ["artist_id"], name: "index_venue_micropost_comment_votes_on_artist_id"
  add_index "venue_micropost_comment_votes", ["fan_id", "venue_micropost_comment_id"], name: "index_fan_id_v_comment_votes", unique: true
  add_index "venue_micropost_comment_votes", ["fan_id"], name: "index_venue_micropost_comment_votes_on_fan_id"
  add_index "venue_micropost_comment_votes", ["producer_id", "venue_micropost_comment_id"], name: "index_producer_id_v_comment_votes", unique: true
  add_index "venue_micropost_comment_votes", ["producer_id"], name: "index_venue_micropost_comment_votes_on_producer_id"
  add_index "venue_micropost_comment_votes", ["record_label_id", "venue_micropost_comment_id"], name: "index_record_label_id_v_comment_votes", unique: true
  add_index "venue_micropost_comment_votes", ["record_label_id"], name: "index_venue_micropost_comment_votes_on_record_label_id"
  add_index "venue_micropost_comment_votes", ["venue_id", "venue_micropost_comment_id"], name: "index_venue_id_v_comment_votes", unique: true
  add_index "venue_micropost_comment_votes", ["venue_id"], name: "index_venue_micropost_comment_votes_on_venue_id"
  add_index "venue_micropost_comment_votes", ["venue_micropost_comment_id"], name: "index_v_comment_id_v_comment_votes"

  create_table "venue_micropost_comments", force: true do |t|
    t.integer  "venue_micropost_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_micropost_comments", ["artist_id"], name: "index_venue_micropost_comments_on_artist_id"
  add_index "venue_micropost_comments", ["fan_id"], name: "index_venue_micropost_comments_on_fan_id"
  add_index "venue_micropost_comments", ["producer_id"], name: "index_venue_micropost_comments_on_producer_id"
  add_index "venue_micropost_comments", ["record_label_id"], name: "index_venue_micropost_comments_on_record_label_id"
  add_index "venue_micropost_comments", ["venue_id"], name: "index_venue_micropost_comments_on_venue_id"
  add_index "venue_micropost_comments", ["venue_micropost_id"], name: "index_venue_micropost_comments_on_venue_micropost_id"

  create_table "venue_micropost_votes", force: true do |t|
    t.integer  "venue_micropost_id"
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.integer  "venue_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_micropost_votes", ["artist_id", "venue_micropost_id"], name: "index_artist_id_v_micropost_votes", unique: true
  add_index "venue_micropost_votes", ["artist_id"], name: "index_venue_micropost_votes_on_artist_id"
  add_index "venue_micropost_votes", ["fan_id", "venue_micropost_id"], name: "index_fan_id_v_micropost_votes", unique: true
  add_index "venue_micropost_votes", ["fan_id"], name: "index_venue_micropost_votes_on_fan_id"
  add_index "venue_micropost_votes", ["producer_id", "venue_micropost_id"], name: "index_producer_id_v_micropost_votes", unique: true
  add_index "venue_micropost_votes", ["producer_id"], name: "index_venue_micropost_votes_on_producer_id"
  add_index "venue_micropost_votes", ["record_label_id", "venue_micropost_id"], name: "index_record_label_id_v_micropost_votes", unique: true
  add_index "venue_micropost_votes", ["record_label_id"], name: "index_venue_micropost_votes_on_record_label_id"
  add_index "venue_micropost_votes", ["venue_id", "venue_micropost_id"], name: "index_venue_id_v_micropost_votes", unique: true
  add_index "venue_micropost_votes", ["venue_id"], name: "index_venue_micropost_votes_on_venue_id"
  add_index "venue_micropost_votes", ["venue_micropost_id"], name: "index_venue_micropost_votes_on_venue_micropost_id"

  create_table "venue_microposts", force: true do |t|
    t.integer  "venue_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_url",   default: ""
    t.string   "photo_url",  default: ""
  end

  add_index "venue_microposts", ["venue_id"], name: "index_venue_microposts_on_venue_id"

  create_table "venue_profiles", force: true do |t|
    t.integer  "venue_id"
    t.text     "biography",     default: ""
    t.string   "location",      default: ""
    t.string   "founded",       default: ""
    t.string   "facebook_url",  default: ""
    t.string   "twitter_url",   default: ""
    t.string   "youtube_url",   default: ""
    t.string   "ticketfly_url", default: ""
    t.string   "cover_image",   default: ""
    t.string   "profile_image", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website",       default: ""
  end

  add_index "venue_profiles", ["venue_id"], name: "index_venue_profiles_on_venue_id", unique: true

  create_table "venue_relationships", force: true do |t|
    t.integer  "fan_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_relationships", ["fan_id", "venue_id"], name: "index_venue_relationships_on_fan_id_and_venue_id", unique: true
  add_index "venue_relationships", ["fan_id"], name: "index_venue_relationships_on_fan_id"
  add_index "venue_relationships", ["venue_id"], name: "index_venue_relationships_on_venue_id"

  create_table "venue_shows", force: true do |t|
    t.integer  "venue_id"
    t.string   "artist"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.string   "show_venue"
    t.string   "location"
    t.text     "description"
    t.string   "ticket_url"
    t.string   "flyer_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_shows", ["venue_id"], name: "index_venue_shows_on_venue_id"

  create_table "venues", force: true do |t|
    t.string   "venue_name",             default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "venues", ["confirmation_token"], name: "index_venues_on_confirmation_token", unique: true
  add_index "venues", ["email"], name: "index_venues_on_email", unique: true
  add_index "venues", ["reset_password_token"], name: "index_venues_on_reset_password_token", unique: true
  add_index "venues", ["slug"], name: "index_venues_on_slug", unique: true
  add_index "venues", ["unlock_token"], name: "index_venues_on_unlock_token", unique: true
  add_index "venues", ["username"], name: "index_venues_on_username", unique: true
  add_index "venues", ["venue_name"], name: "index_venues_on_venue_name"

end

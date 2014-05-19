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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140519133830) do

  create_table "blocks", :force => true do |t|
    t.integer  "blocker_id"
    t.integer  "blocked_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "favoriter_id"
    t.integer  "favorited_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "type",       :default => "custom", :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer  "user_id"
    t.string   "option"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "content"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "sender_readability",    :default => true
    t.boolean  "recipient_readability", :default => true
  end

  create_table "pings", :force => true do |t|
    t.integer  "pinger_id"
    t.integer  "pinged_id"
    t.string   "ping_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "image_1",         :default => "default.jpg", :null => false
    t.string   "image_2"
    t.string   "image_3"
    t.string   "image_4"
    t.string   "image_5"
    t.text     "fav_characters"
    t.text     "fav_spots"
    t.text     "fav_places"
    t.string   "guilty_pleasure"
    t.string   "occupation"
    t.string   "icon"
    t.text     "interests"
    t.string   "link"
    t.string   "quip"
    t.integer  "flags",           :default => 0,             :null => false
    t.text     "fb_interests"
    t.integer  "user_id",                                    :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                                        :null => false
    t.integer  "gender_id",              :limit => 255,                       :null => false
    t.string   "relationship_status",                   :default => "single", :null => false
    t.date     "birthday",                                                    :null => false
    t.string   "location",                                                    :null => false
    t.string   "role",                                  :default => "basic",  :null => false
    t.string   "other",                                 :default => "",       :null => false
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.string   "email",                                 :default => "",       :null => false
    t.string   "encrypted_password",                    :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0,        :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

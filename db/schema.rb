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

ActiveRecord::Schema.define(:version => 20121019195635) do

  create_table "beer_taps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.string   "brewery"
    t.float    "abv"
    t.float    "srm"
    t.float    "ibus"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "manufacturer_id"
  end

  create_table "kegs", :force => true do |t|
    t.string   "kind"
    t.float    "capacity"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "beer_tap_id"
    t.integer  "beer_id"
    t.boolean  "notified",    :default => false
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "province",    :default => "Ontario"
    t.string   "country",     :default => "Canada"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "measurements", :force => true do |t|
    t.integer  "keg_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.float    "volume"
    t.float    "temperature"
    t.integer  "sampled_at",  :limit => 8
  end

  create_table "ratings", :force => true do |t|
    t.integer  "beer_id"
    t.integer  "value"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "brewery"
    t.string   "name"
    t.string   "requested_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "send_sms"
    t.boolean  "send_email"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "uid"
    t.boolean  "admin",        :default => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "beer_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["beer_id"], :name => "index_votes_on_beer_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end

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

ActiveRecord::Schema.define(version: 20150612111049) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "pref_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "info",       limit: 65535
  end

  add_index "cities", ["pref_id"], name: "index_cities_on_pref_id", using: :btree

  create_table "postals", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.integer  "pref_id",    limit: 4
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "lot",        limit: 255
    t.integer  "flag1",      limit: 4
    t.integer  "flag2",      limit: 4
    t.integer  "flag3",      limit: 4
    t.integer  "flag4",      limit: 4
    t.integer  "flag5",      limit: 4
    t.integer  "flag6",      limit: 4
    t.text     "info",       limit: 65535
  end

  add_index "postals", ["city_id"], name: "index_postals_on_city_id", using: :btree
  add_index "postals", ["pref_id"], name: "index_postals_on_pref_id", using: :btree

  create_table "prefs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "info",       limit: 65535
  end

  add_foreign_key "cities", "prefs"
  add_foreign_key "postals", "cities"
  add_foreign_key "postals", "prefs"
end

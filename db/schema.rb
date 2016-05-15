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

ActiveRecord::Schema.define(version: 20160515173946) do

  create_table "breweries", force: :cascade do |t|
  end

  create_table "locations", force: :cascade do |t|
    t.float   "latitude"
    t.float   "longitude"
    t.integer "locationable_id"
    t.string  "locationable_type"
    t.integer "location_id"
  end

  add_index "locations", ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id"

  create_table "municipalities", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "description"
    t.integer  "population"
    t.string   "link"
    t.integer  "region_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "municipality_translations", force: :cascade do |t|
    t.integer  "municipality_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.text     "description"
    t.string   "link"
  end

  add_index "municipality_translations", ["locale"], name: "index_municipality_translations_on_locale"
  add_index "municipality_translations", ["municipality_id"], name: "index_municipality_translations_on_municipality_id"

  create_table "place_translations", force: :cascade do |t|
    t.integer  "place_id",    null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.string   "link"
  end

  add_index "place_translations", ["locale"], name: "index_place_translations_on_locale"
  add_index "place_translations", ["place_id"], name: "index_place_translations_on_place_id"

  create_table "places", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.integer  "municipality_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.text     "comment"
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region_translations", force: :cascade do |t|
    t.integer  "region_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.string   "link"
  end

  add_index "region_translations", ["locale"], name: "index_region_translations_on_locale"
  add_index "region_translations", ["region_id"], name: "index_region_translations_on_region_id"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.float    "area"
    t.integer  "population"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurants", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

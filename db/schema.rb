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

ActiveRecord::Schema.define(version: 20160326145907) do

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

end

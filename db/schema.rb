ActiveRecord::Schema.define(version: 20160320131429) do

  create_table "region_translations", force: :cascade do |t|
    t.integer  "region_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
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

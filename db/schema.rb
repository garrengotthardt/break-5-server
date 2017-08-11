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

ActiveRecord::Schema.define(version: 20170811134020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_variations", force: :cascade do |t|
    t.bigint "menu_item_id"
    t.string "variation"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_item_variations_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_menu_items_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "long"
    t.string "google_places_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "user_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_user_places_on_place_id"
    t.index ["user_id"], name: "index_user_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_variations", "menu_items"
  add_foreign_key "menu_items", "places"
  add_foreign_key "user_places", "places"
  add_foreign_key "user_places", "users"
end

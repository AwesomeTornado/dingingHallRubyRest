# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_10_29_193930) do
  create_table "foods", force: :cascade do |t|
    t.integer "calories"
    t.datetime "created_at", null: false
    t.string "name"
    t.boolean "pork"
    t.datetime "updated_at", null: false
    t.boolean "vegan"
    t.boolean "vegetarian"
  end

  create_table "foods_menus", id: false, force: :cascade do |t|
    t.integer "food_id", null: false
    t.integer "menu_id", null: false
    t.index ["food_id", "menu_id"], name: "index_foods_menus_on_food_id_and_menu_id"
    t.index ["menu_id", "food_id"], name: "index_foods_menus_on_menu_id_and_food_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "close"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "open"
    t.datetime "updated_at", null: false
  end

  create_table "locations_menus", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "menu_id", null: false
    t.index ["location_id", "menu_id"], name: "index_locations_menus_on_location_id_and_menu_id"
    t.index ["menu_id", "location_id"], name: "index_locations_menus_on_menu_id_and_location_id"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end
end

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

ActiveRecord::Schema.define(version: 20200619203454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
    t.integer "code_department"
    t.string "region"
  end

  create_table "crop_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "scientificName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crops", force: :cascade do |t|
    t.string "crop_type"
    t.date "sowing_date"
    t.date "harvesting_planned_date"
    t.date "actual_harvesting_date"
    t.integer "sowing_area"
    t.bigint "terrain_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["terrain_id"], name: "index_crops_on_terrain_id"
    t.index ["user_id"], name: "index_crops_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postal_codes", force: :cascade do |t|
    t.string "code"
    t.string "department"
    t.integer "department_code"
    t.string "city"
    t.integer "city_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reference_prices", force: :cascade do |t|
    t.float "unitPrice"
    t.string "presentation"
    t.string "unitMeasure"
    t.date "date_of_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrains", force: :cascade do |t|
    t.string "name"
    t.integer "area"
    t.string "source_energy"
    t.string "source_water"
    t.string "state_path"
    t.string "close_town"
    t.decimal "latitude"
    t.decimal "longitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_terrains_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: true
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "last_name"
    t.string "image"
    t.string "email", default: "", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phone_number"
    t.string "document_type"
    t.integer "document_number"
    t.date "birth_date"
    t.string "state"
    t.string "town"
    t.string "role"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "crops", "terrains"
  add_foreign_key "crops", "users"
  add_foreign_key "terrains", "users"
end

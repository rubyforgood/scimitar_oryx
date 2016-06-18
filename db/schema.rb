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

ActiveRecord::Schema.define(version: 20160618152843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "species_id"
    t.integer  "facility_id"
    t.date     "date_of_birth"
    t.string   "studbook"
    t.string   "sire"
    t.string   "dam"
    t.string   "tag"
    t.text     "comments"
    t.boolean  "searchable"
    t.integer  "sex_id"
    t.integer  "rearing_id"
    t.integer  "reproductive_status_id"
    t.string   "transponder"
    t.text     "interests",              default: ["keep", "sell", "trade", "loan"],              array: true
  end

  add_index "animals", ["facility_id"], name: "index_animals_on_facility_id", using: :btree
  add_index "animals", ["rearing_id"], name: "index_animals_on_rearing_id", using: :btree
  add_index "animals", ["reproductive_status_id"], name: "index_animals_on_reproductive_status_id", using: :btree
  add_index "animals", ["sex_id"], name: "index_animals_on_sex_id", using: :btree
  add_index "animals", ["species_id"], name: "index_animals_on_species_id", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "facility_type_id"
    t.boolean  "spa"
    t.float    "acreage"
    t.float    "endangered_acreage"
    t.boolean  "temperture_controled"
    t.boolean  "water_features"
    t.boolean  "supplemental_feed"
    t.integer  "facility_expertise_id"
    t.text     "interests",             default: ["grow_herd_size"],              array: true
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "facilities", ["facility_expertise_id"], name: "index_facilities_on_facility_expertise_id", using: :btree
  add_index "facilities", ["facility_type_id"], name: "index_facilities_on_facility_type_id", using: :btree

  create_table "facilities_users", force: :cascade do |t|
    t.integer "facility_id"
    t.integer "user_id"
  end

  add_index "facilities_users", ["facility_id"], name: "index_facilities_users_on_facility_id", using: :btree
  add_index "facilities_users", ["user_id"], name: "index_facilities_users_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "animal_id"
    t.integer  "facility_id"
  end

  add_index "pictures", ["animal_id"], name: "index_pictures_on_animal_id", using: :btree
  add_index "pictures", ["facility_id"], name: "index_pictures_on_facility_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "site_admin",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pictures", "animals"
  add_foreign_key "pictures", "facilities"
end

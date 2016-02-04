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

ActiveRecord::Schema.define(version: 20160204115131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beds", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "tenant_id"
    t.integer  "rent"
    t.integer  "security_deposit"
    t.integer  "room_occupancy"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "beds", ["house_id"], name: "index_beds_on_house_id", using: :btree
  add_index "beds", ["rent", "room_occupancy"], name: "index_beds_on_rent_and_room_occupancy", using: :btree
  add_index "beds", ["rent"], name: "index_beds_on_rent", using: :btree
  add_index "beds", ["room_occupancy"], name: "index_beds_on_room_occupancy", using: :btree
  add_index "beds", ["tenant_id"], name: "index_beds_on_tenant_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree

  create_table "house_amenity_relationships", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "house_amenity_relationships", ["amenity_id"], name: "index_house_amenity_relationships_on_amenity_id", using: :btree
  add_index "house_amenity_relationships", ["house_id", "amenity_id"], name: "index_house_amenity_relationships_on_house_id_and_amenity_id", unique: true, using: :btree
  add_index "house_amenity_relationships", ["house_id"], name: "index_house_amenity_relationships_on_house_id", using: :btree

  create_table "house_listing_requests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_photos", force: :cascade do |t|
    t.integer  "house_id"
    t.string   "image"
    t.string   "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "house_photos", ["house_id"], name: "index_house_photos_on_house_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "category"
    t.integer  "owner_id"
    t.integer  "bhk"
    t.integer  "no_of_beds"
    t.string   "allowed_gender"
    t.integer  "locality_id"
    t.string   "pincode"
    t.float    "lat"
    t.float    "long"
    t.text     "address"
    t.string   "landmark"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
  end

  add_index "houses", ["allowed_gender"], name: "index_houses_on_allowed_gender", using: :btree
  add_index "houses", ["locality_id", "allowed_gender"], name: "index_houses_on_locality_id_and_allowed_gender", using: :btree
  add_index "houses", ["locality_id"], name: "index_houses_on_locality_id", using: :btree
  add_index "houses", ["owner_id"], name: "index_houses_on_owner_id", using: :btree

  create_table "localities", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "localities", ["city_id"], name: "index_localities_on_city_id", using: :btree
  add_index "localities", ["name", "city_id"], name: "index_localities_on_name_and_city_id", using: :btree
  add_index "localities", ["name"], name: "index_localities_on_name", using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.integer  "locality_id"
    t.integer  "neighbor_locality_id"
    t.float    "distance"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "neighborhoods", ["locality_id", "distance"], name: "index_neighborhoods_on_locality_id_and_distance", using: :btree
  add_index "neighborhoods", ["locality_id", "neighbor_locality_id"], name: "index_neighborhoods_on_locality_id_and_neighbor_locality_id", unique: true, using: :btree
  add_index "neighborhoods", ["locality_id"], name: "index_neighborhoods_on_locality_id", using: :btree
  add_index "neighborhoods", ["neighbor_locality_id", "distance"], name: "index_neighborhoods_on_neighbor_locality_id_and_distance", using: :btree
  add_index "neighborhoods", ["neighbor_locality_id"], name: "index_neighborhoods_on_neighbor_locality_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree

  create_table "tenant_visits", force: :cascade do |t|
    t.integer  "house_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.date     "date"
    t.time     "time"
    t.string   "company_rep"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tenant_visits", ["date", "time"], name: "index_tenant_visits_on_date_and_time", using: :btree
  add_index "tenant_visits", ["date"], name: "index_tenant_visits_on_date", using: :btree
  add_index "tenant_visits", ["email"], name: "index_tenant_visits_on_email", using: :btree
  add_index "tenant_visits", ["house_id"], name: "index_tenant_visits_on_house_id", using: :btree
  add_index "tenant_visits", ["phone"], name: "index_tenant_visits_on_phone", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "beds", "houses"
  add_foreign_key "beds", "tenants"
  add_foreign_key "house_amenity_relationships", "amenities"
  add_foreign_key "house_amenity_relationships", "houses"
  add_foreign_key "house_photos", "houses"
  add_foreign_key "houses", "localities"
  add_foreign_key "houses", "owners"
  add_foreign_key "localities", "cities"
  add_foreign_key "neighborhoods", "localities"
  add_foreign_key "tenant_visits", "houses"
end

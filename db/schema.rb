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

ActiveRecord::Schema.define(version: 20180803163105) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "ISBN"
    t.string   "accountHolder"
    t.integer  "userID_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bank_accounts", ["userID_id"], name: "index_bank_accounts_on_userID_id"

  create_table "categories", force: :cascade do |t|
    t.integer  "max_length"
    t.integer  "max_width"
    t.integer  "max_height"
    t.integer  "max_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_origins", force: :cascade do |t|
    t.integer  "matchID_id"
    t.boolean  "isSigned_Driver"
    t.boolean  "isSigned_Sender"
    t.datetime "origin_date"
    t.text     "comment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "contract_origins", ["matchID_id"], name: "index_contract_origins_on_matchID_id"

  create_table "delivery_orders", force: :cascade do |t|
    t.integer  "matchID_id"
    t.boolean  "isSigned_Driver"
    t.boolean  "isSigned_Receiver"
    t.datetime "destiny_date"
    t.text     "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "delivery_orders", ["matchID_id"], name: "index_delivery_orders_on_matchID_id"

  create_table "journeys", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "intermediate1_id"
    t.integer  "intermediate2_id"
    t.integer  "intermediate3_id"
    t.integer  "destiny_id"
    t.datetime "originTime"
    t.datetime "destinyTime"
    t.integer  "driverID_id"
    t.decimal  "priceTotal"
    t.decimal  "price01"
    t.decimal  "price12"
    t.decimal  "price23"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "journeys", ["destiny_id"], name: "index_journeys_on_destiny_id"
  add_index "journeys", ["driverID_id"], name: "index_journeys_on_driverID_id"
  add_index "journeys", ["intermediate1_id"], name: "index_journeys_on_intermediate1_id"
  add_index "journeys", ["intermediate2_id"], name: "index_journeys_on_intermediate2_id"
  add_index "journeys", ["intermediate3_id"], name: "index_journeys_on_intermediate3_id"
  add_index "journeys", ["origin_id"], name: "index_journeys_on_origin_id"

  create_table "location_logs", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "position_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "packageID_id"
  end

  add_index "location_logs", ["packageID_id"], name: "index_location_logs_on_packageID_id"

  create_table "locations", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "journeyID_id"
    t.integer  "origin_id"
    t.integer  "destiny_id"
    t.datetime "originTime"
    t.datetime "destinyTime"
    t.integer  "packageID_id"
    t.datetime "acceptTime"
    t.decimal  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "isPaid"
  end

  add_index "matches", ["destiny_id"], name: "index_matches_on_destiny_id"
  add_index "matches", ["journeyID_id"], name: "index_matches_on_journeyID_id"
  add_index "matches", ["origin_id"], name: "index_matches_on_origin_id"
  add_index "matches", ["packageID_id"], name: "index_matches_on_packageID_id"

  create_table "packages", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "acceptPolicy"
  end

  add_index "packages", ["category_id"], name: "index_packages_on_category_id"
  add_index "packages", ["user_id"], name: "index_packages_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewOn_id"
    t.integer  "reviewBy_id"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["reviewBy_id"], name: "index_reviews_on_reviewBy_id"
  add_index "reviews", ["reviewOn_id"], name: "index_reviews_on_reviewOn_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "surname"
    t.date     "DOB"
    t.integer  "phone"
    t.boolean  "isDriver"
    t.boolean  "autoAccept"
    t.string   "driverlicense"
    t.boolean  "isAdmin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicles", force: :cascade do |t|
    t.string   "numberPlate"
    t.integer  "driverID_id"
    t.string   "model"
    t.string   "brand"
    t.boolean  "isFull"
    t.integer  "packagesCat1"
    t.integer  "packagesCat2"
    t.integer  "packagesCat3"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vehicles", ["driverID_id"], name: "index_vehicles_on_driverID_id"

end

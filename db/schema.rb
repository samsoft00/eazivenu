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

ActiveRecord::Schema.define(version: 20160610212915) do

  create_table "bookings", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "phone",       limit: 255
    t.string   "email",       limit: 255
    t.date     "from"
    t.date     "to"
    t.integer  "venue_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
    t.boolean  "is_read"
  end

  add_index "bookings", ["category_id"], name: "index_bookings_on_category_id", using: :btree
  add_index "bookings", ["venue_id"], name: "index_bookings_on_venue_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "venue_id",    limit: 4
    t.integer "category_id", limit: 4
  end

  add_index "event_types", ["category_id"], name: "index_event_types_on_category_id", using: :btree
  add_index "event_types", ["venue_id"], name: "index_event_types_on_venue_id", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.string  "key",      limit: 255
    t.string  "value",    limit: 255
    t.integer "venue_id", limit: 4
  end

  add_index "facilities", ["venue_id"], name: "index_facilities_on_venue_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "thumbnail_id", limit: 255
    t.integer  "venue_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "images", ["venue_id"], name: "index_images_on_venue_id", using: :btree

  create_table "local_govt_areas", force: :cascade do |t|
    t.integer "state_id", limit: 4
    t.string  "lga",      limit: 255
  end

  add_index "local_govt_areas", ["state_id"], name: "index_local_govt_areas_on_state_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "config_key",   limit: 255
    t.boolean  "config_value"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "state", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
    t.boolean  "is_admin"
    t.boolean  "is_manager"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "state_id",           limit: 4
    t.integer  "local_govt_area_id", limit: 4
    t.string   "address",            limit: 255
    t.string   "phone",              limit: 255
    t.integer  "event_type_id",      limit: 4
    t.string   "capacity",           limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "slug",               limit: 255
    t.integer  "user_id",            limit: 4
    t.string   "price",              limit: 255
    t.text     "about",              limit: 65535
    t.string   "status",             limit: 255
  end

  add_index "venues", ["event_type_id"], name: "index_venues_on_event_type_id", using: :btree
  add_index "venues", ["local_govt_area_id"], name: "index_venues_on_local_govt_area_id", using: :btree
  add_index "venues", ["state_id"], name: "index_venues_on_state_id", using: :btree
  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

  add_foreign_key "bookings", "categories"
  add_foreign_key "bookings", "venues"
  add_foreign_key "event_types", "categories"
  add_foreign_key "event_types", "venues"
  add_foreign_key "facilities", "venues"
  add_foreign_key "images", "venues"
  add_foreign_key "local_govt_areas", "states"
  add_foreign_key "venues", "event_types"
  add_foreign_key "venues", "local_govt_areas"
  add_foreign_key "venues", "states"
  add_foreign_key "venues", "users"
end

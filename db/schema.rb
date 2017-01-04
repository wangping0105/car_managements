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

ActiveRecord::Schema.define(version: 20170104032457) do

  create_table "addresses", force: :cascade do |t|
    t.float    "lat",              limit: 24
    t.float    "lng",              limit: 24
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.integer  "country_id",       limit: 4
    t.integer  "province_id",      limit: 4
    t.integer  "city_id",          limit: 4
    t.integer  "district_id",      limit: 4
    t.string   "detail_address",   limit: 255
    t.integer  "address_type",     limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id", using: :btree
  add_index "addresses", ["lat", "lng"], name: "index_addresses_on_lat_and_lng", using: :btree
  add_index "addresses", ["province_id"], name: "index_addresses_on_province_id", using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "access_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "app_versions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "app_type",     limit: 4
    t.string   "version_name", limit: 255
    t.string   "version_code", limit: 255
    t.string   "download_url", limit: 255
    t.integer  "upgrade",      limit: 4
    t.text     "changelogs",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "attachmentable_id",   limit: 4
    t.string   "attachmentable_type", limit: 255
    t.string   "name",                limit: 255
    t.string   "file_file_name",      limit: 255
    t.string   "file_content_type",   limit: 255
    t.integer  "file_file_size",      limit: 4
    t.datetime "file_updated_at"
    t.datetime "deleted_at"
    t.text     "note",                limit: 65535
    t.string   "sub_type",            limit: 255
    t.integer  "attachment_position", limit: 4
    t.string   "qiniu_persistent_id", limit: 255
    t.datetime "updated_at",                        null: false
    t.datetime "created_at",                        null: false
  end

  add_index "attachments", ["attachmentable_id", "attachmentable_type"], name: "index_attachments_on_attachmentable_id_and_attachmentable_type", using: :btree
  add_index "attachments", ["qiniu_persistent_id"], name: "index_attachments_on_qiniu_persistent_id", using: :btree
  add_index "attachments", ["user_id"], name: "index_attachments_on_user_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cell_contacts", force: :cascade do |t|
    t.integer  "contact_id",   limit: 4
    t.integer  "cell_id",      limit: 4
    t.string   "building_no",  limit: 255
    t.string   "room_no",      limit: 255
    t.string   "cell_address", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cell_contacts", ["building_no"], name: "index_cell_contacts_on_building_no", using: :btree
  add_index "cell_contacts", ["cell_id"], name: "index_cell_contacts_on_cell_id", using: :btree
  add_index "cell_contacts", ["contact_id"], name: "index_cell_contacts_on_contact_id", using: :btree
  add_index "cell_contacts", ["room_no"], name: "index_cell_contacts_on_room_no", using: :btree

  create_table "cells", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "status",             limit: 4,   default: 0
    t.string   "number",             limit: 255
    t.string   "name",               limit: 255
    t.integer  "cell_contact_count", limit: 4,   default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "cells", ["number"], name: "index_cells_on_number", using: :btree
  add_index "cells", ["status"], name: "index_cells_on_status", using: :btree
  add_index "cells", ["user_id"], name: "index_cells_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "pinyin",      limit: 255
    t.integer  "province_id", limit: 4
    t.integer  "sort",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["pinyin"], name: "index_cities_on_pinyin", using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "phone",              limit: 255
    t.integer  "plate_number_count", limit: 4,   default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "contacts", ["phone"], name: "index_contacts_on_phone", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "sort",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["pinyin"], name: "index_countries_on_pinyin", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "city_id",    limit: 4
    t.integer  "sort",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree
  add_index "districts", ["name"], name: "index_districts_on_name", using: :btree
  add_index "districts", ["pinyin"], name: "index_districts_on_pinyin", using: :btree

  create_table "plate_numbers", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.integer  "car_id",     limit: 4
    t.integer  "contact_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "plate_numbers", ["car_id"], name: "index_plate_numbers_on_car_id", using: :btree
  add_index "plate_numbers", ["contact_id"], name: "index_plate_numbers_on_contact_id", using: :btree
  add_index "plate_numbers", ["number"], name: "index_plate_numbers_on_number", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "sort",       limit: 4
    t.integer  "country_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree
  add_index "provinces", ["name"], name: "index_provinces_on_name", using: :btree
  add_index "provinces", ["pinyin"], name: "index_provinces_on_pinyin", using: :btree

  create_table "sms_codes", force: :cascade do |t|
    t.integer  "users_id",   limit: 4
    t.string   "phone",      limit: 255
    t.string   "code",       limit: 255
    t.integer  "sms_type",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sms_codes", ["phone", "sms_type"], name: "index_sms_codes_on_phone_and_sms_type", using: :btree
  add_index "sms_codes", ["phone"], name: "index_sms_codes_on_phone", using: :btree
  add_index "sms_codes", ["users_id"], name: "index_sms_codes_on_users_id", using: :btree

  create_table "user_cells", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "cell_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_devices", force: :cascade do |t|
    t.string   "uid",          limit: 255
    t.string   "device_token", limit: 255
    t.string   "client_id",    limit: 255
    t.integer  "platform",     limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "phone",                  limit: 255
    t.string   "email",                  limit: 255, default: ""
    t.string   "name",                   limit: 255
    t.string   "name_pinyin",            limit: 255
    t.string   "authentication_token",   limit: 255
    t.datetime "activated"
    t.integer  "role",                   limit: 4,   default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

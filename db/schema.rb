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

ActiveRecord::Schema.define(version: 20171030131436) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "quantity",    limit: 4
    t.integer  "unit_price",  limit: 4
    t.integer  "total_price", limit: 4
    t.integer  "product_id",  limit: 4
    t.integer  "cart_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "store_id",    limit: 4
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "subtotal",   limit: 4
    t.integer  "shipping",   limit: 4, default: 380
    t.integer  "total",      limit: 4
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "store_id",         limit: 4
    t.integer  "cart_id",          limit: 4
    t.integer  "shipping",         limit: 4
    t.integer  "amount",           limit: 4
    t.string   "delivery_address", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.text     "detail",     limit: 65535
    t.string   "image",      limit: 255
    t.text     "category",   limit: 65535
    t.integer  "stock",      limit: 4
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name",                   limit: 255
    t.integer  "tel",                    limit: 4
    t.text     "address",                limit: 65535
    t.text     "genre",                  limit: 65535
    t.string   "image",                  limit: 255
    t.integer  "mindelitime",            limit: 4
    t.integer  "maxdelitime",            limit: 4
    t.time     "opentime"
    t.time     "closetime"
    t.string   "en_name",                limit: 255
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
  end

  add_index "stores", ["email"], name: "index_stores_on_email", unique: true, using: :btree
  add_index "stores", ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true, using: :btree

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
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.integer  "tel",                    limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
end

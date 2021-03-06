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

ActiveRecord::Schema.define(version: 20150307001912) do

  create_table "lists", id: false, force: :cascade do |t|
    t.uuid     "id",         limit: 16
    t.uuid     "user_id",    limit: 16,                 null: false
    t.string   "name",                                  null: false
    t.boolean  "archived",              default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "lists_products", id: false, force: :cascade do |t|
    t.uuid     "id",         limit: 16
    t.uuid     "list_id",    limit: 16
    t.uuid     "product_id", limit: 16
    t.boolean  "ok"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "lists_products", ["list_id"], name: "index_lists_products_on_list_id"
  add_index "lists_products", ["product_id"], name: "index_lists_products_on_product_id"

  create_table "products", id: false, force: :cascade do |t|
    t.uuid     "id",         limit: 16
    t.string   "name",                  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shares", id: false, force: :cascade do |t|
    t.uuid     "id",         limit: 16
    t.integer  "user_id"
    t.integer  "by_id"
    t.uuid     "list_id",    limit: 16
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "shares", ["by_id"], name: "index_shares_on_by_id"
  add_index "shares", ["list_id"], name: "index_shares_on_list_id"
  add_index "shares", ["user_id"], name: "index_shares_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end

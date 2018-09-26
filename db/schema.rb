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

ActiveRecord::Schema.define(version: 20180926164249) do

  create_table "catchers", force: :cascade do |t|
    t.string   "name"
    t.text     "location"
    t.integer  "phone"
    t.string   "password"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "official_id"
    t.text     "description"
    t.integer  "monkeys_spotted"
    t.string   "location"
    t.integer  "status"
    t.boolean  "resolved"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "complaints", ["official_id"], name: "index_complaints_on_official_id"
  add_index "complaints", ["user_id"], name: "index_complaints_on_user_id"

  create_table "contracts", force: :cascade do |t|
    t.integer  "complaint_id"
    t.integer  "official_id"
    t.integer  "catcher_id"
    t.integer  "status"
    t.text     "description"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "contracts", ["catcher_id"], name: "index_contracts_on_catcher_id"
  add_index "contracts", ["complaint_id"], name: "index_contracts_on_complaint_id"
  add_index "contracts", ["official_id"], name: "index_contracts_on_official_id"

  create_table "officials", force: :cascade do |t|
    t.string   "name"
    t.string   "off_code"
    t.string   "email"
    t.integer  "phone"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "password"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

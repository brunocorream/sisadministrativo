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

ActiveRecord::Schema.define(version: 20171231181937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.string   "neighborhood"
    t.string   "street"
    t.string   "number"
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["client_id"], name: "index_addresses_on_client_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "company_name"
    t.string   "document"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_id"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
  end

  create_table "comissions", force: :cascade do |t|
    t.integer  "sale_id"
    t.decimal  "value"
    t.integer  "user_id"
    t.integer  "status"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_comissions_on_sale_id", using: :btree
    t.index ["user_id"], name: "index_comissions_on_user_id", using: :btree
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "value"
    t.integer  "kind"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_quantities", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_quantities_on_product_id", using: :btree
    t.index ["user_id"], name: "index_product_quantities_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "sale_date"
    t.integer  "user_id"
    t.integer  "discount_id"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id"], name: "index_sales_on_client_id", using: :btree
    t.index ["discount_id"], name: "index_sales_on_discount_id", using: :btree
    t.index ["user_id"], name: "index_sales_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "document"
    t.integer  "kind"
    t.integer  "status"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "comissions", "sales"
  add_foreign_key "comissions", "users"
  add_foreign_key "product_quantities", "products"
  add_foreign_key "product_quantities", "users"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "discounts"
  add_foreign_key "sales", "users"
end

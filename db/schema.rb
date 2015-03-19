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

ActiveRecord::Schema.define(version: 20150313022655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_contacts", force: true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", using: :btree

  create_table "deliverables", force: true do |t|
    t.integer  "order_id"
    t.string   "name"
    t.string   "kind"
    t.decimal  "cost"
    t.string   "address"
    t.string   "state"
    t.string   "tracking_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliverables", ["address"], name: "index_deliverables_on_address", using: :btree
  add_index "deliverables", ["name"], name: "index_deliverables_on_name", using: :btree
  add_index "deliverables", ["tracking_number"], name: "index_deliverables_on_tracking_number", using: :btree

  create_table "goods", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "upstream_id"
    t.decimal  "purchase_price"
    t.decimal  "selling_price"
    t.datetime "deleted_at"
  end

  add_index "goods", ["deleted_at"], name: "index_goods_on_deleted_at", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.date     "placed_at"
    t.string   "code"
    t.string   "state"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["code"], name: "index_orders_on_code", using: :btree
  add_index "orders", ["deleted_at"], name: "index_orders_on_deleted_at", using: :btree

  create_table "preferences", force: true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.decimal  "profit_margin"
    t.decimal  "profit_per_item"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", force: true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_category_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "weight"
    t.boolean  "is_public",           default: false
    t.string   "state"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sub_orders", force: true do |t|
    t.integer  "order_id"
    t.integer  "good_id"
    t.integer  "quantity"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upstream_contacts", force: true do |t|
    t.integer "upstream_id"
    t.string  "name"
    t.string  "detail"
  end

  add_index "upstream_contacts", ["name"], name: "index_upstream_contacts_on_name", using: :btree

  create_table "upstreams", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "address"
    t.text    "description"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "age"
    t.string   "email"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end

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

ActiveRecord::Schema.define(version: 20151221230152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "variant_id",                  null: false
    t.integer  "quantity",     default: 1
    t.integer  "item_type_id",                null: false
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["item_type_id"], name: "index_cart_items_on_item_type_id", using: :btree
  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id", using: :btree
  add_index "cart_items", ["variant_id"], name: "index_cart_items_on_variant_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "amount"
    t.string   "invoice_type"
    t.string   "state"
    t.boolean  "active"
    t.decimal  "credited_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal  "price"
    t.decimal  "total"
    t.integer  "order_id"
    t.integer  "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number",          limit: 255
    t.string   "ip_address",      limit: 255
    t.string   "email",           limit: 255
    t.integer  "order_status_id", limit: 2
    t.integer  "user_id"
    t.boolean  "active",                      default: true, null: false
    t.datetime "calculated_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "payment_cim_id"
    t.boolean  "default"
    t.boolean  "active"
    t.string   "last_digits"
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "confirmation_id"
    t.integer  "amount"
    t.string   "error"
    t.string   "error_code"
    t.string   "message"
    t.string   "action"
    t.text     "params"
    t.boolean  "success"
    t.boolean  "test"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "product_properties", force: :cascade do |t|
    t.integer  "product_id",  null: false
    t.integer  "property_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_type_id"
    t.datetime "available_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  add_index "products", ["product_type_id"], name: "index_products_on_product_type_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.boolean  "sms_notification",       default: false, null: false
    t.boolean  "push_notification",      default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["role_id", "user_id"], name: "index_users_roles_on_role_id_and_user_id", using: :btree

  create_table "variant_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "variant_id"
    t.integer  "venue_id"
    t.string   "description", limit: 255
    t.boolean  "primary",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variant_properties", ["property_id"], name: "index_variant_properties_on_property_id", using: :btree
  add_index "variant_properties", ["variant_id"], name: "index_variant_properties_on_variant_id", using: :btree
  add_index "variant_properties", ["venue_id"], name: "index_variant_properties_on_venue_id", using: :btree

  create_table "variant_suppliers", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "supplier_id"
    t.decimal  "cost"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "variants", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0,   null: false
    t.decimal  "cost",       precision: 8, scale: 2, default: 0.0,   null: false
    t.boolean  "master",                             default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree

end

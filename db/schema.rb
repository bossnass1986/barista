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

ActiveRecord::Schema.define(version: 20160405111829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.string   "zip_code"
    t.integer  "phone_id"
    t.string   "alternative_phone"
    t.boolean  "default"
    t.boolean  "billing_default"
    t.boolean  "active"
    t.integer  "country_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  add_index "addresses", ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.string   "batchable_type"
    t.integer  "batchable_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

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

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "shipping_zone_id"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "type"
    t.string   "code"
    t.decimal  "amount"
    t.decimal  "minimum_value"
    t.integer  "percent"
    t.text     "description"
    t.boolean  "combine"
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "image_height"
    t.integer  "image_width"
    t.integer  "position"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.decimal  "price",                        precision: 8, scale: 2
    t.decimal  "total",                        precision: 8, scale: 2
    t.integer  "order_id",                                             null: false
    t.integer  "variant_id",                                           null: false
    t.string   "state",            limit: 255,                         null: false
    t.integer  "tax_rate_id"
    t.integer  "shipping_rate_id"
    t.integer  "shipment_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["shipment_id"], name: "index_order_items_on_shipment_id", using: :btree
  add_index "order_items", ["shipping_rate_id"], name: "index_order_items_on_shipping_rate_id", using: :btree
  add_index "order_items", ["tax_rate_id"], name: "index_order_items_on_tax_rate_id", using: :btree
  add_index "order_items", ["variant_id"], name: "index_order_items_on_variant_id", using: :btree

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
    t.string   "state"
    t.integer  "user_id"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.integer  "order_status_id", limit: 2
    t.integer  "coupon_id"
    t.integer  "shipments_count",             default: 0
    t.boolean  "active",                      default: true,  null: false
    t.boolean  "shipped",                     default: false, null: false
    t.datetime "calculated_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["bill_address_id"], name: "index_orders_on_bill_address_id", using: :btree
  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
  add_index "orders", ["email"], name: "index_orders_on_email", using: :btree
  add_index "orders", ["number"], name: "index_orders_on_number", using: :btree
  add_index "orders", ["ship_address_id"], name: "index_orders_on_ship_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

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

  add_index "payments", ["invoice_id"], name: "index_payments_on_invoice_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "phone_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "phone_type_id"
    t.string   "number"
    t.string   "phoneable_type"
    t.integer  "phoneable_id"
    t.boolean  "primary"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.string   "name",                 limit: 255,                 null: false
    t.text     "description"
    t.text     "product_keywords"
    t.integer  "product_type_id",                                  null: false
    t.integer  "prototype_id"
    t.integer  "shipping_category_id",                             null: false
    t.string   "permalink",            limit: 255
    t.datetime "available_at"
    t.datetime "deleted_at"
    t.string   "meta_keywords",        limit: 255
    t.string   "meta_description",     limit: 255
    t.boolean  "featured",                         default: false
    t.text     "description_markup"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["permalink"], name: "index_products_on_permalink", unique: true, using: :btree
  add_index "products", ["product_type_id"], name: "index_products_on_product_type_id", using: :btree
  add_index "products", ["prototype_id"], name: "index_products_on_prototype_id", using: :btree
  add_index "products", ["shipping_category_id"], name: "index_products_on_shipping_category_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "display_name"
    t.string   "identifying_name"
    t.boolean  "active",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prototype_properties", force: :cascade do |t|
    t.integer  "prototype_id"
    t.integer  "property_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "prototypes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referral_bonus", force: :cascade do |t|
    t.integer  "amount"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referral_programs", force: :cascade do |t|
    t.boolean  "active"
    t.text     "description"
    t.string   "name"
    t.integer  "referral_bonus_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "referral_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrals", force: :cascade do |t|
    t.boolean  "applied"
    t.datetime "clicked_at"
    t.string   "email"
    t.string   "name"
    t.datetime "purchased_at"
    t.integer  "referral_program_id"
    t.integer  "referral_type_id"
    t.integer  "referral_user_id"
    t.integer  "referring_user_id"
    t.datetime "registered_at"
    t.datetime "sent_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
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

  create_table "shipping_rate_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_rates", force: :cascade do |t|
    t.integer  "shipping_method_id"
    t.decimal  "rate"
    t.integer  "shipping_rate_type_id"
    t.integer  "shipping_category_id"
    t.decimal  "minimum_charge"
    t.integer  "position"
    t.boolean  "active"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shipping_zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "described_as"
    t.integer  "country_id"
    t.integer  "shipping_zone_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "store_credits", force: :cascade do |t|
    t.decimal  "amount",     precision: 8, scale: 2, default: 0.0
    t.integer  "user_id",                                          null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "store_credits", ["user_id"], name: "index_store_credits_on_user_id", using: :btree

  create_table "supplier_trading_hours", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "weekday"
    t.time    "open_time"
    t.time    "close_time"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "email"
    t.string   "phone"
    t.string   "permalink",        limit: 255
    t.datetime "available_at"
    t.datetime "deleted_at"
    t.string   "meta_keywords",    limit: 255
    t.string   "meta_description", limit: 255
    t.boolean  "featured",                     default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "suppliers", ["name"], name: "index_suppliers_on_name", using: :btree
  add_index "suppliers", ["permalink"], name: "index_suppliers_on_permalink", unique: true, using: :btree
  add_index "suppliers", ["phone"], name: "index_suppliers_on_phone", unique: true, using: :btree

  create_table "tax_rates", force: :cascade do |t|
    t.decimal  "percentage"
    t.integer  "state_id"
    t.integer  "country_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_ledgers", force: :cascade do |t|
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.integer  "transaction_id"
    t.integer  "transaction_account_id"
    t.decimal  "tax_amount"
    t.decimal  "debit"
    t.decimal  "credit"
    t.string   "period"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "type"
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "state"
    t.string   "mobile"
    t.integer  "account_id"
    t.string   "customer_cim_id"
    t.string   "password_salt"
    t.string   "crypted_password"
    t.string   "perishable_token"
    t.string   "persistence_token"
    t.string   "access_token"
    t.integer  "comments_count",         default: 0
    t.boolean  "sms_notification",       default: true, null: false
    t.boolean  "push_notification",      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "role"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["perishable_token"], name: "index_users_on_perishable_token", unique: true, using: :btree
  add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["role_id", "user_id"], name: "index_users_roles_on_role_id_and_user_id", using: :btree

  create_table "variant_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "variant_id"
    t.string   "description", limit: 255
    t.boolean  "primary",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variant_properties", ["property_id"], name: "index_variant_properties_on_property_id", using: :btree
  add_index "variant_properties", ["variant_id"], name: "index_variant_properties_on_variant_id", using: :btree

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

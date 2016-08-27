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

ActiveRecord::Schema.define(version: 20160821142943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "merchant_id"
    t.string   "account_name"
    t.integer  "bsb"
    t.integer  "account_number"
    t.string   "account_type"
    t.decimal  "charge",         precision: 8, scale: 2, default: 4.4, null: false
    t.boolean  "active"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "accounts", ["merchant_id"], name: "index_accounts_on_merchant_id", using: :btree

  create_table "address_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "address_types", ["name"], name: "index_address_types_on_name", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "suburb"
    t.integer  "state_id"
    t.string   "state_name"
    t.string   "postcode"
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

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

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

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",         limit: 50
    t.string   "abbreviation", limit: 3
    t.boolean  "active",                  default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "countries", ["active"], name: "index_countries_on_active", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "type",          limit: 255,                                         null: false
    t.string   "code",          limit: 255,                                         null: false
    t.decimal  "amount",                    precision: 8, scale: 2, default: 0.0
    t.decimal  "minimum_value",             precision: 8, scale: 2
    t.integer  "percent"
    t.text     "description"
    t.boolean  "combine",                                           default: false
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  add_index "coupons", ["code"], name: "index_coupons_on_code", using: :btree
  add_index "coupons", ["expires_at"], name: "index_coupons_on_expires_at", using: :btree

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

  create_table "merchant_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "merchant_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "merchant_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "account_id"
    t.integer  "merchant_type_id"
    t.string   "permalink",        limit: 255
    t.datetime "available_at"
    t.datetime "deleted_at"
    t.string   "meta_keywords",    limit: 255
    t.string   "meta_description", limit: 255
    t.boolean  "featured",                     default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "merchants", ["name"], name: "index_merchants_on_name", using: :btree
  add_index "merchants", ["permalink"], name: "index_merchants_on_permalink", unique: true, using: :btree

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal  "price",                   precision: 8, scale: 2
    t.decimal  "total",                   precision: 8, scale: 2
    t.integer  "order_id",                                        null: false
    t.integer  "variant_id",                                      null: false
    t.string   "state",       limit: 255,                         null: false
    t.integer  "tax_rate_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["tax_rate_id"], name: "index_order_items_on_tax_rate_id", using: :btree
  add_index "order_items", ["variant_id"], name: "index_order_items_on_variant_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "number",          limit: 255
    t.string   "ip_address",      limit: 255
    t.string   "email",           limit: 255
    t.string   "state"
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.integer  "bill_address_id"
    t.integer  "order_status_id", limit: 2
    t.integer  "coupon_id"
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
  add_index "orders", ["merchant_id"], name: "index_orders_on_merchant_id", using: :btree
  add_index "orders", ["number"], name: "index_orders_on_number", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_cim_id"
    t.string  "token"
    t.integer "address_id"
    t.string  "address_cim_id"
    t.boolean "default"
  end

  add_index "payment_methods", ["address_id"], name: "index_payment_methods_on_address_id", using: :btree
  add_index "payment_methods", ["customer_cim_id"], name: "index_payment_methods_on_customer_cim_id", using: :btree
  add_index "payment_methods", ["user_id"], name: "index_payment_methods_on_user_id", using: :btree

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
    t.integer  "product_id",              null: false
    t.integer  "property_id",             null: false
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.integer  "merchant_type_id"
    t.string   "name",             limit: 255,                null: false
    t.boolean  "active",                       default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 255,                 null: false
    t.text     "description"
    t.text     "product_keywords"
    t.integer  "product_type_id",                                null: false
    t.integer  "prototype_id"
    t.string   "permalink",          limit: 255
    t.datetime "available_at"
    t.datetime "deleted_at"
    t.string   "meta_keywords",      limit: 255
    t.string   "meta_description",   limit: 255
    t.boolean  "featured",                       default: false
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

  create_table "properties", force: :cascade do |t|
    t.string   "display_name",     limit: 255,                null: false
    t.string   "identifying_name", limit: 255
    t.boolean  "active",                       default: true
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

  add_index "referral_programs", ["referral_bonus_id"], name: "index_referral_programs_on_referral_bonus_id", using: :btree

  create_table "referral_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrals", force: :cascade do |t|
    t.boolean  "applied",                         default: false
    t.datetime "clicked_at"
    t.string   "email",               limit: 255,                 null: false
    t.string   "name",                limit: 255
    t.datetime "purchased_at"
    t.integer  "referral_program_id",                             null: false
    t.integer  "referral_type_id",                                null: false
    t.integer  "referral_user_id"
    t.integer  "referring_user_id",                               null: false
    t.datetime "registered_at"
    t.datetime "sent_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "referrals", ["email"], name: "index_referrals_on_email", using: :btree
  add_index "referrals", ["referral_program_id"], name: "index_referrals_on_referral_program_id", using: :btree
  add_index "referrals", ["referral_type_id"], name: "index_referrals_on_referral_type_id", using: :btree
  add_index "referrals", ["referral_user_id"], name: "index_referrals_on_referral_user_id", using: :btree
  add_index "referrals", ["referring_user_id"], name: "index_referrals_on_referring_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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

  add_index "states", ["abbreviation"], name: "index_states_on_abbreviation", using: :btree
  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "store_credits", force: :cascade do |t|
    t.decimal  "amount",          precision: 8, scale: 2, default: 0.0
    t.integer  "user_id",                                               null: false
    t.datetime "expire_at"
    t.datetime "last_expired_at"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "store_credits", ["user_id"], name: "index_store_credits_on_user_id", using: :btree

  create_table "tax_rates", force: :cascade do |t|
    t.decimal  "percentage", precision: 8, scale: 2, default: 0.0,          null: false
    t.integer  "state_id"
    t.integer  "country_id"
    t.date     "start_date",                         default: '2016-08-27', null: false
    t.date     "end_date"
    t.boolean  "active",                             default: true
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "tax_rates", ["country_id"], name: "index_tax_rates_on_country_id", using: :btree
  add_index "tax_rates", ["state_id"], name: "index_tax_rates_on_state_id", using: :btree

  create_table "trading_hours", force: :cascade do |t|
    t.integer "merchant_id"
    t.integer "weekday"
    t.time    "open_time"
    t.time    "close_time"
    t.boolean "trades"
  end

  add_index "trading_hours", ["merchant_id"], name: "index_trading_hours_on_merchant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "state"
    t.string   "mobile"
    t.string   "customer_cim_id"
    t.string   "encrypted_password",  limit: 128,                null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "access_token"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "sms_notification",                default: true, null: false
    t.boolean  "push_notification",               default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.string   "remember_token",      limit: 128
    t.integer  "sash_id"
    t.integer  "level",                           default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["role_id", "user_id"], name: "index_users_roles_on_role_id_and_user_id", using: :btree

  create_table "variant_merchants", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "merchant_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

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

  create_table "variants", force: :cascade do |t|
    t.integer  "product_id",                                                     null: false
    t.string   "sku",        limit: 255,                                         null: false
    t.decimal  "price",                  precision: 8, scale: 2, default: 0.0,   null: false
    t.decimal  "cost",                   precision: 8, scale: 2, default: 0.0,   null: false
    t.boolean  "master",                                         default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree

end

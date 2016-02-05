class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number, limit: 255
      t.string :ip_address, limit: 255
      t.string :email, limit: 255
      t.string :state, limti: 255
      t.integer :user_id, limit: 4
      t.integer :bill_address_id, limit: 4
      t.integer :ship_address_id, limit: 4
      t.integer :order_status_id, limit: 1
      t.integer  :coupon_id, limit: 4
      t.integer :shipments_count, limit: 4, default: 0
      t.boolean  :active, default: true,  null: false
      t.boolean :shipped, default: false, null: false
      t.datetime :calculated_at
      t.datetime :completed_at

      t.timestamps
    end

    add_index "orders", ["bill_address_id"], name: "index_orders_on_bill_address_id", using: :btree
    add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
    add_index "orders", ["email"], name: "index_orders_on_email", using: :btree
    add_index "orders", ["number"], name: "index_orders_on_number", using: :btree
    add_index "orders", ["ship_address_id"], name: "index_orders_on_ship_address_id", using: :btree
    add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree
  end
end

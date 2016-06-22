class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number, limit: 255
      t.string :ip_address, limit: 255
      t.string :email, limit: 255
      t.string :state, limti: 255
      t.integer :user_id, limit: 4
      t.integer :merchant_id, limit: 4
      t.integer :bill_address_id, limit: 4
      # t.integer :ship_address_id, limit: 4
      t.integer :order_status_id, limit: 1
      t.integer :coupon_id, limit: 4
      # t.integer :shipments_count, limit: 4, default: 0
      t.boolean :active, default: true,  null: false
      t.boolean :shipped, default: false, null: false
      t.datetime :calculated_at
      t.datetime :completed_at

      t.timestamps
    end
    add_index :orders, :bill_address_id
    add_index :orders, :coupon_id
    add_index :orders, :email
    add_index :orders, :number
    # add_index :orders, :ship_address_id
    add_index :orders, :user_id
    add_index :orders, :merchant_id
  end
end

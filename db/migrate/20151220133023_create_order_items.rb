class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal  :price, precision: 8, scale: 2
      t.decimal  :total, precision: 8, scale: 2
      t.integer  :order_id, limit: 4, null: false
      t.integer  :variant_id, limit: 4, null: false
      t.string   :state, limit: 255, null: false
      t.integer  :tax_rate_id, limit: 4
      # t.integer  :shipping_rate_id, limit: 4
      # t.integer  :shipment_id, limit: 4

      t.timestamps null: false
    end

    add_index :order_items, :order_id
    # add_index :order_items, :shipment_id
    # add_index :order_items, :shipping_rate_id
    add_index :order_items, :tax_rate_id
    add_index :order_items, :variant_id

  end
end
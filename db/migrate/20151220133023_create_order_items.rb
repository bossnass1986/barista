class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal  :price,                        precision: 8, scale: 2
      t.decimal  :total,                        precision: 8, scale: 2
      t.integer  :order_id,         limit: 4,                           null: false
      t.integer  :variant_id,       limit: 4,                           null: false
      t.string   :state,            limit: 255,                         null: false
      t.integer  :tax_rate_id,      limit: 4
      t.integer  :shipping_rate_id, limit: 4
      t.integer  :shipment_id,      limit: 4

      t.timestamps null: false
    end
  end
end
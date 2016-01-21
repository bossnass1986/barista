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

    add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
    add_index "order_items", ["shipment_id"], name: "index_order_items_on_shipment_id", using: :btree
    add_index "order_items", ["shipping_rate_id"], name: "index_order_items_on_shipping_rate_id", using: :btree
    add_index "order_items", ["tax_rate_id"], name: "index_order_items_on_tax_rate_id", using: :btree
    add_index "order_items", ["variant_id"], name: "index_order_items_on_variant_id", using: :btree
  end
end
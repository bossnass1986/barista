class CreateOrdersVenues < ActiveRecord::Migration
  def change
    create_table :orders_venues do |t|
      t.integer :order_id
      t.integer :venue_id

      t.timestamps
    end
  end
end

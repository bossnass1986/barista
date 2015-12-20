class CreateProductsVenues < ActiveRecord::Migration
  def change
    create_table :products_venues do |t|
      t.integer :product_id
      t.integer :venue_id

      t.timestamps
    end
  end
end

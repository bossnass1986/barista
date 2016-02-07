class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.integer :shipping_method_id
      t.decimal :rate
      t.integer :shipping_rate_type_id
      t.integer :shipping_category_id
      t.decimal :minimum_charge
      t.integer :position
      t.boolean :active

      t.timestamps null: false
    end
  end
end

class CreateVariantProperties < ActiveRecord::Migration
  def change
    create_table :variant_properties do |t|
      t.integer :property_id, limit: 4
      t.integer :variant_id, limit: 4
      t.integer :venue_id, limit: 4
      t.string :description, limit: 255
      t.boolean :primary, default: false
      t.timestamps
    end
    add_index :variant_properties, :variant_id
    add_index :variant_properties, :property_id
    add_index :variant_properties, :venue_id
  end
end

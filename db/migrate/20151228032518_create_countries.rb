class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :abbreviation
      t.integer :shipping_zone_id
      t.boolean :active

      t.timestamps null: false
    end

    add_index :countries, :name
    add_index :countries, :active
    add_index :countries, :shipping_zone_id

  end
end

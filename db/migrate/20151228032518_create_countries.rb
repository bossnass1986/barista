class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, limit: 50
      t.string :abbreviation, limit: 3
      # t.integer :shipping_zone_id, limit: 4
      t.boolean :active, default: false

      t.timestamps null: false
    end

    add_index :countries, :name
    add_index :countries, :active
    # add_index :countries, :shipping_zone_id

  end
end

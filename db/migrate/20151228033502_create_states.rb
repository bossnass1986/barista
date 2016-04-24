class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.string :described_as
      t.integer :country_id
      t.integer :shipping_zone_id

      t.timestamps null: false
    end

    add_index :states, :name
    add_index :states, :abbreviation
    add_index :states, :country_id

  end
end

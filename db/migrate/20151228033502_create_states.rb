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
  end
end

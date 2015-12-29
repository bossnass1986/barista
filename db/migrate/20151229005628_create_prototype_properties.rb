class CreatePrototypeProperties < ActiveRecord::Migration
  def change
    create_table :prototype_properties do |t|
      t.integer :prototype_id
      t.integer :property_id

      t.timestamps null: false
    end
  end
end

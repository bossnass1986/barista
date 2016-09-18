class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, limit: 45, null: false
      t.string :code, limit: 45
      t.integer :property_set_id, limit: 4
      # t.enum :mode
      t.boolean :active, default: true
      t.timestamps
    end
  end
end

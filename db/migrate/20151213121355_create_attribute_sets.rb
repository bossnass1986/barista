class CreateAttributeSets < ActiveRecord::Migration
  def change
    create_table :attribute_sets do |t|
      t.string :name, limit: 45, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end

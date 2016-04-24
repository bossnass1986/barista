class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :display_name, limit: 255, null: false
      t.string :identifying_name, limit: 255
      t.boolean :active, default: true
      t.timestamps
    end
  end
end

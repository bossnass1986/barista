class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :display_name, limit: 45, null: false
      t.string :code, limit: 45
      t.integer :attribute_set_id, limit: 4
      # t.enum :mode
      t.boolean :active, default: true
      t.timestamps
    end
  end
end

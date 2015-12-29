class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :display_name
      t.string :identifying_name
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end

class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end

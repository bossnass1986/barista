class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name,                 limit: 50,                   null: false
      t.string   :keywords,        limit: 255
      t.string   :description,     limit: 160
      t.boolean  :active,                default: true

      t.timestamps
    end
    add_index :products, :name
  end
end

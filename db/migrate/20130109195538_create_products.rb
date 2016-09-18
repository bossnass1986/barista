class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name,                 limit: 50,                   null: false
      t.string   :keywords,        limit: 255
      t.string   :description,     limit: 160
      t.boolean  :active,                default: true
      t.boolean  :featured,             default: false
      t.integer  :brand_id,             limit: 4

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :brand_id
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name,                 limit: 255,                   null: false
      t.text     :description,          limit: 65535
      t.text     :product_keywords,     limit: 65535
      t.integer  :product_type_id,      limit: 4,                     null: false
      t.integer  :prototype_id,         limit: 4
      t.string   :permalink,            limit: 255
      t.datetime :available_at
      t.datetime :deleted_at
      t.string   :meta_keywords,        limit: 255
      t.string   :meta_description,     limit: 255
      t.boolean  :featured,             default: false
      t.text     :description_markup,   limit: 65535
      t.integer  :brand_id,             limit: 4

      t.timestamps
    end
    add_index :products, :brand_id
    add_index :products, :deleted_at
    add_index :products, :product_type_id
    add_index :products, :name
    add_index :products, :permalink, unique: :true
    add_index :products, :prototype_id
  end
end

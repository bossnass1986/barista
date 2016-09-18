class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string   :name,                 limit: 50,                   null: false
      t.string   :meta_keywords,        limit: 255
      t.string   :meta_description,     limit: 160
      t.boolean  :active,               default: true

      t.timestamps
    end
    add_index :categories, :name
  end
end

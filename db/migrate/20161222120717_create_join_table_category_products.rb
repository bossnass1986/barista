class CreateJoinTableCategoryProducts < ActiveRecord::Migration
  def change
    create_join_table :category, :products do |t|
      t.index [:category_id, :product_id]
      t.index [:product_id, :category_id]
    end
  end
end

class Cart < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :customer, class_name: 'User'
  has_many    :cart_items
  has_many    :shopping_cart_items, -> { where(active: true, item_type_id: ItemType::SHOPPING_CART_ID) },   class_name: 'CartItem'
  has_many    :saved_cart_items,    -> { where( active: true, item_type_id: ItemType::SAVE_FOR_LATER_ID) }, class_name: 'CartItem'
  has_many    :wish_list_items,     -> { where( active: true, item_type_id: ItemType::WISH_LIST_ID) },      class_name: 'CartItem'
  has_many    :purchased_items,     -> { where( active: true, item_type_id: ItemType::PURCHASED_ID) },      class_name: 'CartItem'
  has_many    :deleted_cart_items,  -> { where(active: false) }, class_name: 'CartItem'

  accepts_nested_attributes_for :shopping_cart_items

end

class AddressType < ActiveRecord::Base
  has_many :addresses

  BILLING   = 'Billing'
  SHIPPING  = 'Shipping'
  ORDER     = 'Order'
  MERCHANT  = 'Merchant'
  NAMES     = [BILLING, SHIPPING, ORDER, MERCHANT] #, ORDER

  BILLING_ID  = 1
  SHIPPING_ID = 2
  ORDER_ID    = 3
  MERCHANT_ID = 4

  validates :name, :presence => true,       :length => { :maximum => 55 }

end
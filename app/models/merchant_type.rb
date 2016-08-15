class MerchantType < ActiveRecord::Base
  has_many :merchants, dependent: :destroy
  has_one :product_type
end

class MerchantType < ActiveRecord::Base
  has_many :merchants, :through => :PropertySet, dependent: :destroy
  has_one :property_set
end

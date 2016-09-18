class MerchantType < ActiveRecord::Base
  has_many :merchants, :through => :AttributeSet, dependent: :destroy
  has_one :attribute_set
end

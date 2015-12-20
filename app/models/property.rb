class Property < ActiveRecord::Base

  has_many :product_properties
  has_many :products,          :through => :product_properties

  has_many :variant_properties
  has_many :variants,          :through => :variant_properties
  belongs_to :venue

  validates :name,       :presence => true, :length => { :maximum => 165 }

end

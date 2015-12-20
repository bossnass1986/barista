class Property < ActiveRecord::Base

  has_many :product_properties
  has_many :products,          :through => :product_properties

  has_many :variant_properties
  has_many :variants,          :through => :variant_properties

  # has_and_belongs_to_many :Products
  belongs_to :venue

  validates :name,       :presence => true, :length => { :maximum => 165 }

  def menu_attribute_params
    params.require(:menu_attribute, :variant_properties).permit(:name, :description)
  end

end

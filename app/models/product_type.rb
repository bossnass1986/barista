class ProductType < ActiveRecord::Base

  # acts_as_nested_set  :order => "name"
  has_many :products, dependent: :restrict_with_exception

  validates :name,    presence: true, length: { :maximum => 255 }

end

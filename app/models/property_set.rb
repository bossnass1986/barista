class PropertySet < ActiveRecord::Base

  belongs_to :merchant_type
  has_many :properties
  has_many :products
  has_many :products, through: :merchant_types, dependent: :restrict_with_exception


  validates :name,    presence: true, length: { :maximum => 45 }

  accepts_nested_attributes_for :properties

end

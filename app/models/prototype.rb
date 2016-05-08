class Prototype < ActiveRecord::Base

  has_many :products
  has_many :prototype_properties
  has_many :properties,          through: :prototype_properties

  validates :name,    presence: true, length: { maximum: 255 }

  accepts_nested_attributes_for :properties, :prototype_properties

end
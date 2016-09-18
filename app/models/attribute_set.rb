class AttributeSet < ActiveRecord::Base

  # belongs_to :merchant_type
  # has_many :attributes
  # has_many :products, through: :merchant_types, dependent: :restrict_with_exception


  validates :name,    presence: true, length: { :maximum => 45 }

end

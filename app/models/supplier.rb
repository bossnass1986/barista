class Supplier < ActiveRecord::Base
  has_many :variant_suppliers
  has_many :variants,         through: :variant_suppliers
  has_many :phones

  validates :name,        presence: true,       length: { maximum: 255 }
  validates :email,       format: { with: CustomValidators::Emails.email_validator },       :length => { :maximum => 255 }
end

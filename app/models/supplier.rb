class Supplier < ActiveRecord::Base
  has_many :variant_suppliers
  has_many :variants,         through: :variant_suppliers
  # has_many :phones

  validates :name,        presence: true,       length: { maximum: 255 }
  # validates :email,       format: { with: CustomValidators::Emails.email_validator },       :length => { :maximum => 255 }

  geocoded_by :address
  after_validation :geocode

  def image_available
    (Rails.application.assets.find_asset("places/#{self.id}.jpg").nil?) ?
        ActionController::Base.helpers.image_tag('places/generic.jpg', size: '50', alt: self.name.titlecase, title: self.name.titlecase) :
        ActionController::Base.helpers.image_tag("places/#{self.id}.jpg", size: '50', alt: self.name.titlecase, title: self.name.titlecase)
  end
end

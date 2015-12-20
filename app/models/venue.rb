class Venue < ActiveRecord::Base
  # attr_accessible :address, :latitude, :longitude, :name, :phone, :suburb, :state, :country
  after_validation :geocode

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :products

  geocoded_by :address, :if => :address?


  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("address like ?", "%#{query}%")
  end


  def full_address
    [address, suburb, state, country].compact.join(', ')
  end

end

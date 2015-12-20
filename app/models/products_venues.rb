class ProductsVenues < ActiveRecord::Base

  belongs_to :product
  belongs_to :venue

  def menu_items_venues_params
    params.require(:products_venues).permit(:menu_items_id, :venue_id)
  end

end

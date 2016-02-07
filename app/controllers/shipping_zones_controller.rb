class ShippingZonesController < ApplicationController
  before_action :set_shipping_zone, only: [:show, :edit, :update, :destroy]

  # GET /shipping_zones
  def index
    @shipping_zones = ShippingZone.all
  end

  # GET /shipping_zones/1
  def show
  end

  # GET /shipping_zones/new
  def new
    @shipping_zone = ShippingZone.new
  end

  # GET /shipping_zones/1/edit
  def edit
  end

  # POST /shipping_zones
  def create
    @shipping_zone = ShippingZone.new(shipping_zone_params)

    if @shipping_zone.save
      redirect_to @shipping_zone, notice: 'Shipping zone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shipping_zones/1
  def update
    if @shipping_zone.update(shipping_zone_params)
      redirect_to @shipping_zone, notice: 'Shipping zone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shipping_zones/1
  def destroy
    @shipping_zone.destroy
    redirect_to shipping_zones_url, notice: 'Shipping zone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_zone
      @shipping_zone = ShippingZone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_zone_params
      params.require(:shipping_zone).permit(:name)
    end
end

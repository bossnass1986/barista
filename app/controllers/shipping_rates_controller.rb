class ShippingRatesController < ApplicationController
  before_action :set_shipping_rate, only: [:show, :edit, :update, :destroy]

  # GET /shipping_rates
  def index
    @shipping_rates = ShippingRate.all
  end

  # GET /shipping_rates/1
  def show
  end

  # GET /shipping_rates/new
  def new
    @shipping_rate = ShippingRate.new
  end

  # GET /shipping_rates/1/edit
  def edit
  end

  # POST /shipping_rates
  def create
    @shipping_rate = ShippingRate.new(shipping_rate_params)

    if @shipping_rate.save
      redirect_to @shipping_rate, notice: 'Shipping rate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shipping_rates/1
  def update
    if @shipping_rate.update(shipping_rate_params)
      redirect_to @shipping_rate, notice: 'Shipping rate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shipping_rates/1
  def destroy
    @shipping_rate.destroy
    redirect_to shipping_rates_url, notice: 'Shipping rate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_rate
      @shipping_rate = ShippingRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_rate_params
      params.require(:shipping_rate).permit(:shipping_method_id, :rate, :shipping_rate_type_id, :shipping_category_id, :minimum_charge, :position, :active)
    end
end

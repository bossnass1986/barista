class ShippingRateTypesController < ApplicationController
  before_action :set_shipping_rate_type, only: [:show, :edit, :update, :destroy]

  # GET /shipping_rate_types
  def index
    @shipping_rate_types = ShippingRateType.all
  end

  # GET /shipping_rate_types/1
  def show
  end

  # GET /shipping_rate_types/new
  def new
    @shipping_rate_type = ShippingRateType.new
  end

  # GET /shipping_rate_types/1/edit
  def edit
  end

  # POST /shipping_rate_types
  def create
    @shipping_rate_type = ShippingRateType.new(shipping_rate_type_params)

    if @shipping_rate_type.save
      redirect_to @shipping_rate_type, notice: 'Shipping rate type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shipping_rate_types/1
  def update
    if @shipping_rate_type.update(shipping_rate_type_params)
      redirect_to @shipping_rate_type, notice: 'Shipping rate type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shipping_rate_types/1
  def destroy
    @shipping_rate_type.destroy
    redirect_to shipping_rate_types_url, notice: 'Shipping rate type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_rate_type
      @shipping_rate_type = ShippingRateType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_rate_type_params
      params.require(:shipping_rate_type).permit(:name)
    end
end

class MerchantTypesController < ApplicationController
  before_action :set_merchant_type, only: [:show, :edit, :update, :destroy]

  # GET /merchant_types
  def index
    @merchant_types = MerchantType.all
  end

  # GET /merchant_types/1
  def show
  end

  # GET /merchant_types/new
  def new
    @merchant_type = MerchantType.new
  end

  # GET /merchant_types/1/edit
  def edit
  end

  # POST /merchant_types
  def create
    @merchant_type = MerchantType.new(merchant_type_params)

    if @merchant_type.save
      redirect_to @merchant_type, notice: 'Merchant type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merchant_types/1
  def update
    if @merchant_type.update(merchant_type_params)
      redirect_to @merchant_type, notice: 'Merchant type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merchant_types/1
  def destroy
    @merchant_type.destroy
    redirect_to merchant_types_url, notice: 'Merchant type was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_merchant_type
    @merchant_type = MerchantType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def merchant_type_params
    params.require(:merchant_type).permit(:name, :active)
  end
end

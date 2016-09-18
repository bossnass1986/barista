class ProductAttributesController < ApplicationController
  before_action :set_product_property, only: [:show, :edit, :update, :destroy]

  # GET /@product_attributes
  def index
    @product_attributes = ProductAttribute.all
  end

  # GET /@product_attributes/1
  def show
  end

  # GET /@product_attributes/new
  def new
    @product_attribute = ProductAttribute.new
  end

  # GET /@product_attributes/1/edit
  def edit
  end

  # POST /@product_attributes
  def create
    @product_attribute = ProductAttribute.new(product_property_params)

    if @product_attribute.save
      redirect_to @product_attribute, notice: 'Product property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /@product_attributes/1
  def update
    if @product_attribute.update(product_property_params)
      redirect_to @product_attribute, notice: 'Product property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /@product_attributes/1
  def destroy
    @product_attribute.destroy
    redirect_to product_properties_url, notice: 'Product property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_property
      @product_attribute = ProductAttribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_property_params
      params.require(:product_attribute).permit(:variant_id, :property_id)
    end
end

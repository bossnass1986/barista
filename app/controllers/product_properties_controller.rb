class ProductPropertiesController < ApplicationController
  before_action :set_product_property, only: [:show, :edit, :update, :destroy]

  # GET /product_properties
  def index
    @product_properties = ProductProperty.all
  end

  # GET /product_properties/1
  def show
  end

  # GET /product_properties/new
  def new
    @product_property = ProductProperty.new
  end

  # GET /product_properties/1/edit
  def edit
  end

  # POST /product_properties
  def create
    @product_property = ProductProperty.new(product_property_params)

    if @product_property.save
      redirect_to @product_property, notice: 'Product property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_properties/1
  def update
    if @product_property.update(product_property_params)
      redirect_to @product_property, notice: 'Product property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_properties/1
  def destroy
    @product_property.destroy
    redirect_to product_properties_url, notice: 'Product property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_property
      @product_property = ProductProperty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_property_params
      params.require(:product_property).permit(:variant_id, :property_id)
    end
end

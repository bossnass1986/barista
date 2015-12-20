class VariantPropertiesController < ApplicationController
  before_action :set_variant_property, only: [:show, :edit, :update, :destroy]

  # GET /variant_properties
  def index
    @variant_properties = VariantProperty.all
  end

  # GET /variant_properties/1
  def show
  end

  # GET /variant_properties/new
  def new
    @variant_property = VariantProperty.new
  end

  # GET /variant_properties/1/edit
  def edit
  end

  # POST /variant_properties
  def create
    @variant_property = VariantProperty.new(variant_property_params)

    if @variant_property.save
      redirect_to @variant_property, notice: 'Variant property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /variant_properties/1
  def update
    if @variant_property.update(variant_property_params)
      redirect_to @variant_property, notice: 'Variant property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /variant_properties/1
  def destroy
    @variant_property.destroy
    redirect_to variant_properties_url, notice: 'Variant property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_property
      @variant_property = VariantProperty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def variant_property_params
      params.require(:variant_property).permit(:variant_id, :property_id, :name)
    end
end

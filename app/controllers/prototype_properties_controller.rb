class PrototypePropertiesController < ApplicationController
  before_action :set_prototype_property, only: [:show, :edit, :update, :destroy]

  # GET /prototype_properties
  def index
    @prototype_properties = PrototypeProperty.all
  end

  # GET /prototype_properties/1
  def show
  end

  # GET /prototype_properties/new
  def new
    @prototype_property = PrototypeProperty.new
  end

  # GET /prototype_properties/1/edit
  def edit
  end

  # POST /prototype_properties
  def create
    @prototype_property = PrototypeProperty.new(prototype_property_params)

    if @prototype_property.save
      redirect_to @prototype_property, notice: 'Prototype property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prototype_properties/1
  def update
    if @prototype_property.update(prototype_property_params)
      redirect_to @prototype_property, notice: 'Prototype property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prototype_properties/1
  def destroy
    @prototype_property.destroy
    redirect_to prototype_properties_url, notice: 'Prototype property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prototype_property
      @prototype_property = PrototypeProperty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prototype_property_params
      params.require(:prototype_property).permit(:prototype_id, :property_id)
    end
end

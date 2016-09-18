class PropertySetsController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /@@property_sets
  def index
    @property_sets = PropertySet.all
  end

  # GET /@@property_sets/1
  def show
  end

  # GET /@@property_sets/new
  def new
    @property_set = PropertySet.new
  end

  # GET /@@property_sets/1/edit
  def edit
  end

  # POST /@@property_sets
  def create
    @property_set = PropertySet.new(product_type_params)

    if @property_set.save
      redirect_to @property_set, notice: 'Product type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /@@property_sets/1
  def update
    if @property_set.update(product_type_params)
      redirect_to @property_set, notice: 'Product type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /@@property_sets/1
  def destroy
    @property_set.destroy
    redirect_to product_types_url, notice: 'Product type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @property_set = PropertySet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_type_params
      params.require(:property_set).permit(:name)
    end
end

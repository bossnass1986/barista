class AttributeSetsController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /@attribute_sets
  def index
    @attribute_sets = AttributeSet.all
  end

  # GET /@attribute_sets/1
  def show
  end

  # GET /@attribute_sets/new
  def new
    @attribute_set = AttributeSet.new
  end

  # GET /@attribute_sets/1/edit
  def edit
  end

  # POST /@attribute_sets
  def create
    @attribute_set = AttributeSet.new(product_type_params)

    if @attribute_set.save
      redirect_to @attribute_set, notice: 'Product type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /@attribute_sets/1
  def update
    if @attribute_set.update(product_type_params)
      redirect_to @attribute_set, notice: 'Product type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /@attribute_sets/1
  def destroy
    @attribute_set.destroy
    redirect_to product_types_url, notice: 'Product type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @attribute_set = AttributeSet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_type_params
      params.require(:attribute_set).permit(:name)
    end
end

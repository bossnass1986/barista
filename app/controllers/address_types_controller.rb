class AddressTypesController < ApplicationController
  before_action :set_address_type, only: [:show, :edit, :update, :destroy]

  # GET /address_types
  def index
    @address_types = AddressType.all
  end

  # GET /address_types/1
  def show
  end

  # GET /address_types/new
  def new
    @address_type = AddressType.new
  end

  # GET /address_types/1/edit
  def edit
  end

  # POST /address_types
  def create
    @address_type = AddressType.new(address_type_params)

    if @address_type.save
      redirect_to @address_type, notice: 'Address type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /address_types/1
  def update
    if @address_type.update(address_type_params)
      redirect_to @address_type, notice: 'Address type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /address_types/1
  def destroy
    @address_type.destroy
    redirect_to address_types_url, notice: 'Address type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_type
      @address_type = AddressType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_type_params
      params.require(:address_type).permit(:name, :description)
    end
end

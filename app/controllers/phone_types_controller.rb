class PhoneTypesController < ApplicationController
  before_action :set_phone_type, only: [:show, :edit, :update, :destroy]

  # GET /phone_types
  def index
    @phone_types = PhoneType.all
  end

  # GET /phone_types/1
  def show
  end

  # GET /phone_types/new
  def new
    @phone_type = PhoneType.new
  end

  # GET /phone_types/1/edit
  def edit
  end

  # POST /phone_types
  def create
    @phone_type = PhoneType.new(phone_type_params)

    if @phone_type.save
      redirect_to @phone_type, notice: 'Phone type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /phone_types/1
  def update
    if @phone_type.update(phone_type_params)
      redirect_to @phone_type, notice: 'Phone type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /phone_types/1
  def destroy
    @phone_type.destroy
    redirect_to phone_types_url, notice: 'Phone type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_type
      @phone_type = PhoneType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def phone_type_params
      params.require(:phone_type).permit(:name)
    end
end

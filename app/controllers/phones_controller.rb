class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # GET /phones
  def index
    @phones = Phone.all
  end

  # GET /phones/1
  def show
  end

  # GET /phones/new
  def new
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  def create
    @phone = Phone.new(phone_params)

    if @phone.save
      redirect_to @phone, notice: 'Phone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /phones/1
  def update
    if @phone.update(phone_params)
      redirect_to @phone, notice: 'Phone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /phones/1
  def destroy
    @phone.destroy
    redirect_to phones_url, notice: 'Phone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def phone_params
      params.require(:phone).permit(:phone_type_id, :number, :phoneable_type, :phoneable_id, :primary)
    end
end

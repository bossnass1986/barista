class Shopping::MerchantsController < Shopping::BaseController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /merchants
  def index
    # Only pull the fields we require
    @merchants = Merchant.select('name', 'permalink', 'featured').order(featured: :desc, id: :asc).page(params[:page])
  end

  # GET /merchants/1
  def show
    # @merchant = Merchant.select('product.name','product.description').joins(products: :variants).find(params[:id])
    @merchant = Merchant.select('id', 'permalink').find(params[:id])
     # form_info
    # @cart_item.variant_id = @merchant.try(:id)
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  def create
    @merchant = Merchant.new(supplier_params)

    if @merchant.save
      redirect_to @merchant, notice: 'Merchant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merchants/1
  def update
    if @merchant.update(supplier_params)
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merchants/1
  def destroy
    @merchant.destroy
    redirect_to suppliers_url, notice: 'Merchant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @merchant = Merchant.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :latitude, :longitude, :email, :phone)
    end

    def form_info
      @cart_item = CartItem.new
    end
end

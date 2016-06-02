class Shopping::MerchantsController < Shopping::BaseController
  respond_to :json, :html, :xml
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

  # GET /merchants
  def index
    # Only pull the fields we require
    @merchants = Merchant.select('id', 'name', 'permalink', 'featured').order(featured: :desc, id: :asc).page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @merchants.as_json }
      format.xml { render :json => @merchants }
    end
  end

  # GET /merchants/1
  def show
    # @merchant = Merchant.select('product.name','product.description').joins(products: :variants).find(params[:id])
    @merchant = Merchant.select('id', 'permalink').find(params[:id])
    @merchant_product_lists = @merchant.products.where('products.prototype_id' => [1, 2]).group_by(&:prototype_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @merchant }
    end
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
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      redirect_to @merchant, notice: 'Merchant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merchants/1
  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merchants/1
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @merchant.as_json }
    end
    # redirect_to merchants_url, notice: 'Merchant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_merchant
      @merchant = Merchant.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def merchant_params
    params.require(:merchant).permit(:name, :address, :latitude, :longitude, :email, :phone)
    end

    def form_info
      @cart_item = CartItem.new
    end
end

class Shopping::ProductsController < Shopping::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /Products
  # GET /Products.json
  def index
    products = Product.active
    # products = Product.active.includes(:variants)

    product_types = nil
    if params[:product_type_id].present? && product_type = ProductType.find_by_id(params[:product_type_id])
      product_types = product_type.self_and_descendants.map(&:id)
    end
    if product_types
      @products = products.where(product_type_id: product_types)
    else
      @products = products
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @products }
    end
  end

  # GET /Products/1
  # GET /Products/1.json
  def show
    # @products = Product.find(params[:id])
    # @properties = Product
    #               .joins(:product_properties)
    #               .joins('INNER JOIN variant_properties on product_properties.property_id = variant_properties.property_id')
    #               .joins('INNER JOIN properties ON properties.id = product_properties.property_id AND properties.id = variant_properties.property_id')
    #               .joins('INNER JOIN variants on variants.product_id = products.id AND variants.id = variant_properties.variant_id')
    #               .where('products.id = ?', params[:id])
    #               .pluck('products.id as prod_id', 'properties.display_name as prop_name', 'LEFT(variant_properties.description,1) as short_desc', 'variants.price as price')
    # @product = Product.joins(:properties, :variants).find(params[:id], :variant_id)
    # @product = Product.joins(:variants).group(:variant_id, :property_id).find(params[:id])
    # form_info
    # @cart_item.variant_id = @product.active_variants.first.try(:id)
  end

  # GET /Products/new
  # GET /Products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @product }
    end
  end

  # GET /Products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /Products
  # POST /Products.json
  def create
    @product = Product.new(params[:products])

    respond_to do |format|
      if product.save
        format.html { redirect_to product, notice: 'Menu item was successfully created.' }
        format.json { render json: @product, status: :created, location: product }
      else
        format.html { render action: :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Products/1
  # PUT /Products/1.json

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /Products/1
  # DELETE /Products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      # @product = Product.find(params[:id])
      @product = Product.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

    def product_params
      params.require(:product).permit(:description, :name)
    end

    def form_info
      @cart_item = CartItem.new
    end

end

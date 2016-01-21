class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  def show
    @supplier = Supplier.joins(:products).where('suppliers.id = ?', params[:id]).group('suppliers.id','products.id','products.name').pluck('products.id','products.name','suppliers.id')
                        # .joins(:variants)
                        # .joins(:products)
                        # .where('suppliers.id = ?', params[:id])
                        # .group('suppliers.id','products.id','products.name')
                        # .pluck('suppliers.id as supplier_id','products.id as prod_id','products.name as prod_name')
    # @sizes = Supplier.sizes
    # @sizes = Supplier
    #               .joins(:variant_suppliers)
    #               .joins('INNER JOIN variants on variants.id = variant_suppliers.variant_id')
    #               .joins('INNER JOIN products on products.id = variants.product_id')
    #               .joins('INNER JOIN variant_properties on variant_properties.variant_id = variants.id')
    #               .joins('INNER JOIN properties on properties.id = variant_properties.property_id AND properties.display_name =\'Size\'')
    #               .where('suppliers.id = ?', params[:id])
    #               .pluck('products.id as prod_id', 'LEFT(variant_properties.description,1) as short_desc', 'variants.price as price')

    # TODO v1.0 this is probably a better way of doing it
    # @product_sizes = @sizes.each_with_object({}) do |size, result|
    #   result[size[0]] = {
    #       # 'product_id' => size[0],
    #       'short_desc' => size[1],
    #       'price' => size[2]
    #   }
    # end
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :latitude, :longitude, :email, :phone)
    end
end

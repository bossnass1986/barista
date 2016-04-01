class Shopping::SuppliersController < Shopping::BaseController
# class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  def index
    # Only pull the fields we require
    @suppliers = Supplier.select('name','address','permalink','featured').order(id: :asc).page(params[:page])
  end

  # GET /suppliers/1
  def show
    @supplier = Supplier.joins(:products).where('suppliers.permalink = ?', params[:id]).group('suppliers.id','products.id','products.name','products.description','variants.price','variants.id').pluck('products.id','products.name','products.description','variants.price','variants.id','suppliers.id')
    form_info
    @cart_item.variant_id = @supplier.first.try(:id)
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
      @supplier = Supplier.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :latitude, :longitude, :email, :phone)
    end

    def form_info
      @cart_item = CartItem.new
    end
end

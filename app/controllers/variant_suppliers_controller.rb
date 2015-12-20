class VariantSuppliersController < ApplicationController
  before_action :set_variant_supplier, only: [:show, :edit, :update, :destroy]

  # GET /variant_suppliers
  def index
    @variant_suppliers = VariantSupplier.all
  end

  # GET /variant_suppliers/1
  def show
  end

  # GET /variant_suppliers/new
  def new
    @variant_supplier = VariantSupplier.new
  end

  # GET /variant_suppliers/1/edit
  def edit
  end

  # POST /variant_suppliers
  def create
    @variant_supplier = VariantSupplier.new(variant_supplier_params)

    if @variant_supplier.save
      redirect_to @variant_supplier, notice: 'Variant supplier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /variant_suppliers/1
  def update
    if @variant_supplier.update(variant_supplier_params)
      redirect_to @variant_supplier, notice: 'Variant supplier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /variant_suppliers/1
  def destroy
    @variant_supplier.destroy
    redirect_to variant_suppliers_url, notice: 'Variant supplier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_supplier
      @variant_supplier = VariantSupplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def variant_supplier_params
      params.require(:variant_supplier).permit(:variant_id, :supplier_id, :cost, :active)
    end
end

class Admin::Merchandise::Multi::VariantsController < Admin::BaseController
  helper_method :image_groups
  def edit
    @product        = Product.find(params[:product_id])
    form_info
    # render :layout => 'admin_markup'
  end

  def update
    @product = Product.find(params[:product_id])

    if @product.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated variants"
      redirect_to admin_merchandise_product_url(@product)
    else
      form_info
      # render :action => :edit, :layout => 'admin_markup'
    end
  end
  private


  def allowed_params
    params.require(:product).permit({:variant_properties_attributes => [:id, :product_id, :sku, :name, :price, :cost, :deleted_at, :master, :brand_id, :inventory_id]} )
    # permit({:variant_properties_attributes => [:id, :product_id, :sku, :name, :price, :cost, :deleted_at, :master, :brand_id, :inventory_id]} )
  end

  def image_groups
    # @image_groups ||= ImageGroup.where(:product_id => @product).map{|i| [i.name, i.id]}
  end

  def form_info
  end
end